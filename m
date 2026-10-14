Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445BDCC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 14:53:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449172.1665094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0Lx-0000M6-Jm; Wed, 14 Oct 2026 14:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449172.1665094; Wed, 14 Oct 2026 14:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH0Lx-0000Lz-GV; Wed, 14 Oct 2026 14:53:13 +0000
Received: by outflank-mailman (input) for mailman id 1449172;
 Wed, 14 Oct 2026 14:53:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ae728540008425@swg.vates.tech>)
 id 1xH0Lw-0000Lp-G8
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:53:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH0Lv-004GmY-Ss
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:53:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ae728540008425@swg.vates.tech>)
 id 6acf9740-8faa-0a2a0a5109dd-0a2a4502cdfc-48
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:53:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13ae728540008425@swg.vates.tech>)
 id 6acf9757-6ca4-0a2a45020019-b9ff1c229abb-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 16:53:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13ae728540008425.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 14:53:10 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4499480518;
 Wed, 14 Oct 2026 16:53:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VPGjiL5Gr7QmVv6D45rLscXsuEgvxRdXY0WeTbPWY/Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=eBpK81UR4xKL/52yZKrMbsjls9CTvbNhP2Dl2FF8OKyN7XWmfcnIO5yyRFUgEM50wysQIDDlc
 hIWPQDZb1iUQ+L4CODTaLdy9chAQMGsfuPfjWZQpKTqzvlTfyYp6ZeEVCBtg3G7FBoE6wWFKDvt
 sSi0KOEjwhZ0j1rjtLl2Dv0jAF+mMgImpxcCw9OKBUHWTP8//EG3UM5cQ5HVbyRR9V1vflsEFZd
 wQgItoBFp+gQw3fOyY5ogQi3xVp2V1TJoBY7qVIfRKhAcyH7qTOEqpNm4lYIDf2vlLMF1seDrmi
 ugcny1l2YA+bjDCYUe8ldCaeFB32SlhAzrec4uyBBWDg==
X-Zone-Loop: 1f43e03f673d2efe885a1ff4ea9501d544451772dce6
x-campaign-type: default
x-transaction-id: 075d6783-1ec9-40c1-9189-5ece103183be
x-swg-uid: 01-0d089ff4-9070-444a-b30c-190f3acee227
X-Mailer: Sweego
Message-ID:
 <1791989590.8631fc262581453bbf619ec5b2062170.1a13ae728540008425@vates.tech>
x-swg-bid: 1791989590.8631fc262581453bbf619ec5b2062170.1a13ae728540008425
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
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
In-Reply-To: <3e9e986b-f996-4154-93c1-a07b1f432e71@gmail.com>
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886039.8631fc262581453bbf619ec5b2062170.1a134bb191b0008425@vates.tech>
 <3e9e986b-f996-4154-93c1-a07b1f432e71@gmail.com>
Date: Wed, 14 Oct 2026 16:53:03 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791989584; l=2412;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=TT1RMZ8bP2u4E3+aUazbZoLn6grsUWTCaznTNJ6I1zw=;
 b=7r5jzq7Nv4Y/Ury374pGEZDuCtGbzaO6Z2JKrvWT1kputwlML6Ew9o/WH45VF8RqTqjQ6ibbL
 f1VtT5wJt1cABeUXuaSqEFGEn2lEV0UCbxN5X42YsgBXYVBpa2gO6g2
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791989589481
X-purgate-ID: tlsNG-720697/1791989591-F1CAA2AC-82D09E59/0/0
X-purgate-type: clean
X-purgate-size: 2412

On 2026-10-14 11:59:43+02:00, Oleksii Kurochko wrote:
> On 10/13/26 12:07 PM, Baptiste Le Duc wrote:
> 
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
> 
> I think I missed to mentioned that before, sorry:
> 
> arch_pmap_map() was introduced by f89e1a170299 ("xen/riscv: introduce
> asm/pmap.h header"), so perhaps add a 2nd Fixes: tag.
Thanks, will apply this in next version.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

