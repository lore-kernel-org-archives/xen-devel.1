Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139B9C5B56D
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387639.1628928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSa1-0004Mr-JI; Mon, 10 Aug 2026 16:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387639.1628928; Mon, 10 Aug 2026 16:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSa1-0004LP-DU; Mon, 10 Aug 2026 16:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1387639;
 Mon, 10 Aug 2026 16:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705e62000e099@swg.vates.tech>)
 id 1wtSZz-00046c-Dv
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:10:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSZy-00Exz0-Qy
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:10:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705e62000e099@swg.vates.tech>)
 id 6a79f79b-e002-0a2a0a5209dd-0a2a45018e00-46
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:22 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705e62000e099@swg.vates.tech>)
 id 6a79f7e7-5984-0a2a45010019-b9ff1c23956d-6
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec705e62000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:10:15 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 718B5836CA;
 Mon, 10 Aug 2026 18:10:14 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=b8uUu5RVBX4cAl4lJFvLAs2NLoZ3l9PfrUwp54rMNoY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=EN0WKQPt5ZeZQht5quSPoVwqugNHnkC+k/xdLPn7T/H09/ivM2dM8Q6FSiRUOWNrIKfh+5bNY
 yL+h7c+Z7K0xtzZkkmGklgNLxZ7Mby7p8xD9ry6hwCaqcnmSh8Zl601tKO9YZFtW/OWPvVBD0Nw
 dgmIII4IfGXahumpMkVjpyZq/67lgLblpY8+rrRM37Qoqp1Cw+1QBLmFmF0uZItDijzMt8WW5Nt
 2xccH4LLYbzugr/IQeCc9ZujydqFmqhCokxSnK4UVQyYpKqDaKYY9av0A7arVrR5IH5YD0hT1qy
 EAFKjw7jb5Bq70EwVEUn9+S3wxG4rOxU4DFACcwulJ/Q==
X-Zone-Loop: 5e910abe6b09df3b0635cd623e41b48cfcda30c2ec62
x-campaign-type: default
x-transaction-id: bd1c45bf-91a7-4f09-a9d4-206f924aa378
x-swg-uid: 01-a5039f13-fdab-4e2c-b90b-809608327dcb
X-Mailer: Sweego
Message-ID:
 <1786378215.8631fc262581453bbf619ec5b2062170.19fec705e62000e099@vates.tech>
x-swg-bid: 1786378215.8631fc262581453bbf619ec5b2062170.19fec705e62000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 6/6] CI: run the riscv64 smoke test via QTB framework console-test
Date: Mon, 10 Aug 2026 18:09:56 +0200
In-Reply-To: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.204d.96642db73297cb4b.19fec705c90.6ffbbdec5d88f335=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378214544
X-purgate-ID: tlsNG-d62444/1786378222-BD67C757-D7FE074B/0/0
X-purgate-type: clean
X-purgate-size: 5029

---=Part.204d.96642db73297cb4b.19fec705c90.6ffbbdec5d88f335=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

qemu-smoke-riscv64-gcc drove QEMU through
automation/scripts/qemu-smoke-riscv64=2Esh, an expect wrapper whose machin=
e
description (cpus, memory, device tree, console wiring) lived in the scrip=
t
itself=2E The QTB framework now owns all of that: machines come from the
shared catalog, expectations from the test type's own YAML=2E

Turn =2Eqemu-riscv64 into a template running qemu_smoke_riscv64=2Epy <type=
> run
<test> in the qtb-riscv64 container, machine and test picked per job
through QTB_TEST_TYPE/QTB_TEST=2E The container comes from the test-artifa=
cts
registry, hence the new ARTIFACTS_REGISTRY next to the existing
ARTIFACTS_REPO/ARTIFACTS_BRANCH=2E QTB_BINARIES_DIR points at the artifact=
s
of the job in the new =2Eriscv64-test-needs anchor (QEMU and its firmware)=
,
and QTB_LOG_DIR collects the per-console logs, kept on failure and on
success=2E

Point qemu-smoke-riscv64-gcc at that template, running the console-test
type on dom0less-1smp-0domu-1vcpu-aplic-imsic-null: a Xen-only machine, so
the smoke check is Xen's own "All set up" on console 0, the same string th=
e
expect script waited for=2E

