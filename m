Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C29DC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:29:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428557.1651413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkQ-0006uv-7L; Tue, 22 Sep 2026 10:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428557.1651413; Tue, 22 Sep 2026 10:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xkQ-0006tP-0k; Tue, 22 Sep 2026 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1428557;
 Tue, 22 Sep 2026 10:29:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1x8xkO-0006nB-S0
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:29:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xkO-00ApBz-0w;
 Tue, 22 Sep 2026 10:29:12 +0000
Received: from [2a01:cb15:80c6:e800:b9e9:dfdc:4751:7ecb] (helo=l14.home)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1x8xR6-00DE8C-31;
 Tue, 22 Sep 2026 10:09:16 +0000
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
	bh=xbKqePSgOa7HquVDUAC/PIH+wy1cBxBCncvcGMMYNw0=; b=w9WFgaeqKb8P/grfPG6dOfj7D3
	eOrUekBbBylDc6LCbQGVgOy3X81cse+VLj2PXkFRxPnwBNKHKrWaqSg2gEprousa7rte3MKeGt2Xh
	TITxUzPAjiUgFeidVwg7G2KZ3jzkS4wINj/P/Sy57nu2mS15F3jHLTpktAyCmw4VgEJ0=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 12/13] pytest: Add example .env for options for the tests
Date: Tue, 22 Sep 2026 12:08:59 +0200
Message-ID: <20260922100900.29129-13-anthony@xenproject.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100900.29129-1-anthony@xenproject.org>
References: <20260922100900.29129-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

All thees could be instead pass to the environment of a gitlab-runner
job instead. But that can make developing easier.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/pytest/.env           | 19 +++++++++++++++++++
 automation/pytest/pyproject.toml |  1 +
 automation/pytest/pytest.toml    |  4 ++++
 3 files changed, 24 insertions(+)
 create mode 100644 automation/pytest/.env

diff --git a/automation/pytest/.env b/automation/pytest/.env
new file mode 100644
index 000000000000..6ac8b6158de8
--- /dev/null
+++ b/automation/pytest/.env
@@ -0,0 +1,19 @@
+# Test machine
+HOST_MAC="ff:ff:ff:ff:ff:ff"
+HOST_IP_GATEWAY="203.0.113.1"
+HOST_IP_VLANID=42
+HOST_IP4="203.0.113.42/24"
+HOST_IP6="2001:db8::1:42/32"
+
+# IPMI
+IPMI_HOSTNAME='moonshot.example.org'
+IPMI_BLADE_NODE="c42n1"
+
+# Network environment
+# XXX default value probably not needed with env_files_skip_if_set
+PXE_HOST=${PXE_HOST:-pxe.example.org}
+PXE_HTTP_PATH="configs/custom/${HOST_MAC}"
+PXE_SSH_USER=pxe
+PXE_SSH_PATH="pxe/moonshot-c42"
+
+SSH_PUB_KEYS="ssh-algo AAAArandomstring Not a real key\n"
diff --git a/automation/pytest/pyproject.toml b/automation/pytest/pyproject.toml
index c54c1338f656..b62befaa07d3 100644
--- a/automation/pytest/pyproject.toml
+++ b/automation/pytest/pyproject.toml
@@ -7,6 +7,7 @@ dependencies = [
     "paramiko<5.0.0",
     "pip>=26.0.1",
     "pytest>=9.0.2",
+    "pytest-env>=1.6.0",
     "pytest-timeout>=2.4.0",
     "types-paramiko>=4.0.0.20260322",
 ]
diff --git a/automation/pytest/pytest.toml b/automation/pytest/pytest.toml
index ef61ff74ab47..405a56a83301 100644
--- a/automation/pytest/pytest.toml
+++ b/automation/pytest/pytest.toml
@@ -7,3 +7,7 @@ log_cli_format = "%(asctime)s %(levelname)s %(message)s"
 log_cli_date_format = "%H:%M:%S"
 log_cli_level = "DEBUG"
 log_cli = true
+
+[pytest_env]
+env_files = [".env"]
+env_files_skip_if_set = true
-- 
Anthony PERARD


