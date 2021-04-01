Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D85C433B4
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 13:38:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0738461242
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 13:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0738461242
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104463.199821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxX8-0005sj-5w; Thu, 01 Apr 2021 13:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104463.199821; Thu, 01 Apr 2021 13:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxX8-0005sU-2B; Thu, 01 Apr 2021 13:38:50 +0000
Received: by outflank-mailman (input) for mailman id 104463;
 Thu, 01 Apr 2021 13:38:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8z4=I6=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRxX7-0005gw-3r
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 13:38:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b028f1f-acda-4ee9-a953-5abbd8b840bb;
 Thu, 01 Apr 2021 13:38:39 +0000 (UTC)
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
X-Inumbo-ID: 1b028f1f-acda-4ee9-a953-5abbd8b840bb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617284319;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YXv7m3eiV3hYcI7MMqbRpxWTnC+nXWuF664tG7aNhFw=;
  b=InjMt0I14wi8kYvcymGeiiHOJ/vtU9Isv3EuCCCl2pmhGt5XT4lb/6JZ
   QYrOF6CzXXp8DxnphFTEcPCOXLCEdebPG+qimTBpFMrN1ZFx7rA7ykPZX
   Dy6Saa0zostevP5s2Oy8UYLLyAkJPoVHQzlhqUk0Dnt8k5AxRf678GoWX
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zQrNxEe9R7nv3DSPOkmYPcD4gnfVkNg4qTi3BIeO4ow5uzrHXZeFdzo+wBS4d3XMrtlGZXy5w1
 ghORQpqqy0qx/LdcS4Veq/CT0x9dDPBSUoVgE0Trx1Bi1soFUFp6BQKnz7vYeW4FcRM7K8bWL8
 w4Fki3Y3mRidef77b9XQl8NVxkktOekR8HiCzDZE+eIGlHZOHLRaoQFWHdLfk63QA+xmQBFOxS
 HSnu2dyfDiJU/J2sulHR20z5AVMlRyZJUZgufWaKvaWQxD84nxn4lKFb7jinNp1dSs3qBAcjZ/
 3vo=
X-SBRS: 5.1
X-MesageID: 40698208
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5sYPEa9lZyM6dJaWQxRuk+Erdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnXnKQU3aA6O7C+UA76/Fa5NY0K1/qF/xTMOQ3bstRc26
 BpbrRkBLTLZ2RSoM7m7GCDfOoI78KA9MmT69v273Aodg1ybrEl0gERMHf4LmRTZC1rQaU0D4
 Cd4M0vnUvGRV0yYt6gDncIG8jvzue7967OWhINCx455ATmt1rBhILSKBSW0gwTVDlC294ZgA
 34ujf0+7m5tLWDwgLcvlW5071thNDjxtFfbfb87vQ9FzOEsGeVTbUkYZKulnQfoOaj6FEl+e
 O83CsIDoBIxF76Ok2wqRvp8QH83Dgp8G+K8y7nvVLT5fbXaRh/J81dhZ9IUhax0TtQgPhMlJ
 hl8kjcl51LAQjOlC7wjuK4Jy1Cpw6PjlcJ1csw5kYvKLc2WftqgqE0uH5xKtMmGhn37Yg2ed
 Mecf301bJtXn6xK0zCsnIH+q3VYl0DWi2ob2IlocKv3z1fjBlCvjcl7f1apHsG+Z4nIqM0nN
 jsA+BtnLFKeMcccbhwMucHWde2EWzAW3v3QRivHWg=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40698208"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15 1/7] CHANGELOG.md: Mention XEN_SCRIPT_DIR
Date: Thu, 1 Apr 2021 14:38:21 +0100
Message-ID: <20210401133827.362216-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---

CC: Olaf Hering <olaf@aepfle.de>
CC: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8964bacf73..f7ce6682b9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - CI loop: Add dom0less aarch64 smoke test
  - x86: Allow domains to use AVX-VNNI instructions
  - Factored out HVM-specific shadow code, improving code clarity and reducing the size of PV-only hypervisor builds
+ - Added XEN_SCRIPT_DIR configuration option to specify location for Xen scripts, rather than hard-coding /etc/xen/scripts
+
 
 ### Removed / support downgraded
 
-- 
2.30.2


