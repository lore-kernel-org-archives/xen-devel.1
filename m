Return-Path: <SRS0=DHYy=7O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91160C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2020 12:45:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC9820679
	for <xen-devel@archiver.kernel.org>; Mon,  1 Jun 2020 12:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC9820679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfjo6-0002eP-QF; Mon, 01 Jun 2020 12:44:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um2E=7O=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jfjo6-0002eE-4e
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:44:46 +0000
X-Inumbo-ID: a5ec422c-a405-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5ec422c-a405-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 12:44:35 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jfjnv-0006zf-13; Mon, 01 Jun 2020 13:44:35 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 3/4] cs-bisection-step: Provide no-urls variant of the
 main query
Date: Mon,  1 Jun 2020 13:44:29 +0100
Message-Id: <20200601124430.29761-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
References: <20200601124430.29761-1-ian.jackson@eu.citrix.com>
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

This variant just returns '' for urls.  Unlike the with-urls variant,
it does not ignore trees without urls.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cs-bisection-step | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/cs-bisection-step b/cs-bisection-step
index b36bac05..2f75313e 100755
--- a/cs-bisection-step
+++ b/cs-bisection-step
@@ -181,6 +181,7 @@ END
 
 sub flight_rmap ($) {
     my ($flight) = @_;
+    my $need_urls = 1;
 
     $dbh_tests->do(<<END, {});
           CREATE TEMP TABLE tmp_build_info (
@@ -241,7 +242,19 @@ END
                   rev.name LIKE E'revision\\_%')
 END
 
-    my $sth= db_prepare(<<END);
+    my $sth= db_prepare(!$need_urls ? <<END_NOURLS : <<END_URLS);
+        SELECT
+$qtxt_common_results
+	       '' AS uval
+
+$qtxt_common_tables
+
+           WHERE
+$qtxt_common_rev_condition
+
+	   ORDER by rev.name;
+
+END_NOURLS
         SELECT
 $qtxt_common_results
 	       url.val AS uval
@@ -258,7 +271,8 @@ $qtxt_common_rev_condition
                   rev.name = 'revision_'       || substr(url.name,6))
 
 	   ORDER by url.val;
-END
+END_URLS
+
     $sth->execute();
     my $row;
     my $mixed=0;
-- 
2.20.1


