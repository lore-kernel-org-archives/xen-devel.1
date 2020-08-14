Return-Path: <SRS0=TMXt=BY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95D2C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8733720774
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2020 17:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="DJV/gOVI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8733720774
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTa-0004Ju-BP; Fri, 14 Aug 2020 17:26:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRh-00024Q-JR
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:49 +0000
X-Inumbo-ID: ca6137f4-06f0-4a7e-b61b-7d8f3aeb47da
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca6137f4-06f0-4a7e-b61b-7d8f3aeb47da;
 Fri, 14 Aug 2020 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0olnZbLoPJuh9BMaljhOFagtvg5I4UYKHKHAXNBW7Sw=;
 b=DJV/gOVIfB9h5nhHosmcRF1ZisrHFNmgxS/eNrEVsgeNXe22zqVS/BEU
 yd6xSWyeSh2nch9ypeSARsbiW/Eivdsk6yRGst5kckP0ZVi2Mmmd2EBtf
 O/dtdnLpQ/S+W8bNRRhyqqU5KElpgYIk2FZw83QC/9wsY0D9rFZTy0MCp E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XoG6gYs8oHYMIMiQUF2RL0BFjmGVARyQUFF3LUF53oE12LXrKBkrB29+qKkWDNMPeqYRUAzB+X
 26lzMu667c4cNPHXWm6uftejAtZIK34FcWb4b28MKb/U5cFQNAqGGdXFzKJZrBLzrdCf3Gg92K
 KpXDVqQ9YO8hQALwzDfx7VGO55Q4b5izAiBhkbeJHJirXGNPCKKzVFwuFTVwhXqt9ZrlBVwYUL
 5cWb+TzEHshmQMHzS6P2j7sARBw7ByMJDN92bL4vnBw6AxFVODndz4nBcERyPZkgR1kAUE2Z0v
 MIA=
X-SBRS: 2.7
X-MesageID: 24576922
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576922"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 51/60] history reporting (nfc): Quote keys too
Date: Fri, 14 Aug 2020 18:21:56 +0100
Message-ID: <20200814172205.9624-52-ian.jackson@eu.citrix.com>
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

Right now all the callers have keys which don't need quoting.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 20913d27..3e2ad0d3 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -147,8 +147,9 @@ sub cache_read_previous ($) {
 		$jr->{'%'.$&} = $ch;
 		next;
 	    }
-	    s{^(\w+)=}{} or die "$orig -- $_ ";
-	    my $k = $1;
+	    # Tolerate %, which will be de-quoted by url_unquote
+	    s{^([\%$url_ok_chars]+)=}{}i or die "$orig -- $_ ";
+	    my $k = url_unquote($1);
 	    $ch->{$k} = url_unquote($_);
 	}
 	push @previous, $jr;
@@ -192,7 +193,7 @@ sub cache_write_entry ($$) {
 	    next if $k =~ m/^\%/;
 	    $_ = $h->{$k};
 	    next unless defined;
-	    printf $fh " %s=%s", $k, url_quote($_);
+	    printf $fh " %s=%s", url_quote($k), url_quote($_);
 	}
     };
     $whash->($jr);
-- 
2.11.0


