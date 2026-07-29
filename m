Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBECC53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 15:26:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376266.1623099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6Ai-00043A-Ou; Wed, 29 Jul 2026 15:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376266.1623099; Wed, 29 Jul 2026 15:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6Ai-000433-M7; Wed, 29 Jul 2026 15:26:16 +0000
Received: by outflank-mailman (input) for mailman id 1376266;
 Wed, 29 Jul 2026 15:26:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp6Ah-00042x-Fe
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:26:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp6Ag-000NeI-Ry
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 17:26:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1b82-e002-0a2a0a5209dd-0a2a4502d6fc-48
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:26:14 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a1b96-6ca4-0a2a45020019-d155802eb844-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 17:26:14 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so11241765e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 08:26:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d944cfsm40502645e9.4.2026.07.29.08.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 08:26:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785338774; x=1785943574; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD9V1nQr9gSdilLfugiaP1mG1JxSdCODvxEcmzQSAbA=;
        b=kWBu/QxK/nFHydBRMxkUhmRGXnoWEbA6zc7uFCtDPzSa/Wwnyi1e5tT+dM1Ar8UTzz
         d7Z52CO6ron8i5fuCerc/XRmvNkSWxsCn1VPRb5yLpEuOKlULl+bFh8+mB4CDgyx0yIK
         PNxBKHkNvw3nC9TeNiqa+oMPqRHdEojPYNPScHefFwinAWJe/RvxEXS/S179+s2scXSj
         DS/squneCgjysNZKqLgH6SKdQALEpReRJNTzQ59aK1fmBQsowwyCC2R+MIttMt6WSYCY
         xmAqiQFQGIVAPgzd9AZfTnQ0/K34wj8qt0saW9BmZ9O+R5T36AHR4kpLCYCvhTJJ0m/Z
         Uhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338774; x=1785943574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yD9V1nQr9gSdilLfugiaP1mG1JxSdCODvxEcmzQSAbA=;
        b=cL+sby7G+1lFJ6CX6jg4IgYoFennPe1xVTwBcovWRpw1FnJhvQNPW0Sj1LYUXcG1Ij
         FXJZpOUIzR4niE2blLQlMhaJ2Nd+la08GMEDts56CbY0gU2lx8t0uKXsMYepA4OBoG1/
         qkN7i5Y1ET8gHJfIyjkR1cVriWeOufsbuBU/bK0avqsUewKFU2Vt0ohtLEm0yXaU81tU
         UjGrqNyq6EWlHjTjaW2GsSAIY+XiNfmw8S5WjSgzNzL49/cP4Vhvq1JBvSS4VHbLR9tR
         2TNYjqeUurpDgDBB8kYocv4D87y8kUMpedJfUhgofGj0Rjw03BBblEScY54AYiQPm1HR
         9yhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC11m/trFMIEeW62i/x5cZnAPTsQNdSKLJavTRbTpkNqYCeoOUroNAX3/bbMA17YXg024NLkk6L5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPp1ZqZuo8GFqDAdNskgmC+Kl7JJgqxLGZhGeSgLb5mmlSLpsi
	PxHTK/GLfUhYY+xjYeOy8r8MFRVfRNhE+vGj3jvoO9Oq5xfuWuy2ZqFr
X-Gm-Gg: AR+sD13gPl5Hve+0EpBz4OEgTLeX0gngBdm5/u8nDLzhJ6r0FaV+1GuGeq4HzrpVTbw
	PDH5CkkuVFPSE5m5e1dQtF1n23oVnqM/5pIEFMnyaBTzvq9i5fyzn3fVaPyyeYLP9B3aQXrEHQC
	5ww3Mk2hyhuGyDhVM5nAn1H96h7z7a/KSC0ErNknLXWRqskc6uCFCOlNEPu2/aJf3I3KpVr6g0D
	qGy64Ybe+V/yveTDcLeuenWXsgLQMJtknbCJIIvugKvz017vk9zriPrG1ICx6wIXNjsif3WfGVn
	I6c47wQ0NC0gggVILK6dkZq5PaQSSSQpvw2lAlHahsZwmrjtMaE+oD7/kt+Wl3MA92wDBMPVzCT
	rbVPtlpP4gEeuuDdsXp7d2NBGZlqLSUlunQIdAcWGmyT5/hFX/MvTI/0UNzq03D7fRAvtnPfuec
	IofRPoywJLQVi38ugsF/Y/6pbGTUs7whSKhBrDVSAOJ5SzjJthO46sHrlz5Wr56KsMgScMAIO1K
	r2jdlJCFk7nwx+SxQrSWGrtx14NJPc4vXNArqJlvH8=
