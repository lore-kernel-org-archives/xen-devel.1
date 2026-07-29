Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DCFC54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 13:41:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375939.1622930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4XL-0007A5-FM; Wed, 29 Jul 2026 13:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375939.1622930; Wed, 29 Jul 2026 13:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp4XL-00079y-Cb; Wed, 29 Jul 2026 13:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1375939;
 Wed, 29 Jul 2026 13:41:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp4XK-00079J-7X
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:41:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp4XJ-002ryt-KU
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 15:41:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a02f2-e002-0a2a0a5209dd-0a2a450bd3ac-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:41:29 +0200
Received: from [209.85.167.49] (helo=mail-lf1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a0309-b7e8-0a2a450b0019-d155a731b952-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 15:41:29 +0200
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5b015b2d792so922972e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 06:41:29 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b2d78ea9efsm399663e87.44.2026.07.29.06.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 06:41:28 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785332489; x=1785937289; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kh0eSunNeEG770Hq1VLFazSA/3JCq5NHBTAoVpXKORQ=;
        b=EyiGHj4cgcWvIhxZY1Um9SEek7xcbscGuugSc8s+E76qXf07eDZCWH3AGUgvfbXKNV
         sl7q9nFavxQjuFXtgp9DJyaRarEUqpAA7NAMev0vEP5FCx3tMubWR9nSRSd1JBkgnbLw
         aLcP5D5g9iiD7e/Exlwh9ycqa7jq4ZbTRgL3PvoJzDH4qfQYeD/OxYC+L+TWfoZvcB9Y
         sxh/mkaIFptIAv/9FYGsbLpH24Cc3/ixyHARRh32ESBM5Q5VPT3y0f5OnwiBLQOlhi/z
         9NuDk2QyhqYMM1ZFeP8jtjZ0ky539Xwn5o1K8MxLQ8/DWdBF5uxMYGOVS2HZbOWyutHC
         tHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332489; x=1785937289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kh0eSunNeEG770Hq1VLFazSA/3JCq5NHBTAoVpXKORQ=;
        b=EmOPb2qvV8anY/PJQSpeKVmMOL+r2NmlQk+EQgAuDf4CmBEP5+EblY/orF+5PO2+L1
         h6RxqbicH5/r9Nvpp8wrNxhTiHqI9hZ+JN/2ChLw+Zgyllas3D4ghZLOHkLOb4tCM5J/
         tBkECashD3Kikj/VHXYE6CKK61ChwrBIHXm/vAWBdBwjOWB+9vJohZsvNKUdCVX1uMBe
         1TGu1NOTiXwgutAAF8lm0rUS7B8jiROmv12V26CVOZm5GLy5UFvz7nvgqnHAdLrYnz7i
         EjdJXVtNLOus+HOjW5c4k6bycpdpMfvstUQtNq3UfxOKjj9FytcT1njO3Xf/w3vLKWZ6
         RcVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxEQbKpZm7JDKebmzVAxGLdAb+AzV1ZeVB5oKqObsMWzWtIU6aF9P476V1uO2U20x3+3DJElpuhG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyt2Ic4pM2lLFgUUDvAl3m0Lt9Hv4AqDBG66dUjfKG4WcC1v7Ko
	pV504GG/5hbnXmTTOigRocbJZ8FgARI6vVwWQ1/PSHsWESoFLOZe5uNViK8GLQ==
X-Gm-Gg: AR+sD12KoqvuuTImZXVDa3/bSwymAzV2eiaFr8ZxexczUlzmt+tHrwD2DF1x80b0QPv
	v0WimR8Ne4oONFvEj9h8y3VEPuw06IVMhCRMC6qkAQWLNwo7SiE9xJs5n+DcTBQv0jqdy/xA/5D
	1c6OPxdx4q1XL3Ncph5Ds9w/6tpAljVuIy+KQVMASw9eaELcTyUoSUJY5ZyPKO3ll5oa+j9wpIh
	FyqcffC5AiqKReZ1lZ0jduwY5mBJ792mYVHFYUleuQxQju+Sfg3ymT2Tjhh2XB9h4e20eK64xc8
	FvT9fS/DSEbVQR/oKHrS1ZJjMoukSYwNVanUGv84rjvGxxf4Xq8jkAgUUg9FJKgBdeFgSk+zc7u
	cO/7F8Kp88cYYwZzn1m6iXm8yqvxfJhF2nNmP62oOYs0277xmWmgtF+Og8wvaZAypU4AeguCLtf
	OO+YEXaUQ2hyYh1v3ryCsrFzj87MNGXswMmVZsdgpbxe76l7VW8jUHGM6tVAMNluDkxJi27MTiz
	bOFTnXdNPPAd4aA2QgnjH7Xy7Bg7w6oDN8DPVgCUP4=
X-Received: by 2002:a05:6512:1387:b0:5b1:5ad4:8374 with SMTP id 2adb3069b0e04-5b2d02519c1mr1504693e87.42.1785332488438;
        Wed, 29 Jul 2026 06:41:28 -0700 (PDT)
Message-ID: <c4f9cef5-572e-4265-a51f-170ef0fc7f60@gmail.com>
Date: Wed, 29 Jul 2026 15:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/17] [RISC-V] virtual interrupt controller
 (vAPLIC/vIMSIC) support
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
 <29fcc402-f953-4b51-b077-729bb0e5b4e0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <29fcc402-f953-4b51-b077-729bb0e5b4e0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785332489-1BCD79EA-5018854F/10/73395122804
