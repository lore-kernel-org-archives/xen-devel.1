Return-Path: <SRS0=tjso=GP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8BAC433E6
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 18:13:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD1622DFA
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 18:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD1622DFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65827.116642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAU-0003fU-PX; Tue, 12 Jan 2021 18:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65827.116642; Tue, 12 Jan 2021 18:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzOAU-0003fM-M3; Tue, 12 Jan 2021 18:13:22 +0000
Received: by outflank-mailman (input) for mailman id 65827;
 Tue, 12 Jan 2021 18:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gu5a=GP=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzOAS-0003Yo-SW
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 18:13:20 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3168622-0c44-4f9e-9ac7-ff1feaf4399e;
 Tue, 12 Jan 2021 18:13:13 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10CIDCMM008504;
 Tue, 12 Jan 2021 19:13:12 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10CIDAqJ006345;
 Tue, 12 Jan 2021 19:13:10 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id B449D7218; Tue, 12 Jan 2021 19:13:10 +0100 (MET)
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
X-Inumbo-ID: f3168622-0c44-4f9e-9ac7-ff1feaf4399e
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: [PATCH] NetBSD hotplug: fix block unconfigure on destroy
Date: Tue, 12 Jan 2021 19:12:24 +0100
Message-Id: <20210112181242.1570-4-bouyer@antioche.eu.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 12 Jan 2021 19:13:12 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

From: Manuel Bouyer <bouyer@netbsd.org>

When a domain is destroyed, xparams may not be available any more when
the block script is called to unconfigure the vnd.
Check xparam only at configure time, and just unconfigure any vnd present
in the xenstore.

Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
---
 tools/hotplug/NetBSD/block | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/tools/hotplug/NetBSD/block b/tools/hotplug/NetBSD/block
index 23c8e38ebf..27f3b98335 100644
--- a/tools/hotplug/NetBSD/block
+++ b/tools/hotplug/NetBSD/block
@@ -22,37 +22,28 @@ error() {
 xpath=$1
 xstatus=$2
 xparams=$(xenstore-read "$xpath/params")
-if [ -b "$xparams" ]; then
-	xtype="phy"
-elif [ -f "$xparams" ]; then
-	xtype="file"
-elif [ -z "$xparams" ]; then
-	error "$xpath/params is empty, unable to attach block device."
-else
-	error "$xparams is not a valid file type to use as block device." \
-	      "Only block and regular image files accepted."
-fi
 
 case $xstatus in
 6)
 	# device removed
-	case $xtype in
-	file)
-		vnd=$(xenstore-read "$xpath/vnd" || echo none)
-		if [ $vnd != none ]; then
-			vnconfig -u $vnd
-		fi
-		;;
-	phy)
-		;;
-	*)
-		echo "unknown type $xtype" >&2
-		;;
-	esac
+	vnd=$(xenstore-read "$xpath/vnd" || echo none)
+	if [ $vnd != none ]; then
+		vnconfig -u $vnd
+	fi
 	xenstore-rm $xpath
 	exit 0
 	;;
 2)
+	if [ -b "$xparams" ]; then
+		xtype="phy"
+	elif [ -f "$xparams" ]; then
+		xtype="file"
+	elif [ -z "$xparams" ]; then
+		error "$xpath/params is empty, unable to attach block device."
+	else
+		error "$xparams is not a valid file type to use as block device." \
+		      "Only block and regular image files accepted."
+	fi
 	case $xtype in
 	file)
 		# Store the list of available vnd(4) devices in
-- 
2.29.2