Drop automation/scripts/qemu-smoke-riscv64=2Esh as it has no caller left i=
n
the CI after this patch and drop smoke=2Eserial from the =2Eqemu-riscv64
artifacts since no riscv64 job uses it anymore, the logs are now kept unde=
r
QTB_LOG_DIR=2E

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
---
 =2Egitlab-ci=2Eyml                           |  3 +++
 automation/gitlab-ci/test=2Eyaml           | 26 ++++++++++++++++++------
 automation/scripts/qemu-smoke-riscv64=2Esh | 19 -----------------
 3 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100755 automation/scripts/qemu-smoke-riscv64=2Esh

diff --git a/=2Egitlab-ci=2Eyml b/=2Egitlab-ci=2Eyml
index f42a9abeaa=2E=2E15f93b8634 100644
--- a/=2Egitlab-ci=2Eyml
+++ b/=2Egitlab-ci=2Eyml
@@ -11,6 +11,9 @@ variables:
   ARTIFACTS_BRANCH:
     description: "Branch in test-artifacts to use"
     value: master
+  ARTIFACTS_REGISTRY:
+    description: "Registry holding the test-artifacts containers"
+    value: registry=2Egitlab=2Ecom/xen-project/hardware/test-artifacts
   LINUX_JOB_X86_64:
     description: "Job name in test-artifacts to use for Linux x86_64"
     value: linux-6=2E6=2E56-x86_64
diff --git a/automation/gitlab-ci/test=2Eyaml b/automation/gitlab-ci/test=
=2Eyaml
index 61adc1baff=2E=2E4775d2cc4e 100644
--- a/automation/gitlab-ci/test=2Eyaml
+++ b/automation/gitlab-ci/test=2Eyaml
@@ -5,6 +5,11 @@
   - if: $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
     when: on_success
=20
+=2Eriscv64-test-needs: &riscv64-test-needs
+  - project: $ARTIFACTS_REPO
+    job: qemu-9=2E0=2E0-riscv64
+    ref: $ARTIFACTS_BRANCH
+
 =2Earm64-test-needs: &arm64-test-needs
   - project: $ARTIFACTS_REPO
     job: $LINUX_JOB_ARM64
@@ -72,14 +77,21 @@
     TEST_TIMEOUT_OVERRIDE: 120
=20
 =2Eqemu-riscv64:
+  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}
   extends: =2Etest-jobs-common
   variables:
-    CONTAINER: debian:13-riscv64
-    LOGFILE: qemu-smoke-riscv64=2Elog
+    CONTAINER: debian:13-qtb-riscv64
+    QTB_LOG_DIR: qtb-logs
+    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries
+  script:
+    - =2E/automation/scripts/qemu_smoke_riscv64=2Epy
+      ${QTB_TEST_TYPE}
+      run
+      ${QTB_TEST}
+      --log-dir ${QTB_LOG_DIR}
   artifacts:
     paths:
-      - smoke=2Eserial
-      - '*=2Elog'
+      - ${QTB_LOG_DIR}
     when: always
   tags:
     - x86_64
@@ -779,9 +791,11 @@ qemu-xtf-argo-x86_64-gcc-debug:
=20
 qemu-smoke-riscv64-gcc:
   extends: =2Eqemu-riscv64
-  script:
-    - =2E/automation/scripts/qemu-smoke-riscv64=2Esh 2>&1 | tee ${LOGFILE=
}
+  variables:
+    QTB_TEST_TYPE: console-test
+    QTB_TEST: dom0less-1smp-0domu-1vcpu-aplic-imsic-null
   needs:
+    - *riscv64-test-needs
     - debian-13-riscv64-gcc-debug
=20
 qemu-smoke-ppc64le-powernv9-gcc:
diff --git a/automation/scripts/qemu-smoke-riscv64=2Esh b/automation/scrip=
ts/qemu-smoke-riscv64=2Esh
deleted file mode 100755
index c0b1082a08=2E=2E0000000000
--- a/automation/scripts/qemu-smoke-riscv64=2Esh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/bash
-
-set -ex -o pipefail
-
-# Run the test
-rm -f smoke=2Eserial
-
-export TEST_CMD=3D"qemu-system-riscv64 \
-    -M virt,aia=3Daplic-imsic \
-    -cpu rv64,svpbmt=3Don \
-    -smp 1 \
-    -nographic \
-    -m 2g \
-    -kernel binaries/xen"
-
-export TEST_LOG=3D"smoke=2Eserial"
-export PASSED=3D"All set up"
-
-=2E/automation/scripts/console=2Eexp |& sed 's/\r\+$//'


-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.204d.96642db73297cb4b.19fec705c90.6ffbbdec5d88f335=---

