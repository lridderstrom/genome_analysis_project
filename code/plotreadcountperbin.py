import pandas as pd
import matplotlib.pyplot as plt
import os
import numpy as np

# === Sökvägar ===

base_dir = os.path.dirname(__file__)  # mappen där scriptet ligger
loc37_dir = os.path.join(base_dir, "location37")
loc39_dir = os.path.join(base_dir, "location39")
out_dir = os.path.join(base_dir, "expression_plots_raw")

os.makedirs(out_dir, exist_ok=True)


# Loopa genom alla bin-filer i location37
for filename in os.listdir(loc37_dir):

    if not filename.endswith("_counts_sorted.txt"):
        continue  # bara filer som slutar på _counts_sorted.txt
    
    # resten av koden...

    bin_name = filename.replace("_counts_sorted.txt", "")
    file37 = os.path.join(loc37_dir, filename)
    file39 = os.path.join(loc39_dir, filename)

    if not os.path.exists(file39):
        print(f" Hoppar över {bin_name} – saknas i location39")
        continue

    # Läs in counts
    df37 = pd.read_csv(file37, sep="\t", header=None, names=["Gene", "Count_loc37"])
    df37 = df37[~df37["Gene"].str.startswith("_")]
    df39 = pd.read_csv(file39, sep="\t", header=None, names=["Gene", "Count_loc39"])
    df39 = df39[~df39["Gene"].str.startswith("_")]


    # Slå ihop på gen-namn
    merged = pd.merge(df37, df39, on="Gene", how="outer").fillna(0)

    # Ta de 20 generna med högst counts per location (var för sig)
    top20_loc37 = merged.nlargest(20, 'Count_loc37')
    top20_loc39 = merged.nlargest(20, 'Count_loc39')

    # Slå ihop dessa två set med gener (för att få alla top gener)
    top_genes = pd.concat([top20_loc37, top20_loc39]).drop_duplicates('Gene').reset_index(drop=True)

    # Sortera för snygg plotting (t.ex. på location37 counts)
    top_genes = top_genes.sort_values(by='Count_loc37', ascending=False)

    # Skapa plot med grupperade staplar
    x = np.arange(len(top_genes))
    width = 0.35

    fig, ax = plt.subplots(figsize=(12,6))
    ax.bar(x - width/2, top_genes['Count_loc37'], width, label='Hypoxic environment')
    ax.bar(x + width/2, top_genes['Count_loc39'], width, label='Oxygenated environment')

    ax.set_xlabel('Gene')
    ax.set_ylabel('Read count')
    ax.set_title(f'Read counts per gene – {bin_name}')
    ax.set_xticks(x)
    ax.set_xticklabels(top_genes['Gene'], rotation=90)
    ax.legend()
    plt.tight_layout()

    # Spara fil
    plot_file = os.path.join(out_dir, f"{bin_name}_top20_readcounts.png")
    plt.savefig(plot_file)
    plt.close()

    print(f" Sparade plot för {bin_name}")
