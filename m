Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F40606A339
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JHWSdmVf
Received: from list by lists.xenproject.org with outflank-mailman.1486870.1689336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmnD-0003bz-Rw; Fri, 13 Nov 2026 08:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486870.1689336; Fri, 13 Nov 2026 08:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRmnD-0003br-Mn; Fri, 13 Nov 2026 08:37:55 +0000
Received: by outflank-mailman (input) for mailman id 1486870;
 Fri, 13 Nov 2026 08:37:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRmnC-0003bl-Ba
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:37:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRmnB-00FJpS-CS
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:37:53 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6cc41-2eae-0a2a0a5409dd-0a2a4506b94e-36
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:37:53 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6cc61-195a-0a2a45060019-d155dd33c852-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:37:53 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-490c3ae81d3so256023f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 00:37:53 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d22394esm4089735f8f.3.2026.11.13.00.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 00:37:52 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794559073; x=1795163873; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+5SWZKVOVriZCDBJRoFzEtyb/ULyuHhDPKRFW2RzxQ=;
        b=JHWSdmVfyE0JELeKVvbwqKex3i/WbSuPeq+fbvF6un3jTMJW2HQn4xCniyndGK2SiB
         KxGbapkkwHtbiYjtega8nd+acMqbQ5k+YRo1FcrKmrdla4WsIcchYNlwt/BfgaOhYe5Z
         ETScAOhFxRjxHCLss5fW4rbKiW8Liz+iegqRoQwNW189grGzHL+PR8Rw2KrWvTyNO/Bi
         NyHlhj+6WnXbj4ijFtALBU1SFhxYwhS7Duj2+leHRAzA0/wcJajjXUteXfBqj70Ri59e
         sTivxSy+P6D4PXwDjTaPvNw+8jbMM741ckas/25E863MQOSDM8FqXI0495B0FrP/I3eu
         fSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559073; x=1795163873;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+5SWZKVOVriZCDBJRoFzEtyb/ULyuHhDPKRFW2RzxQ=;
        b=suDe4opJPOS5+XIehAbNEBQtJaZmXDCKKGf3iSxoh4a2pEb5qPxGi3mdKSn17v2e7X
         K7bG650jaCUCKTiFU+/T7mEZy16YK4M17lzvife3fdoiIZJnxVd/Ce5wd5lUXhKne5QF
         nLIPItbqrNbH326yA7vwWnTXtSzC3lVGisF+F8OaC5HMiKDyKmKHVMpxDnjM6aVt9NlK
         RADSNqzf2TNu/XbhYee3WZ6ER7Js4USj5ZhhQVMX4pLQ0t81R37SWktWBS4zJeaPTc0n
         S75Ry1Um+JcTnehqIKJWIZcPn+dIRO+E5g0q585TaVKJZZX/5RsDFJ0yILrIXtVGoaJz
         tCtA==
X-Forwarded-Encrypted: i=1; AL+hErE7hdcor724fGTZCWSKQ2660hocP7k9NS2sWrLLLusDmAJwHDL68pbwz0eJoBtqYWpTgRxVBDDs7h8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/5YFB4hW0GG7OgWBY8ZZunrcqNzn5rUmIroFBjRtUl+Q+aY8zo
	4J8eMR5gTTkWlla/2Mukfzm5vqAQFiFa/hpeUdf+108FHuo3cLPdfuMj
X-Gm-Gg: AYBFou3OIQdo8Ayby3RHq9wjBrqE0+s6pWxTHs8fmOwdDvZtUtxJGEqcFFf7XugLPCn
	zf8lcvlPnAVWkH3FytBenV9UDuuu6elmBhx2beFRUbZLt3wwEXRQSQAW/J3vdblIf53J0INAlon
	mVcA2iHjgNCumPsS3zChyN+5HMRRUhilMA2v6+ZvBawZR1XtxQONItZ7L9tMIxYCqYUAHLAcXtj
	72I0LQgbp+vzRRY5XxtagsBQlX/EoHdQDNKerJgrG0VWgHLV4QRPbDr7uo+4u6hBcB38PZImhjO
	ys+QuIzwGTpbeQrty6pXBACc/8YM+8iwrUz4bnOpErMa98rEbagL2FeKitq4+K7OaNax5Ku++C0
	EkGGj63BmRcZFAvCBkKCVmLuhnau3u5U9Dv4qy8c5B1PUHbM8AQF8jAb9oJPm9KoNC4Kcunay8K
	5/zeZWVba+XmVRFHN44SkmTPi8bBcKhSSxJCNDhump6/zF7X3hD8UFHi5oLOkn+42R9pD/cGuxH
	KYVZuvyRzRPUYaITCMp+2XOpamQocy9bWOw8Cl94cO9eoUPjumiw7ib59FjDTETcqDbIb+al6fC
	EoPGC7dOzTc23dqsj4TbZAzOiABj8/4AAXrSRzJdI1AZ0cCks+YYgAMWWYk5Rn6uLPgdl683Nbi
	dkw==
