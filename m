Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DEDECD6C7
	for <xen-devel@archiver.kernel.org>; Wed, 11 Feb 2026 17:16:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1227991.1534345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDog-0004UH-3e; Wed, 11 Feb 2026 17:15:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227991.1534345; Wed, 11 Feb 2026 17:15:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDog-0004UA-0o; Wed, 11 Feb 2026 17:15:54 +0000
Received: by outflank-mailman (input) for mailman id 1227991;
 Wed, 11 Feb 2026 17:15:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDof-0004U4-3C
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:15:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4e2adfb4-076d-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:15:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37D80339;
 Wed, 11 Feb 2026 09:15:40 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 775063F63F;
 Wed, 11 Feb 2026 09:15:45 -0800 (PST)
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
X-Inumbo-ID: 4e2adfb4-076d-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 00/12] xen/arm: ffa: v1.2 improvements
Date: Wed, 11 Feb 2026 18:15:24 +0100
Message-ID: <cover.1770826406.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series tightens Xen's FF-A mediator after the v1.2 enablement work,
focusing on correctness, validation, and diagnostics while keeping
existing v1.0/v1.1 guests working.

Hardening and validation (Patches 1-3):
  1) centralize endpoint lookup validation for messaging paths
  2) reject NS MEM_SHARE attributes and name normal memory encoding
  3) tighten MEM_SHARE page parsing with overflow/alignment checks

FF-A 1.2 support (Patch 4):
  4) accept 1.2 EMADs in MEM_SHARE and forward IMPDEF while allowing 1.1 layouts

Correctness fixes (Patches 5-9):
  5) avoid spurious SPMC RX releases on PARTINFO failures
  6) align RX/TX map descriptor layout and return NO_MEMORY on map failures
  7) deny RXTX_UNMAP while a VM owns the RX buffer and close the race
  8) validate FFA_FEATURES properties and gate ABIs, with RX_ACQUIRE workaround
  9) gate SEND2 SP support on RX_ACQUIRE

Code quality and diagnostics (Patches 10-12):
  10) reduce log noise and ratelimit expected failures
  11) add MEM_SHARE page diagnostics for malformed ranges and mapping issues
  12) add message parameter diagnostics for SEND2 and direct requests

Backward compatibility: v1.0/v1.1 guests continue to use their ABI unchanged;
v1.2 guests use EMADs and negotiated ABI features.

The implementation passes the FF-A Architecture Compliance Suite.

This serie was validated through gitlab-ci here:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/tree/ffa-v12-improve/v2
Build pipeline for the serie:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/pipelines/2319853458

Changes since v1:
- Handle review comments, details in each patch
- add Jens R-b on reviewed patches

Bertrand Marquis (12):
  xen/arm: ffa: Add endpoint lookup helper
  xen/arm: ffa: Fix MEM_SHARE NS attribute handling
  xen/arm: ffa: Harden shm page parsing
  xen/arm: ffa: Add FF-A 1.2 endpoint memory access descriptors
  xen/arm: ffa: Fix PARTINFO RX release errors
  xen/arm: ffa: Fix RX/TX map layout and errors
  xen/arm: ffa: Fix RXTX_UNMAP ownership race
  xen/arm: ffa: Fix FFA_FEATURES validation
  xen/arm: ffa: Fix SEND2 SP support gating
  xen/arm: ffa: Reduce logging noise
  xen/arm: ffa: Add MEM_SHARE page diagnostics
  xen/arm: ffa: Add message parameter diagnostics

 xen/arch/arm/tee/ffa.c          | 127 +++++++++++++++---
 xen/arch/arm/tee/ffa_msg.c      |  80 ++++++++---
 xen/arch/arm/tee/ffa_notif.c    |  11 +-
 xen/arch/arm/tee/ffa_partinfo.c |  29 ++--
 xen/arch/arm/tee/ffa_private.h  |  34 ++++-
 xen/arch/arm/tee/ffa_rxtx.c     |  80 +++++++++--
 xen/arch/arm/tee/ffa_shm.c      | 226 ++++++++++++++++++++++----------
 7 files changed, 450 insertions(+), 137 deletions(-)

-- 
2.52.0


