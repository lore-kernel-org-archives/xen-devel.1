Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CB4C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 14:28:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408626.1641093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uu9-00067b-31; Fri, 04 Sep 2026 14:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408626.1641093; Fri, 04 Sep 2026 14:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Uu8-00067U-V2; Fri, 04 Sep 2026 14:28:32 +0000
Received: by outflank-mailman (input) for mailman id 1408626;
 Fri, 04 Sep 2026 14:28:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2Uu7-00066r-Gl
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:28:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Uu6-006U27-Td
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:28:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9ad574-e002-0a2a0a5209dd-0a2a450bea5a-48
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:28:30 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9ad58e-b7e8-0a2a450b0019-d155802dc45f-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 16:28:30 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso8954065e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 07:28:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5533ffbsm157930585e9.3.2026.09.04.07.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 07:28:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788532110; x=1789136910; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pD7OeTsKlgp5Zou4D+LlQhgrAakl+ESpDfDKraMHwT8=;
        b=JhcA+DOf+43Bru8FKKnKT2CwQ8TH8/VfHgyIZvwuzF7AMnkgAYKA8ZyrfHRXJQFdkD
         9oAi5CWDYiV/LOPyIKIkFPOya9hq4MHVCgIEJscRAbcm5zGCQ+2G/JPSCuwktnVFUdVP
         yFfNXluZGVxPjUdGzT3uxFIUoZqWSWmvj78dkHK50KD9cSnqsJyf9/02fS0y5ZRKiiA3
         bHtauT8Fj9WN524OTiCJLRlnAbtHOMwQofXQgeZuCsr2/pvBxYMzVxGOWP68jEi2IXsd
         hlExsFE+dxZMPT/yDioFLJYeAQL1Kshf89YkdBy047vobkAuPBOHswIbioQR245JgUqv
         nP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788532110; x=1789136910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pD7OeTsKlgp5Zou4D+LlQhgrAakl+ESpDfDKraMHwT8=;
        b=aMcWV5c7/qfIIMqXrseK2sFgi28fC4AkIx2ECNfE7Q6JeGxYK/u04/97js+pHxrp4/
         RP+IiZKCrIv3vmZNG7r0c62wkiHScPdatzoQQ8jZfYbsegtDzoJaiQaXOHLQO+XlyEdf
         2CIvb61ExWGe723cSOMWmIuxw0F12wAoo1sYTuWVIuHu4i4++YsvMKHG5HRvfJGdXiK8
         9y6USm1nBmEXD3Dl3CQiEs4H2PDXPOYwwGPy8HqUUWr51nDmuCovCWFbyCYF4VOkxLRc
         kZSDuqkyqQEDLLnbH5wtFl72JOmFQBjrDnlMUTJHfLjyrCN8LCEmlI9F4jFQqnOn0GXB
         vLqg==
X-Gm-Message-State: AFuF++nEQzUhk4TCFejnFKRIA5yjvMsz2Y2fnwFOgpjp0RbmRX/qg34C
	m2bEbUH+x2qzd33W09RXsdoOil3rDNT8+VGYkrJAppZkgjouNa8+/6fO
X-Gm-Gg: AYBFou3agCPtkU+VKEzfH8LsUQtM5YR7igFcM3EdZBK1i/EhZtwz/I0nIO214A80wgf
	2fTrJLAtLBXQ6Mm+o4ukfWSRcjnMphG1dL3gM+8/PNET9fYVdlpyGFihhIcj6Cq4emOKW6MV2oX
	IZ8KfXep/DUVZlWzHqkFYqNP19FFNsv5KzUWxuusgOwbLxL5ufk9H6gtY7CvVkoVRmxeVj7hecR
	HECZ5xqS/GuaIXalRmOb8uyH4RUQ8XgFdgj6cdiWL2B0+y8Y6j5V7IWq3nZRbN5YtD+OkSM7lAT
	WkCJFzt+6/WQxjK6c6MOPwjvH8vWVRDsCyfqphHcB7lQ05RVFTKjjr3L+UN9eZVMGtfFQag9RcF
	l24mgnp2x9fxpa5gFYaC2w7w9+ZCcJqhfOMzByPT0+rMruUxk+PUB+MTHR12UFrFxjSeGYdae5u
	xTM63/btOx2fKI+OWW55VNhfA2gtlE7aYF5BJkZpcIMhHHT9NWKrXOduDTGhJjuFYkmmGC/JJDG
	OsH/wyBtTSMfbim2v/L0QgkVsRiW8fNfqJ1vB8=
X-Received: by 2002:a05:600c:8b8a:b0:49c:ee08:6ed1 with SMTP id 5b1f17b1804b1-49cf81eafe6mr68388215e9.5.1788532109780;
        Fri, 04 Sep 2026 07:28:29 -0700 (PDT)
Message-ID: <c17116d0-e79e-41e0-8e07-6aa1bce3a943@gmail.com>
Date: Fri, 4 Sep 2026 16:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: build the target hart index via
 aplic_hart_field()
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
 <3c7418d64a730ec5e4b2cfd0ecfbbbc6fe0bf7d8.1787838835.git.oleksii.kurochko@gmail.com>
 <1788510380.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788510380.8631fc262581453bbf619ec5b2062170.1a06b869ff7000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788532110-A8ECE9EA-C39BD17D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1087



On 9/4/26 10:26 AM, Baptiste Le Duc wrote:
> On Thu, 27 Aug 2026 17:20:54 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>> aplic_set_irq_affinity() open-coded the packing of the group and hart
>> indices into the target register, and got two things wrong along the
>> way:
>>
>>   - imsic_config.msi[] is indexed by logical CPU id, but the index was
>>     run through cpuid_to_hartid() first. On any platform where the two
>>     spaces differ this picks another CPU's interrupt file, or reads past
>>     the array;
>>
>> [...]
> 
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 

Thanks.

Considering your suggestion regarding renaming of the function 
aplic_hart_field() in the prev. patches. I will also do here:

@ -344 +344 @@ static void cf_check aplic_set_irq_affinity(struct 
irq_desc *desc, const cpumask
-    value = MASK_INSR(aplic_hart_field(cpu), APLIC_TARGET_HART_IDX) |
+    value = MASK_INSR(aplic_hart_index(cpu), APLIC_TARGET_HART_IDX) |

+

Update the functions name in the commit message.

~ Oleksii


