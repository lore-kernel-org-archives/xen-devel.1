Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DFECA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:02:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447066.1663230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbD6-0008EX-Vv; Tue, 13 Oct 2026 12:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447066.1663230; Tue, 13 Oct 2026 12:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbD6-0008EQ-SI; Tue, 13 Oct 2026 12:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1447066;
 Tue, 13 Oct 2026 12:02:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGbD4-0008E1-Ty
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 12:02:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbD4-00FHrU-AV
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:02:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a135245ff60008425@swg.vates.tech>)
 id 6ace1dcc-8faa-0a2a0a5109dd-0a2a4504b27c-24
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:02:22 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a135245ff60008425@swg.vates.tech>)
 id 6ace1dcd-b57f-0a2a45040019-b9ff1c2293e7-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 14:02:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a135245ff60008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 12:02:18 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 098D482A53;
 Tue, 13 Oct 2026 14:02:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=vH4ryhxHfjpxScZaR+5GHwUz3vel3IrdJ29Pjj07wag=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=O8dyIsjWwEi6ggWBJIXSuMVyGHi2wEMA9c0GogfYlfiX30fppMBc2GbkU8gJtvtzWD6aeVAh5
 YD35k29joE8lINrKNsqHL48ErkwWliq/wGn/CvVk6zm7dmY1FmGe9RkSZp+07H2enf2e4yN6Zu0
 z/zEOczbKKbJquicf6VSC41+B05kKlpBkmZPeh4ZcDPaNyMboOHO5SUSjZ+pgEJnZ/hDRwdbZd+
 5K2t+ckY0nDJNxoWNOh667qO/P/Y34na9xqY+5qiToGZ6S6z1ambX8XSZzRA/6eRjhd0XIRkJCq
 /zxd92nqj7y6iSQD2gZ+8mkMXChbPEk5dmftzaa2Y/pA==
X-Zone-Loop: 31308d98c1f42c3f49b93cf9198d3ef3754626494cd8
x-campaign-type: default
x-transaction-id: dbffd92a-cd62-47a1-a25b-0d1feaacf644
x-swg-uid: 01-3c070210-9773-48a7-8d16-670b0725eaa4
X-Mailer: Sweego
Message-ID:
 <1791892938.8631fc262581453bbf619ec5b2062170.1a135245ff60008425@vates.tech>
x-swg-bid: 1791892938.8631fc262581453bbf619ec5b2062170.1a135245ff60008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 3/4] xen/riscv: fix A/D bits in Xen's page-table
 mappings
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
In-Reply-To: <f03043d3-740b-4e85-ab53-a7a19adc5f6c@suse.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb191b0008425@vates.tech>
 <f03043d3-740b-4e85-ab53-a7a19adc5f6c@suse.com>
Date: Tue, 13 Oct 2026 14:02:12 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791892932; l=3302;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=E73gw/8OOuaTvII//aH+XeLD9kXOIetzLop9Zywi2ps=;
 b=Cfh0Y+fitdviDMxZHimArV9ZKpf87tX9LsiD6beaoFGsvF6PieJUoh9A2RS/D+bxtPmhVBa8c
 BUj99m3foMiAkMHELwAXUH454kFlgICs7o3dbjp1bfvwUKB9J7l5knO
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791892938226
X-purgate-ID: tlsNG-ebf023/1791892942-C3EC6B50-94130788/10/73395122804
X-purgate-type: spam
X-purgate-size: 3302

On 2026-10-13 12:43 +0200, Jan Beulich wrote:
> On 13.10.2026 12:07, Baptiste Le Duc wrote:
> > Xen does not handle page faults caused by clear A/D bits, so it presets
> > them when creating PTEs. pt_update_entry() does so, but three places build
> > leaf PTEs directly without going through it: setup_initial_mapping() (the
> > boot page tables), check_pgtbl_mode_support() (the temporary root entry
> > used to probe SATP mode support) and arch_pmap_map() (the fixmap).
> > 
> > Without Svadu, all three fault on first access. For
> > check_pgtbl_mode_support(), the fault is raised by the instruction fetch
> > right after the SATP write, before any trap handler is set.
> > 
> > Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
> > PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
> > all cases for consistency with pt_update_entry() which sets it at runtime.
> > 
> > This fixes arch_pmap_map() for free, since it already builds its PTE from
> > PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> > its default, text and rodata permissions, and check_pgtbl_mode_support() to
> > use PAGE_HYPERVISOR_RX for its temporary root entry. The latter drops
> > PTE_WRITABLE, going from RWX to RX, but this is harmless, as that entry
> > only has to make the current instruction stream fetchable between the two
> > CSR_SATP writes, and nothing writes through it.
> > 
> > Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> > open-coded site above leaves it with no user outside page.h itself.
> > 
> > pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
> > of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
> > masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
> > carries A and D, a reserved PTE with A or D set would no longer be caught.
> > Mask with the V, R and W bits explicitly instead, and factor the check out
> > into pte_has_reserved_rwx().
> > 
> > Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> > Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes since v5:
> > - no changes, already reviewed and waiting to be merged.
> 
> I'm puzzled by this, also seen in the next patch: For one, nothing is said
> anywhere that patches 3 and 4 are independent of patches 1 and 2, and
> hence could go in ahead of those. And then, formally, neither patch is
> ready for committing - Oleksii's R-b isn't enough at this point. I would
> have ack-ed the last patch if that didn't - contextually - depend on the
> one here. I'm only going to ack the one here once either it is clarified
> that it's independent of the first two patches, or once agreement was
> reached on those earlier patches. (If this was independent, though, I
> would have expected it to have got moved to the front of the series, to
> disambiguate whether it may go in already.)
Sorry I wasn't aware of that. I will put the last patch first in the
next revision as it is independent of the other ones. Thanks for
clarifying.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

