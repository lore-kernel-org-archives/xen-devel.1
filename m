Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B605CCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 15:17:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445187.1661587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFYoq-0004Mv-Nq; Sat, 10 Oct 2026 15:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445187.1661587; Sat, 10 Oct 2026 15:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFYoq-0004Mo-KZ; Sat, 10 Oct 2026 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1445187;
 Sat, 10 Oct 2026 15:17:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFYop-0004La-Cg
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 15:17:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFYoo-00AbL3-3S
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 17:17:02 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca56c9-e002-0a2a0a5209dd-0a2a450b9748-34
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 17:17:02 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca56ed-b7e8-0a2a450b0019-d155802ab500-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 17:17:02 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so5867855e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 08:17:01 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18dcd7dd3sm86534725e9.2.2026.10.10.08.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 08:17:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791645421; x=1792250221; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjlFr7guwoLOFhLjs/XB8izsuXbGxHF7rFdwL0lpGts=;
        b=ixhjA0ZaD2vWV3PGPzuCjFFXezb3D7XMwT6lF0ZN7IkMDXOkjgJcU90Zx+tD7ubOC4
         CDHaAwGF/SiTxGwov0G6Gkz0aOAjxlAAYuy2PoGiBdDr4MkjxKY7uMdw3resxJKrCKgJ
         0sKDdrv7mQurulhwoiOve2IkyDWuPWF1Ow2bVFkYwb6ICul3eAEZyVIpUtij49aQv/Q4
         LF5znae3/qLa8PB8YOodE+b1S3gMmFxOBUIMzggJqeRl6kpveH+u5xFex3lMzYK8Q4jl
         CLUxhrZzIL6zaahOEVDKKnaFdSQdU+VcKBHNERGzRc0wSToekzZhKMuatJpEoa4UPnNm
         qDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791645421; x=1792250221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjlFr7guwoLOFhLjs/XB8izsuXbGxHF7rFdwL0lpGts=;
        b=rRNcaHsU4q7SLrowJ+RFAwPw8aR7UAMxIsCgGxQqn6CaDY1jtBQv0zsRcHPEZB087a
         Q6yn8O0hGLHWOcuLKF6HjyBqRkGXCtAD94/iToVMbBh9qj7MNXpesWsX9duyt0ylvX5W
         YcKrXoE3rgoSqEl/EYSRx6ePnnCDjB9we/BTsx+7+nsMQld+RrIQSIWsQrinfon69zrJ
         nYpK5X1kKOjEumRw9EECcUrvr593t4zAwKvZVRC1euq5yM8pLaSHb6WHGwAeeOVoNF8r
         MqCKz2XmTC/tUVszUzAZm5wkpUbXTcDmr1usySVhguBJLK7YGIgvMvPNoP+zSeKRaPbq
         sRqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOXcG9qTow9udBRQTr+wFDQILXXnK23kUdVgv6VGBpekIET34hi50EgNAGBv9Z8ucq39NwNvyKrzc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIycHDDw3ObxWNg/wJRXBKZ+l86YGgIytv+jNvWgOGIFzpV02x8
	uUjpboFOyXv03or3bbea6EhekIfaIf5QsD3xBPVM99L67lY6/hFoL3YB
X-Gm-Gg: AYBFou1us0MUZoU7bRRNJpKtKuRJb77U/JCW2OIXXUn2Uliw/Zpg9WANGfiOfODJ9Rf
	VSuyS/CNpCr0w0YWTJ/OzoopSV8pllNgeF/GhbsZPMjMo0YhjZgxk+Bx+hMI1dFsxvmyed2wlp3
	i7mwp15f4j/L7UcH7OJC6Q5w8KM20K75NuGBj2kuntP2u/UqVZdkN1IXWnkz8vjV2rjYQwnoOSZ
	b3Lnj4pAxgrZ6INq0J28XUkMBNWjy2hFGb4j/7u10SO6u8X+YU6AJo7Qy1VpRIZZEWK0GHo4bI0
	4iiDQbHJWl8jDXq712dTf/kJnYDqijCKj9CUsDD8ePYTVfbCYJvFDY/F66/edGpUMT5Z/ooAePI
	peoru4OJIQtuYvjocAHFGrJd/ZqFd7CB75L/W3TxI14Rpqnvb1+Hk+kxANTvfAGyJIsygNqnNNE
	f8wK0v4RCt8f1hSFcRe7kcUXPAG5QccXK5Vi+xZvSFIcOWyhwwgtt/OCAI0QinY3puSgd7fxHLP
	VM=
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr94381545e9.4.1791645421283;
        Sat, 10 Oct 2026 08:17:01 -0700 (PDT)
