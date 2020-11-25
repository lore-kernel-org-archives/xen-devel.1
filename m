Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D1EC63777
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:28:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6C220789
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0KJ2FeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6C220789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37156.69427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPa-0001Sh-JC; Wed, 25 Nov 2020 04:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37156.69427; Wed, 25 Nov 2020 04:28:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPa-0001SQ-Ai; Wed, 25 Nov 2020 04:28:10 +0000
Received: by outflank-mailman (input) for mailman id 37156;
 Wed, 25 Nov 2020 04:28:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPZ-0000sM-0O
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e39ba1c-edf1-48c4-ab82-3e2147a8fe83;
 Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04CEA217A0;
 Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPZ-0000sM-0O
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:28:09 +0000
X-Inumbo-ID: 1e39ba1c-edf1-48c4-ab82-3e2147a8fe83
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1e39ba1c-edf1-48c4-ab82-3e2147a8fe83;
	Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 04CEA217A0;
	Wed, 25 Nov 2020 04:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278470;
	bh=4BFMlUkVsDnSoLgmGArV/mCzcDdkcQd+lAhVA8u7LRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0KJ2FeIWigon+n9L5r4/5UqYJVS9ALNLDtJtAYnxQddJQ7COG/nZHQKkow/ReJHJ
	 RjfEP3GZ/aXwveCH5Nk+/fokZE28D5Ya8C4yUFDR671G5gutvRoDyNrg9pVUARoLEF
	 vUN1cvvqYJBQRMWj5LAzzP2CsglE8Ka9SgdT7r84=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 07/12] automation: add alpine linux x86 build jobs
Date: Tue, 24 Nov 2020 20:27:40 -0800
Message-Id: <20201125042745.31986-7-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

Allow failure for these jobs. Currently they fail because hvmloader
doesn't build with musl. The failures don't block the pipeline.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
This patch is probably required: https://github.com/alpinelinux/aports/blob/master/main/xen/musl-hvmloader-fix-stdint.patch
---
 automation/gitlab-ci/build.yaml | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index fa38c39d6a..c48c0f3d66 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -410,6 +410,31 @@ opensuse-leap-gcc-debug:
   variables:
     CONTAINER: suse:opensuse-leap
 
+alpine-3.12-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: alpine:3.12
+  allow_failure: true
+
+alpine-3.12-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: alpine:3.12
+  allow_failure: true
+
+alpine-3.12-clang:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: alpine:3.12
+  allow_failure: true
+
+alpine-3.12-clang-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: alpine:3.12
+  allow_failure: true
+
+
 # Arm builds
 
 debian-unstable-gcc-arm64:
-- 
2.17.1


