Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07E6C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 16:13:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CB22086A
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 16:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0CB22086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2zYs-0007YC-6F; Tue, 04 Aug 2020 16:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ER4t=BO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k2zYr-0007Y7-4A
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 16:13:09 +0000
X-Inumbo-ID: 1048a266-1bf8-4a1e-9fe0-25252faa01d1
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1048a266-1bf8-4a1e-9fe0-25252faa01d1;
 Tue, 04 Aug 2020 16:13:08 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k2zYp-00043d-3J; Tue, 04 Aug 2020 17:13:07 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH] cri-args-hostlists: Add some calls to date(1)
Date: Tue,  4 Aug 2020 17:13:04 +0100
Message-Id: <20200804161304.3018-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
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

This will make it easier to see perf changes etc.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cri-args-hostlists | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 28d576db..61572c2d 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -117,17 +117,25 @@ start_email () {
 
 	globallockdir=`getconfig GlobalLockDir`
 
+	date >&2
+
 	with-lock-ex -w $globallockdir/report-lock \
 	  ./sg-report-job-history --html-dir=$job_html_dir --flight=$flight
 
+	date >&2
+
 	./sg-report-flight --html-dir=$flight_html_dir/$flight/ \
 		--allow=allow.all --allow=allow.$branch \
 		$sgr_args $flight >tmp/$flight.report
 	./cr-fold-long-lines tmp/$flight.report
 
+	date >&2
+
 	mkdir -p $host_html_dir
 	with-lock-ex -w $globallockdir/report-lock \
 	  ./sg-report-host-history --html-dir=$host_html_dir flight:$flight
+
+	date >&2
 }
 
 publish_send_email () {
-- 
2.20.1


