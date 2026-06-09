Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D30DCD98C8
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2026 17:31:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1333726.1596902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0IA-00042Z-Do; Tue, 09 Jun 2026 17:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333726.1596902; Tue, 09 Jun 2026 17:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0IA-00042R-Ag; Tue, 09 Jun 2026 17:31:10 +0000
Received: by outflank-mailman (input) for mailman id 1333726;
 Tue, 09 Jun 2026 17:31:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wX0I8-0003ij-Hx
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:31:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX0I7-005Nrm-VC
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:31:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dd9-2eae-0a2a0a5409dd-0a2a450cb48e-4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:07 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284ddb-62f1-0a2a450c0019-d155802dd04d-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:07 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso66200995e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:31:07 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm113509696f8f.27.2026.06.09.10.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:31:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781026267; x=1781631067; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssvV4JRoq9pZxeGW5W9F5HAe356mfd3Foon8HbphNmg=;
        b=ikv9wKwh+Cq585Zh6LBJo5xRUaA2XXckesaKfyqxnS+/dHRlUo6G5TOYDLitjHsT+w
         c0U0FwJLmklcEWkdUl26h5Ade0B5ZHXv51RpEhP+GDwO15s3R0EWnqCwg95rjJDp8Koq
         XiYf/AY5+0EvHU/Y8aYbeZeM1gE7z2oqO1prY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026267; x=1781631067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ssvV4JRoq9pZxeGW5W9F5HAe356mfd3Foon8HbphNmg=;
        b=Id6bOIrEl4R3FQ81PZMkBrwfd4VNHgmcW6CNDd9yABe6hHVbjfr9cLbTg2KUWmyuK/
         dcquZtCTYBGmQ9ntsbiTG0xkl3tYU0OUiWxf1ua8zINEoltuIq/8Xc8MZergZhFL/FXI
         Ser/lmg1KR7qxgNDcgEE5As3z5qXQtCA7ks2WIluVfjxisYprGb5y9W1N5kLmeKRpSMp
         J1B4rhWD4xGxymonO6mal5ezuva5wWhandK71au00TsELKPOZjQj+1My5/uK4IcwyyPR
         ibdFLEiivkAiHWfFazK3XPna5xsdseO9rl9wbtkaHjMeK2qRC3ycZzXYboOims9MjtjZ
         uACw==
X-Gm-Message-State: AOJu0Yywu6xWD+u9JgvmB4BhvSrXGO0u20andTOhfn2ZW6t+xjhM13iZ
	gy2p0znlcC93TEb6fJXTrda5AgDsaiAT5Qqg/qGmdYNg/1jqUuUB98HZ2UGer1jZ8yhUJ8Y3Q1n
	0P8dS
X-Gm-Gg: Acq92OGKui+tO0wjk/X305MaVHk+IcksdbUeQSIEFxwDHtTSgVXroc/HJjPGKfxX7RI
	xvmZ8zPZo9E8l4Vsmnl2k42jp7/ArdUB80/yGHTbZ/iz/8hMvXmkdNlug1YM7yE91yehAIHEjAU
	d6VoNT37lSBQXlPr6l7LzojyTllMUAiwHbUmiJ0k9FP6mXHCbVQcYuuc+ryuLHZZvRMmhAdOsSS
	5GqLicKPcbq1Vu+VPIvCQGaChWNUoEgEe4UUoiObAmXVaP3X1BuqMMcNG76e0DgcqC9jS7+/F6+
	9rOvCg+70oHQiFcHVtf0EpbuRFfPjRmRknwUrMhGOgH6j9JJIc/j3AbrDvyGJMUgcRQSIj6NO2h
	jIJpMl4fIzDn9Ed04v7AT63whj8bZMj1VxU1MvRgTGgN1FzjhOXkQRoR+SM/rLWDds5YrByC7m2
	6S/Zw3vup3j6G+4R2WH+NlLraK9WKi0f86gjqIiuOQOqgfgr5eyhst10uV1W3m9cLjVlH26k18A
	7z6LGl9+/xmzR0=
X-Received: by 2002:a05:600c:4e13:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-490c25eea3bmr388170395e9.23.1781026267210;
        Tue, 09 Jun 2026 10:31:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/4] CI: Rename xenial-xilinx to xilinx-hw-runner
Date: Tue,  9 Jun 2026 18:31:00 +0100
Message-Id: <20260609173102.2908514-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781026267-E156FCF5-0D0897D7/10/63158204843
X-purgate-type: spam
X-purgate-size: 3792

The container is tied to the runner, not a version of Ubuntu.  Intentionally
give it a generic name so it need not change in the future.

Apply standard cleanup to the dockerfile, except that it must continue to be a
root container to drive real hardware.  Explicitly install ca-certificates to
compensate for --no-install-recommends.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 .../build/ubuntu/xenial-xilinx.dockerfile     | 27 ----------------
 .../build/ubuntu/xilinx-hw-runner.dockerfile  | 32 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                |  4 +--
 3 files changed, 34 insertions(+), 29 deletions(-)
 delete mode 100644 automation/build/ubuntu/xenial-xilinx.dockerfile
 create mode 100644 automation/build/ubuntu/xilinx-hw-runner.dockerfile

diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
deleted file mode 100644
index 6107d8b7711f..000000000000
--- a/automation/build/ubuntu/xenial-xilinx.dockerfile
+++ /dev/null
@@ -1,27 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 ubuntu:16.04
-LABEL maintainer.name="The Xen Project " \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# board bringup depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        snmp \
-        snmp-mibs-downloader \
-        u-boot-tools \
-        device-tree-compiler \
-        cpio \
-        git \
-        gzip \
-        file \
-        expect \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/build/ubuntu/xilinx-hw-runner.dockerfile b/automation/build/ubuntu/xilinx-hw-runner.dockerfile
new file mode 100644
index 000000000000..1855b11af354
--- /dev/null
+++ b/automation/build/ubuntu/xilinx-hw-runner.dockerfile
@@ -0,0 +1,32 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:16.04
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    apt-get update
+
+    DEPS=(
+        ca-certificates
+        cpio
+        device-tree-compiler
+        expect
+        file
+        git
+        gzip
+        snmp
+        snmp-mibs-downloader
+        u-boot-tools
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER root
+WORKDIR /build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1722800c1541..89760b24e63a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -105,7 +105,7 @@
 .xilinx-arm64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: ubuntu:xenial-xilinx
+    CONTAINER: ubuntu:xilinx-hw-runner
     LOGFILE: qemu-smoke-xilinx.log
     TEST_TIMEOUT_OVERRIDE: 120
   artifacts:
@@ -124,7 +124,7 @@
 .xilinx-x86_64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: ubuntu:xenial-xilinx
+    CONTAINER: ubuntu:xilinx-hw-runner
     LOGFILE: xilinx-smoke-x86_64.log
     XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2F8,4"
     TEST_BOARD: "crater"
-- 
2.39.5


