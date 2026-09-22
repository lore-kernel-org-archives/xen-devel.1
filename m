Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76066C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:38:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429010.1651935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91dU-0003Nu-1s; Tue, 22 Sep 2026 14:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429010.1651935; Tue, 22 Sep 2026 14:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91dT-0003Nn-VF; Tue, 22 Sep 2026 14:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1429010;
 Tue, 22 Sep 2026 14:38:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x91dS-0003Ne-Sj
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:38:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91dS-0003vP-5Q
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:38:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab292c6-bab6-0a2a0a5309dd-0a2a4504b93e-40
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:38:18 +0200
Received: from [74.125.228.170] (helo=mail-ej2-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab292da-b57f-0a2a45040019-4a7de4aa805c-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:38:18 +0200
Received: by mail-ej2-f42.google.com with SMTP id
 a640c23a62f3a-c254f6c7a56so509161066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:38:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a9c5b2d17sm100643766b.36.2026.09.22.07.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:38:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790087898; x=1790692698; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijelvjpV/j5YwDiQgvuM4OExfRmt6Zi4hbEk3BZURWo=;
        b=m4RM7q90rkJTM/zJS/SApExlM2g6v+uYzcP7MgMx4z794xRn2RJCBzH9DlbMLqm6s9
         X+E4g/upvOh0XiDzT47z21tPTCKMTPes+b9UULbtZDFy+HhrJN138qyDx0W6mfo3q4gP
         tSTH/oaFx2M3ts2xj6aol0G27oz8zJoPhwhtQEmRAZlv5PlCL2GM0fxtU4W0YZgx4OmQ
         W6G+IPlCb8KJYQ01aHyTd68A4rL/Hkaf+GCM139gFXcivGBmbSz9z06SxqFK4FrXlupt
         VIWk4LvVcfBTuB7M9RS6BvfY4H4Q9HzPTZmz8KVAwTIICiT+1kQ6WMtnMY8ejJe2SKuq
         pUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087898; x=1790692698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijelvjpV/j5YwDiQgvuM4OExfRmt6Zi4hbEk3BZURWo=;
        b=xX+5fAflT7Ju4SofBQ2VDESpEUah+kqrHIVQU4E3JXt7XyUbhMoLKdQL8trz01QgmJ
         pFeG2qkKAV21xJxkFenPDTyLDn5EEPzxT9v1WJEvmNzKIp8Vw6T6UXi8zXT/iGjoUzu1
         BcNPZn7dwxgfgJJFQNmDpJWZJcK4GYkjCgS30OyHauei5Ff6WZEwYNAYem++IFHu63Ay
         wxQ168pYCx+Nl5TmDgjZFkH7KS/uBIG0LNZwK9ffQmzobtA+WlvAfm39lPIQPS+w4L6u
         97Nm3FUj4ywK/JMB/ezhe/J7MD+FLyBam1czYh6/1vjQpSTlM3brmtF1R+sDnF/+i0cZ
         QzBg==
X-Gm-Message-State: AFuF++k8FwotCTkYbwaYy9xygAlPz4AOVyKLESn6DDvYbbZhoUXAnNKT
	+8Wq5Q2E7REi+Aw/uwXce7vpxRCTLd+ha6VyFNiqeup2gehkIqVGFP62
X-Gm-Gg: AYBFou0GiZTzkuHpZgGqzEyLpN+yC8WVIn/LGnlsolZNR1y+YCJNtt9OzksvezVTxZK
	+2I8BXwQ0/P3XUrwr2voXvwljScp9Z/Uulj/J7n2kgUfmB2lpLs5XSevEzmkRvSUi9uALDxpvdD
	4kF7I3C1A08neEWqSf3i8vvsRvhyOBARnVjWAvtGtG4DFEbd6Qor9K6bsRcQHC7NjtDutzQbh0G
	iruvONZhj6WUrBSYlEG/O1zq5MMWH10fmqrSOP4CYYichcG9uHVU11/+cZTwB10UNIlPn4B2HQb
	VMLXkN6leuCeCnakRJ6x8IxvvcVfF5Zn9QLZzav9t8ZipWWeZQ3ZmsSmlxkgerkvxIzZSa1BH/1
	m3yUXuinCYalQMeqB1Y9Diwy+c2NImH5bZYRlx0LEquZVn3WsIrgogwOzWG0W+KRJECiXqc1eej
	Fy9e8cGNYfI/ZnQtmbink/1YRL1zmfxZakv5/FMqQ0kg52hEQH4V7DdmfnXwd/wcm4FBGQHdJh2
	cM12b2B2MpniEL8AATf1aeOJ/b7W6KZu+vA0VTEuB9lgXIoMg==
X-Received: by 2002:a17:907:7284:b0:c29:52dd:317b with SMTP id a640c23a62f3a-c2a15aeb6b6mr1362332466b.29.1790087897619;
        Tue, 22 Sep 2026 07:38:17 -0700 (PDT)
Message-ID: <04564edb-95e8-4f7e-a148-7e3533ee38e8@gmail.com>
Date: Tue, 22 Sep 2026 16:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] xen/riscv: make Svpbmt no longer a required
 extension
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aab9fe1000c4f3@vates.tech>
 <9ea9edfc-be76-4507-8b71-a483daa9e7d5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9ea9edfc-be76-4507-8b71-a483daa9e7d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790087898-C34C3B50-FD4A73DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2278



On 9/21/26 5:57 PM, Jan Beulich wrote:
> On 10.09.2026 11:34, Baptiste Le Duc wrote:
>> Without the Svpbmt extension, memory attributes (such as cacheability and
>> ordering) are strictly tied to physical address ranges and enforced by the
>> hardware's Physical Memory Attributes (PMA) checker.
>>
>> In this configuration, supervisor software relies on the platform's memory
>> map:
>>      - peripheral device registers (MMIO) are physically mapped into
>>        hardware-defined I/O regions (which are implicitly non-cacheable and
>>        strongly-ordered)
>>      - regular RAM is mapped as cacheable main memory.
>>
>> S-mode paging can safely map these physical ranges without specifying
>> page-based memory types in the PTEs, as the hardware MMU and PMA pipeline
>> will correctly bypass caches for MMIO accesses and use caches for RAM
>> accesses, based on the target physical address.
> Provided firmware got absolutely everything right.

Yes. S-mode has no standard way to discover PMAs, so it has to trust the
platform here. Note though that PMAs are in most implementations fixed
in hardware rather than programmed by M-mode firmware, so this is mostly
a matter of the platform's memory map being correct (and of the DT/ACPI
describing it correctly), which we rely on anyway.

> 
>> Furthermore, on platforms that either feature fully hardware-coherent DMA
>> or don't expose non-coherent DMA agents to the OS, page-level programmatic
>> cache control via Svpbmt is not required, making it safe to boot and run
>> when Svpbmt is absent.
> Yet a fully coherent platform should also be possible to somehow identify?

To some degree, yes, via firmware tables: on RISC-V DT devices are
treated as DMA-coherent unless marked with the "dma-noncoherent"
property, and with ACPI coherency is expressed via _CCA.

What matters for Svpbmt specifically is whether a non-coherent device
could be used at all: without Svpbmt no NC mapping can be established
through page tables, and without Zicbom there is no standard way to do
cache maintenance. If neither is available and the DT describes a
"dma-noncoherent" device, Xen will want to warn and refuse to assign 
such a device to a domain or something like that.

~ Oleksii

