Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FD5C41604
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:18:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7BF12173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7BF12173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3640.10506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE18-0006ik-LG; Wed, 07 Oct 2020 18:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3640.10506; Wed, 07 Oct 2020 18:18:22 +0000
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
	id 1kQE18-0006ia-HY; Wed, 07 Oct 2020 18:18:22 +0000
Received: by outflank-mailman (input) for mailman id 3640;
 Wed, 07 Oct 2020 18:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE16-0006UA-SC
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:20 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e994920-52a7-45e0-a646-0d04426bbfe9;
 Wed, 07 Oct 2020 18:18:17 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDk5-0007CF-0w; Wed, 07 Oct 2020 19:00:45 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE16-0006UA-SC
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:18:20 +0000
X-Inumbo-ID: 9e994920-52a7-45e0-a646-0d04426bbfe9
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9e994920-52a7-45e0-a646-0d04426bbfe9;
	Wed, 07 Oct 2020 18:18:17 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDk5-0007CF-0w; Wed, 07 Oct 2020 19:00:45 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 46/82] shared/reuse: Use @ for ts-xen-build-prep
Date: Wed,  7 Oct 2020 18:59:48 +0100
Message-Id: <20201007180024.7932-47-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

Pass @ from sg-run-job.  This is the only call site for
ts-xen-build-prep, so it can lose the open-coded test for SharedReady.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job        | 2 +-
 ts-xen-build-prep | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index 067b28db..d46a3a62 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -753,7 +753,7 @@ proc allocate-build-host {ostype} {
 proc prepare-build-host-linux {} {
     global jobinfo
     run-ts broken host-install(*) ts-host-install-twice + --build
-    run-ts . host-build-prep ts-xen-build-prep
+    run-ts . host-build-prep ts-xen-build-prep + @host
 }
 
 proc prepare-build-host-freebsd {} {
diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index dabb9921..092bbffe 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -28,7 +28,6 @@ tsreadconfig();
 our ($whhost) = @ARGV;
 $whhost ||= 'host';
 our $ho= selecthost($whhost);
-exit 0 if $ho->{SharedReady};
 
 our ($vg,$lv);
 
-- 
2.20.1


