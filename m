Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E1CCD98D8
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 23:09:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337051.1598711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0F-00029e-KU; Fri, 12 Jun 2026 23:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337051.1598711; Fri, 12 Jun 2026 23:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0F-00028S-Fb; Fri, 12 Jun 2026 23:09:31 +0000
Received: by outflank-mailman (input) for mailman id 1337051;
 Fri, 12 Jun 2026 23:09:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0E-0001mu-Ax
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0D-00HIs8-O7
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:29 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a7-5cb7-0a2a0a5109dd-0a2a45098b92-2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:29 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a9-2497-0a2a45090019-d155802dc002-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:29 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490c1915793so12536025e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:29 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:28 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781305769; x=1781910569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9f8AM+tsFx7VUeIRhpy35Zn5mtNfQ2vEL4QF0LSn/Hk=;
        b=gBVZ1GUDE1eULvlgNBoZBsEp9EHW8ZZVKYIrdOHdfkVqjFIKqXkldSWYe+kJBhtqAL
         7jPNULD243vm99avT3QDuFe7KyL3XObGkMDKbBdKs9C3raWQvigLRHXS+4xSWsmchRWz
         vjkn+XBj9NzBDyYGZ9D4djkkxXTcQblNI9330=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305769; x=1781910569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9f8AM+tsFx7VUeIRhpy35Zn5mtNfQ2vEL4QF0LSn/Hk=;
        b=N9Kdj5b8bgWuMWlkFOMErhshHB2M6KB06icSHhpfrHuiu+c0ipWUkpAjMT3H3hwEam
         XpDlTEHxGjBgAnlEvNd4XQzMlhWuNZWqGFoI9mMvBJq++/muObgzNoEXzWbuLJNv7lVz
         CvkdJH96vGe3BT4fL4EPx3oZxDZX6NBLJgMz2DX7he/hM6RbTtsNhK0NdvKTOboNEidb
         t331iPSZkHMKROBYweUKBO3NbGVQ6e3CqmRv1LlPjvJeujpsniplEWHXwqFx/ZwAqVIS
         Uh3BtfO9bVM6+UzmWfIwu6FWJqqGUCTmW3Ywg1vL0oLEROZaJNQQ9oBHP8vnL15Xhu50
         IGLQ==
X-Gm-Message-State: AOJu0Yz8w8s+y31gzWxmQaWD/aVoaPHIaK3sp222VbDke7ihd1KeWfDh
	fZq02axkCnH/kFH72fHuiVU+yyiLczhDqcJmBXxVeNU67xen626W9agrMzSAVwos/gft6OJutUN
	Al6co
X-Gm-Gg: Acq92OFLom6Wz74CQXhRjnCuzbxumTfMaM65le122eAvvo26nXHylXcIzkLf1Xe2f5b
	qzWMIVHVvuR9oTT0DU0qjM/8jyxHDxeyr0KZDumBG4XRgseeGuWoTGHpSyMQP1AQjhWC++tke0+
	jlKVD+u303zidAUYEmQaSm6BBgzAKZv8frHQG6SmMR+hkUO2fUFpJ+VylrNOCFtVv8JVwigRBSI
	1JoaDe1pVNX6b1cGiDhs9Dcn3KoYc4cI5JyLV1NplsLzspVD7kZJc0ntVHMGW6KZKh+Dbp3HfRD
	MaVdweLQPiEaqzakTTApDWWu6L34AVhz5zQ11JCelKBpoXzRPyqhh9JBab27SA2QK4RxlVfwY8y
	u7c8yTdVUy2MnW9mYVIz4VBzSNqrkDov7RZqnJZB7YCsCoDTzwAR+/fra67Y2ia5w08dNUL1ilY
	bx8InwU8wGp+puPX+OP/EXImw/0hBkHML7FyLpBGQWKvwKRifpyZOh+0cvg085JzuMkg/qfAoLA
	3PX
X-Received: by 2002:a05:600c:c107:b0:490:e196:eaee with SMTP id 5b1f17b1804b1-490ec509c52mr69174555e9.10.1781305769100;
        Fri, 12 Jun 2026 16:09:29 -0700 (PDT)
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
Subject: [PATCH 3/7] CI: Introduce new qubes-hw-runner.dockerfile
Date: Sat, 13 Jun 2026 00:09:20 +0100
Message-Id: <20260612230924.3181154-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781305769-8816CA53-0008AE5E/10/63158204843
X-purgate-type: spam
X-purgate-size: 2351

This container is tied to gitlab-runner environment in the RPis driving the
test systems, not a specific version of Alpine.  Intentionally give it a
generic name so it need not change in the future.

Switch to Alpine 3.24 right away, as it doesn't interact with the 3.18 builds
under test.

The container needs to remain a root container.  By no longer using the
arm64v8 build container for dual-purpose, we can finally make the build
containers be non-root.

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

Posted previously, part of the prior CI series.
---
 .../build/alpine/qubes-hw-runner.dockerfile   | 21 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile

diff --git a/automation/build/alpine/qubes-hw-runner.dockerfile b/automation/build/alpine/qubes-hw-runner.dockerfile
new file mode 100644
index 000000000000..8b111648721d
--- /dev/null
+++ b/automation/build/alpine/qubes-hw-runner.dockerfile
@@ -0,0 +1,21 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.24
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    DEPS=(
+          expect
+          openssh-client
+    )
+
+    apk add --no-cache "${DEPS[@]}"
+EOF
+
+USER root
+WORKDIR /build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 89760b24e63a..70bb4bbb3b45 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -145,7 +145,7 @@
   extends: .test-jobs-common
   variables:
     # the test controller runs on RPi4
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:qubes-hw-runner
     LOGFILE: smoke-test.log
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
-- 
2.39.5