Message-ID: <1396633e-8e1b-4ceb-82e4-f5b0b40eae0c@gmail.com>
Date: Sat, 10 Oct 2026 18:16:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/22] doc/arm: vIOMMU design document
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <da2b9469ffb63d8bb63c2b9bf14ebecfd56dea22.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <da2b9469ffb63d8bb63c2b9bf14ebecfd56dea22.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791645422-A8AC89EA-B0ABF6E3/0/0
X-purgate-type: clean
X-purgate-size: 21286



On 10/7/26 03:08, Milan Djokic wrote:

Hello Milan


> This document outlines the design of the emulated IOMMU,
> including supported features, security considerations
> and future improvements.
> 
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   docs/designs/arm-viommu.rst | 502 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 502 insertions(+)
>   create mode 100644 docs/designs/arm-viommu.rst
> 
> diff --git a/docs/designs/arm-viommu.rst b/docs/designs/arm-viommu.rst
> new file mode 100644
> index 0000000000..c68e771711
> --- /dev/null
> +++ b/docs/designs/arm-viommu.rst
> @@ -0,0 +1,502 @@
> +==========================================================
> +Design Proposal: Add SMMUv3 Stage-1 Support for XEN Guests
> +==========================================================
> +
> +:Author:     Milan Djokic <milan_djokic@epam.com>
> +:Date:       2026-02-13
> +:Status:     Draft
> +
> +Introduction
> +============
> +
> +The SMMUv3 supports two stages of translation. Each stage of translation
> +can be
> +independently enabled. An incoming address is logically translated from
> +VA to
> +IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to
> +the output PA. Stage 1 translation support is required to provide
> +isolation between different
> +devices within OS. XEN already supports Stage 2 translation but there is no
> +support for Stage 1 translation.
> +This design proposal outlines the introduction of Stage-1 SMMUv3 support
> +in Xen for ARM guests.

Look like this doc does not mention the stage-1-only fallback.


