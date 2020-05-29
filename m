Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A25C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:34:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 829202074D
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 829202074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedGr-0001e1-5p; Fri, 29 May 2020 11:33:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedGp-0001co-QA
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:51 +0000
X-Inumbo-ID: 32caa9a8-a1a0-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32caa9a8-a1a0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:33:21 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3T-0003xZ-52; Fri, 29 May 2020 12:20:03 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 23/49] Honour DebianImageFile_SUITE_ARCH
Date: Fri, 29 May 2020 12:19:19 +0100
Message-Id: <20200529111945.21394-24-ian.jackson@eu.citrix.com>
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

This lets us specify the whole filename, not just a version.
This is needed because for buster we are going to use
   debian-10.2.0-ARCH-xfce-CD-1.iso

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 mfi-common | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mfi-common b/mfi-common
index b40f057e..640cf328 100644
--- a/mfi-common
+++ b/mfi-common
@@ -522,6 +522,15 @@ job_create_test () {
 
 usual_debianhvm_image () {
   local arch=$1; shift
+  if [ -n "$DEBIAN_IMAGE_FILE" ]; then
+      echo $DEBIAN_IMAGE_FILE
+      return
+  fi
+  local file=`getconfig DebianImageFile_${guestsuite}_${arch}`
+  if [ -n "$file " ]; then
+      echo $file
+      return
+  fi
   local ver=$DEBIAN_IMAGE_VERSION
   if [ -z "$ver" ] ; then
       ver=`getconfig DebianImageVersion_$guestsuite`
-- 
2.20.1


