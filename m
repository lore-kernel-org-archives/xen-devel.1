Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F3C982E6
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 17:04:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427781.1650555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8hQm-0002oD-Lk; Mon, 21 Sep 2026 17:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427781.1650555; Mon, 21 Sep 2026 17:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8hQm-0002o6-Ih; Mon, 21 Sep 2026 17:03:52 +0000
Received: by outflank-mailman (input) for mailman id 1427781;
 Mon, 21 Sep 2026 17:03:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@swg.vates.tech>)
 id 1x8hQl-0002o0-Aj
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 17:03:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8hQj-00DBYV-92
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 19:03:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@swg.vates.tech>)
 id 6ab16370-bab6-0a2a0a5309dd-0a2a450b984e-6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 19:03:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@swg.vates.tech>)
 id 6ab16374-b7e8-0a2a450b0019-b9ff1c12a72d-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 19:03:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c4ec74f000072c4.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 21 Sep 2026 17:03:45 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1AD698115F;
 Mon, 21 Sep 2026 19:03:45 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=nFN7+0Yt3+MnStuj92rJ7nzyMbzgriCI4a7p5fqJd3g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YxwCr3ol7fTxAJnM+GrTXXDGGKfIxM24CuMCK7LdS2JUefhEA2rLNwD5AFrYlryAxQUB09pIo
 1ajVsV9Si7mCjDCUYB6YdJ7Vu0HFmbexh7zmUp21cfyfMLQy14ibDs9C2OICu1hFl8Z4/TTVIlH
 IMP0hoyPcHN2k68BlHvmbSx1UikX72PxLVWf0oRV3GtItfOz4jAIlWjiXcu5LWcWnSi6utGke+S
 ndMW+GVPFA5KU8/3sNbUeYAhiwK+FYvqOK2boxcmNxSlthA6Ruhnq17xbyFvM+WHsH4+FBNaPF1
 zohjcbx9wu8LEkVrbTVsZ/QShkW1X6ermyo6rGlsK/Nw==
X-Zone-Loop: 1d52740d9342a53dd63c30c3576c447c708fb3e5ba3a
x-campaign-type: default
x-transaction-id: ea8baf98-ea3f-4d79-ad40-0fc26f7ebde9
x-swg-uid: 01-1ab7c777-214b-4db6-8eb7-d3bd7c7e8d62
X-Mailer: Sweego
Message-ID:
 <1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@vates.tech>
x-swg-bid: 1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
 <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
Date: Mon, 21 Sep 2026 19:03:39 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790010219; l=12521;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ZrRyxxlRPHz5I5lHZ2pJSefPtiVW4YoKEOxkzdtW4hE=;
 b=XHZ16m5qViLmyfz9Edg+6l/zcIS3nsA9f/OrLTN/eXFYH13C71VFuSpTBhjgO/Ep4GJYdmjVb
 3kOtdYWKqQ4AjUfFZXvjyF6LhgWjnvCyPJkE6FsQ15yN1z/FtVs8K6B
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790010225291
X-purgate-ID: tlsNG-42698a/1790010229-182F49EA-9D536384/0/0
X-purgate-type: clean
X-purgate-size: 12525

