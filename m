Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748D8F9D0C0
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 11:36:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281642.1564485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCc4B-00075F-S5; Tue, 14 Apr 2026 11:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281642.1564485; Tue, 14 Apr 2026 11:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCc4B-000758-PW; Tue, 14 Apr 2026 11:36:27 +0000
Received: by outflank-mailman (input) for mailman id 1281642;
 Tue, 14 Apr 2026 11:36:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69de26b7.v1-257b21c4df744c0ea0670254c1d0c766@bounce.vates.tech>)
 id 1wCc49-000752-VE
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:36:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCc49-00FyEd-3o
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:36:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69de26b7.v1-257b21c4df744c0ea0670254c1d0c766@bounce.vates.tech>)
 id 69de26b6-e002-0a2a0a5209dd-0a2a4503befa-8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:36:24 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69de26b7.v1-257b21c4df744c0ea0670254c1d0c766@bounce.vates.tech>)
 id 69de26b7-02b3-0a2a45030019-c602bb0e877a-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:36:24 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fw2Kg2Sm9z8XRvxX
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:36:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 257b21c4df744c0ea0670254c1d0c766; Tue, 14 Apr 2026 11:36:23 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="ngoc-tu.dinh@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776166583; x=1776436583;
	bh=xwnl3M2COGDDo2p9tYSk8w95SfMZZ/DdHUWNhVXJjFc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HKsOlKKvb9wvqin1rprD45U5jl0KnNmIsKH/+9RcQ0H9A1wS51aW92nbqjdG+FIua
	 DFMKU9Cp5r9lE1Qj2/SXWDxlVdTYkgdHuXMF9Z6DlWc/k7xBiaqXV/YacVM2U+6PVL
	 /4PolylLG5T3PUAydL8v1czpUVphXb2lrbKu7A6A0BnKPtZbKJXcuaBKl6hBCloMlt
	 4JQBvPJlc9Khnx0JhcIbsQgk1mbz2uBIYuoz9xJS8GqSZXqQwZOibKtlh5962OLkS7
	 Psr1sWXGv7NHVk/Bk91xLk/pEqOc3/fw4CRkWm2b7scpmZIbDOlL/e1n043FfZML5h
	 79GApbmmUgYYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776166583; x=1776427083; i=ngoc-tu.dinh@vates.tech;
	bh=xwnl3M2COGDDo2p9tYSk8w95SfMZZ/DdHUWNhVXJjFc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mNAGXJrYoNmLRKoPA0DE0SP9PrP70Z6cr04lQrBXUW2E1UszXpBWokEfK7I9552YP
	 wKDLJtk2Wfo3zKWlyDPmVAytcVjLpptFB72N3et9DQsYvSBGGOUaGh+C93iPurml6n
	 Ddn6To9pmNXoL5jWW7QUmTnuT4E+C/KclpXPZnbJ7fhcrX94IpuxTTGiSAysQzAKa6
	 6kIyTIutb6DWjS7SHoSZfBVv27Jd21OHLdJ6SgsmAv3Mz3+n8eJ1qQRnaZd/3NdMEJ
	 K7pp/jeMFuU9DqTwi44QMiUu4E1DN3zt7ilfHIujPoP+Wv8Hi6lMG7hAO6pwGerYKk
	 FiY8BREJKMgsQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/2]=20xen/cpu:=20round=20up=20cpu=5Fkhz=20calculations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776166581512
Message-Id: <d647f18c-c91b-4507-ac1a-149e50d14062@vates.tech>
To: "Roger Pau Monne" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Michal Orzel" <michal.orzel@amd.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Alistair Francis" <alistair.francis@wdc.com>, "Connor Davis" <connojdavis@gmail.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Teddy Astie" <teddy.astie@vates.tech>
References: <20260414103327.7420-1-roger.pau@citrix.com> <20260414103327.7420-3-roger.pau@citrix.com>
In-Reply-To: <20260414103327.7420-3-roger.pau@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.257b21c4df744c0ea0670254c1d0c766?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260414:md
Date: Tue, 14 Apr 2026 11:36:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1776166584-40369C9A-690E3EA6/0/0
X-purgate-type: clean
X-purgate-size: 2660

On 14/04/2026 12:36, Roger Pau Monne wrote:
> All arches truncate the cpu_khz without taking into account the less
> significant digits.  Instead use DIV_ROUND_UP() when scaling from Hz to k=
Hz
> to get as more accurate kHz value.
> 
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Couldn't DIV_ROUND be used here instead for a round-to-closest?

> ---
> While the possibly more accurate value is nice, I'm not sure it's actuall=
y
> fixing any functional bug, and hence the lack of "Fixes:" tag.
> ---
>   xen/arch/arm/time.c   | 4 ++--
>   xen/arch/riscv/time.c | 2 +-
>   xen/arch/x86/time.c   | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index a12912a106a0..9e0c485c77db 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -118,7 +118,7 @@ static void __init preinit_dt_xen_time(void)
>       res =3D dt_property_read_u32(timer, "clock-frequency", &rate);
>       if ( res )
>       {
> -        cpu_khz =3D rate / 1000;
> +        cpu_khz =3D DIV_ROUND_UP(rate, 1000);
>           validate_timer_frequency();
>           timer_dt_clock_frequency =3D rate;
>       }
> @@ -136,7 +136,7 @@ void __init preinit_xen_time(void)
>   
>       if ( !cpu_khz )
>       {
> -        cpu_khz =3D (READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK) / 1000;
> +        cpu_khz =3D DIV_ROUND_UP(READ_SYSREG(CNTFRQ_EL0) & CNTFRQ_MASK, =
1000);
>           validate_timer_frequency();
>       }
>   
> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
> index 7efa76fdbcb1..faca7b70e13a 100644
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -40,7 +40,7 @@ static void __init preinit_dt_xen_time(void)
>       if ( !dt_property_read_u32(timer, "timebase-frequency", &rate) )
>           panic("Unable to find clock frequency\n");
>   
> -    cpu_khz =3D rate / 1000;
> +    cpu_khz =3D DIV_ROUND_UP(rate, 1000);
>   }
>   
>   int reprogram_timer(s_time_t timeout)
> diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> index 244277c0a921..b84414f00d05 100644
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2642,7 +2642,7 @@ void __init early_time_init(void)
>       set_time_scale(&t->tsc_scale, tmp);
>       t->stamp.local_tsc =3D boot_tsc_stamp;
>   
> -    cpu_khz =3D tmp / 1000;
> +    cpu_khz =3D DIV_ROUND_UP(tmp, 1000);
>       printk("Detected %lu.%03lu MHz processor.\n",
>              cpu_khz / 1000, cpu_khz % 1000);
>   



--
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