> +
> +Motivation
> +==========
> +
> +ARM systems utilizing SMMUv3 require stage-1 address translation to
> +ensure secure DMA and
> +guest managed I/O memory mappings.
> +With stage-1 enabled, guest manages IOVA to IPA mappings through its own
> +IOMMU driver.
> +
> +This feature enables:
> +
> +- Stage-1 translation for the guest domain
> +- Device passthrough with per-device I/O address space
> +
> +Design Overview
> +===============
> +
> +These changes provide emulated SMMUv3 support:
> +
> +- **SMMUv3 Stage-1 Translation**: stage-1 and nested translation support
> +  in SMMUv3 driver.
> +- **vIOMMU Abstraction**: Virtual IOMMU framework for guest stage-1
> +  handling.
> +- **Register/Command Emulation**: SMMUv3 register emulation and command
> +  queue handling.
> +- **Device Tree Extensions**: Adds `iommus` and virtual SMMUv3 nodes to
> +  device trees for dom0 and dom0less scenarios.
> +- **Build Configuration**: Introduces a Kconfig arguments
> +  (CONFIG_ARM_VIRTUAL_IOMMU, CONFIG_VIRTUAL_ARM_SMMU_V3) for build-time
> +  enablement.
> +
> +Depending on the domain type, the emulated IOMMU model is the following:
> +
> +- For the hardware domain, the host layout is re-used. The number of exposed
> +  IOMMUs to hardware domain is equal to number of physical IOMMUs
> +  present (1-1 mapping).
> +- For non-hardware domain, a single vIOMMU device is exposed to the guest and
> +  mapped to one or more physical IOMMUs through a Xen-managed translation layer
> +
> +The vIOMMU feature provides a generic framework together with a backend
> +implementation specific to the target IOMMU type. The backend is responsible
> +for implementing the hardware-specific data structures and command handling
> +logic (currently only SMMUv3 is supported).
> +
> +This modular design allows the stage-1 support to be reused
> +for other IOMMU architectures in the future.
> +
> +vIOMMU architecture
> +===================
> +
> +Responsibilities:
> +
> +Guest:
> + - Configures stage-1 via vIOMMU commands.
> + - Handles stage-1 faults received from Xen.
> +
> +Xen:
> + - Emulates the IOMMU interface (registers, commands, events).
> + - Provides vSID->pSID mappings.
> + - Programs stage-1/stage-2 configuration in the physical IOMMU.
> + - Propagate stage-1 faults to guest.
> +
> +The stage-1 context is shared between streams assigned to the same device.
> +This follows the Linux SMMUv3 driver model, where the IOMMU domain is associated
> +with the master/device, while the individual SIDs are represented by separate
> +STEs pointing to the same translation context. This is considered sufficient for
> +the current SMMUv3 driver model, although the SMMUv3 architecture does not
> +forbid having separate translation contexts for different SIDs.
> +
> +vIOMMU commands and faults are transmitted between guest and Xen via
> +command and event queues (one command/event queue created per guest).
> +
> +vIOMMU command Flow:
> +
> +::
> +
> +    Guest:
> +        smmu_cmd(vSID, IOVA -> IPA)
> +
> +    Xen:
> +        trap MMIO read/write
> +        translate vSID->pSID
> +        store stage-1 state
> +        program pIOMMU for (pSID, IPA -> PA)
> +
> +All hardware programming of the physical IOMMU is performed exclusively by Xen.
> +
> +vIOMMU Stage-1 fault handling flow:
> +
> +::
> +
> +    Xen:
> +        receives stage-1 fault
> +        triggers vIOMMU callback
> +        injects virtual fault
> +
> +    Guest:
> +        receives and handles fault
> +
> +Register access
> +---------------
> +
> +Guest accesses to SMMUV3 registers are trapped via MMIO regions. vIOMMU emulates
> +a subset of SMMUv3 registers relevant to currently supported features.
> +Unsupported registers are handled as RAZ (Read-As-Zero) and WI (Write-Ignored)
> +for the register read and write operations, respectively.
> +
> +vSMMUv3 is a partially emulated resource for the guest domain. Some
> +feature register bits (SMMU_IDR) are reflecting what the underlying HW actually
> +support while the rest is preset in the emulation layer to limit guest from
> +using features which are not supported by the emulation. Also, implementer
> +identification register is fully emulated, providing generic ARM implementer
> +ID values, to avoid activating errata/quirk paths in the guest SMMUv3 driver.
> +
> +Supported SMMUv3 Commands
> +-------------------------
> +
> +The vIOMMU implementation currently supports a subset of the SMMUv3
> +architectural command set required for stage-1 translation management.
> +
> +Commands are submitted by the guest through the virtual Command Queue
> +(CMDQ) and consumed by Xen, which translates them into operations on the
> +physical SMMUv3 hardware.
> +
> +Some commands are fully handled by the emulation layer, while others are
> +currently treated as architectural no-ops because the required behavior
> +is either implicitly guaranteed by Xen or not yet modeled explicitly.
> +
> +Emulation handled commands:
> +
> +- CMD_CFGI_STE
> +- CMD_TLBI_NH_ASID
> +- CMD_TLBI_NSNH_ALL
> +- CMD_TLBI_NH_VA
> +
> +No-op/Implicitly handled commands:
> +
> +- CMD_SYNC
> +- CMD_PREFETCH_CFG
> +- CMD_CFGI_CD
> +- CMD_CFGI_CD_ALL
> +- CMD_CFGI_ALL
> +
> +Command Handling Model
> +----------------------
> +
> +The guest submits commands through the virtual CMDQ interface.
> +
> +Xen:
> +
> +- Validates commands
> +- Translates virtual identifiers (vSID->pSID) where required
> +- Programs the physical SMMU
> +- Performs synchronization
> +
> +The physical SMMU executes the resulting invalidation or configuration
> +operations.
> +
> +Unsupported Commands
> +--------------------
> +
> +Commands associated with currently unsupported architectural features
> +are not implemented.
> +
> +This includes commands related to:
> +
> +- PRI
> +- ATS
> +- Address/Range TLB invalidation (currently, all TLBI commands perform complete
> +  domain TLB invalidation)
> +- Advanced stall/retry semantics
> +- CD runtime update/sync
> +
> +vSID Mapping Layer
> +------------------
> +
> +Each non-hardware domain-visible Stream ID (vSID) is mapped by Xen to a physical
> +Stream ID (pSID). The mapping is maintained per-domain. The allocation policy
> +guarantees vSID uniqueness within a domain while allowing reuse of pSIDs for
> +different pIOMMUs.
> +
> +* Platform devices receive individually allocated vSIDs.
> +* PCI devices receive a contiguous vSID range derived from RID space.
> +
> +
> +Supported Device Model
> +======================
> +
> +Currently, the vIOMMU framework supports only devices described via the
> +Device Tree (DT) model. This includes platform devices and basic PCI
> +devices support instantiated through the vPCI DT node. ACPI-described
> +devices are not supported.
> +
> +Guest assigned platform devices are mapped via `iommus` property:
> +
> +::
> +
> +    <&pIOMMU pSID> -> <&vIOMMU vSID>
> +
> +PCI devices use RID-based mapping via the root complex `iommu-map`:

