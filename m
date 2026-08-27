Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC8AC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 16:58:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401299.1637034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzdR5-00041u-GW; Thu, 27 Aug 2026 16:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401299.1637034; Thu, 27 Aug 2026 16:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzdR5-00041n-DV; Thu, 27 Aug 2026 16:58:43 +0000
Received: by outflank-mailman (input) for mailman id 1401299;
 Thu, 27 Aug 2026 16:58:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzdR4-00040s-IS
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:58:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzdR3-003bTr-Oc
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:58:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a906ca1-bab6-0a2a0a5309dd-0a2a4501e5e6-30
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:58:36 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a906cbc-5984-0a2a45010019-d155802bd8b9-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 18:58:36 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so12562545e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 09:58:36 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b49610170sm137236695e9.6.2026.08.27.09.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:58:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787849916; x=1788454716; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2WlaGtCp3aT9Am4Nnc/lITi/fUCYeCl+a0KVbaJhNc=;
        b=qbN8uFMHMyVNlI03SHn4u8MLILCF4ytWnojiEvk2gaCGsJ3Fs9TuArXiHzQl6V6sMB
         JM+xBJjRfPrJVFHEPpqN0qYsCZAzmsAmhkcXnnUJQX+qSpWiPQgQ9BvcAT9y0Y1iLsY7
         7LKJkd3DM9tTwvtzURfjz1MQmchsYCY3hcWUQy8W0gklkLvDN0X/tfbijainkgBK4UPB
         fwAu0mrs7MWaBuA37iePBCZGJDlJ3boXHBmrH6pRqn+s9qc90/hGTESoiSX8NmBXXHJa
         wRnffreYvm0Phl/u8+r9QXgjveBsF5BvUZbRdvh4ZVR61wZTJo2+e1uNTBvAQxx49ncT
         Hy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849916; x=1788454716;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2WlaGtCp3aT9Am4Nnc/lITi/fUCYeCl+a0KVbaJhNc=;
        b=HGU2pXmARaScfWk6BBhpIiQF3aaDLrf03f7q1LqMUjawSEYKtozD1Tg6kKK0GDJ603
         b8TSobZ1H0uhpfmabxntQV8c4AyTgtU/r1TFfkL3nBxNsllVha5WVcIuy5QROhJvVj0I
         Hgfk6xOSux5WUQUFHAEgzHW2k17xA39UZnxImmfi7d+TzZsyINLQdtnwto7D4j7WWTON
         ZeVflh0ZqmYsNrHAnwMiRfa0r/dFAyPfEe1XyKA7FoDBIb7tOWCmWCY+vprta8H1uNj3
         Ucr09hq0gXyPZByrb8A639tDXxtseviXauZbOHncijAfl/V/lJ3UNCrs/4ygo6e2X/fq
         dr6g==
X-Forwarded-Encrypted: i=1; AHgh+RqxlxjEpehnQcGNSzjhrfnPcVopaLYMRamNbnrZEwtTtPojzlFtuvqRi/tPkB6HLer8c+0Qx5hewSU=@lists.xenproject.org
X-Gm-Message-State: AFuF++lINx43N1TLEU7gG5zDJPD+U5K4upRHo3IBol2uoL2C/Ap4L1TS
	EQteGzJNh5khGQn0dyqsEV6IuwNPkAsIN+IdHh8ComnhFooSRi5FXaQ6
X-Gm-Gg: AR+sD128IMJeDSPWLEAp+Db/EyNacj1s3nDoi25oqgD5E1GUa9TOShsjBMAsRxhE9jg
	ljDoLWvEoFSDDoqW/W/Td20G7atmBCCLvfx42d8ze6T5rARDd4oqKLFwrd46Yki9Tlu7IkAVQ3Z
	VWwrUwg+e+TrSIbyCq19V8U7WCgDEITikezoONim76I3AY7gw3YocW4NtVyqKo3awrHmlwughBT
	uKpFQ3OGOBGDgYDwCKNjNU9qHnn5arLGF2JJ3pKHgEYuUDdXHB4plwuTsyoabSATLhXkgXiksoG
	jH2GASJ5mumeBdwCf0JbFOJaxlACGXqaimMMoO5ZKoPbPxc96JSUfZRxWgTmEzqRdKTJs9ePEoj
	iGRMVO9oWdHIEGnCrUBY7WVRfDT3hmEuKLe/YeeC6x/3koeZAOm+Ia89+rJ/bw65ydLSukVWnec
	T5QIO0a3bI/oHu736bEIBrcMa02AaYNLL+EiWjKo43mdVO8wZHBKFthivJU9/S5b+pOyfZ11Vnw
	J3j36zbHv8/Y1MA13Oy1JyGF9r2JfdQVaMgNK6p3Q==
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr5640925e9.1.1787849916038;
        Thu, 27 Aug 2026 09:58:36 -0700 (PDT)
