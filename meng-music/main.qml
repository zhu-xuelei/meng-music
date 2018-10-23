import QtQuick 2.3
import QtQuick.Window 2.2

Rectangle{
    id:mainWindow
    width: 900
    height: 600
    Image {
            id: rocket
            anchors.fill:parent
//            source: "image/timg.jpeg"
       }
//    flags:QtWindow | Qt.FramelessWindowHint   //qu chu biao ti lan

    /*biao ti lan tuo ye yi dong*/
    MouseArea{
        property real xmouse; //shu biao x zuobiao
        property real ymouse; //shu biao y zuobiao
        property real xmainWindow;
        property real ymainWindow;
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton // zhi chu li shu biao zuo jian
        onPressed: {
            xmouse = mouse.x;
            ymouse = mouse.y;
            xmainWindow = mainWindow.x
            ymainWindow = mainWindow.y
        }
        onPositionChanged: {
            mainWindow.x=xmainWindow+(mouse.x-xmouse);
            mainWindow.y=ymainWindow+(mouse.y-ymouse);
        }
        onDoubleClicked: {
            maxBtn.onClicked();
        }
    }

    /*button*/
    MyButton{
        id:closeBtn;
        anchors.right: parent.right
//        flat:true
//        font{
//            family:"Ubuntu"
//            pixelSize:titleBar.height/2
//        }
//        text:"\uf410"
        nomal_Image:"image/kugou_UI/title/close_hover.png"
    }


    /*tuo ye bian huan chuang ti chi cun*/
    MouseArea{
        property var clickPos;
        property int dercicontype:1;     //shu biao tuo dong fang xiang tu fangxiangbiao
//        property QtObject mainWindow;
        property bool needChange: false;
        width:5
        height:5
        cursorShape: {
            switch(dercicontype){
            case 1:
            case 2:
                    return Qt.SizeVerCursor;
            case 3:
            case 4:
                    return Qt.SizeHorCursor;
            case 5:
            case 8:
                    return Qt.SizeFDiagCursor;
            case 6:
            case 7:
                    return Qt.SizeBDiagCursor;
            }
        }
        onPressed: {
            needChange = true;
            clickPos = Qt.point(mouse.x,mouse.y);
        }
        onPositionChanged: {
            resizeWindow(Qt.point(mouse.x-clickPos.x,mouse.y-clickPos.y),dercicontype);
        }
        onReleased: {
            needChange = false;
        }

        function resizeWindow(spacing,dercicontype){
           switch(dercicontype){
            case 1:
                mainWindow.setY((mainWindow.height-spacing.y)>minHeight?(mainWindow.y+spacing.y):mainWindow.y);
                mainWindow.setHeight((mainWindow.height-spacing.y)>minHeight?(mainWindow.height-spacing.y):minHeight);
            case 2:
                        //下
                        mainWindow.setHeight((mainWindow.height+spacing.y)>minHeight?(mainWindow.height+spacing.y):minHeight);
                        break;
                    case 3:
                        //左
                        mainWindow.setX((mainWindow.width-spacing.x)>minWidth?(mainWindow.x+spacing.x):mainWindow.x);
                        mainWindow.setWidth((mainWindow.width-spacing.x)>minWidth?(mainWindow.width-spacing.x):minWidth);
                        break;
                    case 4:
                        //右
                        mainWindow.setWidth((mainWindow.width+spacing.x)>minWidth?(mainWindow.width+spacing.x):minWidth);
                        break;
                    case 5:
                        //左上
                        main.setX((mainWindow.width-spacing.x)>minWidth?(mainWindow.x+spacing.x):mainWindow.x);
                        mainWindow.setY((mainWindow.height-spacing.y)>minHeight?(mainWindow.y+spacing.y):mainWindow.y);
                        mainWindow.setWidth((mainWindow.width-spacing.x)>minWidth?(mainWindow.width-spacing.x):minWidth);
                        mainWindow.setHeight((mainWindow.height-spacing.y)>minHeight?(mainWindow.height-spacing.y):minHeight);
                        break;
                    case 6:
                        //右上
                        mainWindow.setY((mainWindow.height-spacing.y)>minHeight?(mainWindow.y+spacing.y):mainWindow.y);
                        mainWindow.setWidth((mainWindow.width+spacing.x)>minWidth?(mainWindow.width+spacing.x):minWidth);
                        mainWindow.setHeight((mainWindow.height-spacing.y)>minHeight?(mainWindow.height-spacing.y):minHeight);
                        break;
                    case 7:
                        //左下
                        mainWindow.setX((mainWindow.width-spacing.x)>minWidth?(mainWindow.x+spacing.x):mainWindow.x);
                        mainWindow.setWidth((mainWindow.width-spacing.x)>minWidth?(mainWindow.width-spacing.x):minWidth);
                        mainWindow.setHeight((mainWindow.height+spacing.y)>minHeight?(mainWindow.height+spacing.y):minHeight);
                        break;
                    case 8:
                        //右下
                        mainWindow.setWidth((mainWindow.width+spacing.x)>minWidth?(mainWindow.width+spacing.x):minWidth);
                        mainWindow.setHeight((mainWindow.height+spacing.y)>minHeight?(mainWindow.height+spacing.y):minHeight);
                        break;
            }
        }      
    }
}
