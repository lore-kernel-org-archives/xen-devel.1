Return-Path: <SRS0=U/nz=5M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722F3C43331
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2020 18:16:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41C0D2083E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2020 18:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41C0D2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtW7-00049Y-KP; Fri, 27 Mar 2020 18:15:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtW6-000498-FD
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:38 +0000
X-Inumbo-ID: f2bc5c28-7056-11ea-92cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2bc5c28-7056-11ea-92cf-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:33 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtW0-0004UK-Lr; Fri, 27 Mar 2020 18:15:32 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:23 +0000
Message-Id: <20200327181526.19412-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
References: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [OSSTEST PATCH 3/6] ts-logs-capture: Break logs up into
 general logs and host logs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We are going to fetch logs out of guests.  @general_logs will contain
the relevant patterns.  Right now we just introduce the variable and
split the list.  The categorisation is roughly right...

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/ts-logs-capture b/ts-logs-capture
index 88b19658..ae37d492 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -135,8 +135,7 @@ sub try_cmd_output_save ($;$) {
     close $fh or die $!;
 }
 
-sub fetch_logs_host () {
-    my $logs= [qw(
+our @general_logs = qw(
                   /var/log/kern.log*
                   /var/log/syslog*
                   /var/log/daemon.log*
@@ -149,6 +148,10 @@ sub fetch_logs_host () {
                   /var/log/installer/syslog*
                   /var/log/installer/partman*
 
+		     );
+
+sub fetch_logs_host () {
+    my $logs= [@general_logs, qw(
                   /var/log/xen/xend.log*
                   /var/log/xen/xend-debug.log*
                   /var/log/xen/xen-hotplug.log*
-- 
2.11.0


