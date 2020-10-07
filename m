Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDAEC4727E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:26:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75D132168B
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75D132168B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3675.10675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE9J-0000sM-AJ; Wed, 07 Oct 2020 18:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3675.10675; Wed, 07 Oct 2020 18:26:49 +0000
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
	id 1kQE9J-0000sE-63; Wed, 07 Oct 2020 18:26:49 +0000
Received: by outflank-mailman (input) for mailman id 3675;
 Wed, 07 Oct 2020 18:26:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE69-00072Q-QI
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:33 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 305c7497-7824-4566-bea9-54b5df9ad956;
 Wed, 07 Oct 2020 18:21:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDju-0007CF-Sy; Wed, 07 Oct 2020 19:00:35 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE69-00072Q-QI
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:23:33 +0000
X-Inumbo-ID: 305c7497-7824-4566-bea9-54b5df9ad956
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 305c7497-7824-4566-bea9-54b5df9ad956;
	Wed, 07 Oct 2020 18:21:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDju-0007CF-Sy; Wed, 07 Oct 2020 19:00:35 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/82] cr-publish-flight-logs: Fix abs_time calls
Date: Wed,  7 Oct 2020 18:59:13 +0100
Message-Id: <20201007180024.7932-12-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

There was a missing space in these messages, since they were
introduced in 31b7cae19fe1
  timing traces: cr-publish-flight-logs: Report more progress

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cr-publish-flight-logs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cr-publish-flight-logs b/cr-publish-flight-logs
index 63c47d9f..c570dfaf 100755
--- a/cr-publish-flight-logs
+++ b/cr-publish-flight-logs
@@ -43,7 +43,7 @@ die unless $flight =~ m/^\d*$/;
 
 die "usage: ./cr-publish-flight-logs [flight]" unless @ARGV==0;
 
-sub progress { print +(show_abs_time time), @_, "\n" }
+sub progress { print +(show_abs_time time), " ", @_, "\n" }
 
 progress("acquiring publish-lock...");
 open LOCK, "> $c{GlobalLockDir}/publish-lock" or die $!;
-- 
2.20.1


