Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB95C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:35:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA268207D4
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA268207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHu-0002oK-I7; Fri, 29 May 2020 11:34:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedHs-0002md-SC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:56 +0000
X-Inumbo-ID: 4ac56d86-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ac56d86-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:34:01 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Z-0003xZ-CA; Fri, 29 May 2020 12:20:09 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 40/49] Debian.pm: Break out standard_extradebs
Date: Fri, 29 May 2020 12:19:36 +0100
Message-Id: <20200529111945.21394-41-ian.jackson@eu.citrix.com>
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

Refactor this out of ts-xen-install.  We are going to run it in
ts-host-install.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 7 ++++++-
 ts-xen-install    | 3 +--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index d51ac493..60393ca9 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -51,7 +51,6 @@ BEGIN {
                       di_vg_name
                       debian_dhcp_rofs_fix
 		      debian_write_random_seed_command
-		      some_extradebs
                       );
     %EXPORT_TAGS = ( );
 
@@ -1684,4 +1683,10 @@ sub some_extradebs ($$) {
     }
 }
 
+sub standard_extradebs ($) {
+    my ($ho) = @_;
+    # $c{ DebianExtraPackages_<suite> }
+    some_extradebs($ho, [ 'DebianExtraPackages', $ho->{Suite} ]);
+}
+
 1;
diff --git a/ts-xen-install b/ts-xen-install
index d67cd121..965fd519 100755
--- a/ts-xen-install
+++ b/ts-xen-install
@@ -74,8 +74,7 @@ sub packages () {
 sub extradebs () {
     my $suite = $ho->{Suite};
 
-    # $c{ DebianExtraPackages_<suite> }
-    some_extradebs($ho, [ 'DebianExtraPackages', $suite ]);
+    standard_extradebs($ho);
 
     # $c{ DebianExtraPackages_<firmware>_<arch>_<suite> }
     my $firmware = get_host_property($ho, "firmware");
-- 
2.20.1


