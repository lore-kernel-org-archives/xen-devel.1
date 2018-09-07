From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 11/16] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Fri, 7 Sep 2018 15:27:37 -0600
Message-ID: <CABfawh=aBbV8P=iA3u17p1D3v=LspGUTyd-gjVsSEPuQn+y8=g@mail.gmail.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-12-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2655297003179976724=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nd2v=lv=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1fyOID-0007cJ-Lm
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 21:27:53 +0000
Received: by mail-ed1-f68.google.com with SMTP id k14-v6so12463063edr.13
 for <xen-devel@lists.xenproject.org>; Fri, 07 Sep 2018 14:27:51 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id o22-v6sm9738474edc.90.2018.09.07.14.27.50
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Sep 2018 14:27:50 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id v17-v6so16205753wrr.9
 for <xen-devel@lists.xenproject.org>; Fri, 07 Sep 2018 14:27:50 -0700 (PDT)
In-Reply-To: <20180904161533.11575-12-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============2655297003179976724==
Content-Type: multipart/alternative; boundary="000000000000f3948d05754eadf4"

--000000000000f3948d05754eadf4
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018, 10:29 AM Wei Liu <wei.liu2@citrix.com> wrote:

> Going through the code, HAP, EPT, PoD and ALTP2M depend on HVM code.
> Put these components under CONFIG_HVM. This further requires putting
> one of the vm event under CONFIG_HVM.
>
> Altp2m requires a bit more attention because its code is embedded in
> generic x86 p2m code.
>
> Also make hap_enabled evaluate to false when !CONFIG_HVM. Make sure it
> evaluate its parameter to avoid unused variable warnings in its users.
>
> Also sort items in Makefile while at it.
>
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> ---
>  xen/arch/x86/mm/Makefile         | 11 ++++++-----
>  xen/arch/x86/mm/mem_access.c     | 18 +++++++++++++++++-
>  xen/arch/x86/mm/mem_sharing.c    |  2 ++
>  xen/arch/x86/mm/p2m.c            | 23 ++++++++++++-----------
>  xen/common/vm_event.c            |  2 ++
>

As before, please only apply CONFIG_HVM ifdefs to x86 specific parts. We
have an altp2m implementation for ARM that is planned to be posted again to
the mailinglist in the near future.

Thanks,
Tamas

--000000000000f3948d05754eadf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Tue, Sep 4, 2018, 10:29 AM Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix=
.com">wei.liu2@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Going through the code, HAP, EPT, PoD and ALTP2M depend on HVM code.<=
br>
Put these components under CONFIG_HVM. This further requires putting<br>
one of the vm event under CONFIG_HVM.<br>
<br>
Altp2m requires a bit more attention because its code is embedded in<br>
generic x86 p2m code.<br>
<br>
Also make hap_enabled evaluate to false when !CONFIG_HVM. Make sure it<br>
evaluate its parameter to avoid unused variable warnings in its users.<br>
<br>
Also sort items in Makefile while at it.<br>
<br>
Signed-off-by: Wei Liu &lt;<a href=3D"mailto:wei.liu2@citrix.com" target=3D=
"_blank" rel=3D"noreferrer">wei.liu2@citrix.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/x86/mm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++=
-----<br>
=C2=A0xen/arch/x86/mm/mem_access.c=C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++=
+-<br>
=C2=A0xen/arch/x86/mm/mem_sharing.c=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0xen/arch/x86/mm/p2m.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +=
+++++++++++-----------<br>
=C2=A0xen/common/vm_event.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 ++<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">As before, please only apply CONFIG_HVM ifdefs to x86 specific pa=
rts. We have an altp2m implementation for ARM that is planned to be posted =
again to the mailinglist in the near future.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Tamas</div></div>

--000000000000f3948d05754eadf4--


--===============2655297003179976724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2655297003179976724==--
