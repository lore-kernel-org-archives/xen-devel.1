Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAAFC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 23:08:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429531.1652350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x99aT-000762-Gn; Tue, 22 Sep 2026 23:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429531.1652350; Tue, 22 Sep 2026 23:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x99aT-00075v-ED; Tue, 22 Sep 2026 23:07:45 +0000
Received: by outflank-mailman (input) for mailman id 1429531;
 Tue, 22 Sep 2026 23:07:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1x99aS-00075p-By
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 23:07:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x99aR-00Bg09-Ck
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 01:07:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ab30a19-2eae-0a2a0a5409dd-0a2a450c8e3c-18
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 01:07:43 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6ab30a3e-f479-0a2a450c0019-ac6904feb166-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 01:07:43 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 91941601F0;
 Tue, 22 Sep 2026 23:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871731F000FF;
 Tue, 22 Sep 2026 23:07:40 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790118461;
	bh=Kd2W6KkdCDYQn3TqVPRzfg+RT3RLgENl/pIefvqy8R0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GsEPAV4lwjJ1HF/xHZs4rbbgDMsASQ6jlU/Llzp8u3AX9iG8j6xaztp0DSdn6azTD
	 dUXZ2DOyQJs2NPYne5tQzsK8VqeZNpxZUAPtAKp7VoAW2O2pjQ5eDmcjqTY9Pc32PT
	 oI9KZTVLNQ3+DCtgHt0n756LFIut7pZfaUxPHZAaOgi4754aB1PuNeOTpMHvP6y+4k
	 n3fslCm2rnZBqIZBaN05L6rx1p8YP+ObUi42TrOLAVr/W2Ijriz1zyAn/343bA8ow7
	 iinHf+oNjb6ooaRu5ESJi5vXjNUMDKdkjBnYjFz6ShuEmYghwtKQ1AEgeTxgfDyioI
	 dK7v7QTEsFBRQ==
Date: Tue, 22 Sep 2026 16:07:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: remove unused hvm_vcpu.h header
In-Reply-To: <20260919074650.453007-1-enelsonmoore@gmail.com>
Message-ID: <7c7518ed-6eeb-618d-5fba-2461e51c3b82@kernel.org>
References: <20260919074650.453007-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1790118463-51F33A5B-1CB805D8/0/0
X-purgate-type: clean
X-purgate-size: 4125

On Sat, 19 Sep 2026, Ethan Nelson-Moore wrote:
> The <xen/interface/hvm/hvm_vcpu.h> header appears to have been unused
> ever since it was added to the kernel in commit cee2cfb7d18d ("xen/pvh:
> Import PVH-related Xen public interfaces"). Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  include/xen/interface/hvm/hvm_vcpu.h | 116 ---------------------------
>  1 file changed, 116 deletions(-)
>  delete mode 100644 include/xen/interface/hvm/hvm_vcpu.h
> 
> diff --git a/include/xen/interface/hvm/hvm_vcpu.h b/include/xen/interface/hvm/hvm_vcpu.h
> deleted file mode 100644
> index cbf93493275c..000000000000
> --- a/include/xen/interface/hvm/hvm_vcpu.h
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright (c) 2015, Roger Pau Monne <roger.pau@citrix.com>
> - */
> -
> -#ifndef __XEN_PUBLIC_HVM_HVM_VCPU_H__
> -#define __XEN_PUBLIC_HVM_HVM_VCPU_H__
> -
> -#include "../xen.h"
> -
> -struct vcpu_hvm_x86_32 {
> -    uint32_t eax;
> -    uint32_t ecx;
> -    uint32_t edx;
> -    uint32_t ebx;
> -    uint32_t esp;
> -    uint32_t ebp;
> -    uint32_t esi;
> -    uint32_t edi;
> -    uint32_t eip;
> -    uint32_t eflags;
> -
> -    uint32_t cr0;
> -    uint32_t cr3;
> -    uint32_t cr4;
> -
> -    uint32_t pad1;
> -
> -    /*
> -     * EFER should only be used to set the NXE bit (if required)
> -     * when starting a vCPU in 32bit mode with paging enabled or
> -     * to set the LME/LMA bits in order to start the vCPU in
> -     * compatibility mode.
> -     */
> -    uint64_t efer;
> -
> -    uint32_t cs_base;
> -    uint32_t ds_base;
> -    uint32_t ss_base;
> -    uint32_t es_base;
> -    uint32_t tr_base;
> -    uint32_t cs_limit;
> -    uint32_t ds_limit;
> -    uint32_t ss_limit;
> -    uint32_t es_limit;
> -    uint32_t tr_limit;
> -    uint16_t cs_ar;
> -    uint16_t ds_ar;
> -    uint16_t ss_ar;
> -    uint16_t es_ar;
> -    uint16_t tr_ar;
> -
> -    uint16_t pad2[3];
> -};
> -
> -/*
> - * The layout of the _ar fields of the segment registers is the
> - * following:
> - *
> - * Bits   [0,3]: type (bits 40-43).
> - * Bit        4: s    (descriptor type, bit 44).
> - * Bit    [5,6]: dpl  (descriptor privilege level, bits 45-46).
> - * Bit        7: p    (segment-present, bit 47).
> - * Bit        8: avl  (available for system software, bit 52).
> - * Bit        9: l    (64-bit code segment, bit 53).
> - * Bit       10: db   (meaning depends on the segment, bit 54).
> - * Bit       11: g    (granularity, bit 55)
> - * Bits [12,15]: unused, must be blank.
> - *
> - * A more complete description of the meaning of this fields can be
> - * obtained from the Intel SDM, Volume 3, section 3.4.5.
> - */
> -
> -struct vcpu_hvm_x86_64 {
> -    uint64_t rax;
> -    uint64_t rcx;
> -    uint64_t rdx;
> -    uint64_t rbx;
> -    uint64_t rsp;
> -    uint64_t rbp;
> -    uint64_t rsi;
> -    uint64_t rdi;
> -    uint64_t rip;
> -    uint64_t rflags;
> -
> -    uint64_t cr0;
> -    uint64_t cr3;
> -    uint64_t cr4;
> -    uint64_t efer;
> -
> -    /*
> -     * Using VCPU_HVM_MODE_64B implies that the vCPU is launched
> -     * directly in long mode, so the cached parts of the segment
> -     * registers get set to match that environment.
> -     *
> -     * If the user wants to launch the vCPU in compatibility mode
> -     * the 32-bit structure should be used instead.
> -     */
> -};
> -
> -struct vcpu_hvm_context {
> -#define VCPU_HVM_MODE_32B 0  /* 32bit fields of the structure will be used. */
> -#define VCPU_HVM_MODE_64B 1  /* 64bit fields of the structure will be used. */
> -    uint32_t mode;
> -
> -    uint32_t pad;
> -
> -    /* CPU registers. */
> -    union {
> -        struct vcpu_hvm_x86_32 x86_32;
> -        struct vcpu_hvm_x86_64 x86_64;
> -    } cpu_regs;
> -};
> -typedef struct vcpu_hvm_context vcpu_hvm_context_t;
> -
> -#endif /* __XEN_PUBLIC_HVM_HVM_VCPU_H__ */
> -- 
> 2.43.0
> 

