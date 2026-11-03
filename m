Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51BF606D816
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=RlhEWS4Q
Received: from list by lists.xenproject.org with outflank-mailman.1469868.1678630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBi-0001nq-8H; Tue, 03 Nov 2026 14:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469868.1678630; Tue, 03 Nov 2026 14:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOFBi-0001nj-4I; Tue, 03 Nov 2026 14:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1469868;
 Tue, 03 Nov 2026 14:08:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOFBg-0001nd-FY
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 14:08:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOFBf-00EY8x-GH
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 15:08:31 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@swg.vates.tech>)
 id 6ae9eadc-e002-0a2a0a5209dd-0a2a45078c7e-14
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:31 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@swg.vates.tech>)
 id 6ae9eade-b4ea-0a2a45070019-b9ff1c228f1d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 15:08:31 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1a1bd621c000403d.008 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Nov 2026 14:08:25 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D6F098236A;
 Tue,  3 Nov 2026 15:08:24 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=kvdkC7+oTD2iP9TAnzbrTUPmahRuMGjQMQ4fSngxQLU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=RlhEWS4QQQ3mTLiv7xZapMYHrM5hvH0rhYs/snP5Iea/VEbSZV0sBquuUc7asxAIslGb7BmoS
 jpXTva3ZETrbvfONl86FPsJV29bziSaOYpch/vXkVQsSZT3PVjWeucFfE0ZM8DpAQVyuUl8w5V1
 +ZSYJ5XUSdkF8H0i8OebjhtZueCvv5eVZ+Y9ogKiXE3zLKsw0Qgh3SCaHYkUvEuvF1UoqqukPm5
 OCEGI77CB/9GaBwUlrM3ZBSSoNJfpByKzt2PZOBXS8EAi1jtluyEEXGYZYPqvlZx+h8M9ZFp1k+
 bJK9HwVNUTdJPitPyeaXDwecTzlQ8tZWyU+jhrOFegqw==
X-Zone-Loop: 9e543a423f9fa9000eb3a43f866a86d61b99c52b99f2
x-campaign-type: default
x-transaction-id: 76df096f-22f5-4d19-bcb4-4788df50c939
x-swg-uid: 01-8f476212-ee38-4229-8065-f01a696db85c
X-Mailer: Sweego
Message-ID:
 <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
x-swg-bid: 1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d
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
Subject: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
Date: Tue,  3 Nov 2026 15:08:09 +0100
In-Reply-To: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793714580; l=3803; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=kBSemm3XKY9IzqIHBYySRe+wjvdKKyrzIU+se2nT+EI=; b=8AnIJHbSeAVCBcL0+MOX0iTKUWDShIX2767oaQOuZcCuBPFW89dMCclm5cThb/k4aW0+WCvPg W+4GxqT/KMhC4SCBi+4xbo5cq9zAVSdQUomRb8f2Q3126rvW8hJ3NmR
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793714905048
X-purgate-ID: tlsNG-ef75cf/1793714911-A76D2AE4-9E41FBE1/10/63158204843
X-purgate-type: spam
X-purgate-size: 3805
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The riscv64 QTB tests use QTB (QEMU Test Bench) Python package. QTB is part
of AMD's work on the 'safety' branch [1] of their QEMU fork and is not
upstream in QEMU yet. The tests also need pytest and qemu-system-riscv64.

Add debian:13-riscv64-qtb, a Debian Trixie container with those packages
and the QTB package installed from the python/ directory of AMD's QEMU
fork, at the commit pinned by QEMU_REPO/QEMU_COMMIT. Make it available to
containerize script as trixie-riscv64-qtb.

QTB depends on pexpect, ptyprocess, pygdbmi and qemu.qmp. Rather than
fetching them from PyPI, install them from the wheels vendored in the
python/wheels/ directory of the same fork commit, with pip --no-index.

[1] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety?ref_type=heads

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
The CI jobs running the tests in this container come in a later patch.
---
Changes in v3:
- Move the container from test-artifacts to xen.git (automation/build/),
  renamed debian:13-riscv64-qtb.
- Install the QTB dependencies from the wheels vendored in the fork, with
  pip --no-index.
- Add pytest, drop jinja2, yaml and device-tree-compiler.
- Comment that the pinned commit is the tip of the safety branch.
- Reword the commit title and message.
---
 automation/build/debian/13-riscv64-qtb.dockerfile | 47 +++++++++++++++++++++++
 automation/scripts/containerize                   |  1 +
 2 files changed, 48 insertions(+)

diff --git a/automation/build/debian/13-riscv64-qtb.dockerfile b/automation/build/debian/13-riscv64-qtb.dockerfile
new file mode 100644
index 0000000000..34ca1f2b7d
--- /dev/null
+++ b/automation/build/debian/13-riscv64-qtb.dockerfile
@@ -0,0 +1,47 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+ARG QEMU_REPO=https://gitlab.com/xen-project/people/amd/qemu.git
+# Tip of the safety branch
+ARG QEMU_COMMIT=24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(# Base environment
+        ca-certificates
+        git
+        python3-minimal
+        python3-pip
+        python3-pytest
+        python3-setuptools
+
+        # QEMU for the tests
+        qemu-system-riscv64
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    # QTB framework
+    git init /tmp/qemu
+    git -C /tmp/qemu fetch --depth 1 "$QEMU_REPO" "$QEMU_COMMIT"
+    git -C /tmp/qemu checkout FETCH_HEAD
+
+    pip install --break-system-packages --no-index --no-build-isolation \
+                --find-links /tmp/qemu/python/wheels "/tmp/qemu/python[qtb]"
+
+    rm -rf /tmp/qemu
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index feadd9e82f..cd078d48d9 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -33,6 +33,7 @@ case "_${CONTAINER}" in
     _trixie-ppc64le) CONTAINER="${BASE}/debian:13-ppc64le" ;;
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _trixie-riscv64) CONTAINER="${BASE}/debian:13-riscv64" ;;
+    _trixie-riscv64-qtb) CONTAINER="${BASE}/debian:13-riscv64-qtb" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
     _bookworm|_bookworm-x86_64) CONTAINER="${BASE}/debian:12-x86_64" ;;
     _trixie-x86_64|_) CONTAINER="${BASE}/debian:13-x86_64" ;;

-- 
2.56.0


