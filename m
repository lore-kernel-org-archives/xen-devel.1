Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55B7C433DF
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:39:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 564C2221FE
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 19:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="myVy3ffk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564C2221FE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4622.12220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbkp-0003ZD-FA; Thu, 08 Oct 2020 19:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4622.12220; Thu, 08 Oct 2020 19:39:07 +0000
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
	id 1kQbkp-0003Z6-As; Thu, 08 Oct 2020 19:39:07 +0000
Received: by outflank-mailman (input) for mailman id 4622;
 Thu, 08 Oct 2020 19:39:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQbko-0003Yi-7m
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:06 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 858aec6d-ff27-477b-86b2-c876ceba815b;
 Thu, 08 Oct 2020 19:39:05 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkn-0004y3-4w
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:05 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kQbkn-0005NZ-42
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:05 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kQbN6-0006So-9m; Thu, 08 Oct 2020 20:14:36 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ViHE=DP=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQbko-0003Yi-7m
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:06 +0000
X-Inumbo-ID: 858aec6d-ff27-477b-86b2-c876ceba815b
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 858aec6d-ff27-477b-86b2-c876ceba815b;
	Thu, 08 Oct 2020 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=T/OCcqRxeQc9x8tpxs5RGS4FPCqsIq9O+7k8X7cgE7E=; b=myVy3ffk5l9fTO6DjVB8ItLAoo
	txCdhoaMx7mmVXuQnHaEy6LTerQ2tXYUJJgX/DJs2GCJEEm5T6NiuT36V6xOQu+qxYmtWgeISXLAV
	fsnrl/3I5hrt79rL1w3A9APvr7fmG9gGVB4gYJEuD/Cu45fKGOeDBsvdL+oAIfxFynjw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkn-0004y3-4w
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:05 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbkn-0005NZ-42
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:39:05 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kQbN6-0006So-9m; Thu, 08 Oct 2020 20:14:36 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 10/13] cri-args-hostlists: Move flight_html_dir variable
Date: Thu,  8 Oct 2020 20:14:19 +0100
Message-Id: <20201008191422.5683-11-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008191422.5683-1-iwj@xenproject.org>
References: <20201008191422.5683-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is only used in report_flight.  We are going to want to call
report_flight from outside start_email, without having to set that
variable ourselves.

The variable isn't actually used in start_email.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 cri-args-hostlists | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cri-args-hostlists b/cri-args-hostlists
index 52e39f33..52cac195 100644
--- a/cri-args-hostlists
+++ b/cri-args-hostlists
@@ -113,7 +113,6 @@ start_email () {
 	printf '%s\n' "`getconfig EmailStdHeaders`"
 	printf 'Subject: %s' "${subject_prefix:-[$branch test] }"
 
-	local flight_html_dir=$OSSTEST_HTMLPUB_DIR/
 	local job_html_dir=$OSSTEST_HTML_DIR/
 	local host_html_dir=$OSSTEST_HTML_DIR/host/
 
@@ -143,6 +142,7 @@ start_email () {
 
 report_flight () {
 	local flight=$1
+	local flight_html_dir=$OSSTEST_HTMLPUB_DIR/
 	./sg-report-flight --html-dir=$flight_html_dir/$flight/ \
 		--allow=allow.all --allow=allow.$branch \
 		$sgr_args $flight >tmp/$flight.report
-- 
2.20.1


