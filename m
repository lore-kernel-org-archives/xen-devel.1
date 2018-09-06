From: Vikram K <vikram.k@pathpartnertech.com>
Subject: USB pass-through and WiFi access
Date: Thu, 6 Sep 2018 19:51:28 +0530
Message-ID: <CAFsJcmbBym+gR14vucNsaA20cfUpSr6MGehu4RwoX2k0qp2MDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3007898547510991702=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8gs1=lu=pathpartnertech.com=vikram.k@srs-us1.protection.inumbo.net>)
 id 1fxvA3-00051E-7h
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 14:21:31 +0000
Received: by mail-io0-x229.google.com with SMTP id v14-v6so8982790iob.4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Sep 2018 07:21:29 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3007898547510991702==
Content-Type: multipart/alternative; boundary="0000000000005d19e00575349b0b"

--0000000000005d19e00575349b0b
Content-Type: text/plain; charset="UTF-8"

Hi,

1. We are using Hikey960 board.
2. Xen version is 4.8
3. Linux kernel version is 4.14

We want to add/pass-through USB devices to DomU. From the below link I
understood that there is no USB back and front driver support in latest
kernel. But PVUSB support is added to *xl* tools since Xen 4.7. Please
provide pointers on to achieve USB pass-through and hotplug.
https://wiki.xenproject.org/wiki/Xen_USB_Passthrough

Also we want share wireless internet between Dom0 and DomU. To achieve this
what configuration we need to?


-- 
Thanks & Regards
VKS#436

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

--0000000000005d19e00575349b0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br><=
/div><div>1. We are using Hikey960 board.<br></div><div>2. Xen version is 4=
.8</div><div>3. Linux kernel version is 4.14</div><div><br></div><div>We wa=
nt to add/pass-through USB devices to DomU. From the below link I understoo=
d that there is no USB back and front driver support in latest kernel. But =
PVUSB support is added to <b>xl</b> tools since Xen 4.7. Please provide poi=
nters on to achieve USB pass-through and hotplug.<br></div><div><a href=3D"=
https://wiki.xenproject.org/wiki/Xen_USB_Passthrough">https://wiki.xenproje=
ct.org/wiki/Xen_USB_Passthrough</a></div><div><br></div><div>Also we want s=
hare wireless internet between Dom0 and DomU. To achieve this what configur=
ation we need to?<br></div><div><br></div><div><br>-- <br><div class=3D"gma=
il_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><span>Thanks &amp; Reg=
ards<br>VKS#436<br></span><span style=3D"color:rgb(19,79,92)"></span></div>=
</div></div></div>
</div></div></div></div>

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
--0000000000005d19e00575349b0b--


--===============3007898547510991702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3007898547510991702==--
