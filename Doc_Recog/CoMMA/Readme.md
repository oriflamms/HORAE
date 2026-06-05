This folder contains transcriptions of **178 manuscripts** provided by the [CoMMA project](https://comma.inria.fr/homepage). They are taken from https://huggingface.co/datasets/comma-project/deep-jsonl. 

All transcriptions from all zones were exported : `DefaultLines`, `HeadingLines`, `InterlinearLine` etc from `MainZone`, `MarginTextZone`, `text` etc.

Each file corresponds to a single manuscript published on Arkindex. The filename matches the Arkindex manuscript ID. The columns include:

- page_id — the content of the alto tag in the CoMMA files, the label of the transcribed page;
- CoMMA_folio_name — the page or folio name or number;
- text — the transcription of the page;
- page_ordering — the sequential number of the image in Arkindex;
- arkindex_page_id — the page ID in Arkindex.