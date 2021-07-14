Return-Path: <SRS0=2EqH=MG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0468C12002
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 23:48:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA7F613B2
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 23:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA7F613B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.156266.288339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3obu-0006iH-Lq; Wed, 14 Jul 2021 23:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156266.288339; Wed, 14 Jul 2021 23:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3obu-0006iA-HY; Wed, 14 Jul 2021 23:48:14 +0000
Received: by outflank-mailman (input) for mailman id 156266;
 Wed, 14 Jul 2021 23:48:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3obs-0006hm-TG
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 23:48:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1f70f26-6499-48ea-a5f3-33a449b093f8;
 Wed, 14 Jul 2021 23:48:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F64613CA;
 Wed, 14 Jul 2021 23:48:11 +0000 (UTC)
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
X-Inumbo-ID: d1f70f26-6499-48ea-a5f3-33a449b093f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626306491;
	bh=1TPh5oSQ15cVkfsD3NYIBVCTL6kfTq7Et6CCc7xciqc=;
	h=From:To:Cc:Subject:Date:From;
	b=fseb3vzsThJcaexEABicHzWYnA/76h2FUDt54t2LQRu7T1HexnPr6Hpd8+AXrk5N3
	 0EUEpbTIa2vZel2AxMHDhIB9wuLWWvDGxkvLiuepDCvUBNLN1axZ6rMRkpwsMjqIvH
	 0kdb6uQsPOmTLKO+U00qEJN6uFeCMKXrs02IdBT9FYog/i+vPQCpxC7Qo5Gm/+S5A6
	 Ukn579TeSboyPbDyWgb2xUiJjM8L0wZh9RZSFXnGydwEuBxlTVjOotILQO5MXOYz2/
	 towFdXv97uZrH7WJduIOf+nj6qHDK3inNjQ4cQTmFc4ZoKScPHf1v/xsR2aPIHyDj0
	 nUoILgmx6Tt4Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	iwj@xenproject.org,
	wl@xen.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] SUPPORT.md: add Dom0less as Supported
Date: Wed, 14 Jul 2021 16:48:09 -0700
Message-Id: <20210714234809.30483-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Add Dom0less to SUPPORT.md to clarify its support status. The feature is
mature enough and small enough to make it security supported.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- clarify memory scrubbing
---
 SUPPORT.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 317392d8f3..524cab9c8d 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -832,6 +832,15 @@ OVMF firmware implements the UEFI boot protocol.
 
     Status, qemu-xen: Supported
 
+## Dom0less
+
+Guest creation from the hypervisor at boot without Dom0 intervention.
+
+    Status, ARM: Supported
+
+Memory of dom0less DomUs is not scrubbed at boot (even with
+bootscrub=on); no XSAs will be issues due to unscrubbed memory.
+
 # Format and definitions
 
 This file contains prose, and machine-readable fragments.
-- 
2.17.1


