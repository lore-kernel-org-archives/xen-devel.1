Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA126C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:09:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8F12075F
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8F12075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7c2-0005Zu-KO; Tue, 19 May 2020 19:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7c1-0005Zo-Gq
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:09:13 +0000
X-Inumbo-ID: 37edfa64-9a04-11ea-9887-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37edfa64-9a04-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 19:09:10 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vj-0001da-A8; Tue, 19 May 2020 20:02:43 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 29/38] mg-debian-installer-update: support
 overlay-intramfs-SUITE
Date: Tue, 19 May 2020 20:02:21 +0100
Message-Id: <20200519190230.29519-30-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

This lets us patch the installer more easily.

No uses yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 mg-debian-installer-update | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/mg-debian-installer-update b/mg-debian-installer-update
index f1e682f9..fb4fe2ab 100755
--- a/mg-debian-installer-update
+++ b/mg-debian-installer-update
@@ -33,6 +33,8 @@ sbase=$site/dists/$suite
 
 src=$sbase/main/installer-$arch/current/images/netboot/
 
+osstest_dir="$(pwd)"
+
 case ${suite}_${arch} in
     lenny_armhf|squeeze_armhf|lenny_arm64|squeeze_arm64|wheezy_arm64)
         # No such thing.
@@ -188,6 +190,24 @@ if [ "x$specialkernel" != x ]; then
     rm -rf x
 fi
 
+overlay_initrd=$osstest_dir/overlay-initrd-$suite
+if [ -e "$overlay_initrd" ]; then
+    for f in $files; do
+        s=${f/:*} ; d=${f/*:}
+        case "$d" in
+            *initrd*)
+                echo "adding $overlay_initrd to $d"
+                (
+                    set -e
+                    cd "$overlay_initrd"
+                    find -print0 | cpio -0 -Hnewc -o \
+                        | gzip -9nf
+                ) >>$d.new
+                ;;
+        esac
+    done
+fi
+
 for f in $files; do
         s=${f/:*} ; d=${f/*:}
         mv -f $d.new $d
-- 
2.20.1