On 2026-09-21 17:26:47+02:00, Jan Beulich wrote:
> On 10.09.2026 11:34, Baptiste Le Duc wrote:
> 
> > p2m_set_permission() only presets the PTE A/D bits when the Svade extension
> > is present in the device tree. This causes an unhandled page fault when
> > neither Svade nor Svadu is present (the platform's actual behaviour is then
> > unknown), and when both are present in the device tree.
> > 
> > Move the Svade/Svadu resolution out of p2m_set_permission() and into a new
> > riscv_resolve_ad_scheme(), called once from riscv_fill_hwcap(). For each of
> > the four possible Svade/Svadu combinations (inspired by [1]), it decides
> > whether software has to preset the A/D bits and, if so, sets
> > RISCV_ISA_EXT_svade to record that decision:
> > - neither present: assume Svade, since assuming Svade is harmless on real
> >   Svadu hardware, while assuming Svadu on real Svade hardware risks an
> >   unhandled page fault
> > - only Svade present: assume Svade
> > - only Svadu present: leave A/D management to hardware
> > - both present: Svade wins until Xen supports the SBI FWFT call needed to
> >   enable hardware updating of A/D bits, so assume Svade and warn that
> >   dropping 'svade' from the DT is the only way to get Svadu.
> > 
> > [1] https://lwn.net/Articles/980016/
> > 
> > Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> > ---
> > Changes since v1:
> > - change commit title
> > - expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
> > - move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
> >   called once from riscv_fill_hwcap().
> > - expose sbi_probe_extension() (was static) to probe for SBI FWFT.
> > - stop presetting A/D bits unconditionally in p2m_set_permission(), do it
> >   only when Svade is present.
> > ---
> >  xen/arch/riscv/cpufeature.c             | 59 +++++++++++++++++++++++++++++++++
> >  xen/arch/riscv/include/asm/cpufeature.h |  1 +
> >  xen/arch/riscv/include/asm/sbi.h        |  8 +++++
> >  xen/arch/riscv/p2m.c                    | 47 ++++++++++----------------
> >  4 files changed, 86 insertions(+), 29 deletions(-)
> > 
> > diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> > index 92235fdfd5..19454544a7 100644
> > --- a/xen/arch/riscv/cpufeature.c
> > +++ b/xen/arch/riscv/cpufeature.c
> > @@ -18,6 +18,7 @@
> >  
> >  #include <asm/cpufeature.h>
> >  #include <asm/csr.h>
> > +#include <asm/sbi.h>
> >  
> >  #ifdef CONFIG_ACPI
> >  # error "cpufeature.c functions should be updated to support ACPI"
> > @@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
> >      return false;
> >  }
> >  
> > +/*
> > + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
> > + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
> > + * that a page fault will be raised. In contrast, the Svadu extension supports
> > + * hardware updating of the PTE A/D bits.
> > + *
> > + * There are 4 possible combinations of these extensions in the device tree.
> > + * The default hardware behavior for each is:
> > + *
> > + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
> > + *    whether the platform uses Svade or Svadu. Xen should be prepared to
> > + *    handle either hardware updating of the PTE A/D bits or page faults when
> > + *    they need updating. In that case, Xen assumes Svade because it's
> > + *    harmless if the platform is actually Svadu, while assuming Svadu on real
> > + *    Svade hardware risks an unhandled page fault.
> > + *
> > + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
> > + *
> > + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
> > + *
> > + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
> > + *    at boot time by setting A/D bits. To use Svadu, the supervisor must
> > + *    explicitly enable it using the SBI FWFT extension.
> > + *
> > + * The Svade extension is mandatory and the Svadu extension is optional in the
> > + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
> > + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
> > + * get the benefit of Svadu until the SBI FWFT extension is available.
> > + *
> > + * In other words, hardware manages the A/D bits on its own only in case 3, in
> > + * all the other cases software has to preset them. Instead of open coding this
> > + * in every A/D bits user, RISCV_ISA_EXT_svade is used to mean "software is
> > + * responsible for the A/D bits" and is set here for the cases 1, 2 and 4.
> > + */
> > +static void __init riscv_resolve_ad_scheme(void)
> > +{
> > +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> > +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> > +
> > +    /* Case 3: leave the A/D bits management to hardware. */
> > +    if ( svadu && !svade )
> > +        return;
> > +
> > +    /* Case 4 */
> > +    if ( svadu && svade ){
> > +        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){
> 
> Nit (style): Brace placement.
Sorry for that. I will fix that in v3.
> Furthermore this is written in a way which Misra would call "dead code". I'd
> like to suggest (leaving out comments):
> 
>     if ( svadu )
>     {
>         if ( !svade )
>             return;
> 
>         if ( !sbi_probe_extension(SBI_EXT_FWFT) )
>             printk(...);
>     }
I assume you are referring to Misra C:2012 Rule 13.5 "The right operand
of a logical && or || operand shall not contain persistent side effect"

If yes, IMO, I think it doesn't apply here as `svade` is evaluated
before the `if` so there is no side effect that wouldn't have been
executed in case of svadu=false.

> 
> > +          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
> > +                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
> > +                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
> 
> Nit (style): Indentation (in multiple ways). Furthermore XENLOG_* needs
> repeating after every newline.
> 
> > +        }
> > +    }
> > +
> > +    /* Cases 1, 2: Xen assume Svade to be enabled */
> > +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
> 
> Isn't this a lie (to ourselves) then?
If you are talking about case 1:
    [1] Yes, it's technically a lie for boards shipped before
    the svade/svadu extension was ratified (e.g., HiFive Premier P550).
    These extensions merely formalized a mechanism that already existed in
    hardware.

    [2] For boards that do support svade, we could enforce DT
    declaration by adding it to `required_extension` as they are
    explicitly supporting it. However, doing so would cause boards
    without svade/svadu support (as described above) to hit a panic
    during boot.

    So in both case ([1], [2]), the svade extension exist either implicitely or
    explicitly. Therefore, force it doesn't compromize anything.

