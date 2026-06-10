Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080DCD8CB9
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 11:30:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334154.1597254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXH8p-0002Zv-6y; Wed, 10 Jun 2026 11:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334154.1597254; Wed, 10 Jun 2026 11:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXH8p-0002Zo-3A; Wed, 10 Jun 2026 11:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1334154;
 Wed, 10 Jun 2026 11:30:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@swg.vates.tech>)
 id 1wXH8n-0002Zi-Hh
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:30:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXH8m-0025kM-DK
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:30:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@swg.vates.tech>)
 id 6a294adb-5cb7-0a2a0a5109dd-0a2a4504b59e-2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:30:36 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@swg.vates.tech>)
 id 6a294adc-1dec-0a2a45040019-b9ff1c12a125-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:30:36 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eb14c4ec6000701b.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 10 Jun 2026 11:30:28 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id BFBFC86F92;
 Wed, 10 Jun 2026 13:30:27 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=1TSBHoISKY8Tpy76jHQz80tRDkBKRWUDDsQvzHFCD4Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rHdbFLAhxjkc/1AAPy6b2H2A2/wxWcPbHoE6xKx1l/aVuUNGgMlVT0qf30/bv84O2ZXmbmRNX
 fv1jpcGru4vfLeRwN4HETkS6aekZAsFZuiRFBxU8Ef6XAg08nyoLbkRk3CYfiz4BPadRU01ztYu
 jjHZxvj/GiyouIVT4XhAZYzgBDdzUYRyVouOmgwEDs7w1ngepxSIYlJwW69uaLuC20SmF4VE3Zk
 CZFg/7mlryu1Q/0veGz3IVmjYjs+L18YpxC9ykU7WtE+pKPDKy70WhouY8gk9ez2VAeKnD0kJSl
 zTGqU6pC0n4vbMlvxGjP+JWmTbnXQiIiuGhut86/pWMQ==
X-Zone-Loop: 4c879a77de03ff1aeea80a3b46a875d16942cbf163c5
x-campaign-type: default
x-transaction-id: 52111614-d25e-4c22-9d85-ff4449fa8efc
x-swg-uid: 01-075c240c-856c-4fc6-aa0d-a4bfdfab92b7
X-Mailer: Sweego
Message-ID:
 <1781091028.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b@vates.tech>
x-swg-bid: 1781091028.8631fc262581453bbf619ec5b2062170.19eb14c4ec6000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 10 Jun 2026 13:30:27 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/4] CI: Rework the archlinux container
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
 <20260609173102.2908514-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609173102.2908514-5-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.255d.ae5262b65ddd9331.19eb14c4bf2.5d4f0d5b593102f9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781091027955
X-purgate-ID: tlsNG-ebf023/1781091036-48E6F3FF-61FB71B7/0/0
X-purgate-type: clean
X-purgate-size: 1764

---=Part.255d.ae5262b65ddd9331.19eb14c4bf2.5d4f0d5b593102f9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2026 at 06:31:02PM +0100, Andrew Cooper wrote:
> --- a/automation/build/archlinux/current=2Edockerfile
> -    && yes | pacman -S --clean --clean

> +++ b/automation/build/archlinux/current-x86_64=2Edockerfile
> +    pacman -S --clean --clean

The "yes |" is needed, otherwise the files aren't removed from the
caches=2E

I've only got, without:
    :: Do you want to remove ALL files from cache? [y/N] :: Do you want to=
 remove unused repositories? [Y/n]
and no messages about the files been cleaned=2E

I tried --noconfirm, but seems to just get the default response, so
nothing is removed=2E

With "yes|", I drop from 1=2E32 GB to 1=2E26 GB on my machine=2E

> diff --git a/automation/scripts/containerize b/automation/scripts/contai=
nerize
> index 70494645e09f=2E=2Ef3c2b48b113f 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -26,7 +26,7 @@ BASE=3D"registry=2Egitlab=2Ecom/xen-project/xen"
>  case "_${CONTAINER}" in
>      _alpine) CONTAINER=3D"${BASE}/alpine:3=2E18" ;;
>      _alpine-arm64v8) CONTAINER=3D"${BASE}/alpine:3=2E18-arm64v8" ;;
> -    _archlinux|_arch) CONTAINER=3D"${BASE}/archlinux:current" ;;
> +    _archlinux|_arch) CONTAINER=3D"${BASE}/archlinux-x86_64:current" ;;

The "-x86_64" should be added to "current"=2E

With both fix:
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.255d.ae5262b65ddd9331.19eb14c4bf2.5d4f0d5b593102f9=---