I failed to find iommu-map generation in libxl or dom0less.


> +
> +::
> +
> +    <RID-base &viommu vSID-base length>
> +
> +PCI Topology Assumptions and Constraints:
> +
> +- RID space must be contiguous
> +- Pre-defined continuous pSID space (0-0x1000)
> +- No runtime PCI reconfiguration
> +- Single root complex assumed
> +- Mapping is fixed at guest DT construction
> +
> +Constraints for PCI devices will be addressed as part of the future work on
> +this feature.
> +
> +Security Considerations
> +=======================
> +
> +Stage-1 translation provides isolation between guest devices by
> +enforcing a per-device I/O address space, preventing unauthorized DMA.
> +With the introduction of emulated IOMMU, additional protection
> +mechanisms are required to minimize security risks.
> +
> +1. Observation:
> +---------------
> +Support for Stage-1 translation in SMMUv3 introduces new data structures
> +(`s1_cfg` alongside `s2_cfg`)
> +and logic to write both Stage-1 and Stage-2 entries in the Stream Table
> +Entry (STE), including an `abort`
> +field to handle partial configuration states.
> +
> +**Risk:**
> +Without proper handling, a partially applied configuration
> +might leave guest DMA mappings in an inconsistent state, potentially
> +enabling unauthorized access or causing cross-domain interference.
> +
> +**Mitigation:** *(Handled by design)*
> +This feature introduces logic that writes both `s1_cfg` and `s2_cfg` to
> +STE and manages the `abort` field - only considering
> +configuration if fully attached. This ensures  incomplete or invalid
> +device configurations are safely ignored by the hypervisor.


Please see a potential bypass issue in commit #11/22

