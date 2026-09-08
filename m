Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C61CC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 09:50:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411235.1641938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3sSg-0000xM-Pv; Tue, 08 Sep 2026 09:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411235.1641938; Tue, 08 Sep 2026 09:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3sSg-0000xF-Ml; Tue, 08 Sep 2026 09:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1411235;
 Tue, 08 Sep 2026 09:49:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x3sSf-0000x9-Dm
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 09:49:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3sSe-009c86-1X
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 11:49:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fda2d-2eae-0a2a0a5409dd-0a2a450c9540-32
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:49:51 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9fda3f-f479-0a2a450c0019-d155da36cd79-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 11:49:51 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c1677c91969so435334466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 02:49:51 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2621d3f5b6sm473789266b.45.2026.09.08.02.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 02:49:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788860991; x=1789465791; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AIntCyxA5t+PensHW3kaaYXckrxkH4l4HmN3LUFeYcI=;
        b=jaa80YMAhcapfH7UsBs3OmQhHi4+Ymg5cMi9/J0I9AKnaDkIKAwkQtSdsIMYLxprZl
         vsQr3NAzV+RT7ogLw63Ga42cO7p2ghokhFvOaDe320BRatITtbNswI/iueMEKEYJ3QUu
         JrDCtsKNYrzfWP27gPGW/vFFByRN3xTJ4a0XD25ver28AMsb7fDph6Tt9eoShVYAT9aS
         DrsxmhUcM78ltBaTTRpMJ+mSZjY0qsU6lkOaYxyhh4fDbE6gSlNRmAftqzaWiRI5vaJq
         XuiEi0FnKZsO8ANE0mw97m1mFYj+ffmdIJcTMbTcmH+VcYMDqIfFEl1uZmh5Istuisac
         r/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860991; x=1789465791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIntCyxA5t+PensHW3kaaYXckrxkH4l4HmN3LUFeYcI=;
        b=Dl6mDWNqpoPAXXiZFVgmTVtW8BwixWaMvBJbB9d9Z2Tdp21CETVKDv+tLGO81cHDqX
         Ai9sTWt0MuD05RXYpF+pY/EN2HTslRbmI/t3a+LE7A+1IywjBT20qIjjmqzuC51iriBa
         keIj9vj8F39GzcoMXbOEGL10dlteyu/KVPlpf/QZ5HWvA8n0MnaKJI0shuC9lEB/S7Zm
         g9iFKMNGZsjle3wv2J8xmBfHuN8zX/9fLq3NQyQmWBAeYoy67XxkDZU3WKlgQVk2nUs6
         JAUlt+qRaAwfJW09WOgP6tyirfW92H1HAzm4UDqYQVXmcev4uMXtztJKSrJqJlFzXV6w
         hYbA==
X-Gm-Message-State: AFuF++nUQxZ3LJjbdjAdI4bb5Tb2ZmfRkmd67puQw8F+tm6LK04HG4CT
	rRUBGreSFkR9S2SbIv8yPewEigPLfzNk1/yhoGepNnCjyJPSyoPs89Sp
X-Gm-Gg: AYBFou0Yxo8OWQfuBALtJcmCHMeI6n2DWKBeJEhdqPAbwn+0ulHF6qLX4SyJM/E5Zrm
	w6KjFlakeLKJD3lLZebAaXbXXogDQ80UrB5/r4vhrDnFq9KMsUICQaxVhzjntwPnunHQIioxOvK
	ntdghwTDtsRdj6uESimoGBXrhEOmA/vcSCcgZIvlcQTSiEeDDwVi5QzG42WLJqP3dnC6KjILFuj
	Dhtj4iYsEyjq2sE4DdiLyxoonbstDaZJ6McdKzLRYvdEco/FPWrzt+WIv9DGn93rqogAZgXwoDF
	E+dhCUZ6kcrMVQOUKyzdG8Z3AU3d+uuLGZnRdPyfRa4a7VuP3kCdy8MK3FSAZ07DrgfCfhs7IOS
	2WogWnAgdEVHWghHUb802T58F4BO2vTGHLdD0uSU2y/73eGV4NZ0b+lUcyPqJvYxnDlX5qjLuNJ
	mJhmQUPgdfoOzMA1mdsYIGEXLLSTAM0NoySgRE+sBZq27QtRPo+m5xQ8FRc9/Anir4QdHo8glWA
	9N+W1xzL8qCexlfpN5p7ZQElUkrstH3NaQ=
X-Received: by 2002:a17:907:1c22:b0:c26:1649:47a8 with SMTP id a640c23a62f3a-c26164956d1mr947596266b.30.1788860991058;
        Tue, 08 Sep 2026 02:49:51 -0700 (PDT)
