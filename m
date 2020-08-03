Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71598C433DF
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 12:49:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C0F520678
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 12:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="ZJ+YGwog"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C0F520678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2ZuV-0001r6-NL; Mon, 03 Aug 2020 12:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2ZuU-0001oJ-KD
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:49:46 +0000
X-Inumbo-ID: c94bbfc9-d587-11ea-908e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c94bbfc9-d587-11ea-908e-bc764e2007e4;
 Mon, 03 Aug 2020 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kR8KOrJwsxDE/ONPFOt3nY9mFnEziImu/LnFUCfqeYk=; b=ZJ+YGwogR5jrHLs2CgiehNTwnw
 COemTsnajKTmERoLv9bCRMdHA1p4sBqBeZJH4w2ewDSrlQDb4vMSsN2NBJDOySHSFjZ8GIkbkppFA
 934tKxQUzzOfZL8Si5zYm6ODa2bIqWOPvg2C9LsRhGT1a7F85sZO546cKptlYuwLLGT0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2ZuK-0000wv-Nq; Mon, 03 Aug 2020 12:49:36 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2ZuK-0002Mv-GL; Mon, 03 Aug 2020 12:49:36 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/4] tools/hotplug: combine add/online and remove/offline
 in vif-bridge...
Date: Mon,  3 Aug 2020 13:49:29 +0100
Message-Id: <20200803124931.2678-3-paul@xen.org>
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

... as they are in vif-route.

The script is invoked with online/offline for vifs and add/remove for taps.
The operations that are necessary, however, are the same in both cases. This
patch therefore combines the cases.

The open-coded bridge removal code is also replaced with call to
remove_from_bridge().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 tools/hotplug/Linux/vif-bridge | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tools/hotplug/Linux/vif-bridge b/tools/hotplug/Linux/vif-bridge
index e722090ca8..e1d7c49788 100644
--- a/tools/hotplug/Linux/vif-bridge
+++ b/tools/hotplug/Linux/vif-bridge
@@ -77,25 +77,17 @@ then
 fi
 
 case "$command" in
+    add)
+        ;&
     online)
         setup_virtual_bridge_port "$dev"
         set_mtu "$bridge" "$dev"
         add_to_bridge "$bridge" "$dev"
         ;;
-
+    remove)
+        ;&
     offline)
-        if which brctl >&/dev/null; then
-            do_without_error brctl delif "$bridge" "$dev"
-        else
-            do_without_error ip link set "$dev" nomaster
-        fi
-        do_without_error ifconfig "$dev" down
-        ;;
-
-    add)
-        setup_virtual_bridge_port "$dev"
-        set_mtu "$bridge" "$dev"
-        add_to_bridge "$bridge" "$dev"
+        remove_from_bridge "$bridge" "$dev"
         ;;
 esac
 
-- 
2.20.1