X-Received: by 2002:a05:6000:2886:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-49cfc832e91mr1558460f8f.12.1794559072740;
        Fri, 13 Nov 2026 00:37:52 -0800 (PST)
Message-ID: <2f4447db-3a92-4eda-afc0-06720b2854c0@gmail.com>
Date: Fri, 13 Nov 2026 09:37:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
 <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794559073-1FECC77B-58B2F9E7/10/78276251493
X-purgate-type: spam
X-purgate-size: 4339
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/13/26 8:31 AM, Orzel, Michal wrote:
> 
> 
> On 12-Nov-26 19:36, Andrew Cooper wrote:
>> This is a list of pointers which is only ever read.
> I think that's not true. See sched_test_func() macro in scheduler_init() that
> assigns NULL in case the scheduler does not implement the required hook.

The same happens a few lines below if the scheduler's global_init() fails.

Neither NULL assignment can trigger today (both global_init()
implementations return 0 and all in-tree schedulers provide the
hooks), but I think the writes need dropping first, and the entries want 
to become "const struct sched_ops *const" (both in REGISTER_SCHEDULER() 
and the __{start,end}_schedulers_array declarations) so the compiler 
enforces the property.  It would also be nice to rename .data.schedulers 
to .rodata.schedulers while moving it.

The linker script placement itself looks fine to me.

~ Oleksii
> 
>>
>> In the ARM linker file, fix some adjacent misalignment.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> CC: Timothy Pearson <tpearson@raptorengineering.com>
>> ---
>>   xen/arch/arm/xen.lds.S   | 6 +++---
>>   xen/arch/ppc/xen.lds.S   | 2 +-
>>   xen/arch/riscv/xen.lds.S | 2 +-
>>   xen/arch/x86/xen.lds.S   | 2 +-
>>   4 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
>> index 613511390ff4..d1bb6c62d208 100644
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -51,9 +51,10 @@ SECTIONS
>>   
>>     . = ALIGN(PAGE_SIZE);
>>     .rodata : {
>> -        _srodata = .;          /* Read-only data */
>> +       _srodata = .;          /* Read-only data */
>>   
>> -        BUGFRAMES
>> +       BUGFRAMES
>> +       SCHEDULER_ARRAY
>>   
>>          *(.rodata)
>>          *(.rodata.*)
>> @@ -93,7 +94,6 @@ SECTIONS
>>     .data : {                    /* Data */
>>          *(.data.page_aligned)
>>   
>> -       SCHEDULER_ARRAY
>>          HYPFS_PARAM
>>   
>>          *(.data .data.*)
>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>> index 37256c8865a9..cddb70855307 100644
>> --- a/xen/arch/ppc/xen.lds.S
>> +++ b/xen/arch/ppc/xen.lds.S
>> @@ -48,6 +48,7 @@ SECTIONS
>>           _srodata = .;          /* Read-only data */
>>   
>>           BUGFRAMES
>> +        SCHEDULER_ARRAY
>>   
>>           *(.rodata)
>>           *(.rodata.*)
>> @@ -84,7 +85,6 @@ SECTIONS
>>       DECL_SECTION(.data) {                    /* Data */
>>           *(.data.page_aligned)
>>   
>> -        SCHEDULER_ARRAY
>>           HYPFS_PARAM
>>   
>>           *(.data .data.*)
>> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
>> index d9375a961697..250ee3f36f4f 100644
>> --- a/xen/arch/riscv/xen.lds.S
>> +++ b/xen/arch/riscv/xen.lds.S
>> @@ -43,6 +43,7 @@ SECTIONS
>>           _srodata = .;          /* Read-only data */
>>   
>>           BUGFRAMES
>> +        SCHEDULER_ARRAY
>>   
>>           *(.srodata)
>>           *(.srodata.*)
>> @@ -91,7 +92,6 @@ SECTIONS
>>       .data : {                    /* Data */
>>           *(.data.page_aligned)
>>   
>> -        SCHEDULER_ARRAY
>>           HYPFS_PARAM
>>   
>>           *(.sdata .sdata.*)
>> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
>> index 8f943e11ead4..925848980219 100644
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -119,6 +119,7 @@ SECTIONS
>>          __ro_after_init_end = .;
>>   
>>          BUGFRAMES
>> +       SCHEDULER_ARRAY
>>   
>>          *(.rodata)
>>          *(.rodata.*)
>> @@ -297,7 +298,6 @@ SECTIONS
>>     DECL_SECTION(.data.read_mostly) {
>>          *(.data.read_mostly)
>>   
>> -       SCHEDULER_ARRAY
>>          HYPFS_PARAM
>>     } PHDR(text)
>>   
> 


