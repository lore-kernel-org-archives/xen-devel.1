Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF2BCC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:32:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450032.1665534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGtK-0003qm-K6; Thu, 15 Oct 2026 08:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450032.1665534; Thu, 15 Oct 2026 08:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGtK-0003qf-Fq; Thu, 15 Oct 2026 08:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1450032;
 Thu, 15 Oct 2026 08:32:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHGtJ-0003qZ-5N
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:32:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHGtI-00G2F5-B6
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:32:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad08faa-bab6-0a2a0a5309dd-0a2a4505ddea-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:32:43 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad08fab-4cb1-0a2a45050019-d1558035cd6d-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:32:43 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a022fee0caso46959835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:32:43 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs367967.centertel.pl. [37.47.68.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd972aebsm60166815e9.1.2026.10.15.01.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 01:32:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792053163; x=1792657963; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfkp/rx1NcV9zNtmUn9U9CHYh3WHt3tivqTxMiqucCo=;
        b=S1qinhnUANO7Nc6m9x4cTWhYMiIROPOJB+BaX7gWv9X1kmxLSqrWMkpvS6q6uAxD4M
         adhJLzfIEHMLy8MISVoH+H1TBM1fSrALuv80E1kaA7sdk3YioY0N6SSEDfGyFqHQX5ew
         w70zOks9MEur2nlTI0c+nw//rDOt/5fDY+LOuUeU0omRZHqs7nT6MqjtWnhGEXlwoKSN
         AhBUt1d84W/FnSIG4LIEG7uOICfkPf75KfoGpYkMCgmIpLHpfRgtp7LxyMXLLa8ou/TW
         mEZ56gwbWOupkdneu5Iivfgv3ypRmCDdZLfPoB0gjs5yamH4IK1EKuRBoc/LhnkKULTe
         lqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053163; x=1792657963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfkp/rx1NcV9zNtmUn9U9CHYh3WHt3tivqTxMiqucCo=;
        b=gYO9H5bz+grSscARDTTnwzHviTiz6B2GffWhH7Kobu0cqB3eFfkIKUHTsFUTdMzpW/
         mq8GRIMhG/JIX3yHduSD1Qs23v/83sMlkCjM+TZBr7diw+KciPKgeqH4Rel+ytPS/iBz
         Otj5FOEjcDMHVs4ss6mUo84xP4idtGmKDnVYtSiRc/0Db/QvUuRGonORwEPquyjfZpUV
         PTmUOX9JGnd+VFxFxWr8Umwo9foLuZG5V0Ggycylsxgq0pjrI+dgyXVIDwRsd3PPEdOZ
         tkOmMXpCy0JrbQdfzbbCuWlKWTTCASGsQa8D4ZCqIWt9OmZe7UJzw1vnRt8MBKhE2Cgh
         CkEg==
X-Forwarded-Encrypted: i=1; AKwUvBw5NX/r7sFbgjJSWdyfGsKiC1ZdkDC9Ec5wAMEefglGgm0lw7bMXObq9apvoSQbWZoF0peoJIViTns=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLjXly4ZwhIUGjOQiwwEhIUde/VQF0ZhEa5OmVl5rgtV3StAh9R
	qaQO9dluK5cEVo8HUR+lQPeao+Q9UWA35WyrDJPX6AF7IUgTeDPs3kiY
X-Gm-Gg: AYBFou0lvt3l/U8yhNOvEkxoIZrZ7MzU89tds4m+D2yHruTPH5IRhBoIs3+q8HO/HS7
	fNA3z/brqiHKk6SL28oVAloU1DrCkNPDpFesuTDCPgAd9AQbpNMMsNW9IEhxuMjAAzIypaMh/K9
	q35Wi1Ne2MY7s0OdI4jKCTFLRdYjx6vsWDOpcz2GwfXUniJiW149lC8vbiOEFq+kEhC2f25cuR8
	6AAspP306Kiwy2mJer2ffKOyf90uD6n9o99rh3+4X2pF6XFZMqrI0BQ5rMsKGkmuGePmCV9ouCr
	Q6pAMSwNyZVrPzC0yGF/cvVl+mAszl1Dao78vLn7LSZM6cffpI08HhfjwRuUWwXcJcbB8OSyLzx
	bs2PUD1c13chVehmGMsQXgJ33bJ+Y7qsWVyMZ5qEZ3DORQsqAPR3Oa9U11jXcnAGK966nXwt9XG
	tyBSKq9egaB8JeSJ9k9Rkp8PWLtIaPBiY9Z0fOiIBHUaKmkeEVSoFF3+mfldHiYSGus1NrCMTK6
	yLygE6IxXlQppFS05eUUTDMCEOXQTRMnrx/oAo=
X-Received: by 2002:a05:600c:4e4f:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1ad27e79cmr166119235e9.6.1792053163316;
        Thu, 15 Oct 2026 01:32:43 -0700 (PDT)
Message-ID: <107edbb0-eba9-4a4a-a1fe-f07d947d47b3@gmail.com>
Date: Thu, 15 Oct 2026 10:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/39] xen/riscv: build the target hart index via
 aplic_hart_index()
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <ba71bd0de931eab1205a1139e160f40b72bda421.1790779209.git.oleksii.kurochko@gmail.com>
 <27c8f0bb-4c59-4605-ac61-9a3e5434fc64@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <27c8f0bb-4c59-4605-ac61-9a3e5434fc64@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1792053163-73ABF2A1-6C49B14D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1299



On 10/14/26 4:03 PM, Jan Beulich wrote:
> On 30.09.2026 18:18, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -335,9 +335,7 @@ static unsigned int aplic_get_cpu_from_mask(const cpumask_t *cpumask)
>>   static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask_t *mask)
>>   {
>>       unsigned int cpu;
>> -    uint64_t group_index, base_ppn;
>> -    uint32_t hhxw, lhxw, hhxs, value;
>> -    const struct imsic_config *imsic = aplic.imsic_cfg;
>> +    uint32_t value;
>>   
>>       /*
>>        * TODO: Currently, APLIC is supported only with MSI interrupts.
>> @@ -350,27 +348,18 @@ static void cf_check aplic_set_irq_affinity(struct irq_desc *desc, const cpumask
>>   
>>       ASSERT(spin_is_locked(&desc->lock));
>>   
>> -    cpu = cpuid_to_hartid(aplic_get_cpu_from_mask(mask));
>> -    hhxw = imsic->group_index_bits;
>> -    lhxw = imsic->hart_index_bits;
>> +    cpu = aplic_get_cpu_from_mask(mask);
> 
> Any reason this can't be the initializer of the variable? There is a
> related assertion in between, but as long as the variable isn't otherwise
> used ahead of that, such ordering if fine afaict.
> 
Agree, it could be used as initializer. I will do that.

thanks.

~ Oleksii

