Return-Path: <SRS0=/Cwe=LB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC70C47082
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 15:16:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB99360C3D
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jun 2021 15:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB99360C3D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.138038.255658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzN-000609-CV; Mon, 07 Jun 2021 15:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138038.255658; Mon, 07 Jun 2021 15:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGzN-0005yC-6m; Mon, 07 Jun 2021 15:16:29 +0000
Received: by outflank-mailman (input) for mailman id 138038;
 Mon, 07 Jun 2021 15:16:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzL-0005U0-A6
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzL-0002b7-9M
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lqGzL-0001kr-8V
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 15:16:27 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lqGzJ-0000i8-4H; Mon, 07 Jun 2021 16:16:25 +0100
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
	bh=zQfvwktehqJEtR9IykWPHnEdGaQXPLkehhore2dQGUg=; b=h3OJG8RScyvr2Ej+8Ph3K00Nhv
	Ywq0jdXVe0QBJYXD61VflRwbSAu9bV07Nf/wMqpFdHNZENfDaKQJi83wP9lfYFwaWx74iNqiZ7FpI
	0KQmsJINwqVYAMy2ebBHWo2Laf/IzK2fAIaPl88Cqzd65TF2qz1Lgk33OccC4WzoI5Vc=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/3] host allocation: Check "job class" too
Date: Mon,  7 Jun 2021 16:16:13 +0100
Message-Id: <20210607151614.14132-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607151614.14132-1-iwj@xenproject.org>
References: <20210607151614.14132-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That is all jobs which start with the same \w* as this job.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-hosts-allocate-Executive | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index 9722ce12..849bc97b 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -937,12 +937,20 @@ sub attempt_allocation {
 	    }
 	} elsif (%$starvation_p) {
 	    my $est_abs = most_optimistic($best, $now, $starvation_p->{I});
-	    my ($starving, $m) = starving($est_abs, $now, 0);
+	    my $all_starving = 1;
+	    foreach my $thisclass (qw(1 0)) {
+		my $tcdesc = $thisclass ? 'class' : 'flight';
+		my ($starving, $m) = starving($est_abs, $now, $thisclass);
+		if (!$starving) {
+		    print DEBUG "not starving ($tcdesc): $m\n";
+		    $all_starving = 0;
+		    last;
+		} else {
+		    logm "starving ($tcdesc) ($m)";
+		}
+	    }
 	    $starvation_q->finish();
-	    if (!$starving) {
-		print DEBUG "not starving: $m\n";
-	    } else {
-		logm "starving ($m)";
+	    if ($all_starving) {
 		return $alloc_starved_r;
 	    }
 	}
-- 
2.20.1