Message-ID: <6d0a9922-a970-469c-b946-2f3c0deeb0e9@gmail.com>
Date: Tue, 8 Sep 2026 11:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/39] xen/riscv: add guest page fault handling stub
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
 <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
 <1788796634.8631fc262581453bbf619ec5b2062170.1a07c9684ae000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788796634.8631fc262581453bbf619ec5b2062170.1a07c9684ae000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788860991-52331A5B-6D45A3EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 4973



On 9/7/26 5:57 PM, Baptiste Le Duc wrote:
>> Add a handler for guest page faults and hook it into the trap path,
>> providing the trap-side entry point which will later feed the MMIO
>> dispatch.
>>
>> This will be used, for example, to trap accesses to APLIC registers so
>> that a guest can initialize and drive an emulated interrupt controller.
>>
>> Two of the situations handled here are already decided, as neither can
>> ever be turned into an emulated access:
>>
>>   - A fault reported with a pseudoinstruction in htinst was taken on an
>>     implicit access made for VS-stage address translation, so htval holds
>>     the address of a VS-stage PTE rather than of anything the guest asked
>>     for, and the guest physical address behind the original access is not
>>     known. This is orthogonal to the cause and can accompany any of the
>>     three, which is why it is checked first. scause keeps reporting the
>>     type of the original access, and on bare hardware a PTE which cannot
>>     be read raises an access fault of exactly that type, so reflect one
>>     back to the guest.
>>
>>   - A fetch fault means the guest tried to execute from a guest physical
>>     address which is unmapped or which G-stage does not allow to be
>>     executed. On bare hardware a fetch from physical memory which does
>>     not exist, or which may not be executed, raises an instruction access
>>     fault, so reflect one back too.
>>
>> Explicit loads and stores are where MMIO emulation will hook in.
>>
>> Neither of the two paths above consults the p2m first, and neither will
>> the MMIO one: RISC-V has no populate-on-demand, no paging and no
>> mem_access, so every guest mapping is established eagerly and a G-stage
>> fault never denotes a mapping Xen could install to let the faulting
>> access complete.
>>
>> Both of the helpers this leans on, resolve_faulting_gpa() and
>> trap_redirect(), are BUG_ON() placeholders for now, so each of the three
>> causes currently takes the host down rather than the domain. That is no
>> worse than before this patch, where the same causes fell through to
>> do_unexpected_trap() and die(). Implementing the helpers is left to
>> later patches.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
> 
> I think the commit message it not very clear as it conflates two
> different countable things (the 3 fault causes reported via scause vs.
> the pseudoinstruction condition, which is orthogonal and can accompany
> any of them), which makes "two situations decided" or "any of the three"
> hard to follow on first read.
> 
> Here is a proposition with a split to distinguish fetch-fault and
> pseudoinstruction cases into explicit bullets with their outcome stated
> ("Decided here"), and added spec-mentioned conditions about the
> pseudoinstruction's existence conditions:
> ```
>      Add a handler for guest page faults and hook it into the trap path,
>      providing the trap-side entry point which will later feed the MMIO
>      dispatch.
> 
>      This will be used, for example, to trap accesses to APLIC registers so
>      that a guest can initialize and drive an emulated interrupt controller.
> 
>      A G-stage (stage-2) fault has one of three causes, reported via scause:
> 
>          - Fetch fault: guest tried to execute from a guest-physical address
>          that is unmapped or that G-stage marks non-executable. Never
>          emulatable (nothing to emulate a fetch into). On real hardware
>          this raises an instruction access fault, so Xen reflects the same
>          fault back to the guest. Decided here.
> 
>          - Load fault / Store fault: left undecided by this patch, this is
>          where MMIO emulation will hook in later.
> 
>      Any of these three faults can instead be reported via a pseudoinstruction
>      in htinst, when both:
> 
>          (a) the fault occurred on an implicit access Xen made to walk a
>              VS-stage page table, and
>          (b) htval holds a nonzero value: the guest-physical address of that
>              VS-stage PTE, not of the guest's original access.
> 
>      However, none of these paths consult the p2m first, and the future MMIO path
>      won't either: RISC-V has no populate-on-demand, no paging, and no
>      mem_access, so every guest mapping is established eagerly. A G-stage
>      fault therefore never indicates a mapping Xen could lazily resolve to
>      let the access complete.
> 
>      Both helpers this handler relies on, resolve_faulting_gpa() and
>      trap_redirect(), are BUG_ON() placeholders for now, so all three causes
>      currently take the host down instead of just the guest. This is no worse
>      than before this patch, where these traps fell through to
>      do_unexpected_trap() and die().
> ```

I will apply your suggestion.

Thanks.

~ Oleksii

