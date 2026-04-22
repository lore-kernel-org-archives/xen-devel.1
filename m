Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB464F94CA2
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 00:03:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289731.1569508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFL3X-0004jS-QS; Wed, 22 Apr 2026 00:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289731.1569508; Wed, 22 Apr 2026 00:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFL3X-0004jL-Mu; Wed, 22 Apr 2026 00:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1289731;
 Wed, 22 Apr 2026 00:03:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tamas@tklengyel.com>) id 1wFL3W-0004jF-An
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 00:03:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFL3V-00G3UU-Nr
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 02:03:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tamas@tklengyel.com>)
 id 69e81033-e002-0a2a0a5209dd-0a2a4507bf9e-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:03:01 +0200
Received: from [136.143.188.12] (helo=sender4-op-o12.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tamas@tklengyel.com>)
 id 69e81033-229c-0a2a45070019-888fbc0c433e-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 02:03:01 +0200
Received: by mx.zohomail.com with SMTPS id 1776816174730416.17740676882624;
 Tue, 21 Apr 2026 17:02:54 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-40974bf7781so4567563fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 17:02:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zmail header.d=tklengyel.com header.i="tamas@tklengyel.com" header.h="MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type"
ARC-Seal: i=1; a=rsa-sha256; t=1776816177; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XYspWC+D5MzDrC+8xxyKTK8tuHjqyGEtSHIeqIbHWSZKgInkEeYQH6oNkIMvpJQOsGXoBSMtc67znWGkL5eSf+Rsj4YwvHzoUHF2fg+vBr/VL8YQb6WRFEz63FA24dD7zbmX/Rw92I6MXD/R8g5hWE0sVXZpK8JpNrdOBLetOYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776816177; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zd1lEyRoFzTLgQItSNg7tNN3pcIh4yEX3S7ffIydiQA=; 
	b=hRYDwffcaA+LuNSxSr4Lz1gvB38Iv03r6Vuzsqi1pzp3QfOh2yMm2vCerzLeuNO0iWotWZV1Ot9fu15IXPccmy/09Qxb7H14Rso/HEZui5FuQIllj0SMrIPwQRTjRYJ/GSweSCI9N9t/3H/jl6SW8UgdcorHBM43WyaRdnoKvCA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776816177;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=zd1lEyRoFzTLgQItSNg7tNN3pcIh4yEX3S7ffIydiQA=;
	b=TGAKTmlXQTmlDVWVPVPJykUgLf/ts6wjvLOiV5totqIfKLirECauU8X8Jy91m+59
	j2uIIGrYxBvcuyeBo9c3aNmTE/HcvBLTIx/8H5xw3Y+eMi0oaKGyT4z9uYGJRQB4Cw/
	vRBz1itX3YNgMo1/Y+xWuXrq9yclRytaueG3SbyY=
X-Gm-Message-State: AOJu0Yxfd83/eGrC53x9AZVhjPWCLWNtRxVEUgxDSjxMA3iqdkfhDqhh
	QG7TbyLYiiD3g5HUDW45QUEWJ+9Y+l5TxuYxMA2e2twcVPCySNIjd5kbzrgTUkKQogAH4ieH1qi
	HJukd83i8LM3KPlNjekTQFwUhoYnGqMk=
X-Received: by 2002:a05:6870:a793:b0:41c:9797:d1e6 with SMTP id
 586e51a60fabf-42a99ab682bmr9703095fac.14.1776816173961; Tue, 21 Apr 2026
 17:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260420213206.208750-1-Rose.Spangler@elektrobit.com>
 <20260420213206.208750-9-Rose.Spangler@elektrobit.com> <CABfawh=trqX6Gx3udVpaYDiLRcG+99SHNmK4s9f5pjmNbCMM1A@mail.gmail.com>
 <CH3PR08MB8735846D3C525C40DE983AAC912C2@CH3PR08MB8735.namprd08.prod.outlook.com>
In-Reply-To: <CH3PR08MB8735846D3C525C40DE983AAC912C2@CH3PR08MB8735.namprd08.prod.outlook.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 21 Apr 2026 20:02:17 -0400
X-Gmail-Original-Message-ID: <CABfawhkeMkzaJSPXxGqQ+m-7J1gozrKJaiR-99AWTQ6ZmsdaqA@mail.gmail.com>
X-Gm-Features: AQROBzDXqVm6cwC8bc6fH7GkxSh6NHqMx_eWB2LQdtm-V9_1G1YHiTFScZJ4JC0
Message-ID: <CABfawhkeMkzaJSPXxGqQ+m-7J1gozrKJaiR-99AWTQ6ZmsdaqA@mail.gmail.com>
Subject: Re: [RFC PATCH v6 08/43] altp2m: Rename p2m_*_altp2m functions and
 move declarations out of p2m.h
To: "Spangler, Rose" <Rose.Spangler@elektrobit.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: multipart/alternative; boundary="000000000000e157ef065001400f"
X-purgate-ID: tlsNG-ef75cf/1776816181-ADF6EC48-A70332E5/0/0
X-purgate-type: clean
X-purgate-size: 2666

--000000000000e157ef065001400f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:07=E2=80=AFAM Spangler, Rose <
Rose.Spangler@elektrobit.com> wrote:

> >The following function names could reasonably drop the _altp2m suffix:
> >
> >
> >> - p2m_get_altp2m -> altp2m_get_altp2m
> >> - p2m_set_altp2m -> altp2m_set_altp2m
> >> - p2m_reset_altp2m -> altp2m_reset_altp2m
> >> - p2m_activate_altp2m -> altp2m_activate_altp2m
>
> I used these names to try to differentiate between these functions, which
> operate on a single altp2m view, and the altp2m_init / altp2m_teardown /
> altp2m_flush functions, which operate on all the views of a domain. For
> example,
> without the suffix I don't think it's necessarily immediately obvious tha=
t
> "altp2m_activate" or "altp2m_reset" operate on only a single view.


How about you add the _view suffix for these? I think it would help
disambiguate them and also read better than the current _altp2m suffix ones=
.

Tamas

--000000000000e157ef065001400f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 21,=
 2026 at 10:07=E2=80=AFAM Spangler, Rose &lt;<a href=3D"mailto:Rose.Spangle=
r@elektrobit.com">Rose.Spangler@elektrobit.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt;The following function na=
mes could reasonably drop the _altp2m suffix:<br>
&gt;<br>
&gt;<br>
&gt;&gt; - p2m_get_altp2m -&gt; altp2m_get_altp2m<br>
&gt;&gt; - p2m_set_altp2m -&gt; altp2m_set_altp2m<br>
&gt;&gt; - p2m_reset_altp2m -&gt; altp2m_reset_altp2m<br>
&gt;&gt; - p2m_activate_altp2m -&gt; altp2m_activate_altp2m<br>
<br>
I used these names to try to differentiate between these functions, which<b=
r>
operate on a single altp2m view, and the altp2m_init / altp2m_teardown /<br=
>
altp2m_flush functions, which operate on all the views of a domain. For exa=
mple,<br>
without the suffix I don&#39;t think it&#39;s necessarily immediately obvio=
us that<br>
&quot;altp2m_activate&quot; or &quot;altp2m_reset&quot; operate on only a s=
ingle view.</blockquote><div><br></div><div>How about you add the _view suf=
fix for these? I think it would help disambiguate them and also read better=
 than the current _altp2m suffix ones.</div><div><br></div><div>Tamas=C2=A0=
</div></div></div>

--000000000000e157ef065001400f--

