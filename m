Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823F606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=BBCEfA7D
Received: from list by lists.xenproject.org with outflank-mailman.1469873.1678665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBv-0002q5-8t; Tue, 03 Nov 2026 14:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469873.1678665; Tue, 03 Nov 2026 14:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBv-0002pw-5l; Tue, 03 Nov 2026 14:08:47 +0000
Received: by outflank-mailman (input) for mailman id 1469873;
 Tue, 03 Nov 2026 14:08:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d@swg.vates.tech>)
 id 1xOFBt-0002nR-I5
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:08:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFBs-00EYJz-UY
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:08:44 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d@swg.vates.tech>)
 id 6ae9eae4-bab6-0a2a0a5309dd-0a2a4508d2ba-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:44 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d@swg.vates.tech>)
 id 6ae9eae9-f659-0a2a45080019-b9ff1c2399c7-4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:44 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1bd68c1000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:08:27 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B24478236A;
 Tue,  3 Nov 2026 15:08:26 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=6vCD6hOttXAIWJv23QfDCKmx7T+6OSDFXtpHB3u6bR8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BBCEfA7DxJixrqB10cWjenoWkPJz84Sldq/GTNrzF+NvIHCvEue9/9YbvXLdOJobAT4ZR1hDu
 kVY8g+yciC11c/Ts3taHHF3m0gNDooDNJcf3OJ8CEYhsZznsjLjZgBk+Uw3gVdkRcQ5HPA4v41t
 tCroklZGduSC+GAR/u53ciwUUSoBe9VWjsyQ+M4KXivapkq5i07bdOQzWR331YhiK0Ic5bloulQ
 Qh2WrFSyzUkmJX36hnM7MpZii87WJwECLDDKamZb5ncGdCewAKJ/s+MeDAyKNa+tPA35v3hCitP
 7AlcIjbCvKJqn8ROsQPXyZjIGpCT0+ryFKt7yJ0vTpGA==
X-Zone-Loop: 525fb047e29af77ae3dcdbb4755f5df989d326a2f044
x-campaign-type: default
x-transaction-id: b5b513a0-4d05-496f-937b-69371a84c029
x-swg-uid: 01-3adcb5cc-d819-47ea-b27d-02ab994657a2
X-Mailer: Sweego
Message-ID:
 <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d@vates.tech>
x-swg-bid: 1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd68c1000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: [PATCH v3 5/6] CI: add a riscv64 smoke test job using the QTB console-test
Date: Tue,  3 Nov 2026 15:08:13 +0100
In-Reply-To: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=2337; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=RQCGWr5P16R9YPNSv0us0XQcZehfVnaaI+/kEvD35yE=; b=MfQzPSoqWLrsOlHEJrq99r2FUsQXeD0dtPCcCTpOKlPzxkkq+dqkn8Lh0h/ph8yipPjzrQxSZ Gd+XMe7HwtRAMERYLTOy8Ipwa2olkWjCmz1aeJf9hKzGVL2nvv74o9c
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714906892
X-purgate-ID: tlsNG-c1860d/1793714924-D574B87B-F6C70E92/0/0
X-purgate-type: clean
X-purgate-size: 2339
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add QTB console-test in CI next to the existing qemu-smoke-riscv64-gcc
job, which is left unchanged.

Add .qemu-qtb-riscv64, a template running the pytest module named by
QTB_TEST in the debian:13-riscv64-qtb container. --binaries-dir points
at the artifacts of the job, Xen from the build job. The per-test logs
are collected under qtb-logs, kept on failure and on success, and the
JUnit report is uploaded so GitLab shows per-test results.

Add qemu-smoke-qtb-riscv64-gcc job on top of it, running test_console.py:
its test boots Xen alone on one pCPU and waits for "All set up" on
Xen's console, the same string as the existing qemu-smoke-riscv64-gcc.

Both jobs use Debian's QEMU and its bundled OpenSBI.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Changes in v3:
- Add the QTB job next to qemu-smoke-riscv64-gcc instead of replacing it,
  the drop moves to its own patch.
- Rename the template and job with "qtb".
- Run pytest and upload its JUnit report.
- Use the container from xen.git, drop ARTIFACTS_REGISTRY.
---
 automation/gitlab-ci/test.yaml | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 96127995d7..dcf75e4674 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -84,6 +84,26 @@
   tags:
     - x86_64
 
+.qemu-qtb-riscv64:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:13-riscv64-qtb
+  script:
+    - python3 -m pytest
+      "automation/scripts/qtb/riscv/tests/${QTB_TEST}"
+      -p no:cacheprovider
+      --log-dir qtb-logs
+      --binaries-dir "${CI_PROJECT_DIR}/binaries"
+      --junitxml tests-junit.xml
+  artifacts:
+    paths:
+      - qtb-logs
+    reports:
+      junit: tests-junit.xml
+    when: always
+  tags:
+    - x86_64
+
 .qemu-ppc64le:
   extends: .test-jobs-common
   variables:
@@ -792,6 +812,13 @@ qemu-smoke-riscv64-gcc:
   needs:
     - debian-13-riscv64-gcc-debug
 
+qemu-smoke-qtb-riscv64-gcc:
+  extends: .qemu-qtb-riscv64
+  variables:
+    QTB_TEST: test_console.py
+  needs:
+    - debian-13-riscv64-gcc-debug
+
 qemu-smoke-ppc64le-powernv9-gcc:
   extends: .qemu-ppc64le
   script:

-- 
2.56.0


