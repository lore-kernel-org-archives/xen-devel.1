Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F478C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:35:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414231.1644036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBa-00047K-Tz; Thu, 10 Sep 2026 09:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414231.1644036; Thu, 10 Sep 2026 09:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bBa-00047D-Qu; Thu, 10 Sep 2026 09:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1414231;
 Thu, 10 Sep 2026 09:35:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@swg.vates.tech>)
 id 1x4bBa-0003zD-7V
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:35:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4bBZ-004vNh-KY
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:35:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@swg.vates.tech>)
 id 6aa279cb-8faa-0a2a0a5109dd-0a2a45038d98-16
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:13 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@swg.vates.tech>)
 id 6aa279d0-fae8-0a2a45030019-b9ff1c128343-4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:35:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aaba238000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:34:59 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 83BF281E02;
 Thu, 10 Sep 2026 11:34:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=X/8cvkaIvfN4ORXWCv9sGu6JJ/CUQev1gsouw1gwXDY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=d/KG/E5Q+6iDzxx3DY1MpAJVlJrQCl6ys/adIosnB5+2AvYOPRsIbhtMZXkOOfkO5Kn2CB5VW
 Oe8xpHjg9wx//KDw1j7OLqyse56/wWEOdHC9TwkqxC3bDdH1hvEMXYx0LoMt0QvS9aQC0HmBQYQ
 67hIk499KEw0temB4z9eGtgA7Ew42nBgiSJImPuReLdOv+0LR79hFR3zpE/qrZ6oYFtkPJhNoCG
 BRihAJ8MnT5mPzkGm/vCvL246ETTVglJkjIS2BKIjj+WIbx+o/txvIMf/yhUMOksuSoTm7lKw69
 Wg3wca7dXQDcPT78GUmiToWe2JyxNX/C4qxPbZvZqfIA==
X-Zone-Loop: 2eb777688ec98a335e6d365e5d176e2b551c73a96b11
x-campaign-type: default
x-transaction-id: c0c46c87-1c28-4fce-8319-2dae7e389f67
x-swg-uid: 01-e7b1a648-d90d-48ff-b090-12dd9535cc96
X-Mailer: Sweego
Message-ID:
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@vates.tech>
x-swg-bid: 1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 5/6] xen/riscv: flush speculatively cached Bare-mode TLB entries in turn_on_mmu()
Date: Thu, 10 Sep 2026 11:34:53 +0200
In-Reply-To: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=1716; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=ke7mA7f4Dus9EMjPR0lmZSmqmnKbVtyeE23BIEFxZ5g=; b=t0w307/1fcBfuw+FuOWqjaQqVd0M1voh3gOg4v3raHsmDgjZUSoln+0nnnorn1BTUfZxYn43h D7kGFssZWsXAcI68rvdb2BeoyN35708/HPcXOHZjEy1BiNL4t7DUk3S
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032898729
X-purgate-ID: tlsNG-33051d/1789032913-6DED24E9-A9DFECA2/0/0
X-purgate-type: clean
X-purgate-size: 1718

The existing SFENCE.VMA before the satp write only orders the page table
stores from setup_initial_pagetables() against subsequent implicit reads.
It does not prevent the CPU from speculatively caching translations after
the fence retires.

According to the RISC-V Privileged specification, implementations are
permitted to speculatively cache Bare-mode identity mappings. Furthermore,
selecting MODE=Bare (which happens during check_pgtbl_mode_support())
requires zeroing the remaining fields of satp, causing ASID=0 to be
actively used in Bare mode. Consequently, the TLB can be polluted with Bare
identity mappings tagged with ASID=0.

Once satp is written to enable Sv39 translation, these cached identity
mappings (tagged with ASID=0) can shadow the true Sv39 translations. This
would lead to translation failures since turn_on_mmu() jumps to a
non-identity-mapped linker address.

Fix this by adding a post-satp-write SFENCE.VMA to invalidate any stale
translations (including Bare-mode identity mappings under ASID=0) before
jumping to the virtual address space.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes since v1:
- rewrite commit message
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

-- 
2.55.0


