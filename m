Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38DBC98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:09:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428468.1651310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQw-0006bz-PO; Tue, 22 Sep 2026 10:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428468.1651310; Tue, 22 Sep 2026 10:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xQw-0006bs-Ma; Tue, 22 Sep 2026 10:09:06 +0000
Received: by outflank-mailman (input) for mailman id 1428468;
 Tue, 22 Sep 2026 10:09:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xQv-0006RK-Kc
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:09:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQu-00Ao27-32;
 Tue, 22 Sep 2026 10:09:05 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xQv-00DE8C-1U;
 Tue, 22 Sep 2026 10:09:05 +0000
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
	bh=wrPZcuAXdEWAGjj1WBjrDx+MHluEOn4L26I9H5HEfgg=; b=RrHt68DlEjnQipELy4DNLB4DSZ
	iJTE8QgWyM+nniSfSwx/2H/NSiPan0CdGuvHLMTMwdKduhk6usdCgSfw99/W2Rf/DOME4EDP/Fp3g
	yBI0U7bsBM30s5zar9dNwtvCdyvHjKgHE9YSoOmKDeAuLPnACDqrEsHa5zBBkiFePfhM=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 02/13] Creating new python project
Date: Tue, 22 Sep 2026 12:08:49 +0200
Message-ID: <20260922100900.29129-3-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This can by use by `uv` for example.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
uv run mypy .
---
 automation/pytest/pyproject.toml | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 automation/pytest/pyproject.toml

diff --git a/automation/pytest/pyproject.toml b/automation/pytest/pyproject.toml
new file mode 100644
index 000000000000..3180b2555029
--- /dev/null
+++ b/automation/pytest/pyproject.toml
@@ -0,0 +1,12 @@
+[project]
+name = "xen-ci-intree"
+version = "0.1.0"
+requires-python = ">=3.14"
+dependencies = [
+    "pip>=26.0.1",
+    "pytest>=9.0.2",
+]
+[dependency-groups]
+dev = [
+    "mypy",
+]
-- 
Anthony PERARD


