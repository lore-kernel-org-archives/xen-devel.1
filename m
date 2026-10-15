Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F7ECC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 15:00:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450763.1666180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHMw2-0005Vj-5d; Thu, 15 Oct 2026 14:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450763.1666180; Thu, 15 Oct 2026 14:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHMw2-0005Vc-32; Thu, 15 Oct 2026 14:59:58 +0000
Received: by outflank-mailman (input) for mailman id 1450763;
 Thu, 15 Oct 2026 14:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHMw0-0005VU-AJ
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 14:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHMvz-005PDA-G0
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:59:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0ea6b-8faa-0a2a0a5109dd-0a2a45069dae-0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:59:55 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad0ea6b-195a-0a2a45060019-d155d033e488-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 16:59:55 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b2237b596cso1811187a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 07:59:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b203863cb0sm2590512a12.17.2026.10.15.07.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 07:59:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792076395; x=1792681195; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiC6iKf8InCNIMdR3pbpvRu5cEG3BqEmjDO3duO5XaE=;
        b=O/FSwEuDy6wwIWqdWvOYID/LMg+RpzmWQQTEYtyd4RH3ZcxNGrUguDQwdzMSpcywXE
         GkuX0zDHNhBNgcVN5Mc2r6LJ+XHPbwH/T60TC1OFyVS/Lec49yYxCtQX2dGOsoAHeY9f
         feMczWlNhB9q2TLC6OSC4X3jT1kBYyH431rrpUvVq1UZ5puaey831Xe2k0JtDqOwo8Ld
         DNVHAsNhZSguq/4ld+rESxs53ugPEX0hAki7EbuxNibyq6VmtxBbShoEtv8kv1HuS2KM
         F1bmbOLQflW+VBkP1UTVTsvWJkwVH3VYWTGWfJVkLxgvX70VYoHTI/AAFhEEJEPDf6DY
         INWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076395; x=1792681195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiC6iKf8InCNIMdR3pbpvRu5cEG3BqEmjDO3duO5XaE=;
        b=g+pa80g9PkvWqwLSP8f7tHp0v87HyzZc81BjKrmhNqCSDg8//ziP4WQLZFKLcDyBYp
         9Cg1lsJFv+VX2wXre4z39P7s7i3RGWwz66GYKjOU52+NXy1DF8ATCylaMS1AQCTHyk9w
         /u+ZHmSMDa86pomgvJY5ej63gubuLt9On6xkCuqkrWTbhMhhxtuv3LbLWS0ZsyxZXK6w
         kb0S/IHSzpzuR2Rw40wg2u5mZzbkwYmKG59RE1VI49kSY+dWQmntnYsWB4z3EHoYOgfr
         Uw7tBMfSfOk8MpEeRD5i3bdhdG9JiWkIIKrkx3C/OVCOUUqVbOdUIaf5co5+nFU9g9yx
         SgJQ==
X-Gm-Message-State: AFq9FYI6HV+r57mlwsgwyFSc2HIkfJZlZV8ZTGEhQD8G0Mz5xo704lVG
	VYh7JfdH6WN8Ikl7+Zx9//JuwJddNNkdrFAL0SLdcMsXcz7t3wwNi4n8Thfv4w==
X-Gm-Gg: AYBFou22r7rTkIXLmu701rIxFdlcZAvsFCcNDUzEPLP88mnk/p3K/FAxmBEnuOuPV+I
	KzlOAB2AWg6zZNjcePHzlQcq22vNhHFetQK8FsUH//VkIVV8hZKDmhgkF0wOOlNJj4W5jlkQMc9
	QEuXcESK1EfTp5rwodiCXyp6RraA9/BU0uxwzJ0OGAqGYFRlrkJasas6vyAl6HNzTAk7QU3Chfg
	UcIhWzDY6+NuU9KHYW1iSeCDcJ5M/vie9/823jU4XauJ/SZmq1u1gd1/fuIJksBM3WI8hcK7yt6
	/5zVgMIwIBEBjNRQUctSxYwz1UKHiLk50A8/b8AoO9YeS9BN9oHNLxyOXlJi6+LJLqO2UirLsqa
	t4tkzgLKymbBU4vhwxTVsV5nVpJnTdireGKXkYp3U0al3mklt8lCK8rjrtkjQ0fIhlkucuYxLWi
	TC/kS2/u0yes7RwxGF+NSmCC1lu0d5BqWrHNRy4GtiVHzd3I7ckzwMXopUlgaG12ePDDX7oJ5pQ
	q/6vUk8VbxPpfUr/fYhg05Sz3Nf0PdCUSF0euiLTDlMv5o=
