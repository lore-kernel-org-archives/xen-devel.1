Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F61AC433DF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA6620708
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cYvks3HB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA6620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTH-0003wQ-Q7; Fri, 14 Aug 2020 17:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRN-00024Q-Il
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:29 +0000
X-Inumbo-ID: 6c66d8ac-e734-4832-9a77-65879c1fb801
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c66d8ac-e734-4832-9a77-65879c1fb801;
 Fri, 14 Aug 2020 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=HqW2km6WXxTiCTWVnMIybLjWRSja3jGobFMQpHWc/Ug=;
 b=cYvks3HB7XWfE82iVaNegHKbbGOrmex/WCxTZswLoMt/uWPPemijWonh
 bLl8zN/XQPGnLI/7XPaWzJJAIQcJeO+M+vrtmRKFPN01S45JYkkRBTse7
 VNpVydyY0IOevkaAExN8ZjQGDab1AL4chyG1w86GEjXrqW3lm+9BfBftb A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0LIije89+jZss5FbdKtuoJ2XR1nDpq+FwGeNy498e/CIP+E26WemoojBHOh/B1nQtePSLfNg4O
 QBSzVdjVmBJjO4oh9lYATF/DaOZyK3JUgshcGp4EAGPl+x+92A6LtYQ2Jlk4bKkN9OV78JyVqm
 hbqU6r6fk6E+f8f86tekDb1FySH9b3vFmkp+05EpJMPor0RGhfl0dOHyvtL4Oxvkwz3XIgtgc+
 A/BPLDAg7/H2RBYnMhficbywNy+PNo91GdoRI7UNiTII1tfIppWQGuT/lBZYMBDGqsQxNzVHqQ
 ASE=
X-SBRS: 2.7
X-MesageID: 24576912
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576912"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 14/60] history reporting (nfc): Use cacheable_fn for
 power methods
Date: Fri, 14 Aug 2020 18:21:19 +0100
Message-ID: <20200814172205.9624-15-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Avoids open-coding knowledge of the $jr convention at this use site.
%powers becomes %$powers, so it's a bit noisy.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 43ddd2af..9510757f 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -387,12 +387,8 @@ END
 	my $ri = report_run_getinfo({ %$jr, %$ir });
 	print H "<td $ri->{ColourAttr}>$ri->{Content}</td>\n";
 
-	my %powers;
-	if ($jr->{'%p'}) {
-	    %powers = %{ $jr->{'%p'} };
-	    $runvarq_hits++;
-	} else {
-	    $runvarq_misses++;
+	my $powers = cacheable_fn($jr, 'b', sub {
+            my %powers;
 	    $jrunvarq->execute($jr->{flight}, $jr->{job},
 			       db_quote_like_pattern($ident));
 	    my %runvars;
@@ -404,8 +400,8 @@ END
 		next unless $r =~ m{^\Q${ident}\E_power_};
 		$powers{$'} = $runvars{$r};
 	    }
-	    $jr->{'%p'} = { %powers };
-	}
+	    \%powers;
+	});
 	my $skipped = 0;
         my $any_power = 0;
         my $pr_power_colour = sub {
@@ -421,7 +417,7 @@ END
 	    for (; $skipped; $skipped--) {
 		$pr_power_colour->($grey_mid, " - ");
 	    }
-	    my $how = $powers{$wh};
+	    my $how = $powers->{$wh};
 	    my $colour =
 		$how =~ /PDU/      ? $yellow :
 		$how =~ /Combined/ ? $yellow :
@@ -430,11 +426,11 @@ END
             $pr_power_colour->($colour, " $how ");
 	};
 	foreach my $wh (qw(install recover)) {
-	    $skipped++, next unless exists $powers{$wh};
+	    $skipped++, next unless exists $powers->{$wh};
 	    $pr_power->($wh);
-	    delete $powers{$wh};
+	    delete $powers->{$wh};
 	}
-	foreach my $wh (sort keys %powers) {
+	foreach my $wh (sort keys %$powers) {
 	    $pr_power->($wh);
 	}
         print H "<td>" if !$any_power;
-- 
2.11.0