X-purgate-type: spam
X-purgate-size: 5384



On 7/27/26 5:21 PM, Jan Beulich wrote:
> On 20.07.2026 18:01, Oleksii Kurochko wrote:
>> Hi all,
>>
>> This series adds the initial virtual interrupt controller (vINTC) support
>> for RISC-V guests in Xen, based on the Advanced Interrupt Architecture
>> (AIA): a virtual APLIC (vAPLIC) in MSI mode backed by a virtual IMSIC
>> (vIMSIC) using hardware guest interrupt files.
>>
>> Rather than emulating APLIC in direct-delivery mode (which requires
>> trap-and-emulate for every interrupt and is costly), the series targets
>> IMSIC from the start. AIA lets a hart implement several "guest interrupt
>> files" (up to GEILEN), so external interrupts can be delivered to a vCPU
>> directly by hardware via the VGEIN field of hstatus, without a hypervisor
>> round-trip. Xen only has to emulate the APLIC MMIO programming interface
>> and route the guest's intent onto the physical MSI topology; interrupt
>> delivery itself stays in hardware.
>>
>> The work breaks down into a few logical blocks:
>>
>> Physical APLIC/AIA groundwork (patches 1-3)
>>    - Correctly track IRQ_DISABLED across runtime enable/disable and order
>>      the ->status update against the IMSIC CSR write.
>>    - Per-pCPU VGEIN (guest interrupt file) allocator: assign/release a
>>      hardware guest file to a vCPU and program hstatus.VGEIN.
>>    - Add the missing APLIC register offsets/masks needed by both the
>>      physical and virtual APLIC code (no functional change).
>>
>> Device-agnostic MMIO dispatch + vAPLIC emulation (patches 4-5)
>>    - A per-domain MMIO handler table modelled on Arm's framework, so
>>      emulated devices self-register their GPA ranges and the fault path
>>      stays agnostic via a single try_handle_mmio() entry point.
>>    - vAPLIC MMIO read/write emulation. Writes are gated by the domain's
>>      authorised-IRQ bitmap so a guest cannot touch interrupts it does not
>>      own, and TARGET writes are translated from virtual to physical
>>      hart/guest-file indices. Delegation (SOURCECFG.D) is not yet
>>      supported.
>>
>> vIMSIC guest interrupt files and state (patches 6-9)
>>    - Stage-2 map a vCPU's physical guest interrupt file to the fixed
>>      per-vCPU GPA page the guest expects at offset 0.
>>    - vcpu_aia_init(): assign a VGEIN, map its guest file and record the
>>      IMSIC state as a consistent unit.
>>    - IMSIC state save/restore (currently tracking which pCPU owns the
>>      guest file, needed because the pCPU id is part of the MSI address).
>>    - has_msi_support() helper to decide whether IMSIC state has to be
>>      saved/restored.
>>
>> vINTC state save/restore plumbing (patches 10-11)
>>    - vintc_state_{save,restore}() wrappers over new store/restore hooks in
>>      struct vintc_ops, and the vAPLIC implementation of those hooks. No
>>      callers are wired up yet; the context-switch calls arrive with vCPU
>>      context switch support.
>>
>> Trap and instruction emulation infrastructure (patches 12-17)
>>    - Extend the exception-table format with type/data fields and add
>>      EX_TYPE_TRAP_INFO so fixups can capture sepc/scause/stval.
>>    - riscv_vcpu_unpriv_read() (HLV/HLVX) to read guest memory/instructions
>>      safely, and riscv_vcpu_trap_redirect() to forward a synchronous trap
>>      back into the guest's VS-mode handler.
>>    - A guest page-fault handler that decodes the trapped load/store
>>      instruction (HTINST, or an unprivileged fetch as a fallback) and
>>      dispatches the MMIO access through try_handle_mmio().
>>
>> Note on versioning: the series is posted as v1 as a freshly split-out
>> series, but several patches carry v2/v3 changelogs because they were
>> previously circulated as part of a larger another patches [1] from which the
>> current depends.
>>
>> CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2690874319
>>
>> [1] https://lore.kernel.org/xen-devel/cover.1784559209.git.oleksii.kurochko@gmail.com/T/#t
>>
>> Oleksii Kurochko (17):
>>    xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable
>>      callbacks
>>    xen/riscv: add basic VGEIN management for AIA guests
>>    xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h
>>    xen/riscv: introduce device-agnostic MMIO emulation dispatch
>>    xen/riscv: implement virtual APLIC MMIO emulation
>>    xen/riscv: map IMSIC interrupt file for vCPUs
>>    xen/riscv: introduce vCPU AIA initialization
>>    xen/riscv: add IMSIC state save/restore
>>    xen/riscv: add helper to check APLIC MSI mode
>>    xen/riscv: introduce vintc_state_{save,restore}()
>>    xen/riscv: add vAPLIC state save/restore hooks
>>    xen/riscv: extend exception tables with type and data fields
>>    xen/riscv: add unprivileged guest memory read helper
>>    xen/riscv: add guest page fault handling stub
>>    xen/riscv: implement trap redirection to a guest
>>    xen/riscv: add guest load emulation for trapped MMIO accesses
>>    xen/riscv: add guest store emulation for trapped MMIO accesses
> 
> Where did the last two patches go? My inbox agrees with [1] that only 15 of the
> 17 patches arrived.
> 
They lost for some reason, I sent them separately again. Now it should 
be okay.
> [1] https://lists.xen.org/archives/html/xen-devel/2026-07/threads.html


