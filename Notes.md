# CarWale 360 Multiview Car Dataset

## The Company

CarWale is owned by Automotive Exchange Pvt Ltd and is backed by India`s leading early stage venture capital firm Seedfund and top tier US venture fund Sierra Ventures.

CarWale offers a complete consumer-focused service that includes content and tools for exhaustive research, pricing and marketplace information. As consumers research and make purchase decisions, CarWale connects them with automotive manufacturers, finance and insurance companies, allowing them to make the best decisions for their automotive purchases.

## The Data

On the CarWale website 360° view of several cars are accessible. After simple investigation of the html the data source and access to the data is exposed.

### Sample Javascript code for generation of image urls (From the website)

```javascript
var cwTrackingPath = 'www.carwale.com';
var cdnHostUrl = 'https://imgd.aeplcdn.com/';

var modelDetails = {
    makeId: '11',
    makeName: 'Mercedes-Benz',
    urlMakeName: 'mercedesbenz',
    name: 'GLC',
    maskingName: 'glc',
    modelId: '980'
};

var xmlVersion = {
    closed: '20180212062725',
    open: '20180212062725',
    interior: '20180212062725'
};

var carName = modelDetails.makeName + ' ' + modelDetails.name;
var modelPageUrl = '/mercedesbenz-cars/glc/';
var category = 'closed';
var exteriorPageUrl = '/mercedesbenz-cars/glc/360-view/';
var openPageUrl = '/mercedesbenz-cars/glc/360-view/open/';
var interiorPageUrl = '/mercedesbenz-cars/glc/360-view/interior/';
doNotShowAskTheExpert = false;
```

### Sample URLs

[https://imgd.aeplcdn.com/1280x720/cw/360/mercedesbenz/980/closed-door/1.jpg?wm=1&q=80&v=20180212062725](https://imgd.aeplcdn.com/1280x720/cw/360/mercedesbenz/980/closed-door/1.jpg?wm=1&q=80&v=20180212062725)

**q** parameter defines quality of the image. The website uses **q=80** most of the time. It is possible to obtain higher quality images but the quality is indistinguishable.

Also, it is possible to download the original image from the server via omitting the **q** parameter.

**wm** parameter controls watermarking on the image. **wm=1** generates **carwale**, **wm=2** generates **bikewale**.

Omitting the **wm** parameter results in a picture without watermark.

### Sample scripts

```javascript
var cwTrackingPath = 'www.carwale.com';
var cdnHostUrl = 'https://imgd.aeplcdn.com/';

var modelDetails = {
    makeId: '18',
    makeName: 'Audi',
    urlMakeName: 'audi',
    name: 'A6',
    maskingName: 'a6',
    modelId: '934'
};

var xmlVersion = {
    closed: '20180212062725',
    open: '20180212062725',
    interior: '20180122115925'
};

var carName = modelDetails.makeName + ' ' + modelDetails.name;
var modelPageUrl = '/audi-cars/a6/';
var category = 'closed';
var exteriorPageUrl = '/audi-cars/a6/360-view/';
var openPageUrl = '/audi-cars/a6/360-view/open/';
var interiorPageUrl = '/audi-cars/a6/360-view/interior/';
doNotShowAskTheExpert = false;
```

### Image path creation

```javascript
var closedDoorRoothPath = cdnHostUrl + "1280x720/cw/360/" + modelDetails.urlMakeName + "/" + modelDetails.modelId + "/closed-door/"
var xmlPath = "/api/xml/360/" + modelDetails.modelId + "/"
var closedXMLName = "closed/?v=" + xmlVersion.closed
```

### Sample request for the XML data

[https://www.carwale.com/api/xml/360/934/closed/?v=20180212062725](https://www.carwale.com/api/xml/360/934/closed/?v=20180212062725)

```XML
<config>
    <settings>
        <preloader image="1.jpg?q=20&wm=1&v=20180212062725"/>
        <userInterface showZoomButtons="true" showToolTips="true" showHotspotsButton="true" showFullScreenButton="true" showTogglePlayButton="true" showArrows="true" toolbarAlign="center" toolbarBackColor="#0A0101" toolbarHoverColor="#808285" toolbarForeColor="#A7A9AE" toolbarBackAlpha="1" toolbarAlpha="1" showProgressNumbers="true" showFullScreenToolbar="false" fullScreenBackColor="#FFFFFF"/>
        <control dragSpeed="0.6" doubleClickZooms="false" disableMouseControl="false" showHighresOnFullScreen="true" mouseHoverDrag="false" hideHotspotsOnLoad="true" hideHotspotsOnZoom="true" rowSensitivity="15" dragSensitivity="80" inBrowserFullScreen="false" doubleClickFullscreen="false"/>
        <rotation firstImage="0" rotatePeriod="4" bounce="false" rotateDirection="-1" forceDirection="false" inertiaRelToDragSpeed="true" inertiaTimeToStop="50" inertiaMaxInterval="80" useInertia="true" flipHorizontalInput="false" bounceRows="true"/>
    </settings>
    <hotspots/>
    <images rows="1">
        <image src="1.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="2.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="3.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="4.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="5.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="6.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="7.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="8.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="9.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="10.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="11.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="12.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="13.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="14.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="15.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="16.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="17.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="18.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="19.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="20.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="21.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="22.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="23.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="24.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="25.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="26.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="27.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="28.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="29.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="30.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="31.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="32.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="33.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="34.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="35.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="36.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="37.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="38.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="39.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="40.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="41.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="42.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="43.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="44.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="45.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="46.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="47.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="48.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="49.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="50.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="51.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="52.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="53.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="54.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="55.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="56.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="57.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="58.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="59.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="60.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="61.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="62.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="63.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="64.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="65.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="66.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="67.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="68.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="69.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="70.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="71.jpg?wm=1&q=80&v=20180212062725"/>
        <image src="72.jpg?wm=1&q=80&v=20180212062725"/>
    </images>
</config>
```