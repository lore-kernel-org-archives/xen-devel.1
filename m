Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5409BC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:32:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F23A2074D
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F23A2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedFi-0000lV-KG; Fri, 29 May 2020 11:32:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedFh-0000lA-OI
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:32:41 +0000
X-Inumbo-ID: 19289672-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19289672-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:32:38 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3T-0003xZ-U8; Fri, 29 May 2020 12:20:03 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 27/49] 20_linux_xen: Ignore xenpolicy and config files
 too
Date: Fri, 29 May 2020 12:19:23 +0100
Message-Id: <20200529111945.21394-28-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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

"file_is_not_sym" currently only checks for xen-syms.  Extend it to
disregard xenpolicy (XSM policy files) and files ending .config (which
are built by the Xen upstream build system in some configurations and
can therefore end up in /boot).

Rename the function accordingly, to "file_is_not_xen_garbage".

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 overlay-buster/etc/grub.d/20_linux_xen | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/overlay-buster/etc/grub.d/20_linux_xen b/overlay-buster/etc/grub.d/20_linux_xen
index fb3ed82f..01dfcb57 100755
--- a/overlay-buster/etc/grub.d/20_linux_xen
+++ b/overlay-buster/etc/grub.d/20_linux_xen
@@ -167,10 +167,14 @@ if [ "x${linux_list}" = "x" ] ; then
     exit 0
 fi
 
-file_is_not_sym () {
+file_is_not_xen_garbage () {
     case "$1" in
 	*/xen-syms-*)
 	    return 1;;
+	*/xenpolicy-*)
+	    return 1;;
+	*/*.config)
+	    return 1;;
 	*)
 	    return 0;;
     esac
@@ -178,7 +182,7 @@ file_is_not_sym () {
 
 xen_list=
 for i in /boot/xen*; do
-    if grub_file_is_not_garbage "$i" && file_is_not_sym "$i" ; then xen_list="$xen_list $i" ; fi
+    if grub_file_is_not_garbage "$i" && file_is_not_xen_garbage "$i" ; then xen_list="$xen_list $i" ; fi
 done
 prepare_boot_cache=
 boot_device_id=
-- 
2.20.1


