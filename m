From: Saumya Rajesh <saumyarajesh93@gmail.com>
Subject: Access I2C bus from guest/DomU on ARM board
Date: Tue, 16 Jan 2018 19:09:11 +0530
Message-ID: <CAONE6OA9h6omWptvGQE6EdD+s0geCbUcGUwX1NKPj16PF7_TNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8698549125545306580=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gtqw=el=gmail.com=saumyarajesh93@srs-us1.protection.inumbo.net>)
 id 1ebRSM-0005qq-6m
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 13:39:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============8698549125545306580==
Content-Type: multipart/alternative; boundary="001a11456d1a1bd3ed0562e4dbe7"

--001a11456d1a1bd3ed0562e4dbe7
Content-Type: text/plain; charset="UTF-8"

Hi Xen community


I have built and brought up Xen 4.8 on Renesas RCar H3. For a specific
requirement, I need to use the I2C bus of the board from Domain U. Is there
a way to use the I2C bus from the guest?
I have looked into para-virtualization and passthrough [1][2] but there
isn't enough support or resources related to I2C bus sharing on ARM. Any
possible idea would be appreciated.

Regards
Saumya

[1]
https://lists.xenproject.org/archives/html/xen-users/2017-10/msg00019.html
[2] https://wiki.xenproject.org/wiki/File:DriverDomainonARM01.pdf

--001a11456d1a1bd3ed0562e4dbe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin-top:0px;margin-bottom:0px;color:rgb(0,0=
,0);font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Em=
oji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&q=
uot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:14.6667px"><span styl=
e=3D"font-size:11pt">Hi Xen community</span><br></p><p style=3D"margin-top:=
0px;margin-bottom:0px;color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-s=
erif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,Not=
oColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymb=
ols;font-size:14.6667px"></p><div style=3D"color:rgb(0,0,0);font-family:Cal=
ibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Seg=
oe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android =
Emoji&quot;,EmojiSymbols;font-size:14.6667px"><br></div><div style=3D"color=
:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple =
Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI =
Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:14.6667px">I =
have built and brought up Xen 4.8 on Renesas RCar H3. For a specific requir=
ement, I need to use the I2C bus of the board from Domain U. Is there a way=
 to use the I2C bus from the guest?</div><div style=3D"color:rgb(0,0,0);fon=
t-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&q=
uot;Android Emoji&quot;,EmojiSymbols;font-size:14.6667px">I have looked int=
o para-virtualization and passthrough=C2=A0[1][2] but there isn&#39;t=C2=A0=
enough support or resources related to I2C bus sharing on ARM.=C2=A0<span s=
tyle=3D"font-size:11pt">Any possible=C2=A0idea would be appreciated.</span>=
</div><div style=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-ser=
if,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoC=
olorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbol=
s;font-size:14.6667px"><br></div><div style=3D"color:rgb(0,0,0);font-family=
:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot=
;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Andr=
oid Emoji&quot;,EmojiSymbols;font-size:14.6667px">Regards</div><div style=
=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif,EmojiFont,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;=
Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:14.6=
667px">Saumya</div><div style=3D"color:rgb(0,0,0);font-family:Calibri,Helve=
tica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoj=
i&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot=
;,EmojiSymbols;font-size:14.6667px"><br></div><div style=3D"color:rgb(0,0,0=
);font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quo=
t;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:14.6667px">[1]=C2=A0<a =
href=3D"https://lists.xenproject.org/archives/html/xen-users/2017-10/msg000=
19.html" class=3D"gmail-OWAAutoLink">https://lists.xenproject.org/archives/=
html/xen-users/2017-10/msg00019.html</a></div><div style=3D"color:rgb(0,0,0=
);font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoj=
i&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quo=
t;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:14.6667px">[2]=C2=A0<a =
href=3D"https://wiki.xenproject.org/wiki/File:DriverDomainonARM01.pdf" clas=
s=3D"gmail-OWAAutoLink">https://wiki.xenproject.org/wiki/File:DriverDomaino=
nARM01.pdf</a></div><div style=3D"color:rgb(0,0,0);font-family:Calibri,Helv=
etica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emo=
ji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quo=
t;,EmojiSymbols;font-size:14.6667px"><br></div><div style=3D"color:rgb(0,0,=
0);font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emo=
ji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&qu=
ot;,&quot;Android Emoji&quot;,EmojiSymbols;font-size:14.6667px"><br></div><=
/div>

--001a11456d1a1bd3ed0562e4dbe7--


--===============8698549125545306580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8698549125545306580==--
