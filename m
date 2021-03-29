Return-Path: <SRS0=2Bwx=I3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A5AC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 16:15:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9E761582
	for <xen-devel@archiver.kernel.org>; Mon, 29 Mar 2021 16:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F9E761582
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.103134.196815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuY7-00070O-5l; Mon, 29 Mar 2021 16:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103134.196815; Mon, 29 Mar 2021 16:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQuY7-00070F-20; Mon, 29 Mar 2021 16:15:31 +0000
Received: by outflank-mailman (input) for mailman id 103134;
 Mon, 29 Mar 2021 16:15:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HZ2U=I3=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lQuY5-0006uY-Iz
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:15:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0ae0d7e-5222-43a9-a6fe-7e54a74c23aa;
 Mon, 29 Mar 2021 16:15:24 +0000 (UTC)
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
X-Inumbo-ID: a0ae0d7e-5222-43a9-a6fe-7e54a74c23aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617034524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UkUUulHMRPz+2vhwcXSUEDdxzbFbFoOEDJ/HsF0pmbI=;
  b=H9/TTat0p7KXEwt1KnV9eXyNijkDjbS90CXXosXnxrZBY2H1ivwM1gFB
   h8gU1Qr8/6Uh0VnQUMpVxzi9TJLYhkseqoAWU+CFY53jAVpFZDnFUS7e2
   2uYAT4QnW29zWfrINgI7hX63fQ/NGd1fMg22UcvM/7aS61aho3LjrQC4M
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RCuso1508rjag8Sfa0R/YfsDRcyYaVzzEL8G7wQKI3CPtglISDoqnBmoDmV4vncbKqIO+Hu43C
 IdZqvBj6DOOBnMbcII521Ai8eXqEGvUzFDjq26/uIz2AB5IjxCKl5R7P9+vZy5oNEXnFNbFlJw
 dvhgwh228dwOZw4sDVRCG9ulB1ZJxzczX3xvI9pJYtcJYrwYtofVHC1jvfzAlq/W9ooYsQbe4T
 onhpEeKr+4hikcAu9XlwdWEKdtNV3vvb8ciEsYpDQvzxCaeCFu1dqFcSHv/Z8rto2b7e1/oKqz
 qT8=
X-SBRS: 5.1
X-MesageID: 40346971
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6ZkYza3v6xI49RhYD3+aIwqjBDUkLtp033Aq2lEZdDV+WKWj9v
 yGtvIdyBPylXItQ3kmg9+NI+2tRnnb+J5z7+AqTM6fdSPhv3alK5wn0Jv6z1TbalbD38NUyK
 sISdkcNPTeFl5/5PyU3CCZFJIazMCD4OSUg47lvhNQZCVLT40l0AtjEAacFSRNNW97LL40Do
 CV6MYChxfIQwV0Uu2BCnMIX/fOqrTw/fqMC3NrOzcd5AaDlj+u4rLheiLouSs2aD9T3awktV
 HMjg2R3NTaj9iA1hTe22XPhq43pPLdzLJ4avCku4wwIjXohh3AXvUFZ4G/
X-IronPort-AV: E=Sophos;i="5.81,288,1610427600"; 
   d="scan'208";a="40346971"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<ian.jackson@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH v2 for-4.15 7/7] CHANGELOG.md: Make PV shim smaller by factoring out HVM-specific shadow code
Date: Mon, 29 Mar 2021 17:14:57 +0100
Message-ID: <20210329161457.345360-7-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329161457.345360-1-george.dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- Add into the series

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c4696e41a1..9912ea5a8d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -19,6 +19,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - CI loop: Add Alpine Linux, Ubuntu Focal targets; drop CentOS 6
  - CI loop: Add qemu-based dom0 / domU test for ARM
  - CI loop: Add dom0less aarch64 smoke test
+ - Factored out HVM-specific shadow code, allowing PV shim to be slimmer
 
 ## Removed / support downgraded
 
-- 
2.30.2


