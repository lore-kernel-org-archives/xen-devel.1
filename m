Return-Path: <SRS0=/9Q0=HT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABF1C433E6
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 14:25:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC16164DE0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 14:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC16164DE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86282.161859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlN-0005Js-HQ; Wed, 17 Feb 2021 14:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86282.161859; Wed, 17 Feb 2021 14:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlN-0005Jl-EQ; Wed, 17 Feb 2021 14:25:09 +0000
Received: by outflank-mailman (input) for mailman id 86282;
 Wed, 17 Feb 2021 14:25:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCNlL-0005JR-TG
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 14:25:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlI-0004eP-Gy; Wed, 17 Feb 2021 14:25:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlI-00057m-58; Wed, 17 Feb 2021 14:25:04 +0000
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
	bh=ZmVFimIAQ1oAEuVpblWKPooP062mJ9LJUPpU+7TXU8A=; b=MQMzPDIzMHLhMJ9HqUd6HvPP7U
	DE6DTLxnzzpX6zYovY4qsA0Uk2Fva/LTTQujD8KUOpGqorneYe3kYiNqzogIuRHQd9DljUntB2qZP
	HOgs+wp/crzg1jRNTRaz2YDg1e9in6WSOHgKiuT9bWO7KS+WbVdCKuO2wHUn2kssCZEg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v3 0/3] xen/iommu: Collection of bug fixes for IOMMU teadorwn
Date: Wed, 17 Feb 2021 14:24:55 +0000
Message-Id: <20210217142458.3769-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is a collection of bug fixes for the IOMMU teardown code.
All of them are candidate for 4.15 as they can either leak memory or
lead to host crash/host corruption.

This is sent directly on xen-devel because all the issues were either
introduced in 4.15 or happen in the domain creation code.

Major changes since v2:
    - patch #1 "xen/x86: p2m: Don't map the special pages in the IOMMU
    page-tables" has been removed. This requires Jan's patch [2] to
    fully mitigate memory leaks.

Cheers,

[1] https://lore.kernel.org/xen-devel/1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com

Julien Grall (3):
  xen/iommu: x86: Clear the root page-table before freeing the
    page-tables
  xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
  xen/iommu: x86: Harden the IOMMU page-table allocator

 xen/drivers/passthrough/amd/iommu_map.c     | 13 ++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++-
 xen/drivers/passthrough/vtd/iommu.c         | 25 +++++++++++-
 xen/drivers/passthrough/x86/iommu.c         | 45 ++++++++++++++++++++-
 xen/include/xen/iommu.h                     |  1 +
 5 files changed, 93 insertions(+), 3 deletions(-)

-- 
2.17.1


