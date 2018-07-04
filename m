From: Karl Johnson <karljohnson.it@gmail.com>
Subject: Recent 4.9 kernel not booting as dom0
Date: Wed, 4 Jul 2018 14:16:19 -0400
Message-ID: <CAAzNQHQGhtGReJ=7p=i7nQE72pQdWgsyYRp=K2KBzbqKt3HyLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2152654648251440064=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=iasq=ju=gmail.com=karljohnson.it@srs-us1.protection.inumbo.net>)
 id 1famKQ-0003Sj-Pd
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 18:16:34 +0000
Received: by mail-lf0-x235.google.com with SMTP id l16-v6so4976552lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jul 2018 11:16:33 -0700 (PDT)
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

--===============2152654648251440064==
Content-Type: multipart/alternative; boundary="0000000000001aa87a0570306e3e"

--0000000000001aa87a0570306e3e
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm building dom0 kernel RPMs for the CentOS Xen project (
https://github.com/CentOS-virt7/xen-kernel) and it seems that the 4.9
branch isn't booting anymore as dom0. I recently built 4.9.110 and 4.9.111,
both give black screen and reboot while booting dom0. Our last successful
version is 4.9.105 therefore something must be wrong between 4.9.106 and
4.9.110.

I checked the OSSTEST for linux-4.9 and the last working flight was
4.9.101. Is there a known issue with Xen and Linux 4.9?

I don't have a serial port to see if there's a trace. It reboots right
here: https://pasteboard.co/HsLJbMp.jpg

Regards,

Karl

--0000000000001aa87a0570306e3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I&#39;m building dom0 kernel RPMs for the Ce=
ntOS Xen project (<a href=3D"https://github.com/CentOS-virt7/xen-kernel">ht=
tps://github.com/CentOS-virt7/xen-kernel</a>) and it seems that the 4.9 bra=
nch isn&#39;t booting anymore as dom0. I recently built 4.9.110 and 4.9.111=
, both give black screen and reboot while booting dom0. Our last successful=
 version is 4.9.105 therefore something must be wrong between 4.9.106 and 4=
.9.110.<br><br>I checked the OSSTEST for linux-4.9 and the last working fli=
ght was 4.9.101. Is there a known issue with Xen and Linux 4.9? <br><br>I d=
on&#39;t have a serial port to see if there&#39;s a trace. It reboots right=
 here: <a href=3D"https://pasteboard.co/HsLJbMp.jpg">https://pasteboard.co/=
HsLJbMp.jpg</a><br><br>Regards,<br><br>Karl<br></div>

--0000000000001aa87a0570306e3e--


--===============2152654648251440064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2152654648251440064==--
