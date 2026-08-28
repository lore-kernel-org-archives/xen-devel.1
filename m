Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D214BC61DC6
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 08:30:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401759.1637285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzryC-0001op-C8; Fri, 28 Aug 2026 08:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401759.1637285; Fri, 28 Aug 2026 08:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzryC-0001oi-9E; Fri, 28 Aug 2026 08:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1401759;
 Fri, 28 Aug 2026 08:29:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0477d3954000c4f3@swg.vates.tech>)
 id 1wzryA-0001oc-EG
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:29:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzry8-00E43E-Pe
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 10:29:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0477d3954000c4f3@swg.vates.tech>)
 id 6a9146f4-2eae-0a2a0a5409dd-0a2a4506ec42-18
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:29:48 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0477d3954000c4f3@swg.vates.tech>)
 id 6a9146fb-195a-0a2a45060019-b9ff1c2395c7-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 10:29:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0477d3954000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Aug 2026 08:29:44 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 443A681F21;
 Fri, 28 Aug 2026 10:29:43 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/DizAnrA4pBdfKkD8PpABLQia3/tP+9xpDqqE9BnX/4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=IVVhjJ6b83W0JGfZzDK/zavQcdu1ayPYfK16u5oEzoM20wPkJx0cBE8aV1ZkFmUILp18nPm1F
 kcRJ86IDOSMiao0vkW1tHzdVdPutTUKDl7PH+lrURxK9JcocFimcw4E9q1GmK7WIwf+npjbGGlC
 ZFWubADjGa2NIihIkiR8Cu21bVwY8KNQpRR7ZM5MSmFUqAbZvSLSYFOqYFT42M0kKWA+1JY7Bvm
 VWMMi+nkyV/HcxnAWz8gtD5tJzhbTWMlR+A08QIcUasi9kRX3plKwnSuYLV1ThelOFrRyCzrCVS
 ZTeIc6Ivhlg2jE7AhDwH7PBeS27aDCr1k/hAEL47/h8A==
X-Zone-Loop: 8b2d2254ef00eb337c067ae4ed8f0e1e13fa5aeced00
x-campaign-type: default
x-transaction-id: b0feec2c-0e20-46be-9675-393d20f6a89f
x-swg-uid: 01-49215b67-0565-46e4-80ed-1c517a94a648
X-Mailer: Sweego
Message-ID:
 <1787905784.8631fc262581453bbf619ec5b2062170.1a0477d3954000c4f3@vates.tech>
x-swg-bid: 1787905784.8631fc262581453bbf619ec5b2062170.1a0477d3954000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 5/5] xen/riscv: add SFENCE.VMA after enabling paging
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, zhangzheng@iscas.ac.cn, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <f22db381-40c1-4928-85a4-5019da6a9c07@gmail.com>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
 <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
 <9e4778fa-3164-49bc-a921-ce6b251b5db5@gmail.com>
 <f22db381-40c1-4928-85a4-5019da6a9c07@gmail.com>
Date: Fri, 28 Aug 2026 10:29:37 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787905783; l=4650;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=M08mTRxVE0D5+bHJkCBbCH5IQ0DXFvcTqRRnUEa63Hk=;
 b=oEioOmSgKOcnob6ZYJGxvyyaJZLR4btxB33Xte7w1dMWI9dsaoAGfFmY5+wUgvCGN1Rohh2X9
 TcATHegIzMxDrVm9iqIowu2d5QsUJzB+yfflB4RkSrIPs8cuQfkX2tg
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787905783486
X-purgate-ID: tlsNG-16d1c6/1787905788-FD20877B-234B41DE/0/0
X-purgate-type: clean
X-purgate-size: 4654

