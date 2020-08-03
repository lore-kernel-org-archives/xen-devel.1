Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D70EC433E1
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 12:49:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B9D20738
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 12:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="etQRioOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B9D20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2ZuR-0001oz-B2; Mon, 03 Aug 2020 12:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2ZuP-0001oJ-KB
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:49:41 +0000
X-Inumbo-ID: c94bbfc8-d587-11ea-908e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c94bbfc8-d587-11ea-908e-bc764e2007e4;
 Mon, 03 Aug 2020 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEecjANlWh3hBTz/ieGtixPqvrZoBJyua6jWfk3Vf10=; b=etQRioOuZx5mSrQGtdIYJdZ0Yc
 ZEVxz5N3UUHLW/QPuNGa/Jorna3ZqR7Hwj3mwB5CcspH7meQgXSd7H/LTsHrqsMkc6uaQkP24+Mpf
 E1XkZpIWjBvJCHKM06adVaIfBZLO9RqRHMkbY8UkjB8DSItessioIBxTbwYNM3JyJJLA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2ZuJ-0000wp-Tp; Mon, 03 Aug 2020 12:49:35 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2ZuJ-0002Mv-KR; Mon, 03 Aug 2020 12:49:35 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/4] tools/hotplug: add remove_from_bridge() and improve
 debug output
Date: Mon,  3 Aug 2020 13:49:28 +0100
Message-Id: <20200803124931.2678-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803124931.2678-1-paul@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch adds a remove_from_bridge() function into xen-network-common.sh
to partner with the existing add_to_bridge() function. The code in
add_to_bridge() is also slightly re-arranged to avoid duplication calls of
'ip link'.

Both add_to_bridge() and remove_from_bridge() will check if their bridge
manipulation operations are necessary and emit a log message if they are not.

NOTE: A call to remove_from_bridge() will be added by a subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 tools/hotplug/Linux/xen-network-common.sh | 37 ++++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 8dd3a62068..37e71cfa9c 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -126,19 +126,40 @@ add_to_bridge () {
     local bridge=$1
     local dev=$2
 
-    # Don't add $dev to $bridge if it's already on a bridge.
-    if [ -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
-	ip link set dev ${dev} up || true
-	return
-    fi
-    if which brctl >&/dev/null; then
-        brctl addif ${bridge} ${dev}
+    # Don't add $dev to $bridge if it's already on the bridge.
+    if [ ! -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
+	log debug "adding $dev to bridge $bridge"
+	if which brctl >&/dev/null; then
+            brctl addif ${bridge} ${dev}
+	else
+            ip link set ${dev} master ${bridge}
+	fi
     else
-        ip link set ${dev} master ${bridge}
+	log debug "$dev already on bridge $bridge"
     fi
+
     ip link set dev ${dev} up
 }
 
+remove_from_bridge () {
+    local bridge=$1
+    local dev=$2
+
+    ip link set dev ${dev} down || :
+
+    # Don't remove $dev from $bridge if it's not on the bridge.
+    if [ -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
+	log debug "removing $dev from bridge $bridge"
+	if which brctl >&/dev/null; then
+            brctl delif ${bridge} ${dev}
+	else
+            ip link set ${dev} nomaster
+	fi
+    else
+	log debug "$dev not on bridge $bridge"
+    fi
+}
+
 # Usage: set_mtu bridge dev
 set_mtu () {
     local bridge=$1
-- 
2.20.1


