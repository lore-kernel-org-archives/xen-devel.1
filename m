From: Spencer Michaels <sxmichaels@gmail.com>
Subject: Reading guest page flags
Date: Thu, 13 Sep 2018 13:29:08 -0400
Message-ID: <CAMf-k8GVDLxt4hS9TngxxEb9Sn+jRM7Ecjfk__wL6xwbdKZKJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7562789581105841611=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v4xr=l3=gmail.com=sxmichaels@srs-us1.protection.inumbo.net>)
 id 1g0VQg-000567-PW
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 17:29:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id v90-v6so7140729wrc.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Sep 2018 10:29:21 -0700 (PDT)
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

--===============7562789581105841611==
Content-Type: multipart/alternative; boundary="0000000000000be3280575c40c5c"

--0000000000000be3280575c40c5c
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm writing an application that can read/write guest memory, and as part of
that I need to check whether the page being manipulated is
readable/writable by the guest itself. Does Xen have an API that would
allow me to read the flags of an arbitrary page on a guest, given either
its address or its PFN? I've only been able to find functions that update
the existing memory mappings, but none to read them.

--0000000000000be3280575c40c5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">I&#39=
;m writing an application that can read/write guest memory, and as part of =
that I need to check whether the page being manipulated is readable/writabl=
e by the guest itself. Does Xen have an API that would allow me to read the=
 flags of an arbitrary page on a guest, given either its address or its PFN=
? I&#39;ve only been able to find functions that update the existing memory=
 mappings, but none to read them.</div></div>

--0000000000000be3280575c40c5c--


--===============7562789581105841611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7562789581105841611==--
