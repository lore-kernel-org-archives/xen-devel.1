From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Xen PV: Sample new PV driver for buffer sharing between
 domains
Date: Thu, 27 Sep 2018 11:14:41 +0530
Message-ID: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6858121191328241399=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

--===============6858121191328241399==
Content-Type: multipart/alternative; boundary="0000000000007b1ff20576d3d683"

--0000000000007b1ff20576d3d683
Content-Type: text/plain; charset="UTF-8"

Hi,

I am using Debian as Domain-0 and Debian as Domain-U on Hikey960
platform(ARMv8) and using Xen-4.8 stable release. Here I want to create a
PV frontend and backend to share memory between Domain-0 and Domain-U.



I used below link to create frontend and backend,
https://fnordig.de/2016/12/02/xen-a-backend-frontend-driver-example/

But I am facing below errors while adding device vdevb to xenstore.
Below errors I am getting from xenbus_switch_state().
vdevb vdevb-0: failed to write error node for device/vdevb/0 (13 writing
new state)

Please suggest me, How to create PV drivers.

Thanks,
Omkar B

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--0000000000007b1ff20576d3d683
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">Hi,</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">I am using Debian as Domain-0 and=
 Debian as Domain-U on Hikey960 platform(ARMv8) and using Xen-4.8 stable re=
lease. Here I want to create a PV frontend and backend to share memory betw=
een Domain-0 and Domain-U.=C2=A0</div><div class=3D"gmail_default" style=3D=
"color:rgb(11,83,148)"><br></div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)"><br></div><div class=3D"gmail_default"><br></div><div cla=
ss=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">I used below link=
 to create frontend and backend,</span><font color=3D"#0b5394"><br></font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394"><a href=3D"https:=
//fnordig.de/2016/12/02/xen-a-backend-frontend-driver-example/">https://fno=
rdig.de/2016/12/02/xen-a-backend-frontend-driver-example/</a></font><br></d=
iv><div class=3D"gmail_default"><br></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">But I am facing below errors while adding device vdevb =
to xenstore.=C2=A0</font></div><div class=3D"gmail_default"><font color=3D"=
#0b5394">Below errors I am getting from=C2=A0xenbus_switch_state().</font><=
/div><div class=3D"gmail_default"><span style=3D"color:rgb(11,83,148)">vdev=
b vdevb-0: failed to write error node for device/vdevb/0 (13 writing new st=
ate)</span><br></div><div class=3D"gmail_default"><span style=3D"color:rgb(=
11,83,148)"><br></span></div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">Please suggest me, How to create PV drivers.</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">Thanks,</div><div class=3D"gma=
il_default" style=3D"color:rgb(11,83,148)">Omkar B</div></div></div></div><=
/div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--0000000000007b1ff20576d3d683--


--===============6858121191328241399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6858121191328241399==--
