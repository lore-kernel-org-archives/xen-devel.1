From: Matt Leinhos <matthew.leinhos@gmail.com>
Subject: Re: Xen 4.11.1: guest uses altp2m to crash host
Date: Mon, 15 Apr 2019 09:04:13 -0500
Message-ID: <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4655563470662867755=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HI6c=SR=gmail.com=matthew.leinhos@srs-us1.protection.inumbo.net>)
 id 1hG2Dj-00040v-RS
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 14:04:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id z6so48559wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 07:04:26 -0700 (PDT)
In-Reply-To: <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============4655563470662867755==
Content-Type: multipart/alternative; boundary="00000000000045b8130586922128"

--00000000000045b8130586922128
Content-Type: text/plain; charset="UTF-8"

Hi Razvan,

You are correct -- cherry picking that commit into RELEASE-4.11.1 addresses
the crash. The problem cannot be reproduced on 4.12.

I hope this helps.

Kind regards,
Matt


On Mon, Apr 15, 2019 at 8:43 AM Razvan Cojocaru <rcojocaru@bitdefender.com>
wrote:

> Hello Matt,
>
> Judging by the description of your problem, I believe that it has
> already been fixed by this commit:
>
>
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=1dddfff4c39d3db17dfa709b1c57f44e3ed352e3;hp=68465944c81fa2fbc40bf29ec6084072af5e48ec
>
> Could you please either try to reproduce the problem with 4.12 or apply
> this patch to 4.11 and confirm?
>
>
> Thanks,
> Razvan
>

--00000000000045b8130586922128
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Razvan,</div><div><br></div><div>You are correct -=
- cherry picking that commit into RELEASE-4.11.1 addresses the crash. The p=
roblem cannot be reproduced on 4.12.</div><div><br></div><div>I hope this h=
elps.</div><div><br></div><div>Kind regards,</div><div>Matt</div><div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Apr 15, 2019 at 8:43 AM Razvan Cojocaru &lt;<a href=3D"mailto:=
rcojocaru@bitdefender.com">rcojocaru@bitdefender.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Matt,<br>
<br>
Judging by the description of your problem, I believe that it has <br>
already been fixed by this commit:<br>
<br>
<a href=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D1d=
ddfff4c39d3db17dfa709b1c57f44e3ed352e3;hp=3D68465944c81fa2fbc40bf29ec608407=
2af5e48ec" rel=3D"noreferrer" target=3D"_blank">http://xenbits.xen.org/gitw=
eb/?p=3Dxen.git;a=3Dcommitdiff;h=3D1dddfff4c39d3db17dfa709b1c57f44e3ed352e3=
;hp=3D68465944c81fa2fbc40bf29ec6084072af5e48ec</a><br>
<br>
Could you please either try to reproduce the problem with 4.12 or apply <br=
>
this patch to 4.11 and confirm?<br>
<br>
<br>
Thanks,<br>
Razvan<br>
</blockquote></div>

--00000000000045b8130586922128--


--===============4655563470662867755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4655563470662867755==--
