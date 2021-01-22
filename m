Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3553EC43381
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:56:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8FC022248
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 15:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8FC022248
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72899.131398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004ck-OV; Fri, 22 Jan 2021 15:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72899.131398; Fri, 22 Jan 2021 15:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ynG-0004cS-FV; Fri, 22 Jan 2021 15:56:14 +0000
Received: by outflank-mailman (input) for mailman id 72899;
 Fri, 22 Jan 2021 15:56:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0004b3-VA
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0002OP-UO
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l2ynE-0000RT-SX
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 15:56:12 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l2ynD-0004Ar-5W; Fri, 22 Jan 2021 15:56:11 +0000
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
	bh=GOOGnmdC7TmDzuok1J8HYpZTYLuCXs1wW2s99KsC2o0=; b=vGLpEwIan930QL9r1fU+09arom
	P3LSIqX1WHN4/3GPDetIo8Zac/Fk0AnDu4RUS94sumU/jjshPfozq1U54Et1+miPzvS/fyfp61dqy
	15h5zy6wKLacmOdSH/DIBPRL4l9MR7D72lxAFaiPVZSXt12+CxaQcZc8rDBSl3doPBy8=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/7] ts-xen-install: Rename $commons_config_file
Date: Fri, 22 Jan 2021 15:55:59 +0000
Message-Id: <20210122155603.23402-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122155603.23402-1-iwj@xenproject.org>
References: <20210122155603.23402-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the shell script config for xencommons.  We are going to set
other things here too.

No functional change.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-xen-install | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ts-xen-install b/ts-xen-install
index 5d4f8b0d..feb98951 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -127,18 +127,18 @@ sub adjustconfig () {
 	print EO $extra or die $!;
     }) if toolstack($ho)->{Name} eq "xend";
 
-    my $trace_config_file;
+    my $commons_config_file;
     foreach my $try (qw(/etc/default/xencommons
                         /etc/sysconfig/xencommons
                         /etc/default/xend
                         /etc/sysconfig/xend)) {
         next unless target_file_exists($ho, $try);
-        $trace_config_file= $try;
+        $commons_config_file= $try;
         last;
     }
-    die unless defined $trace_config_file;
+    die unless defined $commons_config_file;
 
-    target_editfile_root($ho, $trace_config_file,
+    target_editfile_root($ho, $commons_config_file,
 	sub { target_editfile_kvp_replace("XENCONSOLED_TRACE", "guest") });
 
     target_editfile_root($ho, '/etc/libvirt/libvirtd.conf',
-- 
2.20.1


