Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E4CC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:29:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428555.1651400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkP-0006nX-Ma; Tue, 22 Sep 2026 10:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428555.1651400; Tue, 22 Sep 2026 10:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkP-0006nQ-Jn; Tue, 22 Sep 2026 10:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1428555;
 Tue, 22 Sep 2026 10:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xkO-0006mw-8j
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xkN-00ApBl-1B;
 Tue, 22 Sep 2026 10:29:11 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR8-00DE8C-0E;
 Tue, 22 Sep 2026 10:09:17 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=DyHqTO5jwlg+PrrWKnovMacZA2AwSnp3TeyqmfEC+9I=; b=2ufe/gQ6FxZjBTTJ+EIhJFj6qu
	oHnK5nEjocfkLk2kQBQ2/bzQ/edqnQFg98T0+woqazh7S6E7oTaiOyTqiZKmi4HdDA4iR4xJo+zBC
	3WusMl1vVozCgrRKhD7h0eo5WelQQliex/lR8o8HqruvL/YiK2YoNE3EVr37CvtD4XGs=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 13/13] gitlab-ci: Add job for moonshot with pytest
Date: Tue, 22 Sep 2026 12:09:00 +0200
Message-ID: <20260922100900.29129-14-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

WIP, use alternative branchs for artefacts

- moonshot need kernel with driver for the network card
  and for vlan
- alpine rootfs need network support and sshd

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/gitlab-ci/test.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 61adc1baff30..1f760e24811f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -205,6 +205,7 @@
     - qubes-hw11
 
 # Test jobs
+
 build-each-commit-gcc:
   extends: .test-jobs-common
   variables:
@@ -777,6 +778,26 @@ qemu-xtf-argo-x86_64-gcc-debug:
   needs:
     - alpine-3.24-x86_64-gcc-debug
 
+broadwell-tools-tests-pv-x86-64-gcc-debug:
+  extends: .test-jobs-common
+  variables:
+    XEN_REGISTRY: registry.gitlab.com/xen-project/people/anthonyper/xen
+    CONTAINER: archlinux:current-uv
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+    reports:
+      junit: tests-junit.xml
+  tags:
+    - vates-moonshot-1
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+  script:
+    - cd automation/pytest && uv run pytest
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
-- 
Anthony PERARD


