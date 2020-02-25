# Geographical-Information-system

# Geographical-Information-system

### Problem Statement

To build a website that track the location coordinates of each plant and its description. The website should be capable of locating all places the plant/species is present and plot them on the map.
## PHP based project
##### Create the Front End UI of the Project:
The UI was divided into two main division:
 - I.   The division that consist of the Indian Map which was used to geographically show the coordinate location of the plants/species. The Indian map was inserted through the help of Google maps API. Google APIs is a set of application programming interfaces (APIs) developed by Google which allow communication with Google Services and their integration to other services. Google Maps API is not licensed if we used for the internal purpose of the company. The API can be integrated to the code just by adding the link to the API applying necessary changes required for the project, on the API. The API being open source was helpful for us to modify its features like the markers. We were able to overcome the usual markers used by Google Maps and design our own markers to make it more user interactive.
 - II.  Another division was the search and information panel where actual processing was done. It was further divided into two. One being the search text box and other the table containing the information generated after querying the database with the searched data. The search box has an auto complete option which provides option to select from all texts possible from the input. On focus and on blur options were used to make the user interface effective. The second division was the table which included which category the plant belong to, the scientific name of plant, the coordinates of all plants with same name, the image of the plant; etc. all in the form of table having two columns one for the type and another for the information. The Link was also provided to the Wikipedia page of each plant but was later removed as it was not required by the company.
 - III. Apart from this two main divisions which was within the body of HTML there were two more division for Header and Footer. Header had the topic of the project and the Ashok stambh as the party being a government body. The image added with the help of img tag. It also had a continuous scrolling bar called marquee. The list for all map legends available were listed here. It included the most important feature of Admin panel in it.
The Footer had details of the BSI Company and also copyright mark by C-DAC
##### Creating the Backend:
The Backend included the PHP Script. PHP was coded to fetch data from the Front end (i.e. JavaScript send over through AJAX). PHP then ran query on the basis of collected data and ran the query to the database. The database reported the result to PHP which was in turn sent to an XML file. AJAX. PHP files actually drove the project as actual data transfer were done through PHP.
##### Creating the Database:
Database was created in Apache PHPMyAdmin. PHPMyAdmin is a database that comes integrated along with XAMPP server, so no further environment needs to be set up. The Database was made having six fields namely – Name of the Plant (NAME), Type of the plant category (TYPE), Coordinates where the plant can be found (Lat, Long), Address, the name of the image file of the plant or the link (Link). The Serial no was added to the database to uniquely identify each data and it was made primary key. All other values were given NOT NULL. This is how database was created.
##### Making the interface for synchronous communication:
AJAX and XML played the role in the matter. AJAX in JavaScript used to send HTTP request to the PHP when search item was queried. The reply made by the database was send to PHP which forwarded the data in XML format to create an intermediate XML file. Making XML file was an important task. XML file used to collect data and store. Thus when a plant name is searched there can me multiple location available for the plant. All location should appear on the Map. But JavaScript being asynchronous Time delay used to happen between data arriving the JavaScript file and data scanned by the JavaScript file. To avoid this delay all the possible locations were written to XML first and then JavaScript read the XML file to get all possible marker. So that all location where the plant was available was displayed successfully.

## Java based project
It does the exact same job as like PHP based project except jsp responsive pages were created instead of HTML based UI. The backend was pure Struts2 based java api implementation.

## Sample output

![Satelite View](https://github.com/harshshah4/Geographical-Information-system/cdacbsi-java/tree/master/image/readme-img-1.png)