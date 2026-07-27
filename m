Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3096C531FC
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:22:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371771.1619243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woN9T-0000i2-Sq; Mon, 27 Jul 2026 15:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371771.1619243; Mon, 27 Jul 2026 15:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woN9T-0000hv-Pd; Mon, 27 Jul 2026 15:21:59 +0000
Received: by outflank-mailman (input) for mailman id 1371771;
 Mon, 27 Jul 2026 15:21:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woN9S-0000hp-BZ
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:21:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woN9R-00C2nv-Ix
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:21:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a677786-bab6-0a2a0a5309dd-0a2a45079cf0-24
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:21:57 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a677795-b4ea-0a2a45070019-d155dd2eecf3-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:21:57 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-476a130c138so2774324f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 08:21:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5d9sm48106900f8f.5.2026.07.27.08.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 08:21:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785165717; x=1785770517; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHfNj3rPAqTUD3/jrcxv/70F+JeLAtHUxp0y1WIHsAY=;
        b=XOAYiemNVF/jv32mCkmZvHOXzccr/IDr+cy3aeQMAiVhIc96cqbpHhQngYWFv3rrft
         pNr0ypD6cM7Z3nEy7CDfke2z5hmPqzIN0NUK/HoFA931QwU6lhKSHetIGFG3/4z+0stv
         iSOotgljv0hLfXwA29Qit0DoCZkrkJGQ0wbQDSEHfh4wl8ZpQT6JlBmVPuRTbBbTZAzS
         bemOZDi1Qp5y0U05m2iyU7TX5PrZpYlTfCnjTppx+cd8pMGgaJaxO39+2i7/YeqXYY3K
         nn4ObdM6Bhs4W+L+GJSS/Q2N/yIskULp1XO+picUVWlrkJWQ4XG9rCl+76NHtw+/pfXt
         vvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165717; x=1785770517;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHfNj3rPAqTUD3/jrcxv/70F+JeLAtHUxp0y1WIHsAY=;
        b=Yxk3WcglSD+ruhAzFp/RphBmjp3AKJpHNNPzRPbYP9tUdLoQ2BRThTZthGW5nZmfp5
         jYdfEedJ356+efePx2RL6meOEdqzuOX69pfifxwN10JXPyYpFPQ9gA1rKwvioKNjRhgz
         Z4RWeg4cC5Ne5leYIzesfCKhnSBMrnqUGX5Dr9v1dIRQK9HBf9kZ8ZaEA+607ShzC0JI
         b0QGQALWKni3SnRQy2Pn/td5vrh1N+9QfKL+lwEuTZVOLcIKDcBiPwC9ZAyaKZYf4V5J
         S9hBWC/Q/0Nn9CPm9ALgd52NVWVQKYk8yXLmu4a2KlaOMAXfplnolvYFwxHRLPewcqaM
         3UXw==
X-Forwarded-Encrypted: i=1; AHgh+RpTND10p0mT3iulywlQkjaOU6ixdg9jUU8LuVuCqVdFEhebmoeoSMsS2qSZvfVcUnxBwGYbK1GC1XM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiFEZJfZ0P4MEs1rEMUjhJj2qGJNUfvK745VTV8bR678YRSAgD
	1AvRHX75DexlGEf9O6Gw75uNcpmen4/80McEsKuEC1/k93LDsuFFz5cB+GGH+kKKWA==
X-Gm-Gg: AR+sD10OS+umis/DSzlX2ukS4GMEu6+URaU0ISCrIrBe9aKj+uG7D/fTqmzQi8OYZoZ
	9/8etZWGVtvp2ineF0oIfhsQPAEiQI9O7BVcXV3zy4xn7GgJMJAZp4zLQ8jMJypynSCCjhQ+Rk4
	pUaSdXeqU0f9Z3oiayUpg+S/lIaEO93kCeMNc66DOY7SLoFSOS26/JDYCuchdcfd/VYelx8SMm6
	oLmgLHX6r3Cmmea6QHQSQpv+fjTrwPjIlqnajGpLXDncKm+a7hNSkq/jkIx/eQ/0lMMQ8Fcz1LC
	x9afC23Owu+OhwFp0H5krxrYPKxy8THBUIMaWZ9KNUUlmSrkO3ITqdMtNQL48mD057o5g5eJlk6
	ZKAf99UCmhLOrTgY9nnu07kHwtWuvX+BFOKffvmqJ2GJT20grFh62gMycXbaRJx8lLew1QqlyOv
	lQfCRlvTq+aMfev/uJdmCNfCqEwkAW71gdvZ1Y1bx+ocSCbdDUxibWFp7peYlk0SLFtA==
X-Received: by 2002:a05:6000:24c9:b0:47f:8860:5663 with SMTP id ffacd0b85a97d-47f9fe92f7cmr12045076f8f.34.1785165716843;
        Mon, 27 Jul 2026 08:21:56 -0700 (PDT)
Message-ID: <29fcc402-f953-4b51-b077-729bb0e5b4e0@suse.com>
Date: Mon, 27 Jul 2026 17:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/17] [RISC-V] virtual interrupt controller
 (vAPLIC/vIMSIC) support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785165717-36CDFAE4-66BFDF97/0/0
