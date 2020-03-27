Return-Path: <SRS0=U/nz=5M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BE8C2D0E5
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2020 18:16:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 372E72083E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Mar 2020 18:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 372E72083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHtWM-0004Fv-H8; Fri, 27 Mar 2020 18:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tAzE=5M=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jHtWL-0004FU-G1
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:15:53 +0000
X-Inumbo-ID: f34610c6-7056-11ea-a6c1-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f34610c6-7056-11ea-a6c1-bc764e2007e4;
 Fri, 27 Mar 2020 18:15:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jHtW1-0004UK-HO; Fri, 27 Mar 2020 18:15:33 +0000
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:15:26 +0000
Message-Id: <20200327181526.19412-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
References: <20200327181526.19412-1-ian.jackson@eu.citrix.com>
Subject: [Xen-devel] [OSSTEST PATCH 6/6] ts-logs-capture: Fish some logs out
 of guest filesystem
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

This involves shutting the guests down.  We use this shell rune
because xl doesn't provide a good way to ensure there are no guests
running.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-logs-capture | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/ts-logs-capture b/ts-logs-capture
index 6be77676..c67856cd 100755
--- a/ts-logs-capture
+++ b/ts-logs-capture
@@ -261,10 +261,40 @@ sub fetch_logs_guest ($) {
     }
 }
 
+sub shutdown_guests () {
+    target_cmd_root($ho, <<'END', 180);
+        set -x
+        (
+            ( exec 2>/dev/null; sleep 30 ; echo y ) &
+            ( xl shutdown -a -F -w ; echo y ) &
+        ) | (
+            read x
+            xl list | awk '!/^Domain-0 |^Name / {print $2}' \
+            | xargs -t -r -n1 xl destroy ||:
+        )
+END
+}
+
+sub extract_logs_guest ($) {
+    my ($gho) = @_;
+    if (!eval {
+	guest_find_lv($gho);
+	target_cmd_root($ho, "umount /mnt ||:");
+	target_cmd_root($ho, "mount -r ".$gho->{Lvdev}." /mnt");
+	try_fetch_logs($ho, \@general_logs, '/mnt', "$gho->{Guest}-");
+	target_cmd_root($ho, "umount /mnt ||:");
+	1;
+    }) {
+	logm("failure extracting logs out of guest fs: $@");
+    }
+}
+
 power_state($ho,1);
 find_guests();
 fetch_xenctx_guest($_) foreach @guests;
 serial_fetch_logs($ho);
 fetch_logs_host();
 fetch_logs_guest($_) foreach @guests;
+shutdown_guests();
+extract_logs_guest($_) foreach @allguests;
 logm("logs captured to $stash");
-- 
2.11.0


