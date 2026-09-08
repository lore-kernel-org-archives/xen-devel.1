Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79280C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:11:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412087.1642576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wXP-0003CJ-Lj; Tue, 08 Sep 2026 14:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412087.1642576; Tue, 08 Sep 2026 14:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wXP-0003CC-J4; Tue, 08 Sep 2026 14:11:03 +0000
Received: by outflank-mailman (input) for mailman id 1412087;
 Tue, 08 Sep 2026 14:11:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3wXO-0003C4-Hh
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:11:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wXN-00986B-UV
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:11:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01762-e002-0a2a0a5209dd-0a2a4504c36a-30
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:11:01 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01775-b57f-0a2a45040019-d155dd2dc5cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:11:01 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4843f205a5bso2905499f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 07:11:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885b1320sm35519732f8f.27.2026.09.08.07.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 07:11:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1788876661; x=1789481461; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X9ZV+IXjqldc8rwvZehjQnhQUA17T2GsGKUUd9xV2EU=;
        b=dtDK7+0dWcfrNRO50/0JodRt0Q57VFdPGNP5kvyncCUhSlbmoqFTSN+F/3Bf7e5/QY
         i5ggFUXl3jr/d91MkH3XuAJ6igwMZadgt9eed8upGyvDfcsYL5yieGrHjpUI/KKS+udI
         Oj4y2VQh0RDiOXy5osIXUsnFCX0N7WfwEMLBuJKUwGVWVIeIXBxf9L46Wvx73kaqCafn
         qabFq+TLcsVGuWLKELpxj9sCZMJyAF1ZC2xCPC+IM7zPPcglNtX5nkNoKSQS9tAlDI/J
         C2Y3tp20BgNPCI8M8z7U0Uh1y0RPwcX+LgAMHb6diXArVLdUZ1FnhPdcbKohahVrP7CX
         8/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876661; x=1789481461;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X9ZV+IXjqldc8rwvZehjQnhQUA17T2GsGKUUd9xV2EU=;
        b=qtA1/gZeqxFo3WKJy4fZuQfUVsj3X0cvcy1P4agR6vD3UFciZxnkoIU95Zy5bUdGCi
         0EyCIqzTmLUdzVmHULzVzweeDl+mMRV3ah5YIPKDruyEOZO+FJ2KIb+tDrM+l8GBYcE5
         w5pJcDywKhn5mPg5O1fr0DhFVpEQpMQRFDRP7gUftbL+my8BbEs/BN7Btg3mffvSBKxF
         O7ML28HrumlqXF3CStNUiQJ9odFiJnKN/Q36y799a8NeVV0mMpfwxxOYn4MDZuObe26Q
         zbjM4SbL4omz63Of50PwrWmJqkZ7tjUbHkBI2RgsKxD44ZH1GOdeTC2Gqlc5noTaqDiD
         0KdQ==
X-Forwarded-Encrypted: i=1; AKwUvByQlrP3HRQzkrNVGr2DqjECOop7Pg5LxHtAPNt5qsa/p39YTAGf7KD3S3Nk+li6gDQfiWmxj3+bBuk=@lists.xenproject.org
X-Gm-Message-State: AFuF++n2h8dJLDRhI7Uhyg7an51OP08w0CYFOAvzUUceCG0WlEQn+5LX
	kgZzosFymLVezzwL0bK4qwk+oVHUlpCgRryp4g0zxUesdNwtQnPOHiQbcNa/mBsmBQ==