X-purgate-type: clean
X-purgate-size: 5120

On 20.07.2026 18:01, Oleksii Kurochko wrote:
> Hi all,
> 
> This series adds the initial virtual interrupt controller (vINTC) support
> for RISC-V guests in Xen, based on the Advanced Interrupt Architecture
> (AIA): a virtual APLIC (vAPLIC) in MSI mode backed by a virtual IMSIC
> (vIMSIC) using hardware guest interrupt files.
> 
> Rather than emulating APLIC in direct-delivery mode (which requires
> trap-and-emulate for every interrupt and is costly), the series targets
> IMSIC from the start. AIA lets a hart implement several "guest interrupt
> files" (up to GEILEN), so external interrupts can be delivered to a vCPU
> directly by hardware via the VGEIN field of hstatus, without a hypervisor
> round-trip. Xen only has to emulate the APLIC MMIO programming interface
> and route the guest's intent onto the physical MSI topology; interrupt
> delivery itself stays in hardware.
> 
> The work breaks down into a few logical blocks:
> 
> Physical APLIC/AIA groundwork (patches 1-3)
>   - Correctly track IRQ_DISABLED across runtime enable/disable and order
>     the ->status update against the IMSIC CSR write.
>   - Per-pCPU VGEIN (guest interrupt file) allocator: assign/release a
>     hardware guest file to a vCPU and program hstatus.VGEIN.
>   - Add the missing APLIC register offsets/masks needed by both the
>     physical and virtual APLIC code (no functional change).
> 
> Device-agnostic MMIO dispatch + vAPLIC emulation (patches 4-5)
>   - A per-domain MMIO handler table modelled on Arm's framework, so
>     emulated devices self-register their GPA ranges and the fault path
>     stays agnostic via a single try_handle_mmio() entry point.
>   - vAPLIC MMIO read/write emulation. Writes are gated by the domain's
>     authorised-IRQ bitmap so a guest cannot touch interrupts it does not
>     own, and TARGET writes are translated from virtual to physical
>     hart/guest-file indices. Delegation (SOURCECFG.D) is not yet
>     supported.
> 
> vIMSIC guest interrupt files and state (patches 6-9)
>   - Stage-2 map a vCPU's physical guest interrupt file to the fixed
>     per-vCPU GPA page the guest expects at offset 0.
>   - vcpu_aia_init(): assign a VGEIN, map its guest file and record the
>     IMSIC state as a consistent unit.
>   - IMSIC state save/restore (currently tracking which pCPU owns the
>     guest file, needed because the pCPU id is part of the MSI address).
>   - has_msi_support() helper to decide whether IMSIC state has to be
>     saved/restored.
> 
> vINTC state save/restore plumbing (patches 10-11)
>   - vintc_state_{save,restore}() wrappers over new store/restore hooks in
>     struct vintc_ops, and the vAPLIC implementation of those hooks. No
>     callers are wired up yet; the context-switch calls arrive with vCPU
>     context switch support.
> 
> Trap and instruction emulation infrastructure (patches 12-17)
>   - Extend the exception-table format with type/data fields and add
>     EX_TYPE_TRAP_INFO so fixups can capture sepc/scause/stval.
>   - riscv_vcpu_unpriv_read() (HLV/HLVX) to read guest memory/instructions
>     safely, and riscv_vcpu_trap_redirect() to forward a synchronous trap
>     back into the guest's VS-mode handler.
>   - A guest page-fault handler that decodes the trapped load/store
>     instruction (HTINST, or an unprivileged fetch as a fallback) and
>     dispatches the MMIO access through try_handle_mmio().
> 
> Note on versioning: the series is posted as v1 as a freshly split-out
> series, but several patches carry v2/v3 changelogs because they were
> previously circulated as part of a larger another patches [1] from which the
> current depends.
> 
> CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2690874319
> 
> [1] https://lore.kernel.org/xen-devel/cover.1784559209.git.oleksii.kurochko@gmail.com/T/#t
> 
> Oleksii Kurochko (17):
>   xen/riscv: manage IRQ_DISABLED flag in APLIC irq enable/disable
>     callbacks
>   xen/riscv: add basic VGEIN management for AIA guests
>   xen/riscv: add missing APLIC register offsets, masks to asm/aplic.h
>   xen/riscv: introduce device-agnostic MMIO emulation dispatch
>   xen/riscv: implement virtual APLIC MMIO emulation
>   xen/riscv: map IMSIC interrupt file for vCPUs
>   xen/riscv: introduce vCPU AIA initialization
>   xen/riscv: add IMSIC state save/restore
>   xen/riscv: add helper to check APLIC MSI mode
>   xen/riscv: introduce vintc_state_{save,restore}()
>   xen/riscv: add vAPLIC state save/restore hooks
>   xen/riscv: extend exception tables with type and data fields
>   xen/riscv: add unprivileged guest memory read helper
>   xen/riscv: add guest page fault handling stub
>   xen/riscv: implement trap redirection to a guest
>   xen/riscv: add guest load emulation for trapped MMIO accesses
>   xen/riscv: add guest store emulation for trapped MMIO accesses

Where did the last two patches go? My inbox agrees with [1] that only 15 of the
17 patches arrived.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-07/threads.html

