Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F029C2BB1B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:14:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF7C21789
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="i2dGcQ3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF7C21789
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4587.12050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbN6-0008Mt-Sp; Thu, 08 Oct 2020 19:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4587.12050; Thu, 08 Oct 2020 19:14:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbN6-0008Mm-PU; Thu, 08 Oct 2020 19:14:36 +0000
Received: by outflank-mailman (input) for mailman id 4587;
 Thu, 08 Oct 2020 19:14:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbN5-0008Lp-DU
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96ba930c-3383-4068-91c2-db1e192daac7;
 Thu, 08 Oct 2020 19:14:34 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN4-0004R3-7F
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN4-0003pq-6V
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN2-0006So-05; Thu, 08 Oct 2020 20:14:32 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbN5-0008Lp-DU
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
X-Inumbo-ID: 96ba930c-3383-4068-91c2-db1e192daac7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 96ba930c-3383-4068-91c2-db1e192daac7;
	Thu, 08 Oct 2020 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Ib9u1KozgEMCg0jCGLWPWL8C4aZzOGRCjREpAAS7g4Y=; b=i2dGcQ3zWuoKvOwadSL80/ZwQh
	IMh5nqXT/22Hz6X1BsFZguNK/5O3s2zyMOo+IZYWYHHjjKqPlKpMO1y8fUFNsZDCGKmlil5XCUzZn
	SGJVt1vXsLQTn5lJicg0a/At1hcux+hBg9J3X0NqB2L34FIJzlpWe4nOKv+RLqEb6Ho4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0004R3-7F
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN4-0003pq-6V
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:34 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN2-0006So-05; Thu, 08 Oct 2020 20:14:32 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 01/13] Honour OSSTEST_SIMULATE=2 to actually run dummy flight
Date: Thu,  8 Oct 2020 20:14:10 +0100
Message-Id: <20201008191422.5683-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-args-hostlists | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 994e00c0..6cdff53f 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -68,8 +68,8 @@ fi
 
 execute_flight () {
         case "x$OSSTEST_SIMULATE" in
-        x|x0)   ;;
-        *)      echo SIMULATING - NOT EXECUTING $1 $2
+        x|x0|x2)   ;;
+        *)      echo SIMULATING $OSSTEST_SIMULATE - NOT EXECUTING $1 $2
                 return
                 ;;
         esac
-- 
2.20.1


