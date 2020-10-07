Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67921C4727E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:01:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F3F2173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F3F2173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3610.10367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQDkD-00042t-GR; Wed, 07 Oct 2020 18:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3610.10367; Wed, 07 Oct 2020 18:00:53 +0000
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
	id 1kQDkD-00042m-CT; Wed, 07 Oct 2020 18:00:53 +0000
Received: by outflank-mailman (input) for mailman id 3610;
 Wed, 07 Oct 2020 18:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQDkC-0003r9-Qp
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:52 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8520070e-0199-4435-9d21-e70d61f00bc3;
 Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDjs-0007CF-98; Wed, 07 Oct 2020 19:00:32 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQDkC-0003r9-Qp
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:00:52 +0000
X-Inumbo-ID: 8520070e-0199-4435-9d21-e70d61f00bc3
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8520070e-0199-4435-9d21-e70d61f00bc3;
	Wed, 07 Oct 2020 18:00:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDjs-0007CF-98; Wed, 07 Oct 2020 19:00:32 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 04/82] sg-run-job: Minor whitespace (formatting) changes
Date: Wed,  7 Oct 2020 18:59:06 +0100
Message-Id: <20201007180024.7932-5-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Jackson <ian.jackson@eu.citrix.com>

No functional change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-run-job | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-run-job b/sg-run-job
index df3d08d0..3db05b34 100755
--- a/sg-run-job
+++ b/sg-run-job
@@ -30,12 +30,12 @@ proc per-host-prep {} {
     per-host-ts .       xen-boot/@        ts-host-reboot
 
     per-host-ts .       host-ping-check-xen/@ ts-host-ping-check
-    per-host-ts .       =(*)             {ts-leak-check basis}
+    per-host-ts .       =(*)            { ts-leak-check basis }
 }
 
 proc per-host-finish {} {
     if {[nested-hosts-p]} { set broken fail } { set broken broken }
-    per-host-ts .       =                {ts-leak-check check}
+    per-host-ts .       =               { ts-leak-check check }
     per-host-ts !$broken capture-logs/@(*) ts-logs-capture
 }
 
@@ -96,7 +96,7 @@ proc run-job {job} {
 	
 	if {![nested-hosts-p]} break
 
-	per-host-ts . final-poweroff {ts-host-powercycle --power=0}
+	per-host-ts . final-poweroff { ts-host-powercycle --power=0 }
 
         set need_xen_hosts [lunappend nested_layers_hosts]
     }
@@ -549,7 +549,7 @@ proc setup-test-pair {} {
     run-ts . =              ts-debian-install      dst_host
     run-ts . =              ts-debian-fixup        dst_host          + debian
     run-ts . =              ts-guests-nbd-mirror + dst_host src_host + debian
-    per-host-ts . =(*)     {ts-leak-check basis}
+    per-host-ts . =(*)    { ts-leak-check basis }
     run-ts . =              ts-guest-start       + src_host          + debian
 }
 proc need-hosts/test-pair {} { return {src_host dst_host} }
-- 
2.20.1


