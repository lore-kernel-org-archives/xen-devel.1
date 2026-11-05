Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB78606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VnGaeeJ7
Received: from list by lists.xenproject.org with outflank-mailman.1474581.1681614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOwuT-0000mV-MB; Thu, 05 Nov 2026 12:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474581.1681614; Thu, 05 Nov 2026 12:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOwuT-0000mO-JA; Thu, 05 Nov 2026 12:49:41 +0000
Received: by outflank-mailman (input) for mailman id 1474581;
 Thu, 05 Nov 2026 12:49:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOwuS-0000mI-LY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 12:49:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOwuS-009gv4-2O
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:49:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec7b4f-8faa-0a2a0a5109dd-0a2a4505a2d8-46
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 13:49:40 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aec7b63-4cb1-0a2a45050019-d1558033c1c3-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 13:49:39 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so11188195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 04:49:39 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4533873f0sm136652705e9.4.2026.11.05.04.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 04:49:38 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793882979; x=1794487779; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbU+esne70TuXyLcr1aSiliGdvPWNYuuqC4KPBugy1g=;
        b=VnGaeeJ73P8aFTis+tQz51UKsKT3n2J0oZAAauy8pkubVa1rH0L53QCDyemPlN4jXu
         yiTi3sF3Z/H8Bwp3eNwmZcFlKXhzZExjQBRzF5pRFO7tlaskn4RaETOD+dlotZ4YRTAq
         wEwqosYiEOs7GoYLfScuZp+ECQF8rMXrGTg0sOL0yhXjQSpSbFNhq7Alw78VbK09M2MV
         rihiwOusbr3uJOScWWvAKTpCzS4j9+KGEmDdBnfeaQMRmMg5CzIqXROVyB91nooO9O8T
         GMxoH+9WNHufAxkE9jFXAt9e+24njLuGNwREKqVgl2U6Z+LbHqjwT3tfWG2gHf9B/O9j
         O9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882979; x=1794487779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbU+esne70TuXyLcr1aSiliGdvPWNYuuqC4KPBugy1g=;
        b=VyHnxx13GiZxEMCVnmak0IE1LOeTwMBw3psK+zwlLASTF8W9qi4pr4rcINUrJ8jmVs
         YU9t1WJ1a8+aQsgLpblBHM4WEeNK2Wa2s5s/+IivYfOHAZr2SlpcQn1j+5whWzfFrEFG
         Cmhm+XbOinIK6ABMItNyZxyei+Mmm7aD1aJaPZs3TtyLHczUgZ6m0K3PWNQm7lUOwnoe
         TAjIRelMR3nyNnvNFwuB87fXOdPLDb8es7xSrHdKJAkilRQp7EhK6PFiwmVh3jQsZSrp
         XEexKjYirWSD3/y/fZHTopXRa8i2iRmhevlF8X8izTroOf3AxJnWAI4dp/LjPU0l4YY+
         oIBQ==
X-Gm-Message-State: APuU4Z99uy00DUMbPbpPK9hT1Ck6HRr9hSccT6ga0XVgxskCERZ/UUGh
	7xlc1T8uqavbOjynSN3h5FDW9ZDGAwYAp7y7wWrBMRfAB00W84zL5K1a
X-Gm-Gg: AYBFou2S02bWCBpeA5VZRsi0Adbx9p83eTHG1vhrK0ElH6gIh300LRl+KabS8zxcTOU
	UHIAkgfC8f0AV5LxFhEpZWwYaJO40L3CkHsV9lHYrGiDRDqjL4LjreWeiRf7642RSfNPo8fk9F4
	676fnbI5yAZdOo3k3X1/XraUIpC71+2qGdgYsgbhRdEYTM2bjPe+3Saiix3wz1eJeZkUeRmbIsd
	v+ifyi4AZnZWS30j27jxjEzIca/0eCnzJrvVdNqholOgzej8LO39lCV5ZWWB6Er3AwyhJyvPjNO
	YmJyLx/viwii2/L8TnbgNC4r/2MG/2KxrktoR1dTNETIutXs5OuOmJdWQjndQGSV8t2pmrA1ifs
	YBlmpoqyYjeFWjCNIutZjk3y4S7LA8N91C6dok42ge4W+c/jcELmUYH2URzbUIG95YDWiY0vEzq
	BN2w76l4vH+JAKcbYQQx5gSfEcs72EG26IFme4P7dctDrOoAb6H4PYRMFT/kX9avLS4PiN+q09s
	IsruvYfMTthR7JiqeN9DhtFkiFjnUvHZxnNNfBmWAuGsEmMvw74azYuYaU5mXgj5Qs75Se5OrlC
	1fCEX6Cadafbgd/97KMDz93JnIgTjU7tk2uIcIyAZIJuSzbzqUbQ/NwrraQlaTL+cHkTbDUIWSl
	EVg==
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr398106795e9.17.1793882978577;
        Thu, 05 Nov 2026 04:49:38 -0800 (PST)
