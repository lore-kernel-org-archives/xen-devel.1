Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA69606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=jaVPC2R+
Received: from list by lists.xenproject.org with outflank-mailman.1469874.1678674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBy-00037K-GH; Tue, 03 Nov 2026 14:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469874.1678674; Tue, 03 Nov 2026 14:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBy-000377-Bx; Tue, 03 Nov 2026 14:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1469874;
 Tue, 03 Nov 2026 14:08:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d@swg.vates.tech>)
 id 1xOFBw-00034N-RB
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:08:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFBv-003291-W7
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:08:48 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d@swg.vates.tech>)
 id 6ae9eae5-8faa-0a2a0a5109dd-0a2a4504ba4c-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:47 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d@swg.vates.tech>)
 id 6ae9eaef-b57f-0a2a45040019-b9ff1c12a8cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:47 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1bd69c6000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:08:27 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 03855823EE;
 Tue,  3 Nov 2026 15:08:27 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=j1bZICL7SPluilW/YkHoXNVCw65K/0Ei74AiOwZX19Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=jaVPC2R+r+TZNr4MvSWY7gbULNZRKTxGV5cDk1rueQL53BPCaBnngHEX1Ozd5aPe88gGtPpXs
 37j2b+IkOcAesH+Ywl+dDO7Amba4e5P5Fr/3GvmDg/2PAeBZo18HQSEAn20jipC5Y0P3qKQcX4H
 jodMM/O8MzaWpgMxCx54+9xbvRP9jr2qTmD5shsywabVl7nd+gCLjjHiLygRt0exbheSY5qkll8
 GAedPhv9ZyvSDCeNncpWbko/FnQG3pdHc6VeR//m8H5ouFnpt6agZL0f3HoJITm0D8x9DI5ecyS
 D5aAeeUPbf89rSPYyris+vTVGFr5XcqbRB0a4U7SkxQw==
X-Zone-Loop: 7ec548f74931ae4a300a4526fc43ad1e167457cb28c7
x-campaign-type: default
x-transaction-id: acc8e7b3-3707-4f70-a1d6-142039beb036
x-swg-uid: 01-58ce1733-ef9e-403b-a3bd-52986555ff4b
X-Mailer: Sweego
Message-ID:
 <1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d@vates.tech>
x-swg-bid: 1793714907.8631fc262581453bbf619ec5b2062170.1a1a1bd69c6000403d
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
Subject: [PATCH v3 6/6] CI: drop the riscv64 expect-based smoke test
Date: Tue,  3 Nov 2026 15:08:14 +0100
In-Reply-To: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=2576; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=AgAAP7eNg8wo8oKqZ6F3L4DvOr5d3p8W1S0cRuVt0KE=; b=aAhW4rgBbC3fBHpnyVPtFNK4bGJuvt8icAo3oIIw8G8CTk5U79VPAcPwOnqD1uFdwY9AKkkrb 16EltjvEzFRCG1u3ZtxB/+M2V1AhGtvKQWMrKLieHOhJfRP3CHZ2aRp
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714907175
X-purgate-ID: tlsNG-ebf023/1793714927-504DBB50-39DC11E7/0/0
X-purgate-type: clean
X-purgate-size: 2578
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qemu-smoke-qtb-riscv64-gcc boots Xen alone and waits for the same
"All set up" string on Xen's console as qemu-smoke-riscv64-gcc, so the
latter is redundant.

Drop qemu-smoke-riscv64-gcc, its .qemu-riscv64 template and
automation/scripts/qemu-smoke-riscv64.sh, which has no caller left.

Kept as a separate patch so it can be deferred until the QTB job has
proven itself.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
The debian:13-riscv64 container still installs qemu-system-riscv64 and
expect for the test phase, although nothing tests in it anymore. As it
needs a rebuild, dropping them is left to a follow-up if needed.
---
Changes in v3:
- New patch, split out of v2 "CI: run the riscv64 smoke test via QTB
  framework console-test".
---
 automation/gitlab-ci/test.yaml           | 20 --------------------
 automation/scripts/qemu-smoke-riscv64.sh | 19 -------------------
 2 files changed, 39 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index dcf75e4674..13f7ddfc7b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -71,19 +71,6 @@
   variables:
     TEST_TIMEOUT_OVERRIDE: 120
 
-.qemu-riscv64:
-  extends: .test-jobs-common
-  variables:
-    CONTAINER: debian:13-riscv64
-    LOGFILE: qemu-smoke-riscv64.log
-  artifacts:
-    paths:
-      - smoke.serial
-      - '*.log'
-    when: always
-  tags:
-    - x86_64
-
 .qemu-qtb-riscv64:
   extends: .test-jobs-common
   variables:
@@ -805,13 +792,6 @@ qemu-xtf-argo-x86_64-gcc-debug:
   needs:
     - alpine-3.24-x86_64-gcc-debug
 
-qemu-smoke-riscv64-gcc:
-  extends: .qemu-riscv64
-  script:
-    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-13-riscv64-gcc-debug
-
 qemu-smoke-qtb-riscv64-gcc:
   extends: .qemu-qtb-riscv64
   variables:
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

-- 
2.56.0


