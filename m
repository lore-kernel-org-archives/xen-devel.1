Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CEFC5B572
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 15:59:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389207.1630095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuBMP-0007Gt-FV; Wed, 12 Aug 2026 15:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389207.1630095; Wed, 12 Aug 2026 15:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuBMP-0007Gm-Bo; Wed, 12 Aug 2026 15:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1389207;
 Wed, 12 Aug 2026 15:59:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuBMO-0007Gg-GP
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:59:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuBMN-00EkPw-Fd
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 17:59:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c9844-2eae-0a2a0a5409dd-0a2a4506c746-46
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 17:59:19 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c9857-195a-0a2a45060019-d1558033f1f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 17:59:19 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so11796845e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 08:59:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c9944ecsm59431915e9.14.2026.08.12.08.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 08:59:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786550359; x=1787155159; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+NlR5DrkM0LUd0bgKd1POAE63cAyrDlPzkYqiYJ4xE=;
        b=nN6HRoxXkssOUSlfcfmpupFhmJdFsgFommt/WqbNPANG6YovEYhZYGnLgZf793ocdy
         lwVs4q1H5VH9iS8q40rmIoIMTEJIr10msycV/AKrJ5EIpVId5X/PoS1yl/UjEdaong+T
         EIRVAe04u/AxTeEukAhL/ua8CZ2Cn0ALVN9BO+AcUnY4moZn3Db4TvOJ/3WasIxsSPyI
         J2qUBbDX1ORMoFRbRo+REH1stvD5ytExrQNH2dd/L+L4XD3MI1W2C7w1R1beq6l2LmaJ
         BJaCfWWzpUWW0xhI8Ekalac3WyYEHyb9PaQf8zVEKYAq4G7CnT1SQKYSsMnFF1CQJ0oy
         tABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786550359; x=1787155159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+NlR5DrkM0LUd0bgKd1POAE63cAyrDlPzkYqiYJ4xE=;
        b=XnK4aWgKij86vQpe/HxOsRurM++UVNVpjVpbgvicLHaPxJQv18Y6ExejWwSbDjDaoL
         fD+ciR3/GRyJXKmqyZakAPLcjxc9apf5vNlUEBVlM6ry/o0XY94t7PUYXJB3E9OaVrow
         nZvmD0CPfQpgghw3uTUV0P6DA3xeJwMiGX1qoiD8pAM5UfRn4aDNhEdkBAswnFQCkPPH
         7aSM8NNiO89f8NETTURIlXlWU042LeiTnylwW2osKUT/M5+urj2ebj37ri+svCSBVwSW
         VTpgFDTjay8fpMYGdzdaYMxfoSrl7kro3njIH5yktt2tvD+Ie84jvsCprfJw8p9mPxBR
         88Cw==
X-Gm-Message-State: AOJu0YzXPHM/9ylUipxsVUkmBGBMNraljHZ7770BuMT2k06Oyz5vtA3a
	kRDsjNeVewnHswkugTMLDtSWM5QDyowpEFnU30u3KJwA1unLgKwrVFiD
X-Gm-Gg: AR+sD11RYaqwSVgmW2/MQadW7hX8xPoAtVfyCEBKCmJ59VeRZVUhgfrkMfYJNQS+wl3
	z0PVf9Wzx5G/jz9cajrLug73Fxg8BerrrhtK1b1d295eYOmS9/H0qXTbSoNsg+6YqD35MmugVPG
	6WgjsQX3/b5PfemH1LNhqU4+i5uIX7UwsIxHbwcoYnHataH3sEPpofNV0i1FAq6j7YDqRp25+IP
	dlUe4F7reThNaEMYOZthRCjHpBJV+Ktj7KeaRppBgJHtcEYgfTZcQGvKwZOoFtSm1F0SuB5r8kP
	t3inAdQPJdfbsj0PxMAQ8laqPZHzh+Lkf8wlhL+k4e9WsnPD1GfSIcwuoX7qk5XYBESZYs/Pr7e
	EG88nCLqwLMVSY3qWqS3I+4zWpWEozStl+sUjweF8EO8AvcUHjnphZdSo5D8ga21Y6e5X3ongAu
	6VWk94dpOLLzXLGlVNhJtuhA0y+6+9Hl4gbR1vQKi/7uMG//ccNn3hS8vIZIqJNZrbm+DiQHUrJ
	XAyiu2CNrPqAZvFsmbIyunQmEvIoBcw3HKqrFp/eiY=
