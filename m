Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F9C43602
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 14:56:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357141.1611632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whThM-0008Rg-UO; Wed, 08 Jul 2026 14:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357141.1611632; Wed, 08 Jul 2026 14:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whThM-0008RZ-Rk; Wed, 08 Jul 2026 14:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1357141;
 Wed, 08 Jul 2026 14:56:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1whThL-0008RP-Kd
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:56:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whThL-000TdA-1C
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:56:27 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4e650d-e002-0a2a0a5209dd-0a2a4502cf7c-30
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:56:26 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a4e651a-5a27-0a2a45020019-d1558030a8fc-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:56:26 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so22114645e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:56:26 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e544837dsm56580655e9.0.2026.07.08.07.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 07:56:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1783522586; x=1784127386; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mv/jtJ1SDZHfc0ENW2uPRf1DZwsBf/wZOyN1L9JO1gs=;
        b=YowQNT3i3A4qdoAZK0aQbfKe61givnScjJ/xTqQqbz/lRCGeshNk9QCWH4p8xv2qWR
         UKxkpl74jzX6woBXvBhXHdgAeQ0uUuyX465h9BmHsMwwWkTQ/bL6s5uFb9+ZQMHBYlX3
         Ew7mdsLLC3NNMv3JEAR7ELNWzXj6fgyCAB5cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522586; x=1784127386;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mv/jtJ1SDZHfc0ENW2uPRf1DZwsBf/wZOyN1L9JO1gs=;
        b=JEdmTwNaoIHvgMzqYfOKgBoP3MbyNNGvxv8CzfZ7kPucdvMSoMWGMAsEaLI+EdVg6t
         lbAZ9LvLe1exzwCH35vUaMH1cBExO4dliJqhACtmm6wU6/MSaUjDihSVL1TtILnWg+kO
         sl1AbA7XVTO4SIZYb3n9CwGrHOaLrwLhwtdqnO6GhOs5WV6+ReEYssOgWyOjF6zGWjMx
         K8bB3XQznV2Iaj7yUjnHmdCx+ZNsnsYQJm/2k5G5PwzZp9LJAr7ULakm9jHVdVucAfj7
         bl7rLRKcQRdtp+h2fAq69899jRd9HFGU1mGpF8T6uLxVkns6AwLJT2rYb6WSHGBcMCYR
         p/9g==
X-Gm-Message-State: AOJu0Yyw/oR38i6elt9zxXjyLKfFPtMvCYiC4xPB+Ldz36oBY7bBNIR1
	vLJlET3X1NvltHiImxQz5i871yNwSCSZb932oxx2ZsSUDNu/DyT544TwpC0SoRUBMDWnT3dgoNC
	AAtSh
X-Gm-Gg: AfdE7cn8M889AuuPtAQmuO4pj8gQKKv0/J2wPWFV1K+OtkahiL/zFs3uiqUOZVTUmRX
	ve2pN3H7jp76Zjugvsm0wmF8LYiTUEytH94A68LHjXPkfgOa+iOFl5jDqZL+2JMtpjMXXJ3ea4H
	sNLgH6H5uEhZmzkPydPH1AfvqYs38ZxDs0eTWq5B41N2m+mo7A76uyK8NeM27zJhOhrzQ6uBP7e
	OGRhBA+vf8ueH4j1T7t4sB1qk0zHbwquUEQq+8DhFtVqYGQgQ4JPcy96/5BvJDr9/+dJCPEjk9o
	MUSME2s41b/61/AGF09QGx5i6BF6Q4H5U/PpdeA9jlxFJhexPEnwq6nWelcol+W442hHHUAykfQ
	QGBFwr/JsEa8JiycI8nkAH5kPNYVKDImnRSYCifnX1tvySNI72xYNRQJixfna852hgXWs1P8TIK
	wOG1Oyrt8jpgbt3nih/GlMlPF4vs9FsOnIeHYogAQYOyJ539pE2uIb+SBn26E0YLg=
X-Received: by 2002:a05:600c:3f0f:b0:493:b698:9247 with SMTP id 5b1f17b1804b1-493e639ac57mr30954645e9.14.1783522585396;
        Wed, 08 Jul 2026 07:56:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH TEST-ARTEFACTS] Add PantherLake microcode
Date: Wed,  8 Jul 2026 15:56:23 +0100
Message-Id: <20260708145623.1441067-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783522586-4C13A7C5-F01DA4AC/0/0
X-purgate-type: clean
X-purgate-size: 834

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 scripts/x86-microcode.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/x86-microcode.sh b/scripts/x86-microcode.sh
index cb55a3bd2d52..7442e0ae9671 100755
--- a/scripts/x86-microcode.sh
+++ b/scripts/x86-microcode.sh
@@ -21,6 +21,7 @@ tar xf intel-latest.tar --strip-components=1
     cd intel-ucode
     cat 06-97-02 # adl-*
     cat 06-8e-09 # kbl-*
+    cat 06-cc-03 # ptl-*
 ) > "${UCODEDIR}/GenuineIntel.bin"
 
 #

base-commit: fe26bfd25cf09cd5ad11ecdf69699d3dde2c865d
-- 
2.39.5


