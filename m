Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F733C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 12:42:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404008.1637933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11LQ-0005W6-Px; Mon, 31 Aug 2026 12:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404008.1637933; Mon, 31 Aug 2026 12:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11LQ-0005Vz-Ms; Mon, 31 Aug 2026 12:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1404008;
 Mon, 31 Aug 2026 12:42:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x11LP-0005Vt-87
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:42:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11LO-00B6s1-L0
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:42:34 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9576b6-bab6-0a2a0a5309dd-0a2a4502a344-8
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:42:34 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9576ba-6ca4-0a2a45020019-d155802dd862-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:42:34 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so26437595e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:42:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cd2e9d9fcsm210772965e9.1.2026.08.31.05.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 05:42:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180154; x=1788784954; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX4wfgIZoKCCoWRsq2wssTRFX2998HO8fvEa99luS08=;
        b=W1Y0rB1wuhXZOu+df/8AgURrVwkkq8D8VmXXoas1IeFeGmpOnQgiHRE5E16JmJe2Ao
         okylrTOYe5ZV82mobIToPJCdD3TODdZYatF/aq3ozmfdBQuLPuG7wwaUQK+e1RAkgtk8
         tyoMunG0d2gjqlgBxBL9UCDrEVkyE7mkBSzFnDWbeAXFIUrd5KZDuYR8uGK3Wv0hncpo
         00dzDNcJoSKFr36sLjEQWeopDn8VQyc7L5phbhdmT7kHVrbaS0uybBwmlY21eOa23eaZ
         23Z3GX5LrSho61nBKezK79RSzhVDiPmoma1jT33uc00ShwtLJc8JuEmq+rWQ5dThNjH3
         3/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180154; x=1788784954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX4wfgIZoKCCoWRsq2wssTRFX2998HO8fvEa99luS08=;
        b=m9mWPhzGeyKkJK2klmUcg8HAP4S1LLtyWT/N8BlMHykzeFvf6l+BY0ze0db+hvyA00
         /981y+GZvBknJxyRKNwCF7c4RMg0iMoWS6uEW+pYsFuZ15N9yHckSiwAuGgYrPdFE1th
         8LSrkveIfd1mnqj2wBJTE82LL6RjKVpObZxES7a6bGcQK0GuK/0AOCtnOxEd3O98/Q/G
         ElNwN9oy0NL31ZMMp6rokflvBRGLrqBCTMLEOkRQI34EkVUdnP2OzRgcoswspYV4VUmO
         VXkjY+QjTZ+cmPg+HIwHXj3oEWyWqwFjkZe9iwmVCZ+gmiBqpjZc1GBPuaTk3JFowmeq
         P/0g==
X-Forwarded-Encrypted: i=1; AHgh+RrgKFevVKCSS9cZa+HBZI6V/WrIRTQr80mNxLGtSEMEBSG2bOGBVV1M70SOGeJl8qgwFFnE/W8uqhE=@lists.xenproject.org
X-Gm-Message-State: AFuF++nF7GUwtMH9OBTR+Ck2oYarI4R0VLPCmUSshAXkw8vlq7O0Jdwk
	yGiFVzYE1IJi3I4sVNUefMgbR/nwKyUAEVARtSgv7tZxJKOmp6IyMtWA
X-Gm-Gg: AR+sD11zW5gk5jeS5yAxj/rA9zH2k65GeuY2uKfTYrKVd06xXBoc2iF1bKBWKTMuaaW
	tn3kP24fQk7S/+VfYzGA/d35skJWqZdnks8rj3HlWmSJpbTAya1wd7OzfVyWsrbWnEZngdKYoqA
	ai95Yzyei0PyELYL49866SmhG1WVqodaW41b1Z4h5D9scz2AL/rIFPID2Mo8Dp8jeZ6be3GMEjh
	EnEiVpmbzvkaGDvvzLEHTG1i1zlri7I1I/cQNorePMvcc6do95iXWnNbm4fvT9MlccLL4JG2sSc
	a+bVIMsLosVjonF9L7xpltWNbmlbRXQbBWHHTFmgH8PaHPFIcWyx0aVFkdnyh2WqgcADM/h3g3O
	YtDfJkibCXCnYsYCM4MFakrS41bml9pcZWIIhXpApLxDjJq/08rZSQbYIla4B7X+F6juG8PFPXs
	GEMh5Z+knqfxMhyfdCVH0xYRFNlgcRvkBV94ks2Gw2B/dHZnWEGNO0BWpv6Q5mlpzU4KkLk40ZZ
	TlDludQUgA1k65dlmzQwEyx67L/5C9uh+gneHLUxQ==
X-Received: by 2002:a05:600c:8581:b0:499:a760:722f with SMTP id 5b1f17b1804b1-49b91c47bf8mr326368655e9.13.1788180153954;
        Mon, 31 Aug 2026 05:42:33 -0700 (PDT)
Message-ID: <91ffbf33-0b54-406f-b91f-1a96afc616d7@gmail.com>
Date: Mon, 31 Aug 2026 14:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/39] xen/riscv: introduce csr_read64()
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <0f7080ea4dc86a8bb3dae39d94e5b03e95d010c0.1787838835.git.oleksii.kurochko@gmail.com>
 <aded3bc6-6d5c-4c3f-879a-be428a8ad36a@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aded3bc6-6d5c-4c3f-879a-be428a8ad36a@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788180154-F24B62AC-3867FA3F/10/73395122804
X-purgate-type: spam
X-purgate-size: 2287



On 8/27/26 5:36 PM, Andrew Cooper wrote:
> On 27/08/2026 4:20 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
>> index 888d6a2a86d6..a5cdd6f99c8e 100644
>> --- a/xen/arch/riscv/include/asm/csr.h
>> +++ b/xen/arch/riscv/include/asm/csr.h
>> @@ -39,12 +39,36 @@
>>       csr_write(csr, v_);             \
>>       csr_write(csr ## H, v_ >> 32);  \
>>   })
>> +
>> +/*
>> + * The two halves are read by separate instructions, so a CSR which hardware
>> + * increments can carry from the low half into the high one in between,
>> + * yielding a value the CSR never held. Re-read the high half and retry the
>> + * sequence if it changed.
>> + */
>> +#define csr_read64(csr)                         \
>> +({                                              \
>> +    uint32_t hi_, lo_;                          \
>> +                                                \
>> +    do {                                        \
>> +        hi_ = csr_read(csr ## H);               \
>> +        lo_ = csr_read(csr);                    \
>> +    } while ( hi_ != csr_read(csr ## H) );      \
>> +                                                \
>> +    ((uint64_t)hi_ << 32) | lo_;                \
>> +})
> 
> This double reads H in the looping case.  You want something more like:
> 
> hi = csr_read();
> do {
>      old = hi;
>      lo = csr_read();
> } while ( (hi = csr_read()) != old );

Good point. I'll apply that.

> 
> 
> Still, this only matters for volatile CSRs, and is unnecessary in the
> general case.  I'd suggest naming it csr_volatile_read64(). 

Yes, that makes sense. I will rename it to csr_volatile_read64().

> Most CSRs
> can use a simple split access.

I may have misunderstood you here, but wouldn't it still make sense to 
have a macro covering the case where a register is 64-bit on RV32 yet 
accessed through two CSRs? VSIE and VSIEH, for example.

My plan was to use a single csr_read64() (but while loop then really 
isn't needed in this case) call to abstract the access to VSIE, so that 
the code looks the same on RV32 and RV64.

Does that make sense, or would it be better to have separate vsie and 
vsieh fields instead?

~ Oleksii

