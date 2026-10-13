Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51732CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 11:58:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447058.1663220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGb8w-0006VO-9u; Tue, 13 Oct 2026 11:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447058.1663220; Tue, 13 Oct 2026 11:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGb8w-0006VH-7L; Tue, 13 Oct 2026 11:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1447058;
 Tue, 13 Oct 2026 11:58:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1352076650008425@swg.vates.tech>)
 id 1xGb8v-0006V2-85
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:58:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGb8u-001ree-L3
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 13:58:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1352076650008425@swg.vates.tech>)
 id 6ace1cc4-8faa-0a2a0a5109dd-0a2a4503a3aa-36
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:58:04 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1352076650008425@swg.vates.tech>)
 id 6ace1ccc-fae8-0a2a45030019-b9ff1c128637-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 13:58:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1352076650008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 11:58:02 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8EFB4827DA;
 Tue, 13 Oct 2026 13:58:01 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=jlH5NbqAOH1MTnY6GYHY4LB8qfq/5ty+AI5nIqMo93o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=fWAupGOBej2Oy0rSg1ncrIqO3LuvR/AkisgAaxdOMDYxRz/gBL8Udy0geSGqRapF+A2eKEEXR
 wyErLrvkNxpS/GTd76tW/aMrgVrOS+3t8rHlKtysZn61k0hUzPK5SNdgKx8SciFfu7wjJfaLQHV
 dAxcJFkAVdwNzMjW6zPZu7sOIhao6kgsNnJNpth2LjwkQdOIEalNNqHuub0ruBMxzLfGM0q5OC1
 tnH1YHKucSLydNOsav6jTtDYbMskUKKhOie4dkrRx4PIrRBjctf1rmGDb5IoPop8Aci44QAltP6
 biDCaMZvWVw4liLVjD2B1H0LS9CUB9zIZgE3V9buARfg==
X-Zone-Loop: af9a13719ebc29d1a885dc2cc64fa44cc7e17218230a
x-campaign-type: default
x-transaction-id: d9e15f8d-2ad5-47c7-84ee-4a013b031c97
x-swg-uid: 01-cab0f3a3-358c-4c44-8454-e1310414f82b
X-Mailer: Sweego
Message-ID:
 <1791892682.8631fc262581453bbf619ec5b2062170.1a1352076650008425@vates.tech>
x-swg-bid: 1791892682.8631fc262581453bbf619ec5b2062170.1a1352076650008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme
 at boot
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
In-Reply-To: <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
Date: Tue, 13 Oct 2026 13:57:56 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791892676; l=4006;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=+LcknYPnhKs9gYEONHko0QbEaF3wRIXTL8NmWlffUJg=;
 b=b7uC8eD3TLUwg8FLHW/GudOM5cxIAHTZwnDCZi3IYcXB+qvnYzEZ7F8zqx9H2yNB9tIvBK2j4
 bz9Fj4yGLcaBkP8JtiUEDJz1vpek4ocToIukmScjeW4CT8rTmE2PIE+
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791892681780
X-purgate-ID: tlsNG-33051d/1791892684-766FB4E9-FAB8AC6D/0/0
X-purgate-type: clean
X-purgate-size: 4006

On 2026-10-13 12:36 +0200, Jan Beulich wrote:
> On 13.10.2026 12:07, Baptiste Le Duc wrote:
> > @@ -620,6 +623,98 @@ static void __init compute_guest_isa(void)
> >          panic("Failed to build guest \"riscv,isa\" string\n");
> >  }
> >  
> > +static bool __init probe_hw_ad_update(void)
> > +{
> > +    bool updated = false;
> > +    unsigned int slot = FIX_MISC;
> > +    vaddr_t va = FIXMAP_ADDR(slot);
> > +    struct page_info *pg;
> > +    pte_t *entry, pte;
> > +    mfn_t mfn;
> > +    unsigned long tmp;
> > +
> > +    pg = alloc_domheap_page(NULL, 0);
> > +    if ( !pg )
> > +        return false;
> 
> Why would you need a fresh page here? Can't you create a secondary mapping
> of a page already in use (e.g. one from Xen's .data or .bss section, or the
> stack page you're running on)?
You're right, I will map the current stack page.
> 
> > +    mfn = page_to_mfn(pg);
> > +
> > +    arch_pmap_map(FIX_MISC, mfn);
> > +    entry = &xen_fixmap[slot];
> > +    pte = pte_from_mfn(mfn, PTE_VALID | PTE_READABLE);
> > +    write_pte(entry, pte);
> > +
> > +    flush_tlb_one_local(va);
> > +
> > +    asm_inline volatile (
> > +        "1: ld %[tmp], 0(%[va])\n"
> > +        "   li %[updated], 1\n"
> 
> If you mapped the stack page, you could preset a variable there to 1, load
> from the alias mapping of that variable, and then avoid the LI altogether.
Yes mapping the stack page appears to be the best way.
> 
> > +        "2:\n"
> > +        ASM_EXTABLE(1b, 2b)
> > +        : [tmp] "=&r" (tmp), [updated] "+r" (updated)
> > +        : [va] "r" (va)
> > +        : "memory" );
> > +
> > +    arch_pmap_unmap(slot);
> > +    free_domheap_page(pg);
> > +
> > +    return updated;
> > +}
> 
> Imo you'd better check that A also was actually set in the PTE.
Right, I will do that.
> 
> > +
> > +    /* Neither advertised: trust the probe. */
> > +    __set_bit(has_hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
> > +              riscv_isa);
> 
> Hmm, this feels fragile. Other schemes are possible, e.g. A being updated
> by hardware but D being left to software. Are such truly precluded by the
> spec, including older versions thereof? Furthermore, probe_hw_ad_update()
> can (right now) return false for unrelated reasons.
Since 1.10 the spec lists exactly two schemes, and each one covers A and
D together: either a clear A (or a clear D on a store) raises a page
fault, or hardware sets the corresponding bit(s). A-bit being set by
hardware while D is left to software isn't one of them. Before 1.10, the
hardware must set the two bits. Therefore, there is not other schemes
possible.
> As a consequence, patch 2 imo also can't leave the A/D pre-setting unaltered.
> It perhaps needs doing unless Svadu is positively identified as present.
I agree it is more robust to preset A/D bits unless Svadu is truly
identified, i.e. advertised in the DTS (without Svade) and confirmed by
probe_hw_ad_update(). The worst case then becomes the probe failing for
an unrelated reason on hardware which does update A/D: we'd preset A/D
needlessly, which is harmless, as hardware only writes the PTE when a
bit is clear.

To sum up, and to avoid unnecessary respins, would you be fine with:
1) Keeping the probe as it is, with your remarks addressed (map stack page).
2) Presetting A/D bits unless Svadu is truly identified as above.
> 
> > --- a/xen/arch/riscv/include/asm/cpufeature.h
> > +++ b/xen/arch/riscv/include/asm/cpufeature.h
> > @@ -42,6 +42,7 @@ enum riscv_isa_ext_id {
> >      RISCV_ISA_EXT_sstc,
> >      RISCV_ISA_EXT_svade,
> >      RISCV_ISA_EXT_svpbmt,
> > +    RISCV_ISA_EXT_svadu,
> 
> Isn't there some sort of sorting in effect here?
No, as it is mentioned in the docstring that:
    * New extensions should just be added to the bottom, rather than added
    * alphabetically, in order to avoid unnecessary shuffling.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

