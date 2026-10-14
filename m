Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C16CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:35:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448832.1664850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxGY-00021R-Ks; Wed, 14 Oct 2026 11:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448832.1664850; Wed, 14 Oct 2026 11:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxGY-00021K-IG; Wed, 14 Oct 2026 11:35:26 +0000
Received: by outflank-mailman (input) for mailman id 1448832;
 Wed, 14 Oct 2026 11:35:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGxGX-00021E-9i
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:35:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxGW-004LBc-Fa
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:35:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf68f0-2eae-0a2a0a5409dd-0a2a4506b1ec-28
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:35:24 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acf68fc-195a-0a2a45060019-d155dd33b0d4-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:35:24 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso2898082f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 04:35:24 -0700 (PDT)
Received: from [172.20.10.5] (public-gprs376522.centertel.pl. [37.47.102.11])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de7268680sm5316489f8f.25.2026.10.14.04.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 04:35:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791977724; x=1792582524; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZNoVYsYeZeqjLqjz1WArRhWgrfldUwyfuLmQBHBv1U=;
        b=Ib3D+r+J5/7dgd1zBGtJBUYBZTW5hW0XGHPr6bORefONrerr5P3qsdplX0oXZxVCEg
         4CKjEjLWQEWe8uJGLUNZMj8Cak7kxz85AgtSRSwXxJw/jpypux1KCP8mvUc009s0CvOd
         rdlQwiYkftksvtAY4ijFC7YcgeJyX6gT/Thp7vfOHmw3VtNcdRdd8WdOOBGG8EAU4iB5
         3k2B2HFIWtvPK1IX1ecLgLD3R2z6i6ZNNsjjsc0v9ZhAYymdKIq7g847pjHLVU/jww+N
         Cjc9ZXgJWFcQRHt57nfRieCqMhB6+F1505B1XX9S2C7Wrhoq17PMR8btWG8P3ZxSnT+u
         NBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977724; x=1792582524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZNoVYsYeZeqjLqjz1WArRhWgrfldUwyfuLmQBHBv1U=;
        b=DnXT2VJtvMhXHJXkE5K6/MZ9YOd8pqX50qu/96ze5EHTHUQXPLzIqDpNB/T7ZeOHbW
         P85Zdgj7/LkuTnWSeb/1Hrqt1LOw2RnL0YWpa/45SQFesRv/y88yaLxmE0xoEMmxRm8a
         NMHgaHqGd/UOoB3PnRCvXc3G9VsYB5sDcwD9+DhydvASiU67MWpck4TlsH/lYQwiZwc9
         tnE++isS1X4msKD32p4tbzLPLcHPHxiPLmSJeZYDNE2OtWnp2AoHN7edkZgZCSXJ64FY
         KXld2Wox2GaS6fSclO2LspdBN4hvzsCA/IhCFNG9rUTonU0ix5xRFK1zUwPXrUghCBXS
         hL1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJM+T4mlqX+2IwW8cFVXORzGBUUJvYrtQXZ41glT+UCa4ALfu1Gl90yheOIqWkiQ7t94EQ8H05vxQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJHu4pJrxSOl9CCCuA/og8KYztxGi9exquFKc0SgRsqEAHftar/
	GUuxnFOVdD/+jYHQS8addIpeNm9MXKMtEqdjKeJbusGsm2wvJWCgUUCO
X-Gm-Gg: AYBFou0+7hUkr2JBn8xp/WbOuq3L7y/C524GVpCffpYUxDosEjYqN3VlutH7cHd2FSI
	qCFbLxQLBfO0a1YdQJLrplcZuntRmCl9ogVXtr2GW3U/60XaHNwa/1XHlhuP2jawmV9ZCORAWam
	RMdAx3oO+J9Ugwkd004I0veHW2ncLmdHIsdf0vWPE2mzF4VIExuOZHfU4VnDzy60eeaKn0h2kbm
	zmfHnODSwiiP2uA+qrH2a8zT8IUnsZ+KM7D7NP4ZFyBUnv+1jSCaT1S57V4Xy6hWF9ibY4SwhFK
	zq1ZhwhcLxtmX6BD0I0oiGDYGfm/MRbkLLk3vcEd5W62E0J4lOfnqvMFBy8Pa+pihvN6dawHe/q
	ZwhGQY7mMaLF7IaS24c4F8jr2LuZIhnm/ZyXym3LbZs4P37uWyXDCna4LNL0w0ZFR7cFIRdIC7U
	dY3dX58zEBPvImu8UGkPlG8S0oS1FVeM2j3SeM1QGUuaJVtzMwKK7mTaQx8NDJlhMNOk8OTbaKF
	mad/bzomnJYKs4qsN4XepU8QGRaWUES/rK9b6o=
