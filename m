Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D7EC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 20:15:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431312.1653484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9TNJ-0001wg-GB; Wed, 23 Sep 2026 20:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431312.1653484; Wed, 23 Sep 2026 20:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9TNJ-0001wZ-DB; Wed, 23 Sep 2026 20:15:29 +0000
Received: by outflank-mailman (input) for mailman id 1431312;
 Wed, 23 Sep 2026 20:15:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ndesaulniers@google.com>) id 1x9TNI-0001w8-3K
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 20:15:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9TNG-008rfR-Mk
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 22:15:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ndesaulniers@google.com>)
 id 6ab4334d-bab6-0a2a0a5309dd-0a2a45029a76-20
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 22:15:26 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ndesaulniers@google.com>)
 id 6ab4335e-6ca4-0a2a45020019-4a7de14cb25f-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 22:15:26 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356f6bso1098779f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 13:15:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790194526; cv=none;
        d=google.com; s=arc-20260327;
        b=BtA/q3fVJ1GUMzoRN6kZpoYxbEcIsZnYYOuSrFwIhJ9vsNH8sa6qila3TblC15PMxo
         OyS4UTG8sc3tI+S0R1rZe30WZBZfbgKD1GxwCDvh0rCdq8L6WqtE1xpPcCdgrhXlN10d
         VzSSOUBJpoJAI28zslLBphPyah1leIZXKUkRXKWQ7pZjnE+NKbdZFmEV5vkoOp6x5S8V
         sooVXWdBYXDcmO6N2t7unk4DvQgl7muTZWvB7P26LT+/eHsLlVYOJg3KZAHM1y/X/I/6
         BCyPhstEQDEINxY5kzvu/L3PHSZbcufJDTTE5hZYUHJWDeOpu6S3E+uOOFC/ERV+ChdL
         LIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        fh=3f41E6Nh1jEvWGJnylBzjuzP2JQmUlbohgqY5xbD5yU=;
        b=YylpakmsNVSdGnSW2alJ4e8fuN22R66GHHwK1BWjW0Mux+i9rgF3mYLQSuKpbpZnEp
         pGteyjs6/xW/xOk6itymA+lVvYHm55hJxUoZU1Ry01NuWBlYDmINCZFQy83CoY5ghN1A
         nhEnOTxCvkzzlFkBOfsepDfhd2Q/dpMPpeMluQsbmEPp71Yu1Y6o+fF01mwqbHFZ2U1t
         inRa8yKlUoHmOAuDnT0fvPAQ2BHhV2sPpr1itlxuz1zsOztBr8g1MVQmZ08IWgdaJoDX
         HdIiPIMZT8mzTd4X/utPRjoZUTua5VfgXQerWoT+JPzi0zhHCHZJ8ndwdrRvxgAPkwfF
         Qolw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790194526; x=1790799326; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=RvbnNNZSSi3krdGNpYmfL/Bqeejk4MzkmjnlX4TsGRUnRkPfSBR88TEMNKRUvA2gn5
         8Lq+xuyjggg1NWXhfG5I6XsqhN48n9GIyuFRB5uYSOsET/Fydi+g3VyUCxNjV+LvIxhn
         XTvnp7sYgZLHashvY3FMet1WqvcbFRCVl2obJ2luZnqRvv8jg+ZZUSzLv37gi1qTfGgq
         vH2FK4badx0sKfZCNBg8yucixT8Y3OHSJGDRQVfzJtralqxJQfCOsSUj4dFgisLytcGz
         3qeaZVylMCg+vndDBmL66YSYo/NutxZ4hJ3k0+CHCzsy761bbU4ronYAeUVpRsJ5SfdF
         WnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194526; x=1790799326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=XRzOjdV3VvT+1M6GQ7flp16LxvS8JdFnGGHpDLScUm7RIBfAoJTHgJiPw9oAXbz4jo
         YZgcn5OzTskuSDEM2PpUjCOoJ/89Xnz5CV+QR2PthGyqKoIaTnLkGf0d2xl4MWcc8vcG
         JvKmW27UVZDXSdhZMMse4C4bs6sYd7iaK5LFq6iBkDSLNZhfooYPD6uv2458IhWl1HUC
         rQyxpi0ZGI7iSBUBZAq2E6ruXp6BTuuMFuXCnNrwTkucv4wbWpwqy16ole7W33kujRtJ
         exQEmw6xODZYZR0GwyRzLGI+PllNQAWm3yHkAZXyp7Z4JmAdI1SNkD9qNXHkrEehS5V0
         jCnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTt/mmP6e9juYAxZBb1ulXgIqZLbSnIsed564FeINAqNNRjc1sy3a819j9i+EknRFrnHwk0lg5JaA=@lists.xenproject.org
X-Gm-Message-State: AFuF++mRhQjRw1wBeJPeYhQr0TAgQY7RbhjYsTyQkKvhW3aVfX4qXNoH
	is1MoTi8duHhFpkFMX4Diot/ytW6mh24Sc5CuouMey+CzY46QcKurIz3uVSA1sY+9VRM3vsazYK
	3VPadsVeNZr2gktdtnYMyPl4afGdfhpb+SwILmVOr