Message-ID: <b411cdad-4976-4ca2-bd18-d38af991f657@gmail.com>
Date: Thu, 27 Aug 2026 18:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen/riscv: add SFENCE.VMA after enabling paging
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
 <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
Content-Language: en-US
In-Reply-To: <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787849916-1FE68757-60F27948/10/73395122804
X-purgate-type: spam
X-purgate-size: 4094



On 8/27/26 6:53 PM, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
>> turn_on_mmu() writes satp to switch on Sv39 paging but never fences
>> afterwards.
>>
>> Xen never allocates a non-zero ASID, so per the Privileged spec, sec.
>> 12.2.1 "Supervisor Memory-Management Fence Instruction":
>>
>>    "If the implementation does not provide ASIDs, or software chooses
>>    to always use ASID 0, then after every satp write, software should
>>    execute SFENCE.VMA with rs1=x0."
>>
>> The spec text around this rule hedges with "may be necessary", but
>> RISC-V spec co-author Andrew Waterman confirmed on the ISA manual
>> issue tracker that the fence after a satp write is not optional in
>> this case: "The SFENCE after the SATP write is definitely necessary
>> ... In general, you need to SFENCE after you've recycled an ASID.
>> Since we don't use ASIDs in the Linux kernel yet, every context
>> switch is effectively an ASID reuse, hence the full TLB flush." [1]
>> The same reasoning applies to Xen: with ASID always 0, this satp
>> write is indistinguishable from an ASID reuse to the hart, so the
>> fence is required for correctness.
> 
> But at the moment of execution of turn_on_mmu() we don't use any ASID, 
> do we? It was used in check_pgtbl_mode_support() but at the end it is done:
> 
>      csr_write(CSR_SATP, 0);
> 
>      sfence_vma();
> 
> So basically Bare mode + flush all TLBs presented before and then up to
> 
> ...
> 
>>
>> Add the missing SFENCE.VMA to order those page-table stores before
>> the hart's first translation under the new mapping.
>>
>> [1] https://github.com/riscv/riscv-isa-manual/issues/226
>>
>> Fixes: f5035d480f7a ("xen: add files needed for minimal riscv build")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>> ---
>>   xen/arch/riscv/riscv64/head.S | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/ 
>> head.S
>> index 9c40512e61..7f6edc972f 100644
>> --- a/xen/arch/riscv/riscv64/head.S
>> +++ b/xen/arch/riscv/riscv64/head.S
>> @@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
>>           srli    t1, t1, PAGE_SHIFT
>>           or      t1, t1, t0
>>           csrw    CSR_SATP, t1
> 
> ... ASID isn't used as we are in Bare mode.
> 
> What am I missing?
> 
>> +        sfence.vma
> 
> The one thing which possibly matters here, and could explain why 
> sfence.vma is needed, is:
> ```
> Implementations with virtual memory are permitted to perform address 
> translations speculatively and earlier than required by an explicit 
> memory access, and are permitted to cache them in address translation 
> cache structures—including possibly caching the identity mappings from 
> effective address to physical address used in Bare translation modes and 
> M-mode.
> ```
> 
> So the TLB could potentially be populated with identity mappings, and I 
> agree that it would be better to flush those.
> 
> I’m not entirely convinced, though, that the reason here is the ASID 
> itself. Rather, it seems that we want to flush because of potentially 
> cached speculative identity mappings.
> 
> If this reasoning looks correct to you, could we update the commit 
> message to reflect this rationale for why sfence.vma is needed here?

My suggestion is:

xen/riscv: add SFENCE.VMA after writing satp in turn_on_mmu()

The existing SFENCE.VMA before the satp write only orders the page
table stores from setup_initial_pagetables() against subsequent
implicit reads. It cannot invalidate translations cached after it
retires, and the Privileged spec permits an implementation to
translate speculatively and to cache the identity mappings used in
Bare mode. Such an entry would shadow the Sv39 translation once
paging is on, which matters because turn_on_mmu() jumps to a linker
address that is not identity mapped.

Does it make sense?

~ Oleksii