X-Received: by 2002:a05:6000:2991:10b0:488:8352:cbfd with SMTP id ffacd0b85a97d-48dbad3820bmr22819430f8f.46.1791977723837;
        Wed, 14 Oct 2026 04:35:23 -0700 (PDT)
Message-ID: <e244311d-f956-42a5-bcf8-43cfa2496422@gmail.com>
Date: Wed, 14 Oct 2026 13:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/39] xen/riscv: introduce CPU_NONE
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
 <d35b280c0bf075a2a730f9cb69ced407e346ebd5.1790779209.git.oleksii.kurochko@gmail.com>
 <d08b6491-8b87-49ba-80bd-36d4448a59b3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d08b6491-8b87-49ba-80bd-36d4448a59b3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1791977724-F7ECC77B-3D43769A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2733



On 10/12/26 5:40 PM, Jan Beulich wrote:
> On 30.09.2026 18:18, Oleksii Kurochko wrote:
>> Introduce CPU_NONE, a CPU number which doesn't identify any physical
>> CPU, to be used wherever a pCPU has to be recorded but there may be
>> none.
>>
>> Its first user is vsfile_cpu in struct vimsic_state, which records the
>> pCPU whose h/w guest interrupt file backs the vCPU's IMSIC VS-file.
>> NR_CPUS has been used there as the value meaning that there is no such
>> pCPU, i.e. that the s/w VS-file is in use. NR_CPUS is however an upper
>> bound rather than a "no CPU" marker, and it already carries other
>> meanings: hartid_to_cpuid() returns it for a hart Xen doesn't know, and
>> pcpu_info[] uses it for an entry whose processor_id isn't valid yet.
> 
> Yet these could (and imo should, subsequently) entirely plausibly also be
> switched to CPU_NONE. IOW I don't think ...
> 
>> Use CPU_NONE for vsfile_cpu instead, so that the s/w VS-file case can't
>> be mistaken for any of those.
> 
> ... this is a plausible justification (nor in its re-written form as per
> Baptiste's suggestion).

Fair enough, that argument doesn't hold. Rather than leaving them for
later, I'll switch hartid_to_cpuid() and pcpu_info[] over to CPU_NONE in
this patch too, and justify CPU_NONE by it stating the "no pCPU" meaning
explicitly instead of reusing the NR_CPUS upper bound for it.

> 
> If you want such a distinction, you'll need separate sentinels for every
> one such field.
> 
>> --- a/xen/arch/riscv/include/asm/config.h
>> +++ b/xen/arch/riscv/include/asm/config.h
>> @@ -136,6 +136,9 @@
>>   #define OPT_CONSOLE_STR "dtuart"
>>   #define INVALID_VCPU_ID MAX_VIRT_CPUS
>>   
>> +/* A CPU number which doesn't identify any physical CPU. */
>> +#define CPU_NONE (~0U)
>> +
>>   /* Linkage for RISCV */
>>   #ifdef __ASSEMBLER__
>>   #define CODE_FILL /* empty */
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -71,7 +71,7 @@ struct vimsic_state {
>>        */
>>       unsigned int guest_file_id;
>>       /*
>> -     * s/w IMSIC VS-file -> vsfile_cpu == NR_CPUS
>> +     * s/w IMSIC VS-file -> vsfile_cpu == CPU_NONE
>>        * h/w IMSIC VS-file -> vsfile_cpu < NR_CPUS
>>        */
>>       unsigned int vsfile_cpu;
> 
> As can be seen from the comment alone, there's now the risk of
> CPU_NONE < NR_CPUS, at which point users of the field will be
> screwed. I think you want
> 
>      BUILD_BUG_ON(CPU_NONE < NR_CPUS);
> 
> somewhere.

Indeed. I'll put it into smp_processor_id(), next to the
BUG_ON(id >= NR_CPUS) which relies on it for a pcpu_info[] entry whose
processor_id isn't valid yet.

Thanks.

~ Oleksii