X-Gm-Gg: AYBFou1vtxKWrGYjCWmsfQk3AeAqzMCiUYD8w5dMrQd3d5AaH0vdQevgjbrCdYABK2C
	LHZhfZ/P+5nkm7NQHC4VgR1e5MqikoIDamUtxDoA6ivWua5P/Y3E0rljwaD8SgAr3ER9uYffPxa
	xthfH0QqrX3LroFbFALe31I8/qtEHN4Ns7cndaRKPJVrY8AzPeg3JmYvuooDFym5GpKXbcIK5tH
	fxhw/nSz425QaopObC28w93LY6/BkbquPC127iw//UKxHtZq4ezN3MJugX9IRAK+Nf4N2OD7lEb
	TNeG32XflhKoK7QFuw+wLibEqtSZ/86DteZKb+Okk9guc8ys14I1kjGTkpPzy1rK/bScvhTLymz
	MR5pC08IJT5ZXefP3OJ7qG7F1UzXz9834d/g8/ScfnxJsZhv61SxxClfE1oNXXuU5Lr7l0vgSmh
	b9Hw==
X-Received: by 2002:a05:6000:2383:b0:485:ad55:208d with SMTP id
 ffacd0b85a97d-488716c8d48mr511088f8f.18.1790194525443; Wed, 23 Sep 2026
 13:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260911084211.3149957-1-jgross@suse.com> <20260923193619.1408940-1-shreshth.srivastava@intel.com>
In-Reply-To: <20260923193619.1408940-1-shreshth.srivastava@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 23 Sep 2026 13:15:14 -0700
X-Gm-Features: AclHuK-BmScte-vitIZ7FKAidjIiegIYr2tRDSSJKsz3-ZO8Fal-vgtzUYiiixY
Message-ID: <CAKwvOdnKS+E9R3QaFk98dPNNh7uW=8yuJpYWGPHbY7k40Fk=rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
To: Shreshth Srivastava <shreshth.srivastava@intel.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, llvm@lists.linux.dev, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	xin@zytor.com, nathan@kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1790194526-F3EBB2AC-F2175C20/0/0
X-purgate-type: clean
X-purgate-size: 3672

On Wed, Sep 23, 2026 at 12:36=E2=80=AFPM Shreshth Srivastava
<shreshth.srivastava@intel.com> wrote:
>
> On 11.09.26 10:41, Juergen Gross wrote:
> > When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> > infrastructure will always use functions for reading or writing MSRs,
> > even when running on bare metal.
>
> Hi Juergen,
>
> This doesn't build with CONFIG_PARAVIRT_XXL=3Dy. 16/17 and 17/17 are wher=
e
> it breaks, but the cause is the .byte fallbacks: ASM_WRMSRNS_IMM from
> 08/17 and ASM_RDMSR_IMM from 10/17 don't end in a separator, unlike the
> .insn variants above them.
>
>   #define ASM_RDMSR_IMM                         \
>         " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
>
> That worked while they were only ever the last argument of an
> ALTERNATIVE(), which appends its own newline. 16/17 concatenates them
> with ASM_CLRERR:
>
>         ASM_RDMSR_IMM ASM_CLRERR, X86_FEATURE_MSR_IMM,  \
>
> so the .long operand runs into the xor. From
> make arch/x86/kernel/cpu/common.s:
>
>         .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long 266xor %rdx,%rdx
>
>   paravirt-msr.h:165: Error: junk at end of line, first unrecognized char=
acter is `x'
>
> clang reports "error: unexpected token" in the same place. 71 objects
> fail, the same 71 either way, no vmlinux.
>
> msr.h chooses between the .insn form and the .byte fallback with:
>
>         #if defined(CONFIG_AS_IS_GNU) && CONFIG_AS_VERSION >=3D 24100
>
> Two kinds of toolchain end up on the .byte side of that test:
>
>   - GNU as older than 2.41. RHEL 9 and CentOS Stream 9 ship 2.35, and
>     Documentation/process/changes.rst sets the minimum at 2.30, so this
>     is a supported configuration rather than an old outlier.
>   - clang, any version. CONFIG_AS_IS_GNU is never set for clang, so the
>     && short-circuits and the version comparison is never reached. Your
>     08/17 comment already notes that clang has no .insn support.

Indeed, looks like we're missing support for .insn for x86.
Filed https://github.com/llvm/llvm-project/issues/225916.
(Please do file bugs against the toolchain when you encounter issues
like this, and cc someone from kernel development).

>
> gcc with binutils 2.41 or newer takes the .insn path, where both macros
> do end in a separator, and is unaffected.
>
> Reproduced on v7.3-rc2 with your v3 00/13, v2 0/5 and v5 00/17 applied in
> that order, x86_64 defconfig plus HYPERVISOR_GUEST, PARAVIRT, XEN and
> XEN_PV. gcc 11.5.0 with GNU as 2.35.2, and clang 21.1.7.
>
> Terminating both fallbacks fixes it, and both toolchains then build
> vmlinux with no errors or warnings:
>
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index eba325ecfe4c..529c13553c63 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -78,9 +78,9 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int=
 failed) {}
>   * form MSR access instructions reference %rax as the register operand.
>   */
>  #define ASM_RDMSR_IMM                          \
> -       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]\n\t"
>  #define ASM_WRMSRNS_IMM                                \
> -       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]\n\t"
>  #endif
>
>  #define RDMSR_AND_SAVE_RESULT                  \
>
> ASM_WRMSRNS needs no change, _ASM_BYTES() already emits a semicolon.
>
> The WRMSRNS line belongs in 08/17 and the RDMSR line in 10/17.
>
> Thanks,
> Shreshth



--=20
Thanks,
~Nick Desaulniers

