Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3EDC5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 06:05:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390744.1630913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wul2T-00073e-BA; Fri, 14 Aug 2026 06:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390744.1630913; Fri, 14 Aug 2026 06:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wul2T-00073X-8W; Fri, 14 Aug 2026 06:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1390744;
 Fri, 14 Aug 2026 06:05:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <james@dingwall.me.uk>) id 1wul2R-00072v-GK
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 06:05:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wul2Q-008Jrg-T7
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 08:05:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7eb004-2eae-0a2a0a5409dd-0a2a4501a102-42
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 08:05:06 +0200
Received: from [212.23.1.21] (helo=smarthost01b.ixn.mail.zen.net.uk)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7eb012-5984-0a2a45010019-d417011593cc-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 08:05:06 +0200
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <james@dingwall.me.uk>) id 1wul2Q-00000003X2U-1X0j;
 Fri, 14 Aug 2026 06:05:06 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id F0E77F09860;
 Fri, 14 Aug 2026 07:05:05 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavis, port 10024)
 with ESMTP id 9s8zgJlwCVpw; Fri, 14 Aug 2026 07:05:05 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id BE51FF0985D;
 Fri, 14 Aug 2026 07:05:05 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id B00DC5F0; Fri, 14 Aug 2026 07:05:05 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
X-Virus-Scanned: Debian amavis at dingwall.me.uk
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	James Dingwall <james@dingwall.me.uk>
Subject: [PATCH 1/2] tools/hotplug: fix invalid frontend path for set_mtu
Date: Fri, 14 Aug 2026 07:03:50 +0100
Message-ID: <20260814060441.923061-2-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814060441.923061-1-james-xen@dingwall.me.uk>
References: <20260814060441.923061-1-james-xen@dingwall.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189
X-purgate-ID: tlsNG-d62444/1786687506-C5540757-EF70DABE/0/0
X-purgate-type: clean
X-purgate-size: 1935

From: James Dingwall <james@dingwall.me.uk>

The set_mtu() function of xen-network-common.sh currently has this code:

        if [ ${type_if} = vif ]
        then
            local dev_=${dev#vif}
            local domid=${dev_%.*}
            local devid=${dev_#*.}

            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"

            xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
        fi

This works fine if the device has its default name but if the xen config
defines the vifname parameter the FRONTEND_PATH is incorrectly constructed.
Learn the frontend path by reading the appropriate value from the backend.

Also change use of `...` to $(...) for a consistent style in the script.

Signed-off-by: James Dingwall <james@dingwall.me.uk>
---
 tools/hotplug/Linux/xen-network-common.sh | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index 0150a4840e..f83eeef030 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -161,7 +161,7 @@ set_mtu () {
     local mtu=$(xenstore_read_default "$XENBUS_PATH/mtu" "")
     if [ -z "$mtu" ]
     then
-        mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
+        mtu="$(ip link show dev ${bridge}| awk '/mtu/ { print $5 }')"
         if [ -n "$mtu" ]
         then
             log debug "$bridge MTU is $mtu"
@@ -174,11 +174,7 @@ set_mtu () {
 
         if [ ${type_if} = vif ]
         then
-            local dev_=${dev#vif}
-            local domid=${dev_%.*}
-            local devid=${dev_#*.}
-
-            local FRONTEND_PATH="/local/domain/$domid/device/vif/$devid"
+            local FRONTEND_PATH="$(xenstore_read "$XENBUS_PATH/frontend")"
 
             xenstore_write "$FRONTEND_PATH/mtu" ${mtu}
         fi
-- 
2.55.0


