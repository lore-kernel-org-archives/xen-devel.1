Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6899C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 14:04:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B611A2087C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 14:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u1P2MNHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B611A2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG2Dl-000415-7Q; Mon, 15 Apr 2019 14:04:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HI6c=SR=gmail.com=matthew.leinhos@srs-us1.protection.inumbo.net>)
 id 1hG2Dj-00040v-RS
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 14:04:27 +0000
X-Inumbo-ID: 608f3f42-5f87-11e9-92d7-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 608f3f42-5f87-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 14:04:26 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z6so48559wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 07:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUiK6IgiXqrYHDXYLxGbtHedJ5WriLdiN6I4b+2ZPys=;
 b=u1P2MNHdpvghZBBtUU3V+5RFD5GW52w1poXZHUUXrjX67mC3e5jIerZ7iEprkKyz5K
 34QKlodxL5XT4xn0vvr19GI67qC0UvRm2dQ6xbzLCPkGZ8hCWzsjS8iS0DxrAyFqBO78
 s8Yl1nxLCbPq8IML+AhZDpbOZbv0y8CT8c5CnYR+RebOOi7RdNlwq77y6/d7OwxxoC1d
 gl5EOWurlyW4bEPMgoBbmIzAmHRPMffdEkZj8sUc3ZyOaA8YAAtIZqZUrmqI6VyC+vIW
 HiG89FIV8O6uVTYG4r35iZERBSVQngpRkV5bbPM/5fCq4RWZUDs1q5if7Irf0u5QClky
 OcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUiK6IgiXqrYHDXYLxGbtHedJ5WriLdiN6I4b+2ZPys=;
 b=lNjF0+f4EuM2FgxtigRVzmScm7teJ3zcucq876zD4gsu0eDylS1FImFfr6zt+pTSRD
 f/ZPKviXNYa1ewBrW7qpe0WauA/lu+7h9X4xUpBpIgOAeqUuNVNS9GbDA6LVmpcd5cyM
 wcERe/Mxd+3sj06IGjXnOwGr3X+keS02974puKTbovFzrtR2cwsly7uiEDB6f1oOqkNE
 Ex/KIXNe+IAcA/i76u9wMJt9IMIE7YRU4s92NChES3VzqnuSA5CUH2rEyLwgeCFdKm9E
 xJShfyeKGcXPq2zrY8Z4H+WEL2uOBvXcyq6qb1YVtfS1GaIiuVmmr9pTQ9WAXwKQJKgf
 bi6Q==
X-Gm-Message-State: APjAAAUUQ8vAlasVIdPmxWu3QMKJCxUloCll+2wkE3EOR6Icc59GV4EU
 z2ErKvfZmKJk0Z1VxJ6x342d81J8Y46jpKY4il06yQ==
X-Google-Smtp-Source: APXvYqz6Y2XT/SGKRfB6Az9oSb3s+2WvjN6DwGJ7UmSUT0qqRy9YAhOGfC7Ned4d8QEuKij4BSuKdPvTLDzkfL1bEsQ=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr21693539wmj.83.1555337065116; 
 Mon, 15 Apr 2019 07:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
In-Reply-To: <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
From: Matt Leinhos <matthew.leinhos@gmail.com>
Date: Mon, 15 Apr 2019 09:04:13 -0500
Message-ID:
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============4655563470662867755=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415140413.O3KM6p1z_7KC9bJnt7d82Blosj0I3SmcrxXFgtkhokI@z>

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

