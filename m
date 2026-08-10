Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F9C5B56A
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387553.1628816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRFn-0003XE-LP; Mon, 10 Aug 2026 14:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387553.1628816; Mon, 10 Aug 2026 14:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRFn-0003X7-IH; Mon, 10 Aug 2026 14:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1387553;
 Mon, 10 Aug 2026 14:45:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtRFm-0003X1-Qk
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:45:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtRFl-00ElvR-KI
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:45:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79e3fd-2eae-0a2a0a5409dd-0a2a4503da2a-30
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:45:25 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79e405-fae8-0a2a45030019-d155dd2ce41c-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:45:25 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so1477577f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 07:45:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002150952sm31371763f8f.15.2026.08.10.07.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 07:45:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786373125; x=1786977925; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zR4+Ndao50WlK7Io6aceA3WQTvXsw/XX3ZCuxEEkqA=;
        b=TtJ6eU9F7hOoTZJLb1mW/rQWz2GuHn69+vzwOuBnc3oiEaUo9XN5ssjyuAoEF8VbND
         JEkEU6ejWRkotnOdDzJW/bIq+RUcly5EwBy3GS1FW91AeJDTOq9wcp04iw+9vxlAJON2
         vHLO7873nOCuwNUdZOzI8+Od7MQg5AzmARv1Cw142qlr9mf1KNlbVjshsT2JtUvTPEe0
         dEXjjg4yrRQ5URmS3twZquPKP+P0ush8kiAFKtVTO+Ogdd+qMiZ+rUiNjL3TghOmSp3w
         0P1FUxpAHy5aEfsqSsgCuMqcmEgJ1Lo0g3XA6vMXj/8X5k1l25wW0JFF0atDVyE9qORC
         b0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373125; x=1786977925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zR4+Ndao50WlK7Io6aceA3WQTvXsw/XX3ZCuxEEkqA=;
        b=XEMU4fjO2L6WMh3XD9L4hF9bv5DNFNHQauuXac7Nf4t9AeJCOqc2v92qCRzIFuIwKg
         seVpk4QKJdMS75TIFsLlXdw25hI4F2HCEKFJ8FcNVeyN6On40LXLjb9PUCp2vJAaph4D
         XPY/Gec6PM8TIeJZhG/KLur+xJsqNjXWRb+NqLx02xY3A3BVOLccO+z8v/60jT55pPud
         2bQGexBBXoMYCnnQzSpj/o/VNOZ/9aZr/taQCxfEPi87dZk2IGnsHXzNEmhc38i43oBt
         mC4bvC1m1lp5wsrNWWctlDMk3J84oq6zWuw96FMKd8oycdXfLKwMNSSjL4OotYU4GCz5
         YVWQ==
X-Gm-Message-State: AOJu0YwTHWL7EJNY5yL/04zFluow5tbiSSt6xVBmfzKeOCEGCp9MjayL
	noFdu7ZOLJSkxUaODmt9wq4DO9NY5z/8dzQfqv70iv1JDQtzPbYYHXii
X-Gm-Gg: AR+sD13tYwpYyp/HFV1tM8Rl/QABVPFu59Mgkf1Rw2Iigo3KZtR5IwfvIugQ/nHe/II
	imo2AMo+30nlMU3NZ8RigIuVN1rPebIE68DZuvwVZm7oLAxyENH3nvdYTSqVkT14ZQRL9vRNms3
	FVy4Q38o50K/4PK/VutOxQts9I5D+a8qyOoBK0A1QVtBthPNSzfOsyZ79R8zxsL1oi4wWVj140F
	B+YagwVzdoHOjhjMpgE2vZ292YQJfJO0ucAzZZGHt1OFwiAijVOiI8zXiHCxgfsfyiW/uqezhKW
	09RJUG+345zGFCwL4PkwSSH/TN7rXEALrcCUAoXdUsK49jvR2AKWT6NFbPrJRZOZqnUyS1oeEzE
	sZc19j4FRBh7yYsIkUwKQA7YT1Vvjo3iAzcH5u2Cuc3hUx3kjpxtOrzp8Bs1omR0RJ9I8XeXAWK
	wecVjGdgArTsDzFJyUVwNTXZ1o5ipz41Q041pQKc5b1qW4R8f0vHZyl8z2K8mj8K5koo2QoxCD2
	kymkmMgne7qCFt7WFs0ZBm+/rIqv+1r+k2vwxUTULE=
X-Received: by 2002:a05:6000:4715:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-48002670a9fmr35995155f8f.3.1786373125080;
        Mon, 10 Aug 2026 07:45:25 -0700 (PDT)
Message-ID: <b1e6363b-2012-44fe-9aa9-3d0f049f0b69@gmail.com>
Date: Mon, 10 Aug 2026 16:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/17] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h
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
 <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
 <1786369533.8631fc262581453bbf619ec5b2062170.19febebe536000e099@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786369533.8631fc262581453bbf619ec5b2062170.19febebe536000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1786373125-758824E9-CD6F66F3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1723



On 8/10/26 3:45 PM, Baptiste Le Duc wrote:
>> These definitions are required for correct decoding of APLIC MMIO
>> accesses and target configuration, and will be used by both the
>> physical and virtual APLIC implementations.
>>
>> No functional change is intended by this patch; it only centralises
>> hardware definitions that were previously missing.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
>> index 07318aaac2..f22622b9a2 100644
>> --- a/xen/arch/riscv/include/asm/aplic.h
>> +++ b/xen/arch/riscv/include/asm/aplic.h
>> @@ -15,6 +15,8 @@
>>   
>>   #include <asm/imsic.h>
>>   
>> +#define APLIC_REG_OFFSET_MASK   0x3fff
> 
> _REG stands for memory-mapped control "region" as explained in spec? If
> yes, it'd be better to add a comment.
> 

Yes, it is a mask that allows us to get the offsets for the registers of 
an interrupt domain’s memory-mapped control region.

IMO, if the problem is with the name of the macro, it would be better to 
use a clearer name instead of adding a comment. For example, 
`APLIC_CTRL_REGION_OFFSET_MASK` sounds self-explanatory to me.

If you’re still not happy with the suggested name and it isn't 
self-explanatory, then:

/*
  * Offsets of the registers of an interrupt domain's memory-mapped control
  * region, which is APLIC_MIN_SIZE bytes large.
  */
#define APLIC_CTRL_REGION_OFFSET_MASK   0x3fff

Alternatively, I could keep the old name (APLIC_REG_OFFSET_MASK) and use 
the suggested comment.

Which option do you prefer?

~ Oleksii