X-Gm-Gg: AYBFou3kPA8mxacNlxqDTQ525CiJCsBne1vHr8cwdXZcTzjoF4xdU78yb0srGzIAjqc
	esStE0YKAAxVTHlAu6EhH3EVD1Imgr03UwfNrg30krZjK0NhD6z2Jrx0hFlzgcuRapmIVNKvY2x
	XK6sGDSmIGnqzc+QfggQgjCeV/pWLyVvinDiySkM91IIXJ4jsP+CcXEyCY6LhZd8+enJovtcdI4
	5VOniEKQQGhqTZVvwH70WrITn0QHGMI9tcbLoOjNSTLc1h7Nt5mdVWQI4Pe+dNT5fi/OdXkzyvi
	P/xk/viNR/JRIONICMvdhYJRGGYw9LR7mB2b89Cpai59tggLsPFBy+7wgeZqor2wDqo/E5yZR6e
	7kmN/oEuGF6nGVqSxo0JgkFECW6EjMxTQgIGPgg21Eqyb5pi/UohtzIfO1N27Xy+pWoc3OyulMc
	SFCBG18s/DvLnyqoEyeKx+uyXXCXTNq3RTqvJlIT1YXllPt0h8QWr87Dnn29JbzxyEcquEy6b4i
	yEbKtYFp2ZqeEvVMg4t+FI9N7AfytI/rR2bw8EKqHZ5dbgNPlGS
X-Received: by 2002:a05:6000:25e7:b0:485:8a46:b3d1 with SMTP id ffacd0b85a97d-4858a46b5acmr28711020f8f.57.1788876661138;
        Tue, 08 Sep 2026 07:11:01 -0700 (PDT)
Message-ID: <35aecc68-d16e-4350-9aca-101de2b21c1f@suse.com>
Date: Tue, 8 Sep 2026 16:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/39] xen/riscv: add guest page fault handling stub
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <42e37df518f1eda9579264b4bae9db3521e1042a.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788876661-C08D9B50-29B247E5/0/0
X-purgate-type: clean
X-purgate-size: 6661

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/emulate.c
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/*
> + * RISC-V instruction emulation for trapped guest accesses
> + */
> +
> +#include <xen/bug.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <asm/csr.h>
> +#include <asm/current.h>
> +#include <asm/emulate.h>
> +#include <asm/riscv_encoding.h>
> +#include <asm/traps.h>
> +
> +/*
> + * The hardware-reported details of a guest page fault, gathered once by
> + * handle_guest_page_fault() and passed down to the emulation of the faulted
> + * access.
> + */
> +struct guest_fault {
> +    /* The guest register state as saved on entry to do_trap(). */
> +    struct cpu_user_regs *regs;

If the comment was true, this could be pointer-to-const.

> +    /* scause: a fetch, a load or a store/AMO guest page fault. */
> +    unsigned long cause;
> +    /*
> +     * htinst: the trapped instruction in its transformed form, or one of the
> +     * special values (zero, or a pseudoinstruction).
> +     */
> +    unsigned long htinst;
> +    /* htval: as written by hardware; see resolve_faulting_gpa(). */
> +    unsigned long htval;
> +    /* stval: the guest virtual address of the faulting access. */
> +    unsigned long stval;
> +    /* The faulting guest physical address, filled by resolve_faulting_gpa(). */
> +    paddr_t gpa;
> +};
> +
> +/*
> + * Is @htinst one of the pseudoinstructions reported for a guest page fault
> + * taken on an implicit memory access done for VS-stage address translation?
> + *
> + * All four values are recognized regardless of the hypervisor's XLEN: the
> + * width they encode is that of a VS-stage PTE, i.e. it follows the guest's
> + * paging mode (4 bytes for Sv32, 8 otherwise). On RV32 the 64-bit forms
> + * simply never occur.
> + */
> +static bool htinst_is_pseudo(unsigned long htinst)
> +{
> +    switch ( htinst )
> +    {
> +    case INSN_PSEUDO_VS_LOAD32:
> +    case INSN_PSEUDO_VS_STORE32:
> +    case INSN_PSEUDO_VS_LOAD64:
> +    case INSN_PSEUDO_VS_STORE64:
> +        return true;
> +
> +    default:
> +        return false;
> +    }
> +}

This feels fragile. New pseudo-insns can appear at any time. If the value as
a whole is non-zero, aiui the low two bits being zero indicate a pseudo-insn.
In which case enumerating pseudo-insns we are currently aware of isn't
necessary.