X-Received: by 2002:a05:6402:a0d6:b0:6ac:b861:dab3 with SMTP id 4fb4d7f45d1cf-6b17c296bf6mr14561014a12.39.1792076394815;
        Thu, 15 Oct 2026 07:59:54 -0700 (PDT)
Message-ID: <9943b1f4-1890-4917-ae39-bf9c70fc36c7@gmail.com>
Date: Thu, 15 Oct 2026 16:59:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/39] xen/riscv: add guest load emulation for trapped
 MMIO accesses
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <d4304a157181d8a8432b8f65f92019e0ead3bec7.1790779209.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d4304a157181d8a8432b8f65f92019e0ead3bec7.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1792076395-1F6C877B-5594F23E/10/73395122804
X-purgate-type: spam
X-purgate-size: 3200



On 9/30/26 6:23 PM, Oleksii Kurochko wrote:
> Implement emulate_load() on top of the decoding interface introduced by
> the previous patch: fetch the trapped instruction, decode it, dispatch
> the access to a registered MMIO handler via do_mmio(), write the result
> back into the destination register and step over the instruction.
> 
> Xen dispatches MMIO synchronously to an in-hypervisor handler, so unlike
> KVM RISC-V there is no userspace exit/return step and no equivalent of
> the kvm_io_bus_read() / KVM_EXIT_MMIO / kvm_riscv_vcpu_mmio_return()
> split; the result is consumed in place.
> 
> Sign extension is done here rather than in the handlers: a signed load
> is normalized by a shift pair, so a handler need only report the value
> it read.

This part of commit message should be updated. Suggestion look below...

> 
> At the moment vINTC is the only backend registered with the MMIO
> dispatch, so in practice this only covers vINTC traps. An access which
> no handler claims currently crashes the domain; injecting an access
> fault into the guest instead is left for later.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---

[...]

>   static int emulate_load(const struct guest_fault *gf)
>   {
> -    /* Transient, until the helpers gain their users. */
> -    (void)advance_pc;
> -    (void)guest_xlen;
> -    (void)guest_gpr;
> -    (void)insn_fetch_faulted;
> -    (void)decode_ldst_insn;
> +    struct cpu_user_regs *regs = gf->regs;
> +    mmio_info_t info = { .is_write = false };
> +    struct decoded_insn di = {};
> +    unsigned int shift = 0;
> +    int rc;
>   
> -    return -EOPNOTSUPP;
> +    /* A fault taken re-reading the instruction is redirected to the guest. */
> +    if ( insn_fetch_faulted(gf, &di) )
> +        return 0;
> +
> +    if ( !decode_ldst_insn(&di, guest_xlen(regs)) || di.is_write )
> +        return -EOPNOTSUPP;
> +
> +    if ( !di.is_unsigned )
> +        shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
> +
> +#ifdef EMULATE_LOAD_DEBUG
> +    gdprintk(XENLOG_DEBUG, "pc=%#lx, addr=%#"PRIpaddr", len=%u, shift=%u\n",
> +             regs->sepc, gf->gpa, di.len, shift);
> +#endif
> +
> +    rc = do_mmio(&info, gf->gpa, di.len);
> +    if ( rc )
> +        return rc;
> +
> +    /* A load into x0 discards its result. */
> +    if ( di.reg )
> +        *guest_gpr(regs, &di) = (long)(info.data << shift) >> shift;

It would be more correct to have here:

     shift = BITS_PER_BYTE * (sizeof(info.data) - di.len);
     ...
     if ( di.reg )
         *guest_gpr(regs, &di) = di.is_unsigned
                                 ? (info.data << shift) >> shift
                                 : (long)(info.data << shift) >> shift;

and update the commit message part "Sign extension is done here…" to:

Sign and zero extension are done here rather than in the handlers: a
shift pair drops whatever lies above the access width in the value read
and, for a signed load, sign-extends it, so a handler need only report
the value it read.

> +
> +    advance_pc(regs, di.insn_len);
> +
> +    return 0;
>   }
>   
~ Oleksii

