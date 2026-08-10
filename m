Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA608C5B56C
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387634.1628888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZw-0003Qy-7s; Mon, 10 Aug 2026 16:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387634.1628888; Mon, 10 Aug 2026 16:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZw-0003Qr-5F; Mon, 10 Aug 2026 16:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1387634;
 Mon, 10 Aug 2026 16:10:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtSZu-0003Qe-57
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:10:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSZs-00Exue-DC
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:10:16 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705643000e099@swg.vates.tech>)
 id 6a79f79b-e002-0a2a0a5209dd-0a2a45018e00-36
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:16 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec705643000e099@swg.vates.tech>)
 id 6a79f7e7-5984-0a2a45010019-b9ff1c23956d-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec705643000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:10:12 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1015683637;
 Mon, 10 Aug 2026 18:10:12 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=HPY5KGo/VIwCujbKN7MPUq1fMcqLDozezWN+GUEapgE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NmKVVJOZy+xIPZzg6dOvGfZBZk48PkhyGPAQSxFQ/Y6IptkNe1TMzrJ3IOLKZPlCInxryPJAk
 5AJ60KQ9Pif7ELtmqjukClyNlq7eFfG62KsDXIZuSTaWpL92FsppVRGF8c/ox7sDX4bTuzpzOAe
 DWX3nIjmvRg+FA/+TDrUQyYPbAhDmtv/pHfJYCaNit1cA+Xv/zMlLcBtebAsTHfTmUZzT/vbTTW
 h89tyJmKqb1qVWott6OapujF5lJ11O6rg0OXpdo0i/O8DCWxVOEh5g0kc3MM1LQi7rP2Fh6MciX
 2VzEboj+5r1jKzrCCHfkmXuRH6EIWApZEHbTsRvClzfw==
X-Zone-Loop: 8daa169fd0630ec516f0a8d154ab406ac16cf6fa2551
x-campaign-type: default
x-transaction-id: 467ac744-8f84-4df0-8cbc-3a4c19cac1eb
x-swg-uid: 01-ed8ec477-e6d0-4af5-85db-9867530b7a14
X-Mailer: Sweego
Message-ID:
 <1786378213.8631fc262581453bbf619ec5b2062170.19fec705643000e099@vates.tech>
x-swg-bid: 1786378213.8631fc262581453bbf619ec5b2062170.19fec705643000e099
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
Subject: [PATCH 1/6 TEST-ARTIFACTS] Add a QTB container to run the Xen riscv64 tests
Date: Mon, 10 Aug 2026 18:09:51 +0200
In-Reply-To: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2048.292bd88b0601f785.19fec705373.26d4cb990fb59c26=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378212212
X-purgate-ID: tlsNG-d62444/1786378216-1F86F757-4B913EE8/10/63158204843
X-purgate-type: spam
X-purgate-size: 3421

---=Part.2048.292bd88b0601f785.19fec705373.26d4cb990fb59c26=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

QTB (QEMU Test Bench) is a Python framework, developed as part of AMD's Xen
safety initiative, that drives a live QEMU instance over qtest and QMP=2E =
It
gives a test full access to the machine while the emulation runs: read and
write the consoles, inspect the registers and the memory, inject interrupt=
s=2E

For now the riscv64 CI tests only use it to read the Xen console in the
smoke test, since DomU is not supported yet=2E Once it is, the same
framework will read and write the DomU consoles and inject IRQs, so the
tests can assert an interrupt reaches the expected guest and vCPU=2E

QTB is not upstream in QEMU yet, though it is planned to be, so get the
framework from AMD's fork gitlab=2Ecom/xen-project/people/amd/qemu and
pip-installs qemu=2Eqtb from it=2E

Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
---
 containerize                            |  1 +
 images/debian/13-qtb-riscv64=2Edockerfile | 45 +++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 images/debian/13-qtb-riscv64=2Edockerfile

diff --git a/containerize b/containerize
index dad9afa=2E=2E477b670 100755
--- a/containerize
+++ b/containerize
@@ -31,6 +31,7 @@ case "_${CONTAINER}" in
     _alpine-3=2E24-arm64-base) CONTAINER=3D"${BASE}/alpine:3=2E24-arm64-b=
ase" ;;
     _alpine-3=2E24-arm64-build) CONTAINER=3D"${BASE}/alpine:3=2E24-arm64-=
build" ;;
     _alpine-3=2E24-x86_64-base) CONTAINER=3D"${BASE}/alpine:3=2E24-x86_64=
-base" ;;
+    _debian-13-qtb-riscv64) CONTAINER=3D"${BASE}/debian:13-qtb-riscv64" ;=
;
     _alpine-3=2E24-x86_64-build|_) CONTAINER=3D"${BASE}/alpine:3=2E24-x86=
_64-build" ;;
 esac
=20
diff --git a/images/debian/13-qtb-riscv64=2Edockerfile b/images/debian/13-=
qtb-riscv64=2Edockerfile
new file mode 100644
index 0000000=2E=2E86215d3
--- /dev/null
+++ b/images/debian/13-qtb-riscv64=2Edockerfile
@@ -0,0 +1,45 @@
+# syntax=3Ddocker/dockerfile:1
+FROM --platform=3Dlinux/amd64 debian:trixie-slim
+LABEL maintainer=2Ename=3D"The Xen Project"
+LABEL maintainer=2Eemail=3D"xen-devel@lists=2Exenproject=2Eorg"
+
+ENV DEBIAN_FRONTEND=3Dnoninteractive
+
+ARG QEMU_REPO=3Dhttps://gitlab=2Ecom/xen-project/people/amd/qemu=2Egit
+ARG QEMU_COMMIT=3D24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=3D(# Base environment
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
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.2048.292bd88b0601f785.19fec705373.26d4cb990fb59c26=---

