Return-Path: <SRS0=kHyn=7B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E157C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:10:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524B4207FB
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2020 19:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524B4207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7dA-00071G-RZ; Tue, 19 May 2020 19:10:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7d9-000707-Iv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:10:23 +0000
X-Inumbo-ID: 4c80120a-9a04-11ea-b9cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c80120a-9a04-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 19:09:44 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vi-0001da-95; Tue, 19 May 2020 20:02:42 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 24/38] buster: Specify DebianImageFile_SUITE_ARCH
Date: Tue, 19 May 2020 20:02:16 +0100
Message-Id: <20200519190230.29519-25-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 production-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/production-config b/production-config
index 103b8915..f0ddc132 100644
--- a/production-config
+++ b/production-config
@@ -98,6 +98,9 @@ DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/2019020
 DebianImageVersion_wheezy 7.2.0
 DebianImageVersion_jessie 8.2.0
 DebianImageVersion_stretch 9.4.0
+DebianImageFile_buster_amd64 debian-10.2.0-amd64-xfce-CD-1.iso
+DebianImageFile_buster_i386 debian-10.2.0-i386-xfce-CD-1.iso
+
 
 # Update with ./mg-netgrub-loader-update
 TftpGrubVersion XXXX-XX-XX
-- 
2.20.1


