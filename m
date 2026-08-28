Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372F3C61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 08:11:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401738.1637268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzrgN-0004hu-K3; Fri, 28 Aug 2026 08:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401738.1637268; Fri, 28 Aug 2026 08:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzrgN-0004hn-H1; Fri, 28 Aug 2026 08:11:27 +0000
Received: by outflank-mailman (input) for mailman id 1401738;
 Fri, 28 Aug 2026 08:11:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzrgL-0004gc-Tq
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:11:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzrgK-001JEX-KM
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:11:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9142a2-8faa-0a2a0a5109dd-0a2a4507d532-24
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:11:24 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9142ac-b4ea-0a2a45070019-d155802da4a3-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:11:24 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso6127365e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 01:11:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b9266d45esm25000875e9.2.2026.08.28.01.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 01:11:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787904684; x=1788509484; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsu0dQntEYrc++cEclLDRAjDXydDbaGRch5cVS6DJ+I=;
        b=BBDLr0QvCjshlZmEkmKJOAaWpHOQr4A2THSubn5EwORB571exMmPVcrfiXwW/PTENU
         tw6GerID3VsauCkZZtfeSgdv5XiFB6EPmVvtBX0nqk57mQ/yX3W9iUKK8fI2eoE06Gmw
         KKqJAcp8nNFBr2aSpN2voAXvjs8z1vLqRD3tgJrOniG8QjSfgt+HiAe66p95clmAHOTI
         dLhMwtoLIsRN8ufLCwlpZcHVtEXk35N3mY42n45LSnfome5LRPIvwCZ/TaQGYbfCIlGV
         1OpbrMgIYWTnin9Hvr8Mci5LywptgzF507zdmW1Dyh1+at6cOjRHpb1Iz9iP/AFqd9Ey
         Olqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904684; x=1788509484;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsu0dQntEYrc++cEclLDRAjDXydDbaGRch5cVS6DJ+I=;
        b=lxdkpX4W9swb1SqILmr2ueyrxDSen11qB3oLP5t/NlJM3kaTlHg89BPPbe0yyy7Tv6
         64frpuWLnjHaYPhywiBEzgt00o1SY7Je0ATMfsMjTjH63yak4CqagRWIMbfpD3DvUpzX
         Wf4dpXXHGzLZFm5Q4ZcKXb7HQC5zPclPEbF1m9eCM3A2X++w69+/Tvv/0Zf5tgrsZhWW
         VSQH5ptLt0CAyoNSE8EUbJ0+NDDExrRp8sCC88hQjx9dVIVDvJTPuja2b6pFfRSbYorO
         Exy9W4WQpFyaQf1gQpcWCcn9q1EhvL8ocO8ww2T7/6s5NjSTOAlkpvtRCb5E4l9xD1Q3
         G8oQ==
X-Forwarded-Encrypted: i=1; AHgh+RoY5UWg30Icqq30ohgpbNl63S/MyJuLMs+r8EWIk59rKO61O+lkqV1ov79y7VlVECKHnOi8QmcpP1I=@lists.xenproject.org
X-Gm-Message-State: AFuF++mDv+Vowj0Cn24vqN4ZD6ftmbzltLp+z/1KS0tu7XkHjnklJCnC
	1HwvxO+lVbAK9VLzI6MjJL2ebkjngtxCuJT0DhScRlLe3GBFlGb1+jul
X-Gm-Gg: AR+sD12SWNuY3Te4Ki4pBJzWGBd6Vv/TVq1AKhkD048iPlelzwM4Kezk1PKZnVi9udj
	MwY5gQUcdCeqfa/+YijfJ62PhYLE9LhTlmVJQVXVgVvmIqric1JbdN7awMKY0aba501w+01U86E
	JCq5rWJ/2tdyokfP/Q6T0NiNR2ldIz4t6UwbPyWU8xlxiT0M3+xr+gJXfi5eN8XyrLv5d5igwh0
	MpTHDmKB6WEqeFbvdphAwIH0fiBQAN3hFxKYLUgEsDW0CidhTzhxnck80wYVbRbGCWvGf3ra1NJ
	Ev8bTfDgaMBmuk3/PdqI8D+RVa2lF+LUrRO/vN7i4+ppXToocLA+2hldNwRkKrDYDht35palS1p
	7bKiCqjsXJRAVjD+XdCbCT4yDiNXGYBB5iwtWbNDdyn+ykALl95e/RyXK8oQaL/PMyhCpzeIwUL
	S+34COkmA1XaUWyWsyKRDLYtZGkQkiKOh9wc5xT+5WOliKPs9yf0dmQDA95YRRgCORSK0v1Fi/Y
	RhEIbx+bo+8vJrpveIF0dLdnkitm0GketgYkisq9w==
X-Received: by 2002:a05:600c:1f8b:b0:49c:a2f3:fe9a with SMTP id 5b1f17b1804b1-49ca2f3ff43mr543115e9.7.1787904683881;
        Fri, 28 Aug 2026 01:11:23 -0700 (PDT)
Message-ID: <f22db381-40c1-4928-85a4-5019da6a9c07@gmail.com>
Date: Fri, 28 Aug 2026 10:11:22 +0200
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
X-purgate-ID: tlsNG-ef75cf/1787904684-36AD8AE4-20620A47/10/73395122804
X-purgate-type: spam
X-purgate-size: 4317



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

After the conversation with Jan B. in the separate thread I re-read 
documentaion and found that ASID=0 will be used here too as after 
check_pgtbl_mode_support() we set Bare mode and ASID 0 will be really 
used even in Bare mode as to select MODE=Bare as software must write 
zero to the remaining fields of satp (bits 30–0 when SXLEN=32, or bits 
59–0 when SXLEN=64) what automatically includes field ASID (so it will 
be zero).

But still the full reason why we need sfence.vma here is that TLB could 
be polluted with identity mapping (even in Bare mode) and which will be 
tagged by ASID=0.

So what about to update commit message with:
```
xen/riscv: flush speculatively cached Bare-mode TLB entries in turn_on_mmu()

The existing SFENCE.VMA before the satp write only orders the page table
stores from setup_initial_pagetables() against subsequent implicit reads.
It does not prevent the CPU from speculatively caching translations 
after the fence retires.

According to the RISC-V Privileged specification, implementations are
permitted to speculatively cache Bare-mode identity mappings. Furthermore,
selecting MODE=Bare (which happens during check_pgtbl_mode_support())
requires zeroing the remaining fields of satp, causing ASID=0 to be
actively used in Bare mode. Consequently, the TLB can be polluted with Bare
identity mappings tagged with ASID=0.

Once satp is written to enable Sv39 translation, these cached identity
mappings (tagged with ASID=0) can shadow the true Sv39 translations.
This would lead to translation failures since turn_on_mmu() jumps to
a non-identity-mapped linker address.

Fix this by adding a post-satp-write SFENCE.VMA to invalidate any stale
translations (including Bare-mode identity mappings under ASID=0) before
jumping to the virtual address space.
```

~ Oleksii

