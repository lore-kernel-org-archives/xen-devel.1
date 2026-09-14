Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB4DC88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 11:48:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420840.1647057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65At-0002Eb-3B; Mon, 14 Sep 2026 11:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420840.1647057; Mon, 14 Sep 2026 11:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65At-0002EU-0L; Mon, 14 Sep 2026 11:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1420840;
 Mon, 14 Sep 2026 11:48:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x65As-0002EO-EI
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 11:48:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x65Ar-0017U7-Cm
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 13:48:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7df0d-bab6-0a2a0a5309dd-0a2a450599f8-22
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:48:37 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7df15-4cb1-0a2a45050019-4a7de48cddef-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 13:48:37 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254fa4c24cso262570666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 04:48:37 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29660219ecsm413939866b.16.2026.09.14.04.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 04:48:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789386517; x=1789991317; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xL0QViIq8WveYbpgruXyAkwKN3bOGAOjj8sghQlhHo=;
        b=ejeq5xC7KrYyjj0Vk23l1hhAnLtHtfK0uLiX3F9zJWjNGOtXJb5rVKAJgHezm1PiM4
         X8w/90LzRTF3KmoH7JHgKTGvNEwuDqE4V+vnx8SUKfJti3fUvOSu2e3y7UTofzvD0/5l
         j73n5T0haePBNCIr2z0+D5MprhblAHdC3RPZqVVDpIiLP4P7fM9NZwFbFtBRn37hkJ9D
         +aY4AJwSxE9MBNDDC4lyW/PSlF9lhTnmFfwLRQZB2Q3ylTb9l28kLF8h/bihf+2R7f5A
         vvAGHLO4Mw51WS39mV6G3ELLhygc4cLIH8E8npjaYhMjRkqDwfMsr/NqGIWf55R4wqhc
         UViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386517; x=1789991317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xL0QViIq8WveYbpgruXyAkwKN3bOGAOjj8sghQlhHo=;
        b=LtgyDlnMsbZ6z8doyyomZrXnS0YV9IyKk53Xk72QSlMB/5zV9UE+/LzzhrKMq6O1T1
         LzSCovFx2BBHM1+kAMODpY0Jj9YPGxevxAVx1W+2qUAFkxMu8ep2DDPHlyY/8XqWSO7L
         jDSd+wqYnpAEDW9UqEpyvD22QF37pti+iPtLkq92LXycf+KsUV2xj2bsHuvRBdG3bIRt
         QaFMoqGDZ6WVIignghkGmJ6ZTzFYExr84FJHZ0EYOZ6tV/mU0r2a0KDGJwikqC3Us+bH
         1NJH4zB8SRPBzqHZjChNMYn/2EfOUFqnalJ2sK30jdtFwkcZEw0bo6/oGRRsTyQ4Js9/
         NbsA==
X-Forwarded-Encrypted: i=1; AKwUvByoBovO2T2fIWcMtP4aqm+qmS8vgVv1w1ZujPtNwcYUwoVpGlwGU8iLl5wd+C6MuD1jHnsB3uk7gTM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lrfR/T+9Ii8m677dGS47hHTWe01C1K5HcxFpr1P8zW6NbItYPU
	tN3h4j79ipXeiYP77riX732U0FX5lMn0dI+ILWefS9LE+nmAkwOjpcHk+AUZF6hPOA==
X-Gm-Gg: AYBFou3EbdzL70W8HL7eZmrQVD43Fm850ODMkVex/QloAm2OTlND3FKPTG21uLEn0lQ
	dnlCtRZFvMoyJaCFCslUPyjE6a+ZAQ1jRtDL6Af9+8+t6whivPf+Jsq3mBB3OvEN1xDnfRmoUF2
	VeXEy0dc1ra5G2QGsRKXA62K+WWBMTcOQAdcZpzcFFVNoAF8hP0phEm4QVD4L70IqH0sXe5/GB6
	GgNrJaO0Su6qR/7I1JgS3iRL1US1nVvcYuGIqd/ZI+1ONrbbHyWwldtiRmQU4XeGoNN5pcMsiPV
	QmKjcqv40v+t1QVjFB5EpA0IEM2kpyJue1JpIrauNioNe8eZfDyPlWTR7ylLMJl57ZQB+wZkF6c
	LzSLeC64A/KnUPsRQr719FAtP+Cm0TTLgntDVMhFDZA/mhzBFxb8CCx8fRQHMB5Wds9vkaDopsO
	F0Q1WUuSn/srkl4JdYDoqKYq4x/5RdtstvV821cMm3YC2fDwzVQ8Hh5ikKzKCCO6Vxm2Dq/ePK7
	hNtVnHkeGrxhYqefpWQ2fc=
X-Received: by 2002:a17:907:9806:b0:c29:4503:35a9 with SMTP id a640c23a62f3a-c29b874b239mr138933466b.44.1789386516719;
        Mon, 14 Sep 2026 04:48:36 -0700 (PDT)
Message-ID: <ec4da2d4-d1d4-40f9-a008-be6ac4d2f05f@suse.com>
Date: Mon, 14 Sep 2026 13:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/39] xen/riscv: add guest load emulation for trapped
 MMIO accesses
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789386517-71CA82A1-DB2C0647/0/0
X-purgate-type: clean
X-purgate-size: 1707

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> @@ -419,7 +416,41 @@ static __maybe_unused bool decode_ldst_insn(struct decoded_insn *di,
>  
>  static int emulate_load(const struct guest_fault *gf)
>  {
> -    return -EOPNOTSUPP;
> +    struct cpu_user_regs *regs = gf->regs;
> +    mmio_info_t info = { .is_write = false };
> +    struct decoded_insn di;
> +    unsigned int shift = 0;
> +    int rc;
> +
> +    /* A fault taken re-reading the instruction is redirected to the guest. */
> +    if ( insn_fetch_faulted(gf, &di) )
> +        return 0;
> +
> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
> +        return -EOPNOTSUPP;
> +
> +    if ( !di.is_unsigned )
> +        shift = BITS_PER_BYTE * (sizeof(unsigned long) - di.len);

This is one of the cases where sizeof(<type>) is not only unclear to
read, but actively risky: Which variable(s) of that type does this
refer to? What if those variable(s)' type(s) change? Aha, ...

> +#ifdef EMULATE_LOAD_DEBUG
> +    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
> +             regs->sepc, gf->gpa, di.len, shift);
> +#endif
> +
> +    rc = do_mmio(&info, gf->gpa, di.len);
> +    if ( rc )
> +        return rc;
> +
> +    /*
> +     * A load into x0 discards its result: writing regs->zero would break the
> +     * invariant that it reads as zero when x0 is a source operand elsewhere.
> +     */
> +    if ( di.reg )
> +        *guest_gpr(regs, di.reg) = (long)(info.data << shift) >> shift;

... you apparently mean sizeof(info.data) there.

The comment is (nit) also too long for my taste. Everything from the
colon onwards is imo redundant.

Jan

