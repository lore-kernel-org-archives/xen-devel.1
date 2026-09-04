Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3CAC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:02:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408544.1641037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2UUj-0007vi-SX; Fri, 04 Sep 2026 14:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408544.1641037; Fri, 04 Sep 2026 14:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2UUj-0007vb-Pt; Fri, 04 Sep 2026 14:02:17 +0000
Received: by outflank-mailman (input) for mailman id 1408544;
 Fri, 04 Sep 2026 14:02:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2UUi-0007vV-3A
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:02:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2UUh-001GCJ-G1
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:02:15 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9acf62-bab6-0a2a0a5309dd-0a2a4508d1d6-16
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:02:15 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9acf67-f659-0a2a45080019-d155dd2be833-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:02:15 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so765105f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:02:15 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cff8195ffsm11907345e9.14.2026.09.04.07.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 07:02:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788530535; x=1789135335; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvZf0BuB+g+rEOo7VkNwWxDHWLRnLLzXnbrgge1f0og=;
        b=K/fxFgIb5oDnBfHE4NIdyz/R0G79tta4Czr+fdmjR02V3gzjjMalHw0g2RLTiLJY7Z
         mHOGdEbEh4nSy3r+4MdW12bnG17ev4/14VwV4VQ8s9ycdqhFZy0hs75wHBvFtIuhAWai
         ahyxChPWAxO5QmTMwREfVeyJWPizgjYgfQjolNu81YgryIRKeCyC77YVVqulQyFTaeSv
         bjeLY4y0J3But+mK8N1rwGYaGPAXVanFJjXyn46Dy0M+wlz3UFuo5G29Q5BPP3G+6aYa
         jDvJJ8XeygQdvfKxuLo2hZBTARwztI7TgAYLLnq2HKR3uFeqSZZRgwwnYPatnEj342n4
         XdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530535; x=1789135335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvZf0BuB+g+rEOo7VkNwWxDHWLRnLLzXnbrgge1f0og=;
        b=B+e6tPXEj3bdznzLlUVCBm7C8S+UGSR9zmq+W4oPQ3/WttEghPPy4adMztXYvuFDD0
         7vu5XkbEymSfeBT5+SfX93UGOP7Scl+pVmdiZ/X6JFzmLKPF13IXGVysl35QLMl45g76
         WxZHlkYCUgqXYvT7r8+8BuYEixfHvTX0P9Yim1r9pFHaq6VHuHM0dP3nnLwlBJ+uqEox
         MbBeWCRua8bhO83ZZ64ijx+WGAa/hISToYrNI1CISlQpSVhufUu3UgwHNy3jzT4SzAuJ
         thno20bs+KUjtHPBD0hCCsQVBQk5PnfSTekfKBdfRJ3ntV/A22CBI+boMcVQ6FOViVi1
         HlXw==
X-Gm-Message-State: AFuF++kpFFID2dMdoJgoosfCWi/SihivAMJJxEHg+w3lkFLG9Y5Zqzfq
	2ox8PyhjAe5n80JG5laGXiSA9mJK1YCR5beognQ4eLAnM5TC5Jh2yYcn
X-Gm-Gg: AYBFou35zmpV6flncNjpqIjmAQT3s0xCtyNba5GwnxuWjnQRS9jdEH7fAmYhvvEWLGv
	IM5ZMnv6eGboIb1vTj7t9A3Hfb5jKoP5Kz+TYiQQpTxffFsEkcxKGIVJ8bjc+BkUyImhj7xcOWM
	qzv5qQYbHWs0kH/h4hsIRP+cDRkEvMP2/uBhg/r/jA//WeTxsNCqEBKc2/BoGp2OScwwT4T+kIi
	IA7fMKnpFtefeoMkISegTa2IIgbJc7y63c4fYpFjYrigSPW/+Of1xc1OG2f2DnZAgDibY1gFVWE
	1QKaAALFdekNom2f/xe/fXacZO2sIbZTkDXiI1c74+UT3+YnIfqZvtS1ri50ndl5deveagi4Ngg
	7UQ4yp/ja+33inh8FK96MLrQWJzIK4Po8Iuylu5hzD6/Cfz9KQLASgARJCiINytDH6wb6gmcv4q
	2eeF2ewMCiWHI41R1yqNKehgaDRSLHKlR56BK2cDZVpSrnwCYKRwAB34T8iDXD4NZIBY8l1K3sr
	/hUGnab1HRgIsUlLZe23MbYwK544illODcz/DI=
