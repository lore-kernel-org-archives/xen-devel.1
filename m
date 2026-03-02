Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED7EA4E26
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2026 15:44:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1244371.1543810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rc-00060R-OW; Mon, 02 Mar 2026 15:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244371.1543810; Mon, 02 Mar 2026 15:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rc-00060K-Lt; Mon, 02 Mar 2026 15:44:28 +0000
Received: by outflank-mailman (input) for mailman id 1244371;
 Mon, 02 Mar 2026 15:44:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7KG=BC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vx5Ra-00060E-RI
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:44:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ae257be3-164e-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 16:44:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4091514BF;
 Mon,  2 Mar 2026 07:44:14 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.82.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BAC23F73B;
 Mon,  2 Mar 2026 07:44:19 -0800 (PST)
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
X-Inumbo-ID: ae257be3-164e-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 0/4] xen/arm: ffa: Add PARTITION_INFO_GET_REGS support
Date: Mon,  2 Mar 2026 16:44:09 +0100
Message-ID: <cover.1772464956.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements FF-A 1.2 PARTITION_INFO_GET_REGS support,
providing register-based partition info retrieval as an efficient
alternative to the RX buffer-based PARTITION_INFO_GET.

The serie is also introducing a caching system for the list of secure
partitions to prevent retrieving it on each VM call as we expect it to
be static and not changing over time.

The patches are organized as follows:
- patch 1 is modifying existing code to prepare for GET_REGS support by
  adding a start_index in the existing internal function
- patch 2 is introducing the secure partition list caching
- patch 3 is removing the existing suscribers list to directly use the
  cached secure partition list
- patch 4 is adding GET_REGS support

Changes since v1 (Jens comments):
- rework SP cache handling to enforce 1.1+ structure size
- ensure unaligned-safe reads
- remove checks for SBZ fields
- tighten tag handling

Bertrand Marquis (4):
  xen/arm: ffa: Add start_index to VM partinfo helper
  xen/arm: ffa: Cache SP partition info at init
  xen/arm: ffa: Drop SP subscriber lists
  xen/arm: ffa: Add cached GET_REGS support

 xen/arch/arm/tee/ffa.c          |  23 +-
 xen/arch/arm/tee/ffa_partinfo.c | 565 ++++++++++++++++++++++----------
 xen/arch/arm/tee/ffa_private.h  |   4 +-
 3 files changed, 410 insertions(+), 182 deletions(-)

-- 
2.52.0