Message-ID: <81b0b1fa-1aa4-4646-bdfa-5e773cb876f4@gmail.com>
Date: Thu, 5 Nov 2026 13:49:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/39] xen/riscv: prepare new IMSIC VS-file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <7f00946a6b1b67e79f94e3c665f8f0ce9d5d0e5a.1790779209.git.oleksii.kurochko@gmail.com>
 <1792760165.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792760165.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793882979-F60AA2A1-2898F6FF/10/73395122804
X-purgate-type: spam
X-purgate-size: 6406
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/26 2:55 PM, Baptiste Le Duc wrote:
>> [ ... 64 lines skipped ... ]
>> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
>> index e31c9c2d24..229ab4b867 100644
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -1,8 +1,10 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>> +#include <xen/bug.h>
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/sections.h>
>> +#include <xen/sched.h>
> Nit: Why xen/sched.h? The stub doesn't dereference v, and asm/aia.h already
> forward-declares struct vcpu. If it stays: sched < sections, so it goes one
> line up.

Indeed, nothing needs it here. I'll include <asm/aia.h> instead, which
aia.c doesn't include yet: without that the stub's struct vcpu would 
only be declared inside the parameter list. <xen/sched.h> then moves to 
the patch where v gets dereferenced first.

>> [ ... 30 lines skipped ... ]
>> +#define imsic_vs_csr_write(c, v)    \
>> +do {                                \
>> +    csr_write(CSR_VSISELECT, c);    \
>> +    csr_write(CSR_VSIREG, v);       \
>> +} while (0)
>> +
>> +/*
>> + * Leaf macros for the switchcase expansion pyramid below:
>> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg, v); break"
>> + */
>> +#define imsic_switchcase_break(ireg, op, v) \
>> +    case ireg:                              \
>> +        op(ireg, v);                        \
>> +        break
>> +
>> +/*
>> + * Generic switchcase expansion pyramid.
>> + * F is the per-operation leaf macro, ireg is the base register index.
>> + * Extra args (e.g. an operation and/or a value) are forwarded to F via
>> + * __VA_ARGS__.
>> + */
>> +#define imsic_switchcase_2(F, ireg, ...)             \
>> +    F((ireg) + 0, __VA_ARGS__);                      \
>> +    F((ireg) + 1, __VA_ARGS__)
>> +#define imsic_switchcase_4(F, ireg, ...)             \
>> +    imsic_switchcase_2(F, (ireg) + 0, __VA_ARGS__);  \
>> +    imsic_switchcase_2(F, (ireg) + 2, __VA_ARGS__)
>> +#define imsic_switchcase_8(F, ireg, ...)             \
>> +    imsic_switchcase_4(F, (ireg) + 0, __VA_ARGS__);  \
>> +    imsic_switchcase_4(F, (ireg) + 4, __VA_ARGS__)
>> +#define imsic_switchcase_16(F, ireg, ...)            \
>> +    imsic_switchcase_8(F, (ireg) + 0, __VA_ARGS__);  \
>> +    imsic_switchcase_8(F, (ireg) + 8, __VA_ARGS__)
>> +#define imsic_switchcase_32(F, ireg, ...)            \
>> +    imsic_switchcase_16(F, (ireg) + 0, __VA_ARGS__); \
>> +    imsic_switchcase_16(F, (ireg) + 16, __VA_ARGS__)
>> +#define imsic_switchcase_64(F, ireg, ...)            \
>> +    imsic_switchcase_32(F, (ireg) + 0, __VA_ARGS__); \
>> +    imsic_switchcase_32(F, (ireg) + 32, __VA_ARGS__)
>> +
>> +static void imsic_eix_write(unsigned int ireg, unsigned long val)
>> +{
>> +    switch ( ireg )
>> +    {
>> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
>> +                        imsic_vs_csr_write, val);
>> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
>> +                        imsic_vs_csr_write, val);
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +        break;
>> +    }
>> +}
>> +
> What does the switch buy? ireg only ends up as the value written to
> vsiselect, not as a CSR number, so it doesn't need to be a compile-time
> constant. imsic_vs_csr_write(ireg, val) does the same, without the 128 case
> labels and the macro pyramid. If there's a reason, it wants stating in a
> comment; otherwise please drop the pyramid (an ASSERT() on the range can
> stay if you want one).

