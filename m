Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859FBC56201
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 16:45:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF68A22267
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 16:45:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="MylLuYkv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF68A22267
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10559.28100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVdiJ-0007Jn-WC; Thu, 22 Oct 2020 16:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10559.28100; Thu, 22 Oct 2020 16:45:19 +0000
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
	id 1kVdiJ-0007JY-P6; Thu, 22 Oct 2020 16:45:19 +0000
Received: by outflank-mailman (input) for mailman id 10559;
 Thu, 22 Oct 2020 16:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVdiI-0007J9-0W
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:18 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f11cb73-a3a8-404f-98a9-c4b5274c2d3a;
 Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiH-0005KZ-3E
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVdiH-0007SY-2Q
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiF-00059e-Bv; Thu, 22 Oct 2020 17:45:15 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVdiI-0007J9-0W
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:18 +0000
X-Inumbo-ID: 0f11cb73-a3a8-404f-98a9-c4b5274c2d3a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0f11cb73-a3a8-404f-98a9-c4b5274c2d3a;
	Thu, 22 Oct 2020 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=lTKozFywdZBXuKF9Bj7Cq1GHxhWrqzo800hkAgAt6wI=; b=MylLuYkvvp9ULb4KjJpXm0fxNN
	wgEaHk7iPKq7S9V1OeJU79pTUGyB5znm4veg0iJDvwWdIweFwbzv5B6QIlELGW++9zX1KB/FO5Pgd
	GQkDGFLQhwGiZOSGBG2lEdKbpAvyY5cXMJ3U5Rs4ao6Qff4twuB0NbioXQNzR6cWrPEg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-0005KZ-3E
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-0007SY-2Q
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 16:45:17 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiF-00059e-Bv; Thu, 22 Oct 2020 17:45:15 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 07/16] PDU/MSW: Actually implement delayed-*
Date: Thu, 22 Oct 2020 17:44:57 +0100
Message-Id: <20201022164506.1552-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in our tree uses this but having it here is useful docs for
the protocol so I shan't just delete it.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 pdu-msw | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pdu-msw b/pdu-msw
index 03b0f342..196b6c45 100755
--- a/pdu-msw
+++ b/pdu-msw
@@ -127,7 +127,7 @@ sub action_value () {
                  $action =~ m/^(?:1|on)$/ ? 1 :
                  $action =~ m/^(?:reboot)$/ ? 3 :
                  die "unknown action $action\n$usagemsg");
-    return $valset;
+    return $valset + $delayadd;
 }
 
 sub set ($) {
-- 
2.20.1