On 2026-08-28 10:11 +0200, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 6:53 PM, Oleksii Kurochko wrote:
> > 
> > 
> > On 8/27/26 5:33 PM, Baptiste Le Duc wrote:
> >> turn_on_mmu() writes satp to switch on Sv39 paging but never fences
> >> afterwards.
> >>
> >> Xen never allocates a non-zero ASID, so per the Privileged spec, sec.
> >> 12.2.1 "Supervisor Memory-Management Fence Instruction":
> >>
> >>    "If the implementation does not provide ASIDs, or software chooses
> >>    to always use ASID 0, then after every satp write, software should
> >>    execute SFENCE.VMA with rs1=x0."
> >>
> >> The spec text around this rule hedges with "may be necessary", but
> >> RISC-V spec co-author Andrew Waterman confirmed on the ISA manual
> >> issue tracker that the fence after a satp write is not optional in
> >> this case: "The SFENCE after the SATP write is definitely necessary
> >> ... In general, you need to SFENCE after you've recycled an ASID.
> >> Since we don't use ASIDs in the Linux kernel yet, every context
> >> switch is effectively an ASID reuse, hence the full TLB flush." [1]
> >> The same reasoning applies to Xen: with ASID always 0, this satp
> >> write is indistinguishable from an ASID reuse to the hart, so the
> >> fence is required for correctness.
> > 
> > But at the moment of execution of turn_on_mmu() we don't use any ASID, 
> > do we? It was used in check_pgtbl_mode_support() but at the end it is done:
> > 
> >      csr_write(CSR_SATP, 0);
> > 
> >      sfence_vma();
> > 
> > So basically Bare mode + flush all TLBs presented before and then up to
> > 
> > ...
> > 
> >>
> >> Add the missing SFENCE.VMA to order those page-table stores before
> >> the hart's first translation under the new mapping.
> >>
> >> [1] https://github.com/riscv/riscv-isa-manual/issues/226
> >>
> >> Fixes: f5035d480f7a ("xen: add files needed for minimal riscv build")
> >> Assisted-by: Claude:claude-opus-5
> >> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> >> ---
> >>   xen/arch/riscv/riscv64/head.S | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/ 
> >> head.S
> >> index 9c40512e61..7f6edc972f 100644
> >> --- a/xen/arch/riscv/riscv64/head.S
> >> +++ b/xen/arch/riscv/riscv64/head.S
> >> @@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
> >>           srli    t1, t1, PAGE_SHIFT
> >>           or      t1, t1, t0
> >>           csrw    CSR_SATP, t1
> > 
> > ... ASID isn't used as we are in Bare mode.
> > 
> > What am I missing?
> 
> After the conversation with Jan B. in the separate thread I re-read 
> documentaion and found that ASID=0 will be used here too as after 
> check_pgtbl_mode_support() we set Bare mode and ASID 0 will be really 
> used even in Bare mode as to select MODE=Bare as software must write 
> zero to the remaining fields of satp (bits 30–0 when SXLEN=32, or bits 
> 59–0 when SXLEN=64) what automatically includes field ASID (so it will 
> be zero).
> 
> But still the full reason why we need sfence.vma here is that TLB could 
> be polluted with identity mapping (even in Bare mode) and which will be 
> tagged by ASID=0.
> 
> So what about to update commit message with:
> ```
> xen/riscv: flush speculatively cached Bare-mode TLB entries in turn_on_mmu()
> 
> The existing SFENCE.VMA before the satp write only orders the page table
> stores from setup_initial_pagetables() against subsequent implicit reads.
> It does not prevent the CPU from speculatively caching translations 
> after the fence retires.
> 
> According to the RISC-V Privileged specification, implementations are
> permitted to speculatively cache Bare-mode identity mappings. Furthermore,
> selecting MODE=Bare (which happens during check_pgtbl_mode_support())
> requires zeroing the remaining fields of satp, causing ASID=0 to be
> actively used in Bare mode. Consequently, the TLB can be polluted with Bare
> identity mappings tagged with ASID=0.
> 
> Once satp is written to enable Sv39 translation, these cached identity
> mappings (tagged with ASID=0) can shadow the true Sv39 translations.
> This would lead to translation failures since turn_on_mmu() jumps to
> a non-identity-mapped linker address.
> 
> Fix this by adding a post-satp-write SFENCE.VMA to invalidate any stale
> translations (including Bare-mode identity mappings under ASID=0) before
> jumping to the virtual address space.
> ```
> 
> ~ Oleksii
> 
I read the thread and I'm ok with this suggestion.
Thanks.
> 
> 