Good point.

I will drop it and use the following instead:

/*
  * On RV64 a 64-bit EIx group is the even-numbered register alone, 
whereas on
  * RV32 it is split into the even-numbered (low half) and the following
  * odd-numbered (high half) register. ireg names the first, even-numbered
  * register of such a group, among eip0..eip63 or eie0..eie63.
  */
static void imsic_eix_check(unsigned int ireg)
{
     ASSERT(!(ireg & 1));
     ASSERT((ireg >= IMSIC_EIP0 && ireg < IMSIC_EIP0 + 64) ||
            (ireg >= IMSIC_EIE0 && ireg < IMSIC_EIE0 + 64));
}

/* Write a whole 64-bit EIx group, laid out as described above. */
static void imsic_eix_write64(unsigned int ireg, uint64_t val)
{
     imsic_eix_check(ireg);
     imsic_vs_csr_write(ireg, val);
     if ( IS_ENABLED(CONFIG_RISCV_32) )
         imsic_vs_csr_write(ireg + 1, val >> 32);
}

I will applt the similar patter to other patches where the pyramid was used.


> 
> Typo (only if the macros stay): "Leaf macros" - there's only one here. And
> `case ireg:` / `op(ireg, v)` as well as c and v in imsic_vs_csr_write()
> want parenthesizing (MISRA 20.7).

As to c and v in imsic_vs_csr_write(): they're passed as whole arguments
to csr_write() and the other csr_*() macros, which is covered by the
R20.7 deviation for macro parameters used as macro arguments. That's 
also why the parentheses were dropped in v3.

>> [ ... 67 lines skipped ... ]
>> +static void cf_check imsic_vsfile_local_clear(void *data)
>> +{
>> +    unsigned int i;
>> +    const struct imsic_vsfile_data *idata = data;
>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>> +
>> +    /* We can only zero-out if we have a IMSIC VS-file */
> Typo: s/a IMSIC/an IMSIC/
>> [ ... 31 lines skipped ... ]
>>   void imsic_migrate_vcpu(struct vcpu *v)
>>   {
>> +    struct imsic_vsfile_data vsfile_data = {
>> +        .nr_eix = imsic_cfg.nr_eix,
>> +    };
>> +
>>       /*
>>        * The scheduler can mark a freshly created vCPU's unit as migrated and
>>        * invoke this before the vCPU has ever run (see the migrated branch in
>> @@ -703,5 +849,18 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       if ( v->arch.last_cpu == CPU_NONE )
>>           return;
>>   
>> +    /*
>> +     * At this point, all interrupt producers are still using the old IMSIC
>> +     * VS-file.
>> +     */
>> +
>> +    vsfile_data.hgei = vgein_assign(v);
>> +
>> +    /* We don't support SW interrupt files at the moment. */
>> +    BUG_ON(!vsfile_data.hgei);
>> +
>> +    /* Zero-out new IMSIC VS-file */
>> +    imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
> Nit: The comment restates the call; drop it.
> 

Agreed, I will drop.

Thanks!

~ Oleksii



