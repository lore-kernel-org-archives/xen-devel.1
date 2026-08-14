Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A08C5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 06:05:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390746.1630922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wul2Y-0007MU-Ho; Fri, 14 Aug 2026 06:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390746.1630922; Fri, 14 Aug 2026 06:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wul2Y-0007MJ-Eo; Fri, 14 Aug 2026 06:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1390746;
 Fri, 14 Aug 2026 06:05:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <james@dingwall.me.uk>) id 1wul2X-0007K3-Dc
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 06:05:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wul2W-0006DM-AS
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 08:05:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7eb015-8faa-0a2a0a5109dd-0a2a450cd480-10
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 08:05:12 +0200
Received: from [212.23.1.21] (helo=smarthost01b.ixn.mail.zen.net.uk)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <james@dingwall.me.uk>)
 id 6a7eb018-f479-0a2a450c0019-d41701158232-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 08:05:12 +0200
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <james@dingwall.me.uk>) id 1wul2V-00000003X3F-4BtL;
 Fri, 14 Aug 2026 06:05:12 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id B567BF09864;
 Fri, 14 Aug 2026 07:05:11 +0100 (BST)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavis, port 10024)
 with ESMTP id rf9CWZLGjV3g; Fri, 14 Aug 2026 07:05:11 +0100 (BST)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 8D79FF09861;
 Fri, 14 Aug 2026 07:05:11 +0100 (BST)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 8A5CCAC8; Fri, 14 Aug 2026 07:05:11 +0100 (BST)
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
Subject: [PATCH 2/2] tools/hotplug: validate mtu read from xenstore against RFC 791 minimum
Date: Fri, 14 Aug 2026 07:03:51 +0100
Message-ID: <20260814060441.923061-3-james-xen@dingwall.me.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814060441.923061-1-james-xen@dingwall.me.uk>
References: <20260814060441.923061-1-james-xen@dingwall.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189
X-purgate-ID: tlsNG-d25034/1786687512-5093EA5B-062069C2/0/0
X-purgate-type: clean
X-purgate-size: 1280

From: James Dingwall <james@dingwall.me.uk>

RFC 791 sets the minimum acceptable mtu to 68:

    Every internet module must be able to forward a datagram of 68
    octets without further fragmentation.  This is because an internet
    header may be up to 60 octets, and the minimum fragment is 8 octets.

In the Linux kernel source:

include/net/ip.h:#define IPV4_MIN_MTU           68              /* RFC 791 */

While there is no reason to expect a value <68 to be read from xenstore or
from the bridge make the value test require a number >= this minimum.

Signed-off-by: James Dingwall <james@dingwall.me.uk>
---
 tools/hotplug/Linux/xen-network-common.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
index f83eeef030..344730cb42 100644
--- a/tools/hotplug/Linux/xen-network-common.sh
+++ b/tools/hotplug/Linux/xen-network-common.sh
@@ -167,7 +167,7 @@ set_mtu () {
             log debug "$bridge MTU is $mtu"
         fi
     fi
-    if [ -n "$mtu" ] && [ "$mtu" -gt 0 ]
+    if [ -n "$mtu" ] && [ "$mtu" -ge 68 ]
     then
         log debug "setting $dev MTU to $mtu"
         ip link set dev ${dev} mtu ${mtu} || :
-- 
2.55.0


