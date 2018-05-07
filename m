From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Subject: domain_crash_sync vs "plain crash"
Date: Mon, 07 May 2018 01:06:49 +0000
Message-ID: <CAAQRGoCRJch7OLrCyOUUx9gUWpB07_+LBawXkTbCWZ1eii7Qtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1311648562996130667=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--===============1311648562996130667==
Content-Type: multipart/alternative; boundary="00000000000075b45f056b9349c7"

--00000000000075b45f056b9349c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When I'm performing some hypercalls with some "unexpected" parameters
(robustness test) sometimes the guest is explicitly  "killed" by xen
calling the domain_crash(), but sometimes the guest just crash without any
explicit message on dmesg or logs.

Are those "plain crashes" an expected behavior by design on Xen or are they
some untreated parameter checking or something else?

Can someone comment about it?

Thanks!


--=20
Atenciosamente,
Charles F.'. Gon=C3=A7alves

--00000000000075b45f056b9349c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>When I&#39;m performing some hypercalls with some &qu=
ot;unexpected&quot; parameters (robustness test) sometimes the guest is exp=
licitly=C2=A0 &quot;killed&quot; by xen calling the=C2=A0domain_crash(), bu=
t sometimes the guest just crash without any explicit message on dmesg or l=
ogs.<br></div><div><br></div><div>Are those &quot;plain crashes&quot; an ex=
pected behavior by design on Xen or are they some untreated parameter check=
ing or something else?</div><div><br></div><div>Can someone comment about i=
t?</div><div><br></div><div>Thanks!</div><div><br></div><div><br></div></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature"><div dir=3D"ltr"><div>Atenciosamente,=C2=A0</div>Charles F.&#39=
;. Gon=C3=A7alves</div></div>

--00000000000075b45f056b9349c7--


--===============1311648562996130667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1311648562996130667==--
