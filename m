Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C4CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 14:33:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447959.1663907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdYt-00064r-Aw; Tue, 13 Oct 2026 14:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447959.1663907; Tue, 13 Oct 2026 14:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdYt-00064k-8L; Tue, 13 Oct 2026 14:33:03 +0000
Received: by outflank-mailman (input) for mailman id 1447959;
 Tue, 13 Oct 2026 14:33:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@swg.vates.tech>)
 id 1xGdYs-00064c-E5
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:33:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGdYr-008INE-QC
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:33:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@swg.vates.tech>)
 id 6ace4118-8faa-0a2a0a5109dd-0a2a450bc4bc-24
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:33:01 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@swg.vates.tech>)
 id 6ace411d-b7e8-0a2a450b0019-b9ff1c23a9dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:33:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a135ae53690008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 14:32:59 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7CCCE82AC1;
 Tue, 13 Oct 2026 16:32:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=175D5jhR8LtrrcoaZGhXaKt7LAOn7bOeuXP10amTjjE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=V66Ltl40876c1KfT4Bp+4/naw+gKqQlh2yYohMkq/Zq4VSc+aAYGj+dhf+22O4+x/014R0ejH
 8zmWG8GP3neN/if8OLTVYFqzqCKhmZze4JlGgTx7SPdYl4dtIR1O5qc50saRZ/gt8W+Mp2k+uSo
 vAVYglLphC/65v0bDUN9wqdLlSyUR2eGqLVlc1M+yHnhBpUMSnlBHSOdwGdgRpbkB80yRdI2Xrs
 EQNPpkBTEHL42JOOROWw45UwFgN4COS/qsYbzUQge6NvPCKQCNxtkppJXy4/oPkthMxVDL60YEq
 oltwS8mzvlxdKellXrP2azKf2NZO+J9OU1OL+huJuT2Q==
X-Zone-Loop: c75b45008d7691d0b5408dbf61df685e69bafffc4208
x-campaign-type: default
x-transaction-id: 779fd0da-9d66-426b-9910-c8154a516f25
x-swg-uid: 01-df09542c-2016-486a-8dd4-063ce9fcde7d
X-Mailer: Sweego
Message-ID:
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
x-swg-bid: 1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425
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
Date: Tue, 13 Oct 2026 16:32:52 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791901973; l=1903;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=qcFkZYCkTx0zYutf6aDU8vl9CZ5fXy72ZTfR1yp5ikU=;
 b=s9xFap/Vzo0m6qL7bXgeSnjzYZDodSmWO2DfznTNjVzLZB238C6n1WM8jvHeo3rdtC5v6OtFC
 lBmRYh03nJlB6OKmds6AcirqpfMkTUccYYuvORr8jR8cwR5A4Mwp00J
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791901978709
X-purgate-ID: tlsNG-42698a/1791901981-A88C99EA-4C61047D/0/0
X-purgate-type: clean
X-purgate-size: 1903

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

If I check that A was set, can I drop the "updated" variable? The A bit
would tell us more than whether the load succeeded.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