X-Received: by 2002:a05:600c:1d08:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49cf825168cmr70126585e9.13.1788530533061;
        Fri, 04 Sep 2026 07:02:13 -0700 (PDT)
Message-ID: <66c96742-3ee2-4e76-948c-92ed6efaaac9@gmail.com>
Date: Fri, 4 Sep 2026 16:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <1788352275.8631fc262581453bbf619ec5b2062170.1a0621a2590000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788352275.8631fc262581453bbf619ec5b2062170.1a0621a2590000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788530535-DFED287B-A2171963/10/73395122804
X-purgate-type: spam
X-purgate-size: 11857



On 9/2/26 2:31 PM, Baptiste Le Duc wrote:
>> +
>> +static bool vaplic_emulate_store(const struct vcpu *curr, paddr_t addr,
>> +                                 uint32_t value)
>> +{
>> +    const struct domain *currd = curr->domain;
>> +    unsigned int offset = addr & APLIC_CTRL_REGION_OFFSET_MASK;
>> +
>> +    ASSERT(curr == current);
>> +
>> +    switch ( offset )
>> +    {
>> +    case APLIC_SETIP_BASE ... APLIC_SETIP_LAST:
>> +    case APLIC_CLRIP_BASE ... APLIC_CLRIP_LAST:
>> +    case APLIC_SETIE_BASE ... APLIC_SETIE_LAST:
>> +    case APLIC_CLRIE_BASE ... APLIC_CLRIE_LAST:
>> +    {
>> +        unsigned int word_idx =
>> +            regoffset_to_word_idx(offset & APLIC_SETCLR_OFFSET_MASK);
>> +
>> +        value &= generate_auth_mask(currd, word_idx);
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
>> +        if ( value & APLIC_SOURCECFG_D )
>> +        {
>> +            dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
>> +
>> +            goto fail;
>> +        }
>> +
>> +        /*
>> +         * As sourcecfg register starts from 1:
>> +         *   0x0000 domaincfg
>> +         *   0x0004 sourcecfg[1]
>> +         *   0x0008 sourcecfg[2]
>> +         *    ...
>> +         *   0x0FFC sourcecfg[1023]
>> +         * It is necessary to calculate an interrupt number by subtracting
>> +         * APLIC_DOMAINCFG instead of APLIC_SOURCECFG_BASE.
>> +         */
>> +        if ( !AUTH_IRQ_BIT(currd,
>> +                           regoffset_to_word_idx(offset - APLIC_DOMAINCFG)) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return true;
>> +
>> +        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
> This compares the whole value against 7, not the extracted SM field
> (bits [2:0]). A perfectly legal SM=0 write with any bit set in the
> reserved [9:3] range (e.g. value=8) gets rejected here even though the
> actual field is fine Should be MASK_EXTR(value, APLIC_SOURCECFG_SM) >
> APLIC_SOURCECFG_SM_LEVEL_LOW.

Agree, if() written in this way is incorrect in the way what is going 
before this if().

I think that we don't need it at all and what we want instead is 
ignoring write to others bits then D (bit10) and SM(bits 2:0) as they 
are reserved and read as zeros.

         /*
          * Only D (bit 10) and SM (bits 2:0) are implemented, the rest 
of the
          * bits are reserved and read as zero, so ignore what a guest 
writes
          * to them.
          */
         value &= (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM);

Probably it make sense to introduce and use it above:

/*
  * All other bits of sourcecfg[] are reserved and read as zero, so drop 
them on a write.
  */
#define  APLIC_SOURCECFG_WMASK          (APLIC_SOURCECFG_D | 
APLIC_SOURCECFG_SM)

And ...

> 
> SM is WARL. If SM invalid but other fields valid, shouldn't reject whole
> write. Instead override value.SM with current valid SM in this branch,
> so other valid fields still get written.

... considering that SM is WARL it means that technically any value 
could be written to this field but read of this register should be 
return always something valid. So considering that in the case of 
SOURCECFG we don't have a shadow copy for vAPLIC and use just real h/w 
we could ignore fully the value it is trying to write to SM field as 
even it is something illegal h/w will choose something legal instead.

If one day we will need a copy of SOURCECFG for vAPLIC we will need to 
do something like this to emulate behavior of real SOURCECFG:

         /*
          * SM is a WARL field. If the guest wrote reserved values (2 or 3),
          * optionally coerce them to a supported default (e.g., 
Inactive/0).
          */
         if ( value == 2 || value == 3 )
             value = APLIC_SOURCECFG_SM_INACTIVE;

For now we can do nothing. I can put TODO:

         /*
          * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
          * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
          * written straight to the h/w register and is read back from 
it, so
          * it is the h/w which substitutes a legal value for an illegal 
one.
          *
          * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL 
behaviour
          * will have to be emulated here instead, e.g.:
          *   if ( value == 0x2 || value == 0x3 )
          *       value = APLIC_SOURCECFG_SM_INACTIVE;
          */

Note that here it is okay not to use MASK_EXTR as we have always D=0 so 
sourcecfg[i] value is basically SM field (as other bits are reserved and 
are read only)

So my final suggestion is:

      case APLIC_SOURCECFG_BASE ... APLIC_SOURCECFG_LAST:
+        /*
+         * Only D (bit 10) and SM (bits 2:0) are implemented, the rest 
of the
+         * bits are reserved and read as zero, so ignore what a guest 
writes
+         * to them.
+         */
+        value &= APLIC_SOURCECFG_WMASK;
+
          if ( value & APLIC_SOURCECFG_D )
          {
              dprintk(XENLOG_ERR, "APLIC_SOURCECFG_D isn't supported\n");
@@ -169,6 +176,18 @@ static bool vaplic_emulate_store(const struct vcpu 
*curr, paddr_t addr,
              goto fail;
          }

+        /*
+         * SM is WARL, so the reserved values 0x2 and 0x3 need no handling
+         * here: vAPLIC keeps no shadow copy of sourcecfg[], the value is
+         * written straight to the h/w register and is read back from 
it, so
+         * it is the h/w which substitutes a legal value for an illegal 
one.
+         *
+         * TODO: when vAPLIC starts to shadow sourcecfg[], the WARL 
behaviour
+         * will have to be emulated here instead, e.g.:
+         *   if ( value == 0x2 || value == 0x3 )
+         *       value = APLIC_SOURCECFG_SM_INACTIVE;
+         */
+
          /*
           * As sourcecfg register starts from 1:
           *   0x0000 domaincfg
@@ -184,15 +203,6 @@ static bool vaplic_emulate_store(const struct vcpu 
*curr, paddr_t addr,
              /* Interrupt not enabled, ignore it */
              return true;

-        if ( value > APLIC_SOURCECFG_SM_LEVEL_LOW )
-        {
-            gdprintk(XENLOG_ERR,
-                     "value(%#x) is incorrect for sourcecfg register\n",
-                     value);
-
-            return true;
-        }
-
          break;

Does it make sense? Or I still missing something.




>> +        {
>> +            gdprintk(XENLOG_ERR,
>> +                     "value(%#x) is incorrect for sourcecfg register\n",
>> +                     value);
>> +
>> +            return true;
>> +        }
>> +
>> +        break;
>> +
>> +    case APLIC_TARGET_BASE ... APLIC_TARGET_LAST:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
>> +        struct vcpu *target_vcpu;
>> +        unsigned int guest_hart_idx = MASK_EXTR(value, APLIC_TARGET_HART_IDX);
>> +        /*
>> +         * Look at vaplic_emulate_load() for explanation why APLIC_GENMSI is
>> +         * subtracted.
>> +         */
>> +        unsigned int srcn = regoffset_to_word_idx(offset - APLIC_GENMSI);
>> +
>> +        if ( !AUTH_IRQ_BIT(currd, srcn) )
>> +            /* Interrupt not enabled, ignore it */
>> +            return true;
>> +
>> +        target_vcpu = domain_vcpu(currd, guest_hart_idx);
>> +
>> +        if ( !target_vcpu )
>> +        {
>> +            dprintk(XENLOG_ERR, "Invalid vCPU id in target register\n");
>> +
>> +            /* Ignore such writings */
>> +            return true;
>> +        }
>> +
>> +        if ( vaplic->regs.domaincfg & APLIC_DOMAINCFG_DM )
>> +        {
>> +            /*
>> +             * A non-zero guest index asks for delivery to an interrupt file of
>> +             * nested guest. The vIMSIC node has no riscv,guest-index-bits
>> +             * property, so a guest is told its harts have no guest interrupt
>> +             * files and the field is read-only zero for them. The write isn't
>> +             * rejected (that would throw away a valid hart index and EIID);
>> +             * instead the field is dropped, which is also what
>> +             * aplic_msi_target_gen() does with it when programming the h/w.
>> +             */
>> +            if ( MASK_EXTR(value, APLIC_TARGET_GUEST_IDX) )
>> +            {
>> +                printk_once(XENLOG_WARNING
>> +                            "%pd: vAPLIC target guest index != 0 is unsupported\n",
>> +                            currd);
>> +
>> +                /* Ignore such writes ... */
>> +                return true;
>> +            }
> Comment above this says "The write isn't rejected ... instead the field
> is dropped, which is also what aplic_msi_target_gen() does with it." But
> the code doesn't follow it as it returns true immediately here before
> the write occurred and without zeroing the guest index field.

It looks like the same question in the other thread [1] at the end.

If you don't mind lets continue discussion there. I responded there.

[1] 
https://lore.kernel.org/xen-devel/cover.1787838835.git.oleksii.kurochko@gmail.com/T/#m0de75013bd31481a2f6abd6f36ccccb8ede87a20

>> +
>> +            write_atomic(&vaplic->regs.target[srcn], value);
>> +
>> +            value = aplic_msi_target_gen(target_vcpu, value);
>> +        }
>> +        else
>> +        {
>> +            /*
>> +             * IPRIO is WARL and zero isn't a legal value for it, so normalize
>> +             * it once: the guest then reads back exactly what it gets.
>> +             */
>> +            unsigned int iprio = MASK_EXTR(value, APLIC_TARGET_IPRIO) ?:
>> +                                 APLIC_TARGET_IPRIO_DEFAULT;
>> +            unsigned long h = cpuid_to_hartid(guest_hart_idx);
>> +
>> +            value = MASK_INSR(guest_hart_idx, APLIC_TARGET_HART_IDX) |
>> +                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
>> +
>> +            write_atomic(&vaplic->regs.target[srcn], value);
>> +
>> +            value = MASK_INSR(h, APLIC_TARGET_HART_IDX) |
>> +                    MASK_INSR(iprio, APLIC_TARGET_IPRIO);
>> +        }
>> +
>> +        break;
>> +    }
>> +
>> +    case APLIC_SETIPNUM:
>> +    case APLIC_SETIPNUM_LE:
>> +    case APLIC_CLRIPNUM:
>> +    case APLIC_SETIENUM:
>> +    case APLIC_CLRIENUM:
>> +        if ( !value || !AUTH_IRQ_BIT(currd, value) )
>> +            return true;
>> +
>> +        break;
>> +
>> +    case APLIC_DOMAINCFG:
>> +    {
>> +        struct vaplic *vaplic = to_vaplic(currd);
>> +
>> +        vaplic->regs.domaincfg = APLIC_DOMAINCFG_RO |
>> +                                 (value & APLIC_DOMAINCFG_WMASK);
>> +
> APLIC_DOMAINCFG_WMASK includes APLIC_DOMAINCFG_DM, so
> the guest can clear DM through this write. But aplic.c:
> aplic_init_hw_interrupts() sets the real hardware APLIC's domaincfg to IE|DM
> exactly once and never touches it again. Is this expected?

Yes, it is expected as we are supporting now only APLIC+IMSIC in Xen and 
it is the reason why we here started to provided a shadow copy of 
domaincfg register for vAPLIC instead of using real APLIC domaincfg 
register.

> 
> Moreover, I saw that d8fbe0bbc7's commit message claims: "a guest's
> domaincfg.DM reads back as a fixed one, so is there situation where we would
> allow direct delivery mode? If not, the else branch should be dropped.
> 

At the moment, we started with a support only when we are working in MSI 
mode but commonly it is possible that IMSIC will be absent and we don't 
have any other choice as started to support delivery mode.

Thanks for review!

~ Oleksii



