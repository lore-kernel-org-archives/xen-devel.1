Return-Path: <SRS0=UpcS=BU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4432C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 11:21:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F989206E9
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2020 11:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F989206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k55rk-0008Jt-HV; Mon, 10 Aug 2020 11:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5wo=BU=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k55rj-0008Fj-VE
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 11:21:19 +0000
X-Inumbo-ID: 3a3d34f7-c5cd-43be-9fbb-eaaa765e87eb
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a3d34f7-c5cd-43be-9fbb-eaaa765e87eb;
 Mon, 10 Aug 2020 11:20:55 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k55rK-0003aJ-9Z; Mon, 10 Aug 2020 12:20:54 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 6/6] timing traces: cri-args-hostlists: Add some
 timestamps
Date: Mon, 10 Aug 2020 12:20:47 +0100
Message-Id: <20200810112047.30285-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
References: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
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

Pass --report-processing-start-time, and add some calls to date >&2.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cri-args-hostlists | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 61572c2d..994e00c0 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -77,11 +77,13 @@ execute_flight () {
         rm -f abort
         check_stop_core ''
 
+	date >&2
         ./cr-ensure-disk-space Logs
         ./cr-ensure-disk-space LogsPublish
 
 	export OSSTEST_RESOURCE_PREINFO="[$branch $2]"
 
+	date >&2
 	set +e
         ./sg-execute-flight $1 $2 >tmp/$1.transcript 2>&1
 	local rc=$?
@@ -120,11 +122,13 @@ start_email () {
 	date >&2
 
 	with-lock-ex -w $globallockdir/report-lock \
-	  ./sg-report-job-history --html-dir=$job_html_dir --flight=$flight
+	  ./sg-report-job-history --report-processing-start-time \
+	    --html-dir=$job_html_dir --flight=$flight
 
 	date >&2
 
-	./sg-report-flight --html-dir=$flight_html_dir/$flight/ \
+	./sg-report-flight --report-processing-start-time \
+	        --html-dir=$flight_html_dir/$flight/ \
 		--allow=allow.all --allow=allow.$branch \
 		$sgr_args $flight >tmp/$flight.report
 	./cr-fold-long-lines tmp/$flight.report
@@ -133,7 +137,8 @@ start_email () {
 
 	mkdir -p $host_html_dir
 	with-lock-ex -w $globallockdir/report-lock \
-	  ./sg-report-host-history --html-dir=$host_html_dir flight:$flight
+	  ./sg-report-host-history --report-processing-start-time \
+	        --html-dir=$host_html_dir flight:$flight
 
 	date >&2
 }
-- 
2.20.1


