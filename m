Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F6606A32A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HUNEpQBI
Received: from list by lists.xenproject.org with outflank-mailman.1497832.1695884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUK1p-0008Mw-3o; Fri, 20 Nov 2026 08:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497832.1695884; Fri, 20 Nov 2026 08:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUK1p-0008Mp-1G; Fri, 20 Nov 2026 08:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1497832;
 Fri, 20 Nov 2026 08:31:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUK1o-0008Mj-H6
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 08:31:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUK1n-007I9Q-MR
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:31:27 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b00054a-8faa-0a2a0a5109dd-0a2a450ba3d4-16
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:31:27 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b00055f-b7e8-0a2a450b0019-d155802aac3c-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 09:31:27 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4bb72b44a97so4611805e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 00:31:27 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm57774395e9.9.2026.11.20.00.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 00:31:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795163487; x=1795768287; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yBfhjeN6w6PhBxIR1RjbdaVwORFJ+72dM1b/oLLX28k=;
        b=HUNEpQBI9NQGE6i+OnBcp5ctv6y9iY5crJ9raE5Jr1C8SP524aeN3v5skRHMnQw/Bo
         DFAvWWWsrFXOTD0O52UyYswC8RrY8FdUB3y2xP1CkHd1c2oZAy7tlJeHK8ZGJdUtKXQv
         XJQPsIJrPirtNAtrmCVxaACFSPIEWvZ/eTWQZ3WcDYe2NbooRW8pMLHjx/ZCa7b9KlOE
         K8EloPtJ73Hcx+bcLdESMh8whyConrd/32IA716Apsawr4BYl64spW4IufjdN2nyg4I1
         NZd5XSblPot4QiD6eRZzoiHhS4DtrVqkIjY/bz6/ZPaaxLSqGjqA9det3j54L4V7FVl3
         Zvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163487; x=1795768287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBfhjeN6w6PhBxIR1RjbdaVwORFJ+72dM1b/oLLX28k=;
        b=HNt4Z+r2PB57XVo4f1Qj06arZrxByNAmyS9VuAl5i/z1wcbojXYhGlMtF6LAfunYho
         ZA2c1jei0j56dtU5ZrxGHrEwc5cbHeMlllJ1n3dl6SreDkNb3lhq5su4tO4V+fJl+ZmQ
         3M3548hpAqMF1DY79L1dum9uwTJ13l5Vj1xshj0vwFpc2pjjKhQzomeX9vF1VddZVbtY
         Lo0gNYglTJqUfjiJWaOCpug0ThMHsu7OgwGZ9McWnGfJdhn13rQjpLQPIrH2P8Tw2FhK
         sUVVgBWO2SuFuOSFmHqSnr6zA9iOkq0krEWkul6OMXYxwlgGZkw394+Nug7gwmuMoraY
         QndA==
X-Gm-Message-State: APuU4Z/kiTDOf0C5SatE+KZnRfl6k6IjRDwhLaFfz0fAuUSud9bl4U3N
	/qqUfVuh11hCinpyzhJB4V2lV+NoFzH9nt/gD2RcSlS9IXjb2S9gmRMT
X-Gm-Gg: AYBFou1dCJ4AetgazRsjBYcYwaZ6N70WZM//iHEpGNFS7GFmxXdycgxAGMFDvzaKrm2
	pPLoYPKIYD5C1r7sIMAYoebNSAu8Wq6WanmKq88zycsJaio1IsH80atowJNISCFc3QwaPzW2PqN
	M+tNxoITj+BVkqsNnNQDuHGf+5oaXUjoyt8+ShF5jNVQDJH0ilni+RH/UtOusMoE0o8DCEB18Hq
	HJZrKH+e+LXXVjw/BL5/m+plgDvqs+vn7YMORbKu7VMJqhc+0P4MlYh7kxZdd3LuGtmFfqvrjMs
	5TBnPfulaG2kuMGUS+3/vuTczMidahDtKLwInCSfu5mtYcoFF7XzOCpaBXT/c65SvRUnpRVumq/
	wFVskdKQlTmFMZFN+pSxMAf0HNKrSsrafd7Ju/+/pkLzNgL26GUbT8vCeQRC/T2CyVcc+javty7
	si2ElzRgQpWGogCg8vk9l55LbLlp1vxYrjwnuFBz1cLICrRyCB8GJ5/bdsMQZc4Tp+DXveh0YL6
	h6zcdEYpmuyAWDDC2dCiEBgKnej3P3lktzlzphLY2feadkTFnpK/g7rnIzQCCg92/+4D6VcKhei
	3NMXqX864Kr94e/QUrNx6VMCMNchkAwCn5Tm+b7vWiYf+uy6pWaQ37ay00V5qoVrwB8ek+WosNS
	Elg==
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr54377295e9.9.1795163486879;
        Fri, 20 Nov 2026 00:31:26 -0800 (PST)
