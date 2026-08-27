Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C65C61DD4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:33:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401167.1636941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6u-0004o8-GQ; Thu, 27 Aug 2026 15:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401167.1636941; Thu, 27 Aug 2026 15:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc6u-0004nj-AP; Thu, 27 Aug 2026 15:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1401167;
 Thu, 27 Aug 2026 15:33:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@swg.vates.tech>)
 id 1wzc6t-0004jQ-0K
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:33:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzc6s-009mXR-9u
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:33:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@swg.vates.tech>)
 id 6a9058d6-bab6-0a2a0a5309dd-0a2a450be46e-12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:46 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@swg.vates.tech>)
 id 6a9058d9-b7e8-0a2a450b0019-b9ff1c12a07f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:33:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a043dad5be000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 15:33:30 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 85ED883BA7;
 Thu, 27 Aug 2026 17:33:29 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=i+HHq2A31VQb2g0bdrLz5UpxPcOvqCH0udYV5TPCDME=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=lGSlBITXmfankS51hczo2ipy6y9H1e4NMM6p0eUTdYptAEROv7sCPLjQZ8DbASUPFjRfxof98
 gybPD4j2ZgCf+aXUNe7zcCTVLnk8nEfnVbtFNEIYiLYZZU1BOy6JT1Q1l9b9cueZMxrgn8nmDm/
 latsATuPJ99wfJr8jUI+yrquobdTa+yaLsm1oGOyIaBCilqhF3/WBfHHBcaRuS6AOQ1liAy6Jm0
 iDG/IOQQ/sMNuOjwR5qeO8GlrlrSv1fQr+OLB2aSQ19WhCywXHa04+Sq/OPBCBaIdQyS4Lo92qR
 bswzFEIT6+q7c/ZRpnEvAL1q4sZCOcX8y5zjqw6M+VqA==
X-Zone-Loop: 8dd3241f923ac5462f190502a8fbde2faeef09ccf148
x-campaign-type: default
x-transaction-id: 590e34cd-8d8c-4ef1-b2da-a78619f557c2
x-swg-uid: 01-101f5d24-f1c3-4260-9a82-43a570afc621
X-Mailer: Sweego
Message-ID:
 <1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3@vates.tech>
x-swg-bid: 1787844810.8631fc262581453bbf619ec5b2062170.1a043dad5be000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: zhangzheng@iscas.ac.cn,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] xen/riscv: add SFENCE.VMA after enabling paging
Date: Thu, 27 Aug 2026 17:33:19 +0200
In-Reply-To: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
References: <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787844809736
X-purgate-ID: tlsNG-42698a/1787844826-AAAD89EA-3FF432D2/0/0
X-purgate-type: clean
X-purgate-size: 1850

turn_on_mmu() writes satp to switch on Sv39 paging but never fences
afterwards.

Xen never allocates a non-zero ASID, so per the Privileged spec, sec.
12.2.1 "Supervisor Memory-Management Fence Instruction":

  "If the implementation does not provide ASIDs, or software chooses
  to always use ASID 0, then after every satp write, software should
  execute SFENCE.VMA with rs1=x0."

The spec text around this rule hedges with "may be necessary", but
RISC-V spec co-author Andrew Waterman confirmed on the ISA manual
issue tracker that the fence after a satp write is not optional in
this case: "The SFENCE after the SATP write is definitely necessary
... In general, you need to SFENCE after you've recycled an ASID.
Since we don't use ASIDs in the Linux kernel yet, every context
switch is effectively an ASID reuse, hence the full TLB flush." [1]
The same reasoning applies to Xen: with ASID always 0, this satp
write is indistinguishable from an ASID reuse to the hart, so the
fence is required for correctness.

Add the missing SFENCE.VMA to order those page-table stores before
the hart's first translation under the new mapping.

[1] https://github.com/riscv/riscv-isa-manual/issues/226

Fixes: f5035d480f7a ("xen: add files needed for minimal riscv build")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/riscv/riscv64/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 9c40512e61..7f6edc972f 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
         srli    t1, t1, PAGE_SHIFT
         or      t1, t1, t0
         csrw    CSR_SATP, t1
+        sfence.vma
 
         jr      a0
 END(turn_on_mmu)

