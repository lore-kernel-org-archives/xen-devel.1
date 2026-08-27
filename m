Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AEFC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:27:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401146.1636898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc0g-0000ay-QJ; Thu, 27 Aug 2026 15:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401146.1636898; Thu, 27 Aug 2026 15:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzc0g-0000ar-NX; Thu, 27 Aug 2026 15:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1401146;
 Thu, 27 Aug 2026 15:27:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@swg.vates.tech>)
 id 1wzc0g-0000al-2v
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:27:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzc0f-00BqPT-DX
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:27:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@swg.vates.tech>)
 id 6a905733-8faa-0a2a0a5109dd-0a2a4501e450-40
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:27:21 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@swg.vates.tech>)
 id 6a905758-5984-0a2a45010019-b9ff1c23ae87-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:27:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a043d52a06000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 15:27:18 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8394983B31;
 Thu, 27 Aug 2026 17:27:17 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=WNHPSrx6fA4RvjHaealJExdGcNW4rz9y9rtrgh5u6r8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=KpV4QcYtLR88Y3h5Pp8+Jpyp+04TclQeSieQwRTRTkDbkWH5/iFJe8bXpQx7HX1Ek3PC2juTW
 npnRvWtbQWLHkKM4i7ke1+D2S2TdruqlCE0sxXGf+xiF1DEHMLhTpy9yBEqm9Nz+pn7pZ/UfHo3
 kBaxcoAz+APUp1TuEYC1ZvuSx3z0tMCqrFjeCTTpdPmITAKZfqPtz+2+pW03DVLtMFPUj/y1rqW
 vbic2E6KOpis7wVrBlVNTj6B3U7zo+zEa0OJ7kiS4/trl/MYFOEJ9cNJy5kUwOTh1+SHfjVGdny
 e0wphfgchsAW3iWdxxDNqD10Hz8FR5ZjuD8RXKOxxKow==
X-Zone-Loop: 1d1aff709edee18cd9159b4c29280038aa3b52b16779
x-campaign-type: default
x-transaction-id: 625fba25-e6df-4496-a5cc-cb0edc48beab
x-swg-uid: 01-9f0acbc2-e1d0-48e5-b414-d61443cdf80f
X-Mailer: Sweego
Message-ID:
 <1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3@vates.tech>
x-swg-bid: 1787844438.8631fc262581453bbf619ec5b2062170.1a043d52a06000c4f3
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
Subject: [PATCH 0/5] xen/riscv: fix boot on missing extensions and MMU setup bugs
Date: Thu, 27 Aug 2026 17:27:00 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787844437741
X-purgate-ID: tlsNG-d62444/1787844441-C4558757-D636B774/0/0
X-purgate-type: clean
X-purgate-size: 1618

This series introduces bugs fixes that were found while bringing up CI
support for the HiFive Premier P550 board with a basic smoke test. The
board-support series itself will follow separately as it depends on
PLIC/vPLIC and dom0less support that have not been upstreamed yet. This
series carries only the independent fixes found along the way, none of them
need the board-support series to apply.

This series:
- Stop requiring Zihintpause and Svpbmt at boot
    Both are already gated at some call sites that care, drop them
    from required_extensions[] so hardware without them still boots.
- Preset A/D bits in G-stage and in Xen's own page-table mappings
    Avoids an unhandled page fault on Svade/Svadu-less hardware on both
    mapping path.
- Add the missing SFENCE.VMA after enabling paging in turn_on_mmu()
  Required per the Privileged spec when ASID 0 is reused across the satp

CI pipeline:
https://gitlab.com/xen-project/people/baptleduc/xen/-/pipelines/2796673417

Baptiste Le Duc (5):
  xen/riscv: always set A/D bits at boot time
  xen/riscv: preset A/D bits in Xen's own page-table mappings
  xen/riscv: make Svpbmt no longer a required extension
  xen/riscv: make Zihintpause no longer a required extension
  xen/riscv: add SFENCE.VMA after enabling paging

 xen/arch/riscv/cpufeature.c       |  2 -
 xen/arch/riscv/include/asm/page.h | 22 ++++++----
 xen/arch/riscv/mm.c               |  7 ++-
 xen/arch/riscv/p2m.c              | 72 ++++++++++++++++++-------------
 xen/arch/riscv/riscv64/head.S     |  1 +
 5 files changed, 61 insertions(+), 43 deletions(-)


