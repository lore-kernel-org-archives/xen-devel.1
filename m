Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF59FC4741F
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F08C2173E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 18:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F08C2173E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3713.11112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQEAX-0004Nc-3h; Wed, 07 Oct 2020 18:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3713.11112; Wed, 07 Oct 2020 18:28:04 +0000
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
	id 1kQEAW-0004Ls-0B; Wed, 07 Oct 2020 18:28:04 +0000
Received: by outflank-mailman (input) for mailman id 3713;
 Wed, 07 Oct 2020 18:27:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kQE3P-00072Q-JN
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:43 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aa5d4f6-6676-4d7e-804c-ee3b484a641d;
 Wed, 07 Oct 2020 18:19:47 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kQDkC-0007CF-7M; Wed, 07 Oct 2020 19:00:52 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=1qty=DO=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kQE3P-00072Q-JN
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:20:43 +0000
X-Inumbo-ID: 2aa5d4f6-6676-4d7e-804c-ee3b484a641d
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2aa5d4f6-6676-4d7e-804c-ee3b484a641d;
	Wed, 07 Oct 2020 18:19:47 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kQDkC-0007CF-7M; Wed, 07 Oct 2020 19:00:52 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 77/82] sg-report-flight: Improvements to other job (share/reuse) reporting
Date: Wed,  7 Oct 2020 19:00:19 +0100
Message-Id: <20201007180024.7932-78-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Prefer to show "prep" (purple) rather than "share".
* Show our own relationship, in particular to show if it was prep.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 sg-report-flight | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sg-report-flight b/sg-report-flight
index 7dc218cf..2a79db13 100755
--- a/sg-report-flight
+++ b/sg-report-flight
@@ -1473,12 +1473,12 @@ END
 	  "$c{ResultsHtmlPubBaseUrl}/host/$srow->{hostname}.html",
 	  $srow->{hostname};
 	my $rel =
-	  $srow->{olive} ?
-	  "<td align=\"center\" bgcolor=\"$red\">share</td>"
-	  :
 	  $srow->{prep_started} ?
 	  "<td align=\"center\" bgcolor=\"$purple\">prep.</td>"
 	  :
+	  $srow->{olive} ?
+	  "<td align=\"center\" bgcolor=\"$red\">share</td>"
+	  :
 	  "<td align=\"center\">reuse</td>";
         if (defined $srow->{flight}) {
 	    my $furl = "$c{ReportHtmlPubBaseUrl}/$srow->{flight}/";
@@ -1499,8 +1499,10 @@ END
 END
 		  $jurl, $srow->{job};
 	    } else {
-		printf H <<END;
-<td></td>
+		confess unless $rel =~ m{([0-9a-z. ]+)\</td\>$};
+		$rel = '<td></td>' if $1 eq 'reuse';
+		printf H <<END, $rel;
+%s
 <td align="center">this</td>
 <td align="center">this</td>
 END
-- 
2.20.1