X-Received: by 2002:a05:600c:2104:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4997c111b2cmr63905795e9.8.1786550358661;
        Wed, 12 Aug 2026 08:59:18 -0700 (PDT)
Message-ID: <1891f28d-dc23-48ba-92fb-9a0ac8ffd13b@gmail.com>
Date: Wed, 12 Aug 2026 17:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5571644f1d3a4277dc95fe85099563a145d1d935.1784560663.git.oleksii.kurochko@gmail.com>
 <1786543421.8631fc262581453bbf619ec5b2062170.19ff64938f1000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786543421.8631fc262581453bbf619ec5b2062170.19ff64938f1000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786550359-FC40377B-6E90F04B/10/73395122804
X-purgate-type: spam
X-purgate-size: 3290



On 8/12/26 4:03 PM, Baptiste Le Duc wrote:
>> +
>> +static int cf_check vaplic_emulate_load(const struct vcpu *v,
> 
> 
>> +                                        const unsigned long addr,
>> +                                        uint32_t *out)
>> +{
>> +    const struct domain *d = v->domain;
>> +    const struct vaplic *vaplic = to_vaplic(d);
>> +    const unsigned int offset = addr & APLIC_REG_OFFSET_MASK;
> 
> 
>> +    uint32_t auth_mask;
>> +    unsigned int i;
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_DOMAINCFG:
>> +        *out = vaplic->regs.domaincfg;
>> +
>> +        return 0;
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_SETIPNUM_LE:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
>> +        /*
>> +         * Based on the RISC-V AIA spec a read of these registers
>> +         * always returns zero
>> +         */
>> +        *out = 0;
>> +
>> +        return 0;
>> +
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +        i = regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
>> +        auth_mask = generate_auth_mask(d, i);
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +        /*
>> +         * As target registers start from 1:
>> +         *  0x3000 genmsi
>> +         *  0x3004 target[1]
>> +         *  0x3008 target[2]
>> +         *   ...
>> +         *  0x3FFC target[1023]
>> +         * It is necessary to calculate an interrupt number by subtracting
>> +         * APLIC_GENMSI instead of APLIC_TARGET_BASE.
>> +         */
>> +        i = regoffset_to_word_idx(offset - APLIC_GENMSI);
>> +
>> +        if ( !AUTH_IRQ_BIT(d, i) )
>> +        {
>> +            *out = 0;
>> +
>> +            return 0;
>> +        }
>> +
>> +        auth_mask = ~0U;
>> +
>> +        break;
>> +
>> +    default:
>> +        gdprintk(XENLOG_WARNING, "Unhandled APLIC read at offset %#x\n",
>> +                 offset);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>> +    *out = aplic_hw_read_reg(offset, auth_mask);
> 
> I think there is a problem here for the target registers: a read does not
> return what the guest wrote.
> 
> Consider domU calling request_irq() for source 10, with the interrupt
> affinity to vCPU1:
> 
>        writel(0x0004000A, GUEST_APLIC_BASE + 0x3028)
>        /* hart_idx = 1 (vCPU1), guest_idx = 0, EIID = 10 */
> 
> vaplic_emulate_store() passes this through aplic_msi_target_gen(), which
> keeps only the EIID and substitutes the physical hart field and the
> vCPU's guest interrupt file index, so we write target[10] = 0x001C100A
> 
> Therefore, a readl() of the same address returns that raw value (0x001C100A) instead of 0x0004000A, since
> auth_mask is ~0U here.
> 

I found this issue while working on support for the IMSIC software 
interrupt file. I already have a fix that I need to port to this code. 
However, I completely missed that this was already an issue and that the 
fix should have been ported earlier.

Thanks!

~ Oleksii


