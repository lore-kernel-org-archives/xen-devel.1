Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDF51093190
	for <xen-devel@archiver.kernel.org>; Fri, 20 Mar 2026 09:07:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257868.1552115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VpX-0005zd-Au; Fri, 20 Mar 2026 09:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257868.1552115; Fri, 20 Mar 2026 09:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VpX-0005zW-7D; Fri, 20 Mar 2026 09:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1257868;
 Fri, 20 Mar 2026 09:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GknJ=BU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1w3VpV-0005zQ-NN
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:07:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3c42a681-243c-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 10:07:35 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B65621596;
 Fri, 20 Mar 2026 02:07:28 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.84.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 608AB3F778;
 Fri, 20 Mar 2026 02:07:33 -0700 (PDT)
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
X-Inumbo-ID: 3c42a681-243c-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 0/2] xen/arm: tee: Fix MISRA findings
Date: Fri, 20 Mar 2026 10:07:20 +0100
Message-ID: <cover.1773911799.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two MISRA findings in the arm/tee mediators.

1. Rename a local variable in FF-A partition-info handling to avoid
 shadowing the global `ffa_vm_count` (Rule 5.3 report).
2. Add/document `default` switch labels in OP-TEE paths to satisfy
 Rule 16.4 checks.

This serie is based on "xen/arm: ffa: Add PARTITION_INFO_GET_REGS support"
which is pending for merge in the tree so it must not be merged before
it !!

The following pipeline executed on top of this serie shows that there
are no findings anymore in xen/arch/arm/tee:
https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/pipelines/2395186683

Bertrand Marquis (2):
  xen/arm: ffa: Fix local ffa_vm_count shadowing
  xen/arm: optee: Add MISRA-compliant switch default labels

 xen/arch/arm/tee/ffa_partinfo.c | 14 +++++++-------
 xen/arch/arm/tee/optee.c        | 11 +++++++++++
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.52.0


