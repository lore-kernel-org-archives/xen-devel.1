Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B3EC4727E
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 16:25:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D1420872
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 16:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D1420872
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1454.4568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1Nz-0001JX-4c; Thu, 01 Oct 2020 16:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454.4568; Thu, 01 Oct 2020 16:24:51 +0000
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
	id 1kO1Nz-0001JQ-1Z; Thu, 01 Oct 2020 16:24:51 +0000
Received: by outflank-mailman (input) for mailman id 1454;
 Thu, 01 Oct 2020 16:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1Ny-0001JL-Ku
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:24:50 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 418437ea-7a37-43b9-8e44-19305a131d4a;
 Thu, 01 Oct 2020 16:24:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Nx-00029L-5P; Thu, 01 Oct 2020 17:24:49 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1Ny-0001JL-Ku
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:24:50 +0000
X-Inumbo-ID: 418437ea-7a37-43b9-8e44-19305a131d4a
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 418437ea-7a37-43b9-8e44-19305a131d4a;
	Thu, 01 Oct 2020 16:24:49 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Nx-00029L-5P; Thu, 01 Oct 2020 17:24:49 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 2/8] standalone: Use mkdir -p
Date: Thu,  1 Oct 2020 17:24:33 +0100
Message-Id: <20201001162439.18160-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two mkdir calls could fail if
standalone-generate-dump-flight-runvars is run without a log
directory, because they were not concurrency-correct.

mkdir -p should fix that.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 standalone | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/standalone b/standalone
index 9553d6c9..4d1f3513 100755
--- a/standalone
+++ b/standalone
@@ -181,12 +181,8 @@ check_repos() {
 }
 
 ensure_logs() {
-    if [ ! -d "logs" ] ; then
-	mkdir "logs"
-    fi
-    if [ ! -d "logs/$flight" ] ; then
-	mkdir "logs/$flight"
-    fi
+    mkdir -p "logs"
+    mkdir -p "logs/$flight"
 }
 
 with_logging() {
-- 
2.20.1


