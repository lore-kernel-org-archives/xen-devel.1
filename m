Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31B9C433DF
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:14:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549B121789
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="GmGifwcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 549B121789
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4591.12097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbNH-00007s-85; Thu, 08 Oct 2020 19:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4591.12097; Thu, 08 Oct 2020 19:14:47 +0000
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
	id 1kQbNH-00007j-4I; Thu, 08 Oct 2020 19:14:47 +0000
Received: by outflank-mailman (input) for mailman id 4591;
 Thu, 08 Oct 2020 19:14:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbNF-0008Lp-7J
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:45 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18382a06-0336-4c70-b274-adb40acfb562;
 Thu, 08 Oct 2020 19:14:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN5-0004RB-4a
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbN5-0003qS-2W
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN3-0006So-7Y; Thu, 08 Oct 2020 20:14:33 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbNF-0008Lp-7J
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:45 +0000
X-Inumbo-ID: 18382a06-0336-4c70-b274-adb40acfb562
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 18382a06-0336-4c70-b274-adb40acfb562;
	Thu, 08 Oct 2020 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=02bnAe8Pk+WQt+MbpE+lK1JlJkiQs50S4+SkvCn1WvQ=; b=GmGifwcvrhqwsTq+Lso9Ep7vut
	gcsmLnbZN9pVUwz4U5vpqdojCFq9smoSjFlyujFJRsuoUBRHwpwXGcYww2Wj6Qc2TdZSlfwZN3j1P
	Ocj744+PrF9raTarv0Q05lN30y5pY/GBCZS19mohTnW4lMXEzfVSFyygSADWdmh8n7C4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0004RB-4a
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN5-0003qS-2W
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:14:35 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN3-0006So-7Y; Thu, 08 Oct 2020 20:14:33 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 03/13] sg-report-job-history: eval $DAILY_BRANCH_PREEXEC_HOOK
Date: Thu,  8 Oct 2020 20:14:12 +0100
Message-Id: <20201008191422.5683-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Put the call to this debugging/testing variable inside an eval.  This
allows a wider variety of stunts.  The one in-tree reference is
already compatible with this new semantics.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cr-daily-branch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cr-daily-branch b/cr-daily-branch
index b8f221ee..23060588 100755
--- a/cr-daily-branch
+++ b/cr-daily-branch
@@ -472,7 +472,7 @@ sgr_args+=" $EXTRA_SGR_ARGS"
 
 date >&2
 : $flight $branch $OSSTEST_BLESSING $sgr_args
-$DAILY_BRANCH_PREEXEC_HOOK
+eval "$DAILY_BRANCH_PREEXEC_HOOK"
 execute_flight $flight $OSSTEST_BLESSING
 date >&2
 
-- 
2.20.1


