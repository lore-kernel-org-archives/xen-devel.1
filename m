Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC848C982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428472.1651341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR0-0007HF-LB; Tue, 22 Sep 2026 10:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428472.1651341; Tue, 22 Sep 2026 10:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xR0-0007H2-HR; Tue, 22 Sep 2026 10:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1428472;
 Tue, 22 Sep 2026 10:09:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xR0-0007DN-1Y
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQz-00Ao2s-1d;
 Tue, 22 Sep 2026 10:09:09 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR0-00DE8C-09;
 Tue, 22 Sep 2026 10:09:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=/T7l5iO1dXbkzvS8G10wVZoy6AS2fih5DyiAKEvAhIQ=; b=Pu86ouqZl6A08svoclKdBsNkO2
	+P0nYkh7Ox0AQavyyAE8PeEIadRCPrQNH41ihaK0yqpn44PKbgcnfJIBgQIc2gKSGBQQ/K01zY78g
	tgl09v+hEuPOgA1Cz6i1Nun3rrng1ZEsFa+zVtDcYlm8C+urc2iRP7Mv0aTbcCM36Kqc=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 06/13] We need an older version of paramiko.
Date: Tue, 22 Sep 2026 12:08:53 +0200
Message-ID: <20260922100900.29129-7-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

To connect to the moonshot controller over ssh.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/pyproject.toml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/pytest/pyproject.toml b/automation/pytest/pyproject.toml
index 4ab7094e0d84..c54c1338f656 100644
--- a/automation/pytest/pyproject.toml
+++ b/automation/pytest/pyproject.toml
@@ -3,7 +3,8 @@ name = "xen-ci-intree"
 version = "0.1.0"
 requires-python = ">=3.14"
 dependencies = [
-    "paramiko>=4.0.0",
+    # Need paramiko with support for SHA-1 key exchange
+    "paramiko<5.0.0",
     "pip>=26.0.1",
     "pytest>=9.0.2",
     "pytest-timeout>=2.4.0",
-- 
Anthony PERARD