> +
> +2. Observation:
> +---------------
> +Guests can now invalidate Stage-1 caches; invalidation needs forwarding
> +to SMMUv3 hardware to maintain coherence.
> +
> +**Risk:**
> +Failing to propagate cache invalidation could allow stale mappings,
> +enabling access to old mappings and possibly
> +data leakage or misrouting between devices assigned to the same guest.
> +
> +**Mitigation:**
> +The guest must issue appropriate invalidation commands whenever
> +its stage-1 I/O mappings are modified to ensure that translation caches
> +remain coherent.
> +
> +3. Observation:
> +---------------
> +Introducing optional per-guest enabled features (`viommu` argument in xl
> +guest config) means some guests
> +may opt-out.
> +
> +**Risk:**
> +Guests without vIOMMU enabled (stage-2 only) could potentially dominate
> +access to the physical command and event queues, since they bypass the
> +emulation layer and processing is faster comparing to vIOMMU-enabled guests.
> +
> +**Mitigation:**
> +Audit the impact of emulation overhead effect on IOMMU processing fairness
> +in a multi-guest environment.
> +Consider enabling/disabling stage-1 on a system level, instead of per-domain.
> +
> +4. Observation:
> +---------------
> +Guests have the ability to issue Stage-1 IOMMU commands like cache
> +invalidation, stream table entries
> +configuration, etc. An adversarial guest may issue a high volume of
> +commands in rapid succession.
> +
> +**Risk:**
> +Excessive commands requests can cause high hypervisor CPU consumption
> +and disrupt scheduling,
> +leading to degraded system responsiveness and potential
> +denial-of-service scenarios.
> +
> +**Mitigation:**
> +
> +- Implement vIOMMU commands execution restart and continuation support:
> +
> +  - Introduce processing budget with only a limited amount of commands
> +    handled per invocation.
> +  - If additional commands remain pending after the budget is exhausted,
> +    defer further processing and resume it asynchronously, e.g. via a
> +    per-domain tasklet.
> +
> +- Batch multiple commands of same type to reduce emulation overhead:
> +
> +  - Inspect the command queue and group commands that can be processed
> +    together (e.g. multiple successive invalidation requests or STE
> +    updates for the same SID).
> +  - Execute the entire batch in one go, reducing repeated accesses to
> +    guest memory and emulation overhead per command.
> +  - This reduces CPU time spent in the vIOMMU command processing loop.
> +    The optimization is applicable only when consecutive commands of the
> +    same type operate on the same SID/context.
> +
> +5. Observation:
> +---------------
> +Some guest commands issued towards vIOMMU are propagated to pIOMMU
> +command queue (e.g. TLB invalidate).
> +
> +**Risk:**
> +Excessive commands requests from abusive guest can cause flooding of
> +physical IOMMU command queue,
> +leading to degraded pIOMMU responsiveness on commands issued from other
> +guests.
> +
> +**Mitigation:**
> +
> +- Batch commands that are propagated to the pIOMMU command queue and
> +  implement batch execution pause/continuation.
> +  Rely on the same mechanisms as in the previous observation
> +  (command continuation and batching of pIOMMU-related commands of the same
> +  type and context).
> +- If possible, implement domain penalization by adding a per-domain budget
> +  for vIOMMU/pIOMMU usage:
> +
> +  - Apply per-domain dynamic budgeting of allowed IOMMU commands to
> +    execute per invocation, reducing the budget for guests with
> +    excessive command requests over a longer period of time
> +  - Combine with command continuation mechanism
> +
> +6. Observation:
> +---------------
> +The vIOMMU feature includes an event queue used to forward IOMMU events
> +to the guest (e.g. translation faults, invalid Stream IDs, permission errors).
> +A malicious guest may misconfigure its IOMMU state or intentionally trigger
> +faults at a high rate.
> +
> +**Risk:**
> +Occurrence of IOMMU events with high frequency can cause Xen to flood the
> +event queue and disrupt scheduling with
> +high hypervisor CPU load for events handling.
> +
> +**Mitigation:**
> +
> +- Implement fail-safe state by disabling events forwarding when faults
> +  are occurred with high frequency and
> +  not processed by guest:
> +
> +  - Introduce a per-domain pending event counter.
> +  - Stop forwarding events to the guest once the number of unprocessed
> +    events reaches a predefined threshold.
> +
> +- Consider disabling the emulated event queue for untrusted guests.
> +- Note that this risk is more general and may also apply to stage-2-only
> +  guests. This section addresses mitigations in the emulated IOMMU layer
> +  only. Mitigation of physical event queue flooding should also be considered
> +  in the target pIOMMU driver.
> +
> +7. Observation:
> +---------------
> +vIOMMU `CFGI_STE` commands can trigger serialized STE programming on the pIOMMU
> +while `xen_domain->lock`, `devices_lock` and `cmd_queue_lock` are held, with
> +local interrupts disabled. STE programming may issue multiple polling CMD_SYNC
> +operations, each with a one-second timeout.
> +
> +**Risk:**
> +An abusive guest can issue CFGI_STE commands that cause multiple CMD_SYNC
> +operations to reach their polling timeout. This can keep a pCPU with interrupts
> +disabled for a significant period of time, delaying interrupt handling and
> +potentially degrading the responsiveness of Xen and other domains running on
> +the same pCPU.
> +
> +**Mitigation:**
> +
> +- Implement pinning or otherwise maintaining the lifetime of the required
> +  objects before releasing the relevant locks, allowing the
> +  serialized STE programming to be performed without holding locks and with
> +  local interrupts enabled.
> +- Consider redesigning the SMMUv3 command processing and locking model in
> +  future improvements to avoid performing potentially long-running pIOMMU
> +  operations while holding locks and with local interrupts disabled.
> +
> +Performance Impact
> +==================
> +
> +With iommu stage-1 and nested translation inclusion, performance
> +overhead is introduced comparing to existing,
> +stage-2 only usage in Xen. Once mappings are established, translations
> +should not introduce significant overhead.
> +Emulated paths may introduce moderate overhead, primarily affecting
> +device initialization and event/command handling.
> +Testing is performed on Renesas R-Car platform.
> +Performance is mostly impacted by emulated vIOMMU operations, results
> +shown in the following table.
> +
> ++-------------------------------+---------------------------------+
> +| vIOMMU Operation              | Execution time in guest         |
> ++===============================+=================================+
> +| Reg read                      | median: 645ns, worst-case: 2us  |
> ++-------------------------------+---------------------------------+
> +| Reg write                     | median: 630ns, worst-case: 1us  |
> ++-------------------------------+---------------------------------+
> +| Invalidate TLB                | median: 2us, worst-case: 10us   |
> ++-------------------------------+---------------------------------+
> +| Invalidate STE                | median: 5us worst_case: 100us   |
> ++-------------------------------+---------------------------------+
> +
> +With vIOMMU exposed to guest, guest OS has to initialize IOMMU device
> +and configure stage-1 mappings for the devices
> +attached to it.
> +Following table shows initialization stages which impact stage-1 enabled
> +guest boot time and compares it with
> +stage-1 disabled guest.
> +
> +NOTE: Device probe execution time varies depending on device complexity.
> +A USB host controller was selected as the test device in this case.
> +
> ++---------------------+-----------------------+------------------------+
> +| Stage               | Stage-1 Enabled Guest | Stage-1 Disabled Guest |
> ++=====================+=======================+========================+
> +| IOMMU Init          | ~10ms                 | /                      |
> ++---------------------+-----------------------+------------------------+
> +| Dev Attach / Mapping| ~100ms                | ~90ms                  |
> ++---------------------+-----------------------+------------------------+
> +
> +For devices configured with dynamic DMA mappings, DMA allocate/map/unmap
> +operations performance is
> +also impacted on stage-1 enabled guests.
> +Dynamic DMA mapping operation trigger emulated IOMMU functions like mmio
> +write/read and TLB invalidations.
> +
> ++---------------+---------------------------+--------------------------+
> +| DMA Op        | Stage-1 Enabled Guest     | Stage-1 Disabled Guest   |
> ++===============+===========================+==========================+
> +| dma_alloc     | median: 20us, worst: 5ms  | median: 8us, worst: 60us |
> ++---------------+---------------------------+--------------------------+
> +| dma_free      | median: 500us, worst: 10ms| median: 6us, worst: 30us |
> ++---------------+---------------------------+--------------------------+
> +| dma_map       | median: 12us, worst: 60us | median: 3us, worst: 20us |
> ++---------------+---------------------------+--------------------------+
> +| dma_unmap     | median: 400us, worst: 5ms | median: 5us, worst: 20us |
> ++---------------+---------------------------+--------------------------+
> +
> +Testing
> +=======
> +
> +- QEMU-based ARM system tests for Stage-1 translation.
> +- Actual hardware validation to ensure compatibility with real SMMUv3
> +  implementations.
> +- Unit/Functional tests validating correct translations (not implemented).
> +
> +Migration and Compatibility
> +===========================
> +
> +This optional feature defaults to disabled (CONFIG_ARM_VIRTUAL_IOMMU=n,
> +CONFIG_VIRTUAL_ARM_SMMU_V3=n).
> +
> +Future improvements
> +===================
> +
> +- Implement the proposed mitigations to address security risks that are
> +  not covered by the current design
> +  (events batching, commands execution continuation)
> +- PCI support
> +- Support for other IOMMU HW (Renesas, RISC-V, etc.)
> +
> +References
> +==========
> +
> +- Original feature implemented by Rahul Singh:
> +
> +https://patchwork.kernel.org/project/xen-devel/cover/cover.1669888522.git.rahul.singh@arm.com/
> +
> +- SMMUv3 architecture documentation
> +- Existing vIOMMU code patterns (KVM, QEMU)
> \ No newline at end of file