> +static void inject_access_fault(const struct guest_fault *gf)
> +{
> +    struct trap_info utrap = {};
> +
> +    switch ( gf->cause )
> +    {
> +    case CAUSE_FETCH_GUEST_PAGE_FAULT:
> +        utrap.scause = CAUSE_FETCH_ACCESS;
> +        break;
> +
> +    case CAUSE_LOAD_GUEST_PAGE_FAULT:
> +        utrap.scause = CAUSE_LOAD_ACCESS;
> +        break;
> +
> +    case CAUSE_STORE_GUEST_PAGE_FAULT:
> +        utrap.scause = CAUSE_STORE_ACCESS;
> +        break;
> +
> +    default:
> +        domain_crash(current->domain, "Impossible cause (%#lx) in %s?\n",
> +                     gf->cause, __func__);
> +        return;
> +    }
> +
> +    utrap.sepc = gf->regs->sepc;
> +    utrap.stval = gf->stval;

Would there be anything wrong with putting these in utrap's initializer?

> +    trap_redirect(&utrap);
> +}
> +
> +void handle_guest_page_fault(struct cpu_user_regs *regs, unsigned long cause)
> +{
> +    struct guest_fault gf = {
> +        .regs = regs,
> +        .cause = cause,
> +        .htinst = csr_read(CSR_HTINST),
> +        .htval = csr_read(CSR_HTVAL),
> +        .stval = csr_read(CSR_STVAL),
> +        .gpa = INVALID_PADDR,
> +    };

At some point RISC-V code will (very likely) also be scanned for Misra violations.
The csr_read()s here violate rule 13.1 ("Initializer lists shall not contain
persistent side effects"), and I think it would be better if such was avoided from
the start.

> +    int rc;
> +
> +    /*
> +     * A guest-page fault may arise due to an implicit memory access during
> +     * first-stage (VS-stage) address translation, in which case a guest
> +     * physical address written to htval is that of the implicit memory
> +     * access that faulted - for example, the address of a VS-level page
> +     * table entry that could not be read. (The guest physical address
> +     * corresponding to the original virtual address is unknown when
> +     * VS-stage translation fails to complete)
> +     *
> +     * In such cases htinst reports one of the pseudoinstructions recognized
> +     * by htinst_is_pseudo(), and the fault requires separate handling (since
> +     * G-stage translation failed on an unpopulated/unmapped guest physical
> +     * address during a hardware page-table walk). To match bare hardware
> +     * behavior, we must inject an access fault of the ORIGINAL access type
> +     * (Instruction, Load, or Store/AMO) that initiated the address
> +     * translation.
> +     */
> +    if ( htinst_is_pseudo(gf.htinst) )
> +    {
> +        inject_access_fault(&gf);
> +
> +        return;
> +    }

I.e. you imply that guests won't put their page tables in MMIO? That's
fragile imo; I have seen OSes to use video frame buffers for all kinds
of (transient) purposes, for example.

> +    resolve_faulting_gpa(&gf);

Since the function is only a stub right now - how is one to tell whether
this indeed can never fail?

> +    switch ( cause )
> +    {
> +    case CAUSE_LOAD_GUEST_PAGE_FAULT:
> +        rc = emulate_load(&gf);
> +        break;
> +
> +    case CAUSE_STORE_GUEST_PAGE_FAULT:
> +        rc = emulate_store(&gf);
> +        break;
> +
> +    case CAUSE_FETCH_GUEST_PAGE_FAULT:
> +        /*
> +         * Guest is trying to reach unmapped/unpopulated or G-stage PTE doesn't
> +         * allow execution (X=0). Generate fetch fault in this case.
> +         */

Is there perhaps a comma missing before "or", to help parsing the sentence?

> +        inject_access_fault(&gf);
> +        rc = 0;
> +        break;

Simply "return" instead of the latter two statements?

> +    default:
> +        rc = -EOPNOTSUPP;
> +        ASSERT_UNREACHABLE();

To fit a common pattern, these two lines want to be the other way around.

> +        break;
> +    }
> +
> +    if ( rc )
> +        domain_crash(current->domain,
> +                     "%s: unable to handle guest page fault (cause=%#lx) at "
> +                     "gpa %#"PRIpaddr"\n",

Please avoid wrapping of format strings across lines.

Jan