Message-ID: <203974c4-e1ba-40ba-8329-e220fab53370@gmail.com>
Date: Fri, 20 Nov 2026 09:31:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: vsbi: add SBI TIME extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Hiago De Franco <hfranco@baylibre.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Ronaldo Nunez <rnunez@baylibre.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261119-riscv-vsbi-time-ext-v1-1-1d5813a883e6@baylibre.com>
 <1795105976.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1795105976.8631fc262581453bbf619ec5b2062170.1a1f4a7711a000183d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795163487-2C39B9EA-AE35AD3B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2448
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/26 5:32 PM, Baptiste Le Duc wrote:
> The commit's name is kind of weird with this two `:` next to each other.
> Here is suggestion based on previous patches (xen/riscv: implement SBI legacy SET_TIMER support for guests (647542cdf1)...)
>      ```
>      xen/riscv: implement SBI TIME extension for guests
>      ```
> 
>> [ ... 8 lines skipped ... ]
>> Implement the TIME extension and handle SET_TIMER() by programming the
>> vCPU virtual timer through vtimer_set_timer(). With the extension
>> registered, SBI_EXT_BASE_PROBE_EXT reports TIME as available and Linux
>> selects the v0.2 path.
>>
>> Assisted-by: DeepSeek:v4.1-flash
> Uncommon to see DeepSeek model used :)
>> [ ... 46 lines skipped ... ]
>> +static int vsbi_time_ecall_handler(unsigned long eid, unsigned long fid,
>> +                                   struct cpu_user_regs *regs)
>> +{
>> +    ASSERT(eid == SBI_EXT_TIME);
>> +
>> +    if ( fid != SBI_EXT_TIME_SET_TIMER )
>> +        return SBI_ERR_NOT_SUPPORTED;
>> +
>> +    vtimer_set_timer(&current->arch.vtimer, regs->a0);
>>
> Nit: this assumes VSXLEN == 64, i.e. that stime_value fits in a0. The
> SBI spec (binary-encoding.adoc) says:
> 
>      Parameters that are 2×XLEN bits wide are passed in a pair of
>      argument registers, with the low-order XLEN bits in the
>      lower-numbered register and the high-order XLEN bits in the
>      higher-numbered register.
> 
> and sbi_set_timer() takes a uint64_t stime_value, so an RV32 guest
> passes it in a0 (low) and a1 (high).
> 
> That's fine today, as both Xen and its guests are RV64 only, and the
> legacy SET_TIMER path makes the same assumption. But nothing in the
> tree enforces it for guests, so it might be worth stating it somewhere.
> 
> Oleksii, any opinion on that point?

I thought about that too, but decided not to mention it since, as you
noted, only RV64 guests are possible at the moment. Another reason is
that it isn't specific to this handler: every vSBI handler takes guest
arguments as full-width registers, so other SBI extensions have the
same issue. To me, this should be addressed together with RV32 guest
support.

If we want the assumption stated explicitly until then, I think it
should be done once, in a separate patch, e.g. with a comment in
asm/vsbi.h or an ASSERT(is_64bit_domain(current->domain)) in
vsbi_handle_ecall(), rather than per extension.

~ Oleksii

