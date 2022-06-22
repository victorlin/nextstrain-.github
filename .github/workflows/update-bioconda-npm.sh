npmName=$1
biocondaName=$2

latestVersion=$(npm show $npmName version)
echo "Latest version on NPM: $latestVersion"

conda search \
    --channel bioconda \
    --subdir osx-64 $biocondaName==$latestVersion \
    > /dev/null
if [ $? -eq 0 ]; then
    echo "Bioconda is already up to date. Exiting."
    exit 0
fi

echo "Getting shasum from npm"
latestVersionShasum=$(npm show $npmName dist.shasum)

wget https://raw.githubusercontent.com/bioconda/bioconda-recipes/HEAD/recipes/$biocondaName/meta.yaml


# testing

# latestVersion="2.29.1"
conda search \
    --channel bioconda \
    --subdir osx-64 auspice==2.37.1

# latestVersion="2.37.3"
# conda search \
#     --channel bioconda \
#     --subdir osx-64 auspice==$latestVersion \
#     > /dev/null
# if [ $? -eq 0 ]; then
#     echo "Bioconda is already up to date. Exiting."
#     exit 0
# fi
