Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E653BC56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 15:49:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384953.1627637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws0LU-0004ei-PJ; Thu, 06 Aug 2026 15:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384953.1627637; Thu, 06 Aug 2026 15:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws0LU-0004eb-Mm; Thu, 06 Aug 2026 15:49:24 +0000
Received: by outflank-mailman (input) for mailman id 1384953;
 Thu, 06 Aug 2026 15:49:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1ws0LT-0004eV-8A
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:49:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1ws0LS-00834C-17;
 Thu, 06 Aug 2026 15:49:22 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1ws0LR-009pwT-2L;
 Thu, 06 Aug 2026 15:49:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=o3yaR1bb4+BXLENjHX+LaY79Q3ebPt+U4+8LUNnuhlg=; b=U+WUsv/klw2chglEXJrFunuuZj
	jjfotCwxIuFrB1FafeC9rma3Pf2/BhyJY/fK5so3EzomddTISydRL2Bn04NuoaovFK2R6XTLPE9F8
	ZmMftCC1raQ4/fYGX4SBmBWWYO89O5rrsV2IoX/xeMFI1aXkVGCp9y+miPNqLFEuu/eY=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v2 0/2] vpci: allow unaligned accesses by the hardware domain
Date: Thu,  6 Aug 2026 17:26:17 +0200
Message-ID: <20260806152619.23881-1-roger@xenproject.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Mostly the same as v1, plus an additional patch that refuses accesses
that cross a device boundary in pci_mmcfg_{read,write}() itself.

Thanks, Roger.

Roger Pau Monne (2):
  x86/pci: prevent cross-device accesses in pci_mmcfg_{read,write}()
  xen/vpci: allow unaligned accesses by the hardware domain

 tools/include/xen-tools/common-macros.h | 2 ++
 xen/arch/x86/x86_64/mmconfig_64.c       | 6 ++++--
 xen/arch/x86/x86_64/pci.c               | 8 ++++----
 xen/drivers/vpci/vpci.c                 | 6 ++++--
 4 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.53.0


