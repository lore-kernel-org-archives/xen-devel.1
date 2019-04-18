Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BB0C10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 10:07:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004B52184B
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 10:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=thegrail.co header.i=@thegrail.co header.b="amsvcBOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 004B52184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thegrail.co
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH3wd-0001qK-0u; Thu, 18 Apr 2019 10:07:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=htIB=SU=onedefence.com=dylanger@srs-us1.protection.inumbo.net>)
 id 1hH3Ct-0006B0-NK
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 09:19:47 +0000
X-Inumbo-ID: 1bf516a4-61bb-11e9-92d7-bc764e045a96
Received: from mail-oi1-x242.google.com (unknown [2607:f8b0:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bf516a4-61bb-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 09:19:46 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id i21so1054815oib.11
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2019 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thegrail.co; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEtFH23t0bP77aPVM0j2pSrZHyntjnDJQaUtXJ0lO9g=;
 b=amsvcBOlL6aGB1QjwV/M7wv8aAwxcvUmV78s+7p+sKDB1D9FqWXc/BHghnJGjIz5al
 opCNiifmjPQB0Fv7hx67HQ9nblsjUdGHQbJvmWQJheG6ofCcezoEBY5c6oiBZ6sSf5ya
 oAplUx2mtud6EZj0ZLXDa4Jp3PHbcSDWfc99U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEtFH23t0bP77aPVM0j2pSrZHyntjnDJQaUtXJ0lO9g=;
 b=SMQStAw8nOFfw3Ynl4MK2zsLb4c20ZKCvLafdF9eiOiIAZwDdA4cxNNW7HLNBb/TnP
 lWBw9J1FOFDh0MYD/RZE9b91k632DAOmm/Bb1Tsxp0YelCTmoK5d88fh79yMLvuDrSr1
 NLgfTswNzyU8bvTA+eQt55dvnHJVfeihh19Suqh1FtK5lUn4HPOxPF/46HcIqVCr4c5d
 tsF0O/fCRZyANUFEMzxHYQfKPdm+QUaciaemVEskGp41NHM/rld6obNFwvzhBR7vASS9
 pXHHikXeQJNYvq5isaQmPSHYtWTLLWfbKsR7Q3DsIleQGxw0MHwurs6xTEDljdgzYOhE
 kw/A==
X-Gm-Message-State: APjAAAWYZo06/m8rpN26tu7GCfjmOV1nNukVCpm/7YTdU71FTltxdgFJ
 hRM7dHiVlhfmoV0/QIt1GYcOf7fdLG7Ck8VNonQjDw==
X-Google-Smtp-Source: APXvYqxR02Q71iSmw47SnAlogqP1QrlyBrGI6yQrSsnkcNS7B2mk0Acb4HMSLBuD5qj8Ng3tUxGXKTRSzVxTm7sAWZo=
X-Received: by 2002:aca:510d:: with SMTP id f13mr1275007oib.174.1555579186311; 
 Thu, 18 Apr 2019 02:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190418085634.3629-1-dylanger@thegrail.co>
 <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
In-Reply-To: <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
From: Dylanger Daly <dylanger@thegrail.co>
Date: Thu, 18 Apr 2019 10:19:34 +0100
Message-ID:
 <CANJ4vQ1nOuFZw0kk0dWEsx4Q0h8YE2H8gRzg422cRf65FAkncg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailman-Approved-At: Thu, 18 Apr 2019 10:07:01 +0000
Subject: Re: [Xen-devel] [PATCH] Add Undervolt MSRs to wrmsr function.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Dylanger Daly <dylanger@thegrail.co>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============7250815228890833043=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418091934.bypVaFxXhEJt3MtTevr9l5IBJZ3dOX2Xw0GP9OP3S-A@z>

--===============7250815228890833043==
Content-Type: multipart/alternative; boundary="000000000000d20a3e0586ca80c5"

--000000000000d20a3e0586ca80c5
Content-Type: text/plain; charset="UTF-8"

No worries Andrew, it was my first patch, thank you for the response.

It's based on Xen 4.8

Dom0 should be controlling it, but I wasn't aware of the Security
implications.

The scope isn't well documented:
 https://ressman.org/posts/2018-06-26-voltage-temperature-tdp-thinkpad/

More experimental as it worked with my Laptop.

Thank you for your time


On Thu, Apr 18, 2019, 10:09 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 18/04/2019 09:56, Dylanger Daly wrote:
> > Giving Laptop Users the ability to Undervolt and change Temp Throttle
> Limits.
> >
> > Signed-off-by: Dylanger Daly <dylanger@thegrail.co>
>
> Thankyou for the patch.  Which version of Xen is it against?  It is
> fairly old, given that the function you patch has now moved to
> arch/x86/pv/emul-priv-op.c.  Furthermore, this is the legacy path, so
> the functions this should be added to are guest_{rdmsr,wrmsr}() in
> arch/x86/msr.c
>
> What entity is controlling this?
>
> Sadly, there are a number of issues.  You open these MSRs up to
> unprivileged domUs, and there is a mismatch between the vcpus/pcpus.
>
> What is the scope of these MSRs?  I guess dom0 is going to write them on
> all cores, but as dom0 gets scheduled around, this wont match up with
> the pcpus across the host.
>
> ~Andrew
>

--000000000000d20a3e0586ca80c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No worries Andrew, it was my first patch, thank you for t=
he response.<div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s based on=
 Xen 4.8</div><div dir=3D"auto"><br></div><div dir=3D"auto">Dom0 should be =
controlling it, but I wasn&#39;t aware of the Security implications.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">The scope isn&#39;t well docum=
ented:</div><div dir=3D"auto">=C2=A0<a href=3D"https://ressman.org/posts/20=
18-06-26-voltage-temperature-tdp-thinkpad/">https://ressman.org/posts/2018-=
06-26-voltage-temperature-tdp-thinkpad/</a></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">More experimental as it worked with my Laptop.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thank you for your time</div><br=
><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Apr 18, 2019, 10:09 AM Andrew Cooper &lt;<a href=3D"mailto:=
andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 18/04/2019 09:56, Dylanger Daly wrote:<=
br>
&gt; Giving Laptop Users the ability to Undervolt and change Temp Throttle =
Limits.<br>
&gt;<br>
&gt; Signed-off-by: Dylanger Daly &lt;<a href=3D"mailto:dylanger@thegrail.c=
o" target=3D"_blank" rel=3D"noreferrer">dylanger@thegrail.co</a>&gt;<br>
<br>
Thankyou for the patch.=C2=A0 Which version of Xen is it against?=C2=A0 It =
is<br>
fairly old, given that the function you patch has now moved to<br>
arch/x86/pv/emul-priv-op.c.=C2=A0 Furthermore, this is the legacy path, so<=
br>
the functions this should be added to are guest_{rdmsr,wrmsr}() in<br>
arch/x86/msr.c<br>
<br>
What entity is controlling this?<br>
<br>
Sadly, there are a number of issues.=C2=A0 You open these MSRs up to<br>
unprivileged domUs, and there is a mismatch between the vcpus/pcpus.<br>
<br>
What is the scope of these MSRs?=C2=A0 I guess dom0 is going to write them =
on<br>
all cores, but as dom0 gets scheduled around, this wont match up with<br>
the pcpus across the host.<br>
<br>
~Andrew<br>
</blockquote></div></div>

--000000000000d20a3e0586ca80c5--


--===============7250815228890833043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7250815228890833043==--

