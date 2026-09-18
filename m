Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F12C982DC
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 11:53:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425198.1649292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7X9Y-00020s-Tf; Fri, 18 Sep 2026 11:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425198.1649292; Fri, 18 Sep 2026 11:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7X9Y-00020l-Pt; Fri, 18 Sep 2026 11:53:16 +0000
Received: by outflank-mailman (input) for mailman id 1425198;
 Fri, 18 Sep 2026 11:53:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x7X9X-00020f-7t
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 11:53:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7X9W-004asM-K8
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 13:53:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aad2623-e002-0a2a0a5209dd-0a2a450ad36a-18
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:53:14 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aad262a-f2d2-0a2a450a0019-d155dd33a80a-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:53:14 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48431648f33so712284f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 04:53:14 -0700 (PDT)
Received: from ?IPV6:2a02:778:142:8f01:2700:bad4:284c:5aa5?
 ([2a02:778:142:8f01:2700:bad4:284c:5aa5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4872008fe3csm3571728f8f.37.2026.09.18.04.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 04:53:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789732394; x=1790337194; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y0tWxbj9cGkYXEJPFzDR5FglFp8Hk9hDzsHv6lnfQ2E=;
        b=HI6wW3E+PXI6M3bDZslyjnv4oXdgfhGq6H2XZlnBkch/7uN27MUth+bHDi1ZerWp2R
         DmOx4y+5M1aHHNpCcrzR7vk/UJtOQh+v31M3TKn+0lC8pbPqDnOaEbyq7YAw6aao9MXG
         KjuqtbDFUFS+52vDbBFwsYZJttnnglrawk1p/AMi0h14sYenSeejSRngm4C132Fh3RJa
         gZp2ckVEVjrLFOXeNdgCpz4ttQO8LkvpVwPRafRzHECby3/7cYRqU1zQseV4rJkj6SqA
         GjA1bcxTZ+QAbriH0YCPlVyvefFQhxVy3AypZXBaYHIqALWGq8l24Xfo9mLZEDQE8QNy
         /YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732394; x=1790337194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y0tWxbj9cGkYXEJPFzDR5FglFp8Hk9hDzsHv6lnfQ2E=;
        b=iSk0Qfpvdu9XgQZ89SMOSXPLW3vwJDuZZ25Q1QbVzkJ58DERB/z84yPu0w1XkTFWrj
         k1vdxxVhTJHGcmxn4OFGKZijRh4YlBbqb7I3jEfITQ2RcKbrqsE1W8KVUHWr0rmF/jcq
         X5chBkY/7eqYgEzk/0bArIkH93QY9edr7ehr+0YlNUUmfAWNwjsEtskPnbcCdi0MyBVA
         a2Nj1g2k/nArP3XtK/tR+/k8uU67sD9mswHWpIxRCS6/Cl5Bgn1OoEL3X+3Urqpg5Gru
         d5Bb+5cEPyvR76z1U5HvYCC/1AOVxKiK7M7KffGZFlqp8x8AWcw4DMpMebRlFlIcSbba
         eW4A==
X-Forwarded-Encrypted: i=1; AKwUvBx2jb+a6FwX70Dvhg4b/4A40lXx/BAaXl04lUdob0KEnhQbesOgROuiXntaVd57j/uZ3VuiUBWsprM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lRiGKY/oPrAdluxxS78qk1Xp4xsh9iW9emkOqLbE8wnh9XpmV1
	/nJV4ybysga7j2lBXSMsZuETmYa69rEYvaM2MJRw57p64y3exi8S2Dyu
X-Gm-Gg: AYBFou2IUtzL1RT+JR5x0BjVhK4O9oXh9JGLixZMeDdM/ThNbtCeljBsILjU93+D4bt
	ZJtJ2KTpxLiA6vgLED8KjvzW/IQpYmaOEE0QWpndch46Hl91IoT0flYj2IhveozKKtH28CtdSQm
	fbZtuN6N1eneB4C+acTsf+O0iBEBFJlpBqdnqCKyp+JgAZ8w5jwXIGCOiogaSc5qYLL478pM+nP
	/0X9DhGZPwoV6/UDwSRK91RIEg5CeVMHl3ji55e65S7o8u5E9v1JWaYAxmjw/41kpeJSwgzxyxL
	hSiEcUFXyS1TljyWE99r3VU2aBuYVmrdPH5hMIw15llePzWi0wdtUjG+Smbt6MJ/Uh8XaTZSdjY
	cnCBNpHIg4opPHVdPSM7lVI0dQcEqT6KiFtvuJiXB45jQIseLj6zjf+3CVRUdsjKl1zOhStFn8p
	hguHbL+Fckw6qnuyGQnGMz3LGGGGb7msKi3yxcrCbvGhSUEls3CDwmwrfiFNpTCMVP8mASdlE1J
	aSIJi9AwE+suaY6y2n/wOEqzv+xYf4YMdJTGrec4oVziaGR1SeRtQ==
X-Received: by 2002:a05:6000:468c:b0:487:152:e57c with SMTP id ffacd0b85a97d-48713aff8dbmr7318615f8f.1.1789732393638;
        Fri, 18 Sep 2026 04:53:13 -0700 (PDT)
Message-ID: <2e07e5e8-bd6c-4ec9-b656-6fa8c61bb456@gmail.com>
Date: Fri, 18 Sep 2026 13:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/39] xen/riscv: implement APLIC-hart sync barrier for
 vCPU migration
To: Jan Beulich <jbeulich@suse.com>
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
 <3d953b6e7f221f4cf4143454076466fab38b6236.1787838835.git.oleksii.kurochko@gmail.com>
 <45f6e417-ea0e-470c-bfae-e163a65b48d0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <45f6e417-ea0e-470c-bfae-e163a65b48d0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789732394-59DDFCFC-9B653AE7/10/73395122804
X-purgate-type: spam
X-purgate-size: 3088



On 9/14/26 3:27 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> During migration of a virtual hart to a different guest interrupt file,
>> straggler MSIs from the APLIC could arrive at the old interrupt file
>> after the switch.
>>
>> genmsi is used despite not supporting guest interrupt files because the
>> AIA spec guarantees that all MSIs previously sent from the APLIC to the
>> same hart are visible at the hart's IMSIC before the extempore MSI from
>> genmsi becomes visible.
> 
> Hmm. As indicated, I'm learning RISC-V as I'm reviewing patches. This
> paragraph, if left as is, would make sure I simply can't ack the patch.
> I just don't understand what is being talked about. I can guess parts,
> but for example I don't know what "genmsi" is.

I will reword then commit message in the following way:

```
When a vCPU is moved to a different guest interrupt file, MSIs that the
APLIC has already sent towards the old file may still be in flight. They
must land before the old file's state is saved and the switch is done,
otherwise they would be lost.

To wait for them, use the APLIC's genmsi register. Writing it makes the
APLIC itself send an MSI (an "extempore" MSI) with a given interrupt
identity to a given hart. genmsi can only target the hart's supervisor-
level interrupt file, not a guest one, but the AIA spec guarantees that
all MSIs previously sent by the same APLIC to the same hart become
visible at the hart's IMSIC before the extempore MSI does. So once the
extempore MSI has been delivered, no older MSI from this APLIC to the
hart can still be in flight, whichever interrupt file it targets.

The last interrupt identity (nr_ids) is reserved for this purpose.
```

> 
>> @@ -205,6 +207,30 @@ void aplic_hw_write_reg(unsigned int offset, uint32_t value)
>>       spin_unlock_irqrestore(&aplic.lock, flags);
>>   }
>>   
>> +/*
>> + * As needed, synchronize with all IOMMUs and APLICs to ensure that no
>> + * straggler MSIs will arrive at the old interrupt file after this step.
>> + */
>> +void aplic_genmsi_barrier(void)
>> +{
>> +    const struct imsic_config *imsic = imsic_get_config();
>> +    unsigned int cpu = smp_processor_id();
>> +    unsigned long flags;
>> +    uint32_t val;
>> +
>> +    val = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
>> +          (imsic->sync_id & APLIC_TARGET_EIID);
> 
> Along the lines of a question on an earlier patch: What if this ANDing
> actually chops off bits?

I will do then the same as I did in aplic_set_irq_affinity() (i 
mentioned that in the one of the replies connected to this function in 
this patch series):

     /*
      * sync_id is nr_ids, which imsic_parse_node() limits to IMSIC_MAX_ID,
      * so it always fits into the EIID field.
      */
     BUILD_BUG_ON(IMSIC_MAX_ID > MASK_EXTR(~0U, APLIC_TARGET_EIID));
     ASSERT(imsic->sync_id <= IMSIC_MAX_ID);

     val = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |
           imsic->sync_id;

Thanks.

~ Oleksii


