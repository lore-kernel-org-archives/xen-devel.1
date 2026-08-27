Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F062C61DC7
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:43:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400479.1636132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWde-0005Tr-QF; Thu, 27 Aug 2026 09:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400479.1636132; Thu, 27 Aug 2026 09:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWde-0005Ti-L9; Thu, 27 Aug 2026 09:43:14 +0000
Received: by outflank-mailman (input) for mailman id 1400479;
 Thu, 27 Aug 2026 09:43:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzWdc-0005TX-ST
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:43:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWdc-00B8Qw-94
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:43:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@swg.vates.tech>)
 id 6a9006a5-8faa-0a2a0a5109dd-0a2a4506caa8-20
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:12 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@swg.vates.tech>)
 id 6a9006af-195a-0a2a45060019-b9ff1c12a20f-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:12 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0429a0db7000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:43:07 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 656DC81230;
 Thu, 27 Aug 2026 11:43:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+fIlO9mf1bNb6w2Vy7RTkh4SsFCS7tMV++tpqFsgJCE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=FkPrl4dpV8RQmqZi2y9uisTYaUlsQ9UyRpJM+Fepfexh4sjknAVUjb86QPX1q1WYy/mDoZudC
 Z1oqeoT1rIG+gVszk3SnI8NjxBu9lNkTwnJsCe0OUYzszmypD3Pq/PEqEGVcgTtxWYyjXiSJKw0
 +YPPLqVDi0NuMyyNL1yMP+e+JoaH5/WBWJj0N34GaxiIAoHmvN4elod4UkQv3sjeTT/VkOeoSXq
 qpLmgPotZlPnaYtFyDJ+vyS7b+Ejgm0CjOkofuxLgzuPxaZ8cZdt1k5xegybT/46M54hFW1Hm3k
 iD1GiKgQq4FuyCvaEdQ2yD/wx1r43SZ3t/fgLNTXBimA==
X-Zone-Loop: ea63cb4949b7c6921f821a088449c34448928466fe93
x-campaign-type: default
x-transaction-id: 049912a5-1f7d-4876-aba9-f756917953f3
x-swg-uid: 01-3f407e4b-4268-461f-97cb-edbe9143ad2a
X-Mailer: Sweego
Message-ID:
 <1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@vates.tech>
x-swg-bid: 1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/6] Add a QTB container to run the Xen riscv64 tests
Date: Thu, 27 Aug 2026 11:42:47 +0200
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823786578
X-purgate-ID: tlsNG-16d1c6/1787823792-FD80D77B-67A9A57B/10/63158204843
X-purgate-type: spam
X-purgate-size: 2965

QTB (QEMU Test Bench) is a Python framework, developed as part of AMD's Xen
safety initiative, that drives a live QEMU instance over qtest and QMP. It
gives a test full access to the machine while the emulation runs: read and
write the consoles, inspect the registers and the memory, inject interrupts.

For now the riscv64 CI tests only use it to read the Xen console in the
smoke test, since DomU is not supported yet. Once it is, the same
framework will read and write the DomU consoles and inject IRQs, so the
tests can assert an interrupt reaches the expected guest and vCPU.

QTB is not upstream in QEMU yet, though it is planned to be, so get the
framework from AMD's fork gitlab.com/xen-project/people/amd/qemu and
pip-installs qemu.qtb from it.

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 containerize                            |  1 +
 images/debian/13-qtb-riscv64.dockerfile | 45 +++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 images/debian/13-qtb-riscv64.dockerfile

diff --git a/containerize b/containerize
index dad9afa..477b670 100755
--- a/containerize
+++ b/containerize
@@ -31,6 +31,7 @@ case "_${CONTAINER}" in
     _alpine-3.24-arm64-base) CONTAINER="${BASE}/alpine:3.24-arm64-base" ;;
     _alpine-3.24-arm64-build) CONTAINER="${BASE}/alpine:3.24-arm64-build" ;;
     _alpine-3.24-x86_64-base) CONTAINER="${BASE}/alpine:3.24-x86_64-base" ;;
+    _debian-13-qtb-riscv64) CONTAINER="${BASE}/debian:13-qtb-riscv64" ;;
     _alpine-3.24-x86_64-build|_) CONTAINER="${BASE}/alpine:3.24-x86_64-build" ;;
 esac
 
diff --git a/images/debian/13-qtb-riscv64.dockerfile b/images/debian/13-qtb-riscv64.dockerfile
new file mode 100644
index 0000000..86215d3
--- /dev/null
+++ b/images/debian/13-qtb-riscv64.dockerfile
@@ -0,0 +1,45 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+ARG QEMU_REPO=https://gitlab.com/xen-project/people/amd/qemu.git
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
+        device-tree-compiler
+        git
+        python3-jinja2
+        python3-minimal
+        python3-pip
+        python3-yaml
+
+        # Qemu for test phase
+        qemu-system-riscv64
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    # QTB framework
+    git init /tmp/qemu
+    git -C /tmp/qemu fetch --depth 1 "$QEMU_REPO" "$QEMU_COMMIT"
+    git -C /tmp/qemu checkout FETCH_HEAD
+    pip install --break-system-packages /tmp/qemu/python[qtb]
+
+    rm -rf /tmp/qemu
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
-- 
2.55.0