X-Received: by 2002:a05:600c:8288:b0:495:5858:e163 with SMTP id 5b1f17b1804b1-496c6574fe7mr80638545e9.27.1785338774203;
        Wed, 29 Jul 2026 08:26:14 -0700 (PDT)
Message-ID: <0fea0d33-b25d-420f-acf0-3c65368f0bac@gmail.com>
Date: Wed, 29 Jul 2026 17:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/17] xen/riscv: add missing APLIC register offsets,
 masks to asm/aplic.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <ee3825adfd0012437a594f6a0e51c6ee71175cc4.1784560663.git.oleksii.kurochko@gmail.com>
 <a9725508-7660-4960-88ef-8e5b324f8f08@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a9725508-7660-4960-88ef-8e5b324f8f08@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785338774-30DC12AC-6F34AC13/10/73395122804
X-purgate-type: spam
X-purgate-size: 2288



On 7/28/26 2:02 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> @@ -25,6 +27,7 @@
>>   #define APLIC_DOMAINCFG_DM      BIT(2, U)
>>   #define APLIC_DOMAINCFG_BE      BIT(0, U)
>>   
>> +/* sourcecfg register fields */
>>   #define APLIC_SOURCECFG_SM_INACTIVE     0x0
>>   #define APLIC_SOURCECFG_SM_DETACH       0x1
>>   #define APLIC_SOURCECFG_SM_EDGE_RISE    0x4
>> @@ -32,7 +35,39 @@
>>   #define APLIC_SOURCECFG_SM_LEVEL_HIGH   0x6
>>   #define APLIC_SOURCECFG_SM_LEVEL_LOW    0x7
>>   
>> +/* target register fields */
>>   #define APLIC_TARGET_HART_IDX_SHIFT 18
>> +#define APLIC_TARGET_EIID_MASK      0x7ff
> 
> So why would these live here, far ahead of ...
> 
>> +#define APLIC_DOMAINCFG         0x0000
>> +#define APLIC_SOURCECFG_BASE    0x0004
>> +#define APLIC_SOURCECFG_LAST    0x0ffc
>> +
>> +#define APLIC_SMSICFGADDR       0x1bc8
>> +#define APLIC_SMSICFGADDRH      0x1bcc
>> +
>> +#define APLIC_SETIP_BASE        0x1c00
>> +#define APLIC_SETIP_LAST        0x1c7c
>> +#define APLIC_SETIPNUM          0x1cdc
>> +
>> +#define APLIC_CLRIP_BASE        0x1d00
>> +#define APLIC_CLRIP_LAST        0x1d7c
>> +#define APLIC_CLRIPNUM          0x1ddc
>> +
>> +#define APLIC_SETIE_BASE        0x1e00
>> +#define APLIC_SETIE_LAST        0x1e7c
>> +#define APLIC_SETIENUM          0x1edc
>> +
>> +#define APLIC_CLRIE_BASE        0x1f00
>> +#define APLIC_CLRIE_LAST        0x1f7c
>> +#define APLIC_CLRIENUM          0x1fdc
>> +
>> +#define APLIC_SETIPNUM_LE       0x2000
>> +
>> +#define APLIC_GENMSI            0x3000
>> +
>> +#define APLIC_TARGET_BASE       0x3004
>> +#define APLIC_TARGET_LAST       0x3ffc
> 
> ... the register definition itself. Would you mind taking a look at the top
> third (or so) of arch/x86/include/asm/msr-index.h? There you'll find MSR
> index values of MSRs we use, immediately followed by field definitions (of
> course only where applicable). With such an arrangement, the extra comments
> you add can easily be omitted.

I'll move the definitions mentioned above to the suggested location and 
follow this pattern in future changes. I just thought it would be better 
to keep the APLIC register definitions together in memory layout order.

Thanks.

~ Oleksii

