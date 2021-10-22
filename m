Return-Path: <SRS0=pycK=PK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3A5C43219
	for <xen-devel@archiver.kernel.org>; Fri, 22 Oct 2021 16:14:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822C5611CB
	for <xen-devel@archiver.kernel.org>; Fri, 22 Oct 2021 16:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 822C5611CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.215163.374185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBH-0007W4-5H; Fri, 22 Oct 2021 16:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215163.374185; Fri, 22 Oct 2021 16:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBG-0007Tu-UH; Fri, 22 Oct 2021 16:14:06 +0000
Received: by outflank-mailman (input) for mailman id 215163;
 Fri, 22 Oct 2021 16:14:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0007Lr-No
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0008If-NA
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBE-0005pf-MN
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:04 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mdxBC-00021I-8m; Fri, 22 Oct 2021 17:14:02 +0100
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
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=8bn2utW7cd6zKWTRhFw/fx1rt/qE6uN0b47C37/D6yQ=; b=3Gd8TmaouMRkznrHkVweNma+2v
	2HzL8XIqXD6842mEIx/5LZdEnEaUB1tYm9G0NPLv9gBBg7Fp0zjQNOOonohY+wGTrfjVYFs2BZvgH
	5aIRL9RzffpIveQ/k/OWduxx4tFqmD4hK26f2ZhZte0BODHDfY+VM17Z7gfenZ8v6l0w=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/5] ts-memdisk-try-append: Reindent (nfc)
Date: Fri, 22 Oct 2021 17:13:48 +0100
Message-Id: <20211022161351.23091-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211022161351.23091-1-iwj@xenproject.org>
References: <20211022161351.23091-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-memdisk-try-append | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/ts-memdisk-try-append b/ts-memdisk-try-append
index 4b54eff01..a35751eb3 100755
--- a/ts-memdisk-try-append
+++ b/ts-memdisk-try-append
@@ -19,17 +19,17 @@
 set -xe -o posix
 
 arch=`perl -I. -e '
-                use Osstest;
-                use Osstest::TestSupport;
+    use Osstest;
+    use Osstest::TestSupport;
 
-                tsreadconfig();
+    tsreadconfig();
 
-		our $whhost = pop @ARGV; # arg parsing bodge
-		$whhost ||= "host";
-		our $ho = selecthost($whhost);
+    our $whhost = pop @ARGV; # arg parsing bodge
+    $whhost ||= "host";
+    our $ho = selecthost($whhost);
 
-                print $ho->{Arch} or die $!;
-              ' "$@"`
+    print $ho->{Arch} or die $!;
+    ' "$@"`
 
 case "$arch" in
 amd64)
-- 
2.20.1


