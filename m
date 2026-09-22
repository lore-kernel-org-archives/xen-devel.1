Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43DAC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:29:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428558.1651418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkQ-000701-FM; Tue, 22 Sep 2026 10:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428558.1651418; Tue, 22 Sep 2026 10:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkQ-0006xh-8R; Tue, 22 Sep 2026 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1428558;
 Tue, 22 Sep 2026 10:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xkO-0006nG-Sf
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xkO-00ApC1-13;
 Tue, 22 Sep 2026 10:29:12 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR5-00DE8C-2X;
 Tue, 22 Sep 2026 10:09:15 +0000
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
	bh=h6+SFB0CIizh0TnhNrfS2IIUlkL9246nxzGjrD51H0I=; b=QOWCVPAl1mpKrXFrDY/XE+hiAX
	Dh/I4r/EWYNQQ/WU0Vd0h0mta+5IW2k5gAZdMOaiIl1nfmgn+H70XESbEiSxlf5jYmBKQ0rA3DqTI
	8IcygBJbJc1HJryYo/f0EpMFnr7Ll49mFdGEwPsx4LLS6xv3nRIrwYFBzJWTERiSC37E=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 11/13] pytest: Add config to enable live log, and disable ssh/paramiko logging
Date: Tue, 22 Sep 2026 12:08:58 +0200
Message-ID: <20260922100900.29129-12-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/pytest.toml | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 automation/pytest/pytest.toml

diff --git a/automation/pytest/pytest.toml b/automation/pytest/pytest.toml
new file mode 100644
index 000000000000..ef61ff74ab47
--- /dev/null
+++ b/automation/pytest/pytest.toml
@@ -0,0 +1,9 @@
+[pytest]
+addopts = [
+    "--log-disable=paramiko.transport",
+    "--log-disable=paramiko.transport.sftp",
+]
+log_cli_format = "%(asctime)s %(levelname)s %(message)s"
+log_cli_date_format = "%H:%M:%S"
+log_cli_level = "DEBUG"
+log_cli = true
-- 
Anthony PERARD


