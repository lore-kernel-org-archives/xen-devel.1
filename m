Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1059C61DD4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:43:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400483.1636168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdo-0006RS-Sd; Thu, 27 Aug 2026 09:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400483.1636168; Thu, 27 Aug 2026 09:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdo-0006RI-OR; Thu, 27 Aug 2026 09:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1400483;
 Thu, 27 Aug 2026 09:43:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@swg.vates.tech>)
 id 1wzWdn-0006Oz-Hz
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:43:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWdm-00AoWH-Uk
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:43:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@swg.vates.tech>)
 id 6a9006ad-e002-0a2a0a5209dd-0a2a4508ba2a-48
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:22 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@swg.vates.tech>)
 id 6a9006ba-f659-0a2a45080019-b9ff1c22aa53-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0429a155d000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:43:09 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D77DC81230;
 Thu, 27 Aug 2026 11:43:08 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=euv1GKoVBRcVfOMKB9vvDBqdsaalOO1hGV5PMr23tAI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=S1WARVRDzC3L9J/lVdNZ9KNGpcxecckW0Mi0iXhWSBGlPtmgIkvMRv59WML/ehuBa11xHCNl7
 GRjVD8PNvreQYoZqUcxD8LIGiUqIp/8UdhloSOXsmSGAXyyCWSN/ebNq0NmXhT7EH2SU6F8d1BL
 GHgheKikl4be4OWStsO3p78ZeKLviBsW1HvafHRMZ6QsLNP6sxltYoSf6AfFDVV2Bn9DhXlIRvY
 wdan5sdvQEIhGOmcQBLWWu/guIhS7lL/hMVB+94NX2dA4MK1Q5V1l1gy6kyhOoISw+IGfegctRs
 zfdFykhN1T2zDs7TVKguKiqmeCcu5ZRWh3qIYHD8uFdA==
X-Zone-Loop: 979fe070d2e3795f14efb2f7b7383ec99d3be8436984
x-campaign-type: default
x-transaction-id: da2da8be-e678-48f8-be08-ab76297a3d86
x-swg-uid: 01-344139b8-3069-4c6a-a68e-f1ac67380296
X-Mailer: Sweego
Message-ID:
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
x-swg-bid: 1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/6] CI: run the riscv64 smoke test via QTB framework console-test
Date: Thu, 27 Aug 2026 11:42:52 +0200
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823788970
X-purgate-ID: tlsNG-c1860d/1787823802-CD34D87B-C4E01DE3/0/0
X-purgate-type: clean
X-purgate-size: 4129

qemu-smoke-riscv64-gcc drove QEMU through
automation/scripts/qemu-smoke-riscv64.sh, an expect wrapper whose machine
description (cpus, memory, device tree, console wiring) lived in the script
itself. The QTB framework now owns all of that: machines come from the
shared catalog, expectations from the test type's own YAML.

Turn .qemu-riscv64 into a template running qemu_smoke_riscv64.py <type> run
<test> in the qtb-riscv64 container, machine and test picked per job
through QTB_TEST_TYPE/QTB_TEST. The container comes from the test-artifacts
registry, hence the new ARTIFACTS_REGISTRY next to the existing
ARTIFACTS_REPO/ARTIFACTS_BRANCH. QTB_BINARIES_DIR points at the artifacts
of the job (Xen only currently, but aims to have initrd and linux images
when dom0less will be supported). QTB_LOG_DIR collects the per-console
logs, kept on failure and on success.

Point qemu-smoke-riscv64-gcc at that template, running the console-test
type on dom0less-1smp-0domu-1vcpu-aplic-imsic-null: a Xen-only machine, so
the smoke check is Xen's own "All set up" on console 0, the same string the
expect script waited for.

Drop automation/scripts/qemu-smoke-riscv64.sh as it has no caller left in
the CI after this patch and drop smoke.serial from the .qemu-riscv64
artifacts since no riscv64 job uses it anymore, the logs are now kept under
QTB_LOG_DIR.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 .gitlab-ci.yml                           |  3 +++
 automation/gitlab-ci/test.yaml           | 20 ++++++++++++++------
 automation/scripts/qemu-smoke-riscv64.sh | 19 -------------------
 3 files changed, 17 insertions(+), 25 deletions(-)
 delete mode 100755 automation/scripts/qemu-smoke-riscv64.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f42a9abeaa..15f93b8634 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -11,6 +11,9 @@ variables:
   ARTIFACTS_BRANCH:
     description: "Branch in test-artifacts to use"
     value: master
+  ARTIFACTS_REGISTRY:
+    description: "Registry holding the test-artifacts containers"
+    value: registry.gitlab.com/xen-project/hardware/test-artifacts
   LINUX_JOB_X86_64:
     description: "Job name in test-artifacts to use for Linux x86_64"
     value: linux-6.6.56-x86_64
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 61adc1baff..e9dd147380 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -72,14 +72,21 @@
     TEST_TIMEOUT_OVERRIDE: 120
 
 .qemu-riscv64:
+  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:13-riscv64
-    LOGFILE: qemu-smoke-riscv64.log
+    CONTAINER: debian:13-qtb-riscv64
+    QTB_LOG_DIR: qtb-logs
+    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries
+  script:
+    - ./automation/scripts/qemu_smoke_riscv64.py
+      ${QTB_TEST_TYPE}
+      run
+      ${QTB_TEST}
+      --log-dir ${QTB_LOG_DIR}
   artifacts:
     paths:
-      - smoke.serial
-      - '*.log'
+      - ${QTB_LOG_DIR}
     when: always
   tags:
     - x86_64
@@ -779,8 +786,9 @@ qemu-xtf-argo-x86_64-gcc-debug:
 
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
-  script:
-    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
+  variables:
+    QTB_TEST_TYPE: console-test
+    QTB_TEST: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
   needs:
     - debian-13-riscv64-gcc-debug
 
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
deleted file mode 100755
index c0b1082a08..0000000000
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/bash
-
-set -ex -o pipefail
-
-# Run the test
-rm -f smoke.serial
-
-export TEST_CMD="qemu-system-riscv64 \
-    -M virt,aia=aplic-imsic \
-    -cpu rv64,svpbmt=on \
-    -smp 1 \
-    -nographic \
-    -m 2g \
-    -kernel binaries/xen"
-
-export TEST_LOG="smoke.serial"
-export PASSED="All set up"
-
-./automation/scripts/console.exp |& sed 's/\r\+$//'