> 
> > --- a/xen/arch/riscv/include/asm/sbi.h
> > +++ b/xen/arch/riscv/include/asm/sbi.h
> > @@ -30,6 +30,7 @@
> >  #define SBI_EXT_BASE                    0x10
> >  #define SBI_EXT_RFENCE                  0x52464E43
> >  #define SBI_EXT_TIME                    0x54494D45
> > +#define SBI_EXT_FWFT                    0x46574654
> >  
> >  /* SBI function IDs for BASE extension */
> >  #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> > @@ -138,6 +139,13 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
> >  int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
> >                                  size_t size, unsigned long vmid);
> >  
> > +/**
> > + * Check if an SBI extension ID is supported or not.
> > + * @extid: The extension ID to be probed.
> > + *
> > + * @return: 1 or an extension specific nonzero value if yes, 0 otherwise.
> > + */
> > +int sbi_probe_extension(long extid);
> >  /*
> 
> Nit (style): Also add a blank line.
> 
> > --- a/xen/arch/riscv/p2m.c
> > +++ b/xen/arch/riscv/p2m.c
> > @@ -586,42 +586,31 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
> >  
> >  static void p2m_set_permission(pte_t *e, p2m_type_t t)
> >  {
> > +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
> > +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
> > +
> >      e->pte &= ~PTE_ACCESS_MASK;
> >  
> >      e->pte |= PTE_USER;
> >  
> >      /*
> > -     * Two schemes to manage the A and D bits are defined:
> > -     *   • The Svade extension: when a virtual page is accessed and the A bit
> > -     *     is clear, or is written and the D bit is clear, a page-fault
> > -     *     exception is raised.
> > -     *   • When the Svade extension is not implemented, the following scheme
> > -     *     applies.
> > -     *     When a virtual page is accessed and the A bit is clear, the PTE is
> > -     *     updated to set the A bit. When the virtual page is written and the
> > -     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
> > -     *     address translation is in use and is not Bare, the G-stage virtual
> > -     *     pages may be accessed or written by implicit accesses to VS-level
> > -     *     memory management data structures, such as page tables.
> > -     * Thereby to avoid a page-fault in case of Svade is available, it is
> > -     * necessary to set A and D bits.
> > -     *
> > -     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
> > -     *       delegates page faults to a lower privilege mode and so OpenSBI
> > -     *       isn't expect to handle page-faults occured in lower modes.
> > -     *       By setting the A/D bits here, page faults that would otherwise
> > -     *       be generated due to unset A/D bits will not occur in Xen.
> > -     *
> > -     *       Currently, Xen on RISC-V does not make use of the information
> > -     *       that could be obtained from handling such page faults, which
> > -     *       could otherwise be useful for several use cases such as demand
> > -     *       paging, cache-flushing optimizations, memory access tracking,etc.
> > +     * riscv_fill_hwcap() sets either RISCV_ISA_EXT_svade or
> > +     * RISCV_ISA_EXT_svadu (mutually exclusive) depending on the Svade/Svadu
> > +     * device tree combination (see riscv_resolve_ad_scheme()):
> > +     * - RISCV_ISA_EXT_svade means that software is responsible for the A/D
> > +     *   bits.
> > +     * - RISCV_ISA_EXT_svadu means the hardware is responsible for the A/D
> > +     *   bits.
> >       *
> > -     *       To support the more general case and the optimizations mentioned
> > -     *       above, it would be better to stop setting the A/D bits here and
> > -     *       instead handle page faults that occur due to unset A/D bits.
> > +     * Currently, when RISCV_ISA_EXT_svade is set, Xen doesn't track A/D
> > +     * bits, so it does not make use of the information that could be
> > +     * obtained from handling the resulting page faults, which could
> > +     * otherwise be useful for several use cases such as demand paging,
> > +     * cache-flushing optimizations, memory access tracking, etc. To avoid
> > +     * such a page fault, Xen presets the A and D bits instead.
> >       */
> > -    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
> > +    ASSERT(svade != svadu); /* exactly one of svade/svadu must be set by riscv_fill_hwcap() */
> 
> Here I'm lost: riscv_resolve_ad_scheme() specifically handles the "both set"
> case. How can you then assert that exactly one of them is set?
Because in the future, with SBI FWFT support, both extensions could be
supported by the hardware and listed in the DT. Xen could still assume
that only Svadu is turned-off at boot time but then, to use Svadu, it
should explicitly enable it by using SBI FWFT extension.

I agree it's not needed right now. I'll drop it until then.
> 
> Apart from this the line is also too long and the comment doesn't match our
> style.
> 
> Jan



