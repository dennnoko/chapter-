void setup() {
    size(960, 540);
    colorMode(3, 360, 100, 100, 100);
    frameRate(60);
}

//変数の定義
    //球の初期速度
        float vx = 0;
        int vy = 0;

    //球の初期位置
        int xx = 300;
        int yy = 270;
        
    //バーの初期位置
        int bly = 270;
        int bry = 270;
//

void draw() {
    //背景リセット
        background(0, 0, 100, 100);

    //ゲームスタート
        if(vx == 0) {
            textSize(50);
            fill(0, 100, 0, 100);
            text("Click to Start", 350, 400);
        }
        if(mousePressed) {
            xx = 300;
            yy = 270;

            vx = 5/2;
            vy = 4;
        }

    //球の描写
        noStroke();
        fill(0, 100, 0, 100);
        ellipse(xx, yy, 30, 30);

    //球の位置の変化
        xx += vx;
        yy += vy;

    //上下の反射
        if(dist(0, yy, 0, 270) >= 255) {
            vy = vy*(-1);
        }

    //バーの描写
        fill(0, 100, 0, 100);
        rect(0, bly-30, 20, 60);
        rect(940, bry-30, 20, 60);
    
    //バーの移動
        if(keyPressed) {
            //左（W,S）で操作
                if(bly > 30) {
                    if(key == 'w') {
                        bly -= 5;
                    }
                }

                if(bly < 510) {
                    if(key == 's') {
                        bly += 5;
                    }
                }

            //右（↑,↓）で操作
                if(bry > 30) {
                    if(keyCode == UP) {
                        bry -= 5;
                    }
                }

                if(bry < 510) {
                    if(keyCode == DOWN) {
                        bry += 5;
                    }
                }
        }
    
    //ボールのバーによる反射
        if(dist(xx, 0, 480, 0) >= 445 && xx < 480 && dist(xx, 0, 480, 0) < 450) {
            if(yy >= (bly - 30) && yy <= (bly + 30)) {
                vx = vx*(-1);
            }
        }
        
        if(dist(xx, 0, 480, 0) >= 445 && xx > 480 && dist(xx, 0, 480, 0) < 450) {
            if(yy >= (bry - 30) && yy <= (bry + 30)) {
                vx = vx*(-1);
            }
        }

        if(dist(xx, 0, 480, 0) > 450) {
            if(xx < 480) {
                textSize(50);
                fill(0, 100, 0, 100);
                text("WIN", 640, 270);
                text("LOSE", 260, 270);
                text("Click to Restart", 350, 400);
            } else {
                textSize(50);
                fill(0, 100, 0, 100);
                text("LOSE", 640, 270);
                text("WIN", 260, 270);
                text("Click to Restart", 350, 400);
            }
        }       
}
