Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A9C606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 21:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=KpkzVcT9
Received: from list by lists.xenproject.org with outflank-mailman.1504053.1699604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd4-0006L2-CK; Thu, 26 Nov 2026 21:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504053.1699604; Thu, 26 Nov 2026 21:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgd4-0006Ka-7B; Thu, 26 Nov 2026 21:03:42 +0000
Received: by outflank-mailman (input) for mailman id 1504053;
 Thu, 26 Nov 2026 21:03:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWgd2-0006I0-Ne
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:03:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgd2-00CPvZ-4G
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:03:40 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089eac-8faa-0a2a0a5109dd-0a2a450a97f6-0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:40 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6b089eab-f2d2-0a2a450a0019-d1558036ad31-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:03:40 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso75245225e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:03:40 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm570536295e9.1.2026.11.26.13.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 13:03:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1795727019; x=1796331819; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0xJupgVMhexTIqZnilRQJX1qMS7vNcSlf1zAvcqhmw=;
        b=KpkzVcT9Px27OSZ+0An2xIus9LOFAkbjtZ1yvgss0fVU4pQv8l2e56+z74Yjg1QqpJ
         dHf2rPF9TxOS/ewnUa9c83ZRAf+rZmkjMjAvE3yOmLOtsFrcIfd85vGMrFoRcz2359rs
         qjZqJbatZJDeP+6Y0zN3lrHljfMSFybFjePyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795727019; x=1796331819;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0xJupgVMhexTIqZnilRQJX1qMS7vNcSlf1zAvcqhmw=;
        b=CnCos/sk42UV0lnswBdz0L7AgZU2wa3IP/QPmtGwJZ52DVwQchH7chcCGECO3qYAaV
         m8ycxSkwJWg/xCLAnjpeuj7dm/Ci0maXBEHRCqHI+FehsNXLw6GR9cuJd21pTSFy4ZDn
         mSWqni5NPXkMLcWAUrDgxariEjnmqzYoaTig6QO3QdSwL0R6w3KB2jXuqZyouJvH6uBN
         GuVEYeYcNt7Nhkr4fn38dgphmmz/83M6VWFdJtrzpw56hiEvIGeU/74PpAyfXDloS0x3
         f6N+HYxZBKo+vVkpUSqVfSCkTK8HzylN+Je3L07YjK+fSL5s/6dRBU5nJPonTBrNpv2K
         88PQ==
X-Gm-Message-State: APuU4Z/QlyEKDHS+gac6A1cAF1+xScwMc3XGAb9YkikST43uLSvlQJyM
	6n5sVWGK3Z7EYQEZpc/Lg8CmIy8C+iRat2pvT/tCxkherJU+NnxLVszpVjOatHe+lhNIiKWyfza
	m5bd7CHI=
X-Gm-Gg: AZFdTZdsGknI86ts7jvmxAKWeGv3bge2busmi7+CauR648l63ejNv22A59BRWVqQwdk
	MXiusxKXY1Mojaz2/W4EpEcb5mfbrJ+ROoshZTRQmyLuUzN8M4PwkIMXxyyL6PlfOhuVjS5sMKe
	FkVucRPnKAs5S9sAuALUCwmXIFEd0BoOo4W1kT8sVscD9g/rG22Fk6eTYjeACVi2zD24HzMa8yJ
	BsnhVGw0t66QCUGMKdlofn2Ozr3FxRI9PM4sZcfi81xGwIze/X4itT1N/ExPW8RWUyaBWPW8rUi
	y49bjYhVgPmI64NxzNgU+TGR2XbLolHTnsXGMNf181gvLENlpqvpqcTefHuAjjdVwUF9NvjHDQJ
	bmwBlsa0mnqZ7fT5UNQnoC/Cb1euvu8lrLoRjxUuTMnRJKEKTptEyV8SPdKNdtGukFhRjIQZ6k7
	DCujWiXD6Q816vz2u6X0wIAXnRqzXcijNzcbD8OI7qDxo0F1E0AzMLE+vHptEcaMRcm98Go65zE
	HBf+/zqAg6uj31AVANPS7ihWiQv/tX+/rNV2nTd9lkuYz5wtfATuAIAyjvqRv9iw/eYpSEMYO/z
	PqIJmoUaEyZFkY7t0Jgg8Sx/StIX3q1TC6K50F4YTp7JfSeR3tkkYvyr/em2aPmuk2K4o8SFeET
	rnR0=
X-Received: by 2002:a05:600c:4e02:b0:4bb:5d39:95fa with SMTP id 5b1f17b1804b1-4bb88811c82mr435667865e9.12.1795727019372;
        Thu, 26 Nov 2026 13:03:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <freddy77@gmail.com>
Subject: [PATCH 1/4] CI: Update Fedora to 45
Date: Thu, 26 Nov 2026 21:03:34 +0000
Message-Id: <20261126210337.746228-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261126210337.746228-1-andrew.cooper3@citrix.com>
References: <20261126210337.746228-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795727020-4B8D5CFC-A7C306CA/10/63158204843
X-purgate-type: spam
X-purgate-size: 3194
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fedora 43 is about to hit EoL.

This also gets us a container with binutils >= 2.46, which is going to be
needed for EFI/StrictNX testing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <freddy77@gmail.com>

I have already deployed this container, including the additional change from
patch 4.
---
 .../fedora/{43-x86_64.dockerfile => 45-x86_64.dockerfile} | 2 +-
 automation/gitlab-ci/build.yaml                           | 8 ++++----
 automation/scripts/containerize                           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename automation/build/fedora/{43-x86_64.dockerfile => 45-x86_64.dockerfile} (97%)

diff --git a/automation/build/fedora/43-x86_64.dockerfile b/automation/build/fedora/45-x86_64.dockerfile
similarity index 97%
rename from automation/build/fedora/43-x86_64.dockerfile
rename to automation/build/fedora/45-x86_64.dockerfile
index 0a2329e2dc37..5a1764c7ee55 100644
--- a/automation/build/fedora/43-x86_64.dockerfile
+++ b/automation/build/fedora/45-x86_64.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 fedora:43
+FROM --platform=linux/amd64 fedora:45
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 94359febdae2..676009045448 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -619,15 +619,15 @@ debian-13-x86_32-gcc-debug:
   variables:
     CONTAINER: debian:13-x86_32
 
-fedora-43-x86_64-gcc:
+fedora-45-x86_64-gcc:
   extends: .gcc-x86_64-build
   variables:
-    CONTAINER: fedora:43-x86_64
+    CONTAINER: fedora:45-x86_64
 
-fedora-43-x86_64-gcc-debug:
+fedora-45-x86_64-gcc-debug:
   extends: .gcc-x86_64-build-debug
   variables:
-    CONTAINER: fedora:43-x86_64
+    CONTAINER: fedora:45-x86_64
 
 ubuntu-18.04-x86_64-gcc:
   extends: .gcc-x86_64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index feadd9e82fc4..8a175fcd0b36 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -27,7 +27,7 @@ case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.24-x86_64" ;;
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.24-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current-x86_64" ;;
-    _fedora) CONTAINER="${BASE}/fedora:43-x86_64";;
+    _fedora) CONTAINER="${BASE}/fedora:45-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _trixie-ppc64le) CONTAINER="${BASE}/debian:13-ppc64le" ;;
-- 
2.39.5


