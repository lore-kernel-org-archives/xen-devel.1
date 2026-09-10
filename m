Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B2C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 09:31:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414219.1643991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4b7W-0002b5-FP; Thu, 10 Sep 2026 09:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414219.1643991; Thu, 10 Sep 2026 09:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4b7W-0002ay-Cs; Thu, 10 Sep 2026 09:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1414219;
 Thu, 10 Sep 2026 09:31:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4b7U-0002ao-WF
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 09:31:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4b7U-0004Dg-9u
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:31:00 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@swg.vates.tech>)
 id 6aa278d0-8faa-0a2a0a5109dd-0a2a45039f7c-20
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:31:00 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@swg.vates.tech>)
 id 6aa278d2-fae8-0a2a45030019-b9ff1c228fe3-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:30:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08aa7f23b000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 09:30:57 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 95CF681DCD;
 Thu, 10 Sep 2026 11:30:56 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=/qNmr2snEUxJ6RXSRdNUkSONPkCnA0TqdMW4rVChrNE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=auwo4TIqbTpOO5c6OsdUfz5lZAv8tX/Edh/qopMvanMvs47jIss6L+pMRLKOfvzPna2eZ/Fvw
 5Xqbt2ckVmwpGp2wERGTyTbWJIHh0Hj3TA57hAG2iAOsmZoTamjJcEvbrQ0QsaPBYKydGMnkCnC
 24SQj6t11sL5CvtjgSLld+L6gH9gq4IZX0mUypDRSLUc/Um0baRqves92wDV9pBxq2dlo0PNhuA
 BOZ9RlVIuI2aKDl3j/dRIBsGmam439p5PhQocxTleHCPRGf+sj5C1HAqRE1FpIHfVbNxRDd8s3t
 YsMZDxFNUEh2NPoyezU5FykTukmxCvEvtTJ7ZxjVpmqQ==
X-Zone-Loop: 9ad6b4758e3e310fc4b4d177861fa70e8090c18fb7ac
x-campaign-type: default
x-transaction-id: 7ae9e231-e991-4d2e-a636-202933472252
x-swg-uid: 01-8e1b69f9-48ce-44d4-ae07-6e283c2a465e
X-Mailer: Sweego
Message-ID:
 <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
x-swg-bid: 1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3
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
	xen-devel@lists.xenproject.org,
	Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: [PATCH v2 0/6] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Thu, 10 Sep 2026 11:30:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260902-riscv-fix-boot-missing-ext-a79c23bad694
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789032264; l=2757; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=ycGBvEciYSSaDSWIu6A69qet0SFqv1AzaVH2EK0KtfU=; b=XYHDAkRM6LacylJB8xuGFYrJZrs717a8ZqhxaHtUMY3acVqpjiIn2YYnx+WJnoUTwaCDatkmG qE1uItQRnjfBrlBSeEYdiIF1P4lWqgJpWiWEtK5dLr3h7P8ttk+eTDz
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789032656820
X-purgate-ID: tlsNG-33051d/1789032660-766FB4E9-3150732A/10/73395122804
X-purgate-type: spam
X-purgate-size: 2759

This series introduces bugs fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
    1: Fix Svade/Svadu A/D bit handling
    2: Set A/D bits in Xen's own page-table mappings under Svade
    3: Make Svpbmt no longer a required extension
    4: Make Zihintpause no longer a required extension
    5: Flush speculatively cached Bare-mode TLB entries in turn_on_mmu()
    6: Fix level_map_mask truncation on load_start

CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2836284276

---
Changes since v1:
- address ML comments
- rename some patchs
- add new patch-fix: 242dd1f890e4 ("xen/riscv: fix level_map_mask
  truncation on load_start") discovered when working on Spacemit K3 support

To: Zheng Zhang <Zheng Zhang <zhangzheng@iscas.ac.cn>
To: Alistair Francis <alistair.francis@wdc.com>
To: Connor Davis <connojdavis@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
To: Michal Orzel <michal.orzel@amd.com>
To: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>
To: Roger Pau Monné <roger@xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org

---
Baptiste Le Duc (6):
      xen/riscv: fix Svade/Svadu A/D bit handling
      xen/riscv: set A/D bits in Xen's page-table mappings under Svade
      xen/riscv: make Svpbmt no longer a required extension
      xen/riscv: make Zihintpause no longer a required extension
      xen/riscv: flush speculatively cached Bare-mode TLB entries in turn_on_mmu()
      xen/riscv: fix level_map_mask truncation on load_start

 xen/arch/riscv/cpufeature.c             | 61 +++++++++++++++++++++++++++++++--
 xen/arch/riscv/domain.c                 | 10 ++++--
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 xen/arch/riscv/include/asm/page.h       | 37 ++++++++++++++------
 xen/arch/riscv/include/asm/sbi.h        |  8 +++++
 xen/arch/riscv/mm.c                     | 11 +++---
 xen/arch/riscv/p2m.c                    | 49 ++++++++++----------------
 xen/arch/riscv/riscv64/head.S           |  1 +
 8 files changed, 127 insertions(+), 51 deletions(-)
---
base-commit: f7eab298bb9f2634e555aea1db70efcbbfd4d316
change-id: 20260902-riscv-fix-boot-missing-ext-a79c23bad694

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>


