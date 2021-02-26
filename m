Return-Path: <SRS0=mA2z=H4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4933C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 10:57:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62DF964EE1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Feb 2021 10:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62DF964EE1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.90208.170716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFanf-0003Gq-TN; Fri, 26 Feb 2021 10:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90208.170716; Fri, 26 Feb 2021 10:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFanf-0003Gf-MM; Fri, 26 Feb 2021 10:56:47 +0000
Received: by outflank-mailman (input) for mailman id 90208;
 Fri, 26 Feb 2021 10:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFane-0003GB-Jx
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 10:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFanc-0001Pz-11; Fri, 26 Feb 2021 10:56:44 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFanb-0007D9-GS; Fri, 26 Feb 2021 10:56:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=xqgSnLtlJc/ZuKheu9kG+Se2giatvvefwEf89aOzS+w=; b=nV6p8STrDayMAQirzquKLTjbKl
	CxQivydjclySbLsaBgdKBRLVnMqL1mvaSNgqmXcj+7SG9DGL5azphOoc9s93ZeLK/xMlDps0ueTPe
	HCLCvxQN1lfNyV9AExdVB3KbIWZQ8huyI630oAF6uCGTHzK+Gj2yjUWGBErGuZa9AwjY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH for-4.15 v5 0/3] xen/iommu: Collection of bug fixes for IOMMU teardown
Date: Fri, 26 Feb 2021 10:56:37 +0000
Message-Id: <20210226105640.12037-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is a collection of bug fixes for the IOMMU teardown code.
All of them are candidate for 4.15 as they can either leak memory or
lead to host crash/host corruption.

This is sent directly on xen-devel because all the issues were either
introduced in 4.15 or happen in the domain creation code.

Major changes since v4:
    - New patch added (it is a split of patch #1 in v4)

Major changes since v3:
    - Remove patch #3 "xen/iommu: x86: Harden the IOMMU page-table
    allocator" as it is not strictly necessary for 4.15.
    - Re-order the patches to avoid on a follow-up patch to fix
    completely the issue.

Major changes since v2:
    - patch #1 "xen/x86: p2m: Don't map the special pages in the IOMMU
    page-tables" has been removed. This requires Jan's patch [1] to
    fully mitigate memory leaks.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

@Ian, I assumed that the release-acked-by would stand even with the
patch split. Let me know if if this is not the case.

Cheers,

[1] <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>

Julien Grall (3):
  xen/iommu: x86: Don't try to free page tables is the IOMMU is not
    enabled
  xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
  xen/iommu: x86: Clear the root page-table before freeing the
    page-tables

 xen/drivers/passthrough/amd/iommu_map.c     | 12 +++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 ++++++++++-
 xen/drivers/passthrough/vtd/iommu.c         | 24 ++++++++++++++++++++-
 xen/drivers/passthrough/x86/iommu.c         | 19 ++++++++++++++++
 xen/include/xen/iommu.h                     |  1 +
 5 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.17.1


