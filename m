Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A408CD6E7D
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 14:42:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1329556.1593631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVke-000105-Uw; Fri, 05 Jun 2026 14:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329556.1593631; Fri, 05 Jun 2026 14:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVke-0000zy-Rs; Fri, 05 Jun 2026 14:42:24 +0000
Received: by outflank-mailman (input) for mailman id 1329556;
 Fri, 05 Jun 2026 14:42:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVVkc-0000la-Rj
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVkc-00BGpY-8C
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e03f-bab6-0a2a0a5309dd-0a2a450baf3c-22
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:22 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e04d-212f-0a2a450b0019-d155dd2accbe-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:22 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so1548441f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:22 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:20 -0700 (PDT)
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
        d=citrix.com; s=google; t=1780670541; x=1781275341; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=559iRiXpZww5JkKU3CYk9jpFBrwpL8p7P+3OMcMAmEw=;
        b=vq/1X13Y0RmhePpJONdpmDg6o7k9Lr+eQRxxbZMeyHEza7o94LDsbMvdUEGoszXRmg
         0N6LWzG2mBiLkQkCPDgWMa/ia6NwCgPLGz0ijNEOSNw8mnWed6vl+LrWNOhnRf4O9hgz
         aYMsuit3U45B9SNUSU2bm3CboiBL8m7xG6ggo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670541; x=1781275341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=559iRiXpZww5JkKU3CYk9jpFBrwpL8p7P+3OMcMAmEw=;
        b=C99c/KIA0DV82KMYCsjDDcdOyrPkZhfLNs1ExDjXsRfx1d7qs9BCdqVp/VO2rfEsfj
         6+9FrGUhbK8WZBod4+1oILzWok8/G9hqU57yMdxiO+qecmjf5Bi9VaQj71BC1Ix0Bmxf
         Aq1c9ojWXVlAnPFoFlajDjzve6LHMBhAhbLJ3APVub7IYjt2y1jGwj8AyLo537ZoC9Dx
         0F78wczp6aOo7iixYLPylGQ+w43go/oqJxQppmQRholk5PnuFY8N7Xo3IXv+HR/rFqWA
         u1ymPPsWr6EdAenU9KmRx+tj7/+accpwYZwxIvkq5SK+lgk/KfHE2zHsIeX7QISI4Rdr
         GbBQ==
X-Gm-Message-State: AOJu0YwhxjYDswEf0gTOqWozWM0X6OvzSCyqp8uigsyIXYX35QmnoRor
	xnd61lkludH4cXo7mSRqn0rxE7szFWp5BkAVBfFro9B1gYZlxJcn0M5ANGIzn6aFKMXzzWLAMdt
	SN0YQ
X-Gm-Gg: Acq92OFIk0zeWg+m2otseeEuGU7IxU8mYwVXrf6VKGl0yYPCHlsd5EorAs+NP2YGBEo
	FMIHYaSALOdvEqE2RTmdW3dlNEMxm4O0/9WPP4HHIW1bS+7qp2dy8rlbXqhPelASVlTbGGUJwN9
	tG64vDYjpUGpv5YbnTi8SdJ6/9FNCjwf3q9qNclc0hWXnYRpgPDkr+eYSc9yE6IatpQTCLhv0kJ
	nbVd6gg8bLyiYiSiZSIztNmf01WAfdkvT5uPHvFODU0oph8NH13X0o0tdABAwP5tjS6tER71yKN
	RKUieWxEG+r3gMwZtN5taz/m3DG8vU14NCudf3L5WZfXFY9aVgeQaCLMWrRCObCcd0k1e5HkCY8
	7JkVyUBmFgwwTEGxp035HvScrPcVPxdOTKWRBgrGxVT3lHypnLpZx7imjPOOL+FFaRH33K9FVmA
	RB0Pl+edS7vmk+2oToHYbE9Ccm5TFKPqDz1m+xZmzxIn6aeyG7eEYFfv7Eql/V4r1x8ftIlJtT2
	Wla69TcWeBPdQc=
X-Received: by 2002:a05:6000:4697:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-46030186d90mr4525912f8f.0.1780670541140;
        Fri, 05 Jun 2026 07:42:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 3/6] CI: Drop Ubuntu 16.04
Date: Fri,  5 Jun 2026 15:42:10 +0100
Message-Id: <20260605144213.2749656-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780670542-19165F3B-CD4048D6/10/63158204843
X-purgate-type: spam
X-purgate-size: 3087

Ubuntu 16.04 is now fully out of support.

Introduce an 18.04 GCC Debug job in lieu of losing the 16.04 job.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 .../build/ubuntu/16.04-x86_64.dockerfile      | 65 -------------------
 automation/gitlab-ci/build.yaml               | 11 +---
 2 files changed, 3 insertions(+), 73 deletions(-)
 delete mode 100644 automation/build/ubuntu/16.04-x86_64.dockerfile

diff --git a/automation/build/ubuntu/16.04-x86_64.dockerfile b/automation/build/ubuntu/16.04-x86_64.dockerfile
deleted file mode 100644
index 72a46389fa0d..000000000000
--- a/automation/build/ubuntu/16.04-x86_64.dockerfile
+++ /dev/null
@@ -1,65 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 ubuntu:16.04
-LABEL maintainer.name="The Xen Project"
-LABEL maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-
-RUN <<EOF
-#!/bin/bash
-    set -e
-
-    useradd --create-home user
-
-    apt-get update
-
-    DEPS=(
-        # Xen
-        bison
-        build-essential
-        checkpolicy
-        clang
-        flex
-        python3-minimal
-
-        # Tools (general)
-        ca-certificates
-        cpio
-        git-core
-        gzip
-        patch
-        perl
-        pkg-config
-        wget
-        # libxenguest dombuilder
-        libbz2-dev
-        libzstd-dev
-        liblzo2-dev
-        liblzma-dev
-        zlib1g-dev
-        # libacpi
-        acpica-tools
-        # libxl
-        uuid-dev
-        libyajl-dev
-        # RomBIOS
-        bcc
-        bin86
-        # xentop
-        libncurses5-dev
-        # Python bindings
-        python3-dev
-        # Ocaml bindings/oxenstored
-        ocaml-nox
-        ocaml-findlib
-
-        # Stubdom download/extract
-        bzip2
-    )
-
-    apt-get -y --no-install-recommends install "${DEPS[@]}"
-    rm -rf /var/lib/apt/lists/*
-EOF
-
-USER user
-WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 0e5fb26c853e..5a933e42f1ab 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -617,18 +617,13 @@ fedora-41-x86_64-gcc-debug:
   variables:
     CONTAINER: fedora:41-x86_64
 
-ubuntu-16.04-x86_64-gcc:
+ubuntu-18.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: ubuntu:16.04-x86_64
+    CONTAINER: ubuntu:18.04-x86_64
 
-ubuntu-16.04-x86_64-gcc-debug:
+ubuntu-18.04-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:16.04-x86_64
-
-ubuntu-18.04-x86_64-gcc:
-  extends: .gcc-x86-64-build
   variables:
     CONTAINER: ubuntu:18.04-x86_64
 
-- 
2.39.5


