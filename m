Return-Path: <SRS0=atsh=K3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278E1C4708F
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 15:42:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D826761026
	for <xen-devel@archiver.kernel.org>; Tue,  1 Jun 2021 15:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D826761026
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.134933.250918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6Wj-0007Gq-QO; Tue, 01 Jun 2021 15:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134933.250918; Tue, 01 Jun 2021 15:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo6Wj-0007Gj-Mq; Tue, 01 Jun 2021 15:41:57 +0000
Received: by outflank-mailman (input) for mailman id 134933;
 Tue, 01 Jun 2021 15:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqUo=K3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lo6Wi-0007Gd-Q4
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 15:41:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 170f7a4f-90b0-43e8-84cc-37ab07740112;
 Tue, 01 Jun 2021 15:41:56 +0000 (UTC)
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
X-Inumbo-ID: 170f7a4f-90b0-43e8-84cc-37ab07740112
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622562115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uGDUR96hUGFk1aFgdFn9czWUWD+ZG6iEEz3pTgysQ1E=;
  b=bt6G+er2sFla8Udp5gep3ZtlDeBFmBzXVGr+AuIdM5HkFvSZckqr1Oh9
   WE/QI8xLSNf6z5UvyzN7cGH7U48EnykUFVN4UZjwqer10HysvqybB5ocu
   Ng5zAREYqGvkq51iBZzghR/9GhbvtSPktUOYGj31RqLdTC1Qv4yR6WJ22
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7+OO+9ynfigWsQ/frsj5JP43RgOC+SumdwtP6gmlJXQ8DYKI8oNrsqP/eROxyCgW1AbucYXRtI
 uTDM+xbsGDu6C2tW+Pgq228LuAWciuUbZYs+pw1Q/A3HKQl29RQULK/Oh2FhFfNlp42P9rP/qE
 Z1BawY8gYyygo0KNxa0czREV09ryxHoJ2GnOL7GQakZ5TvYR0Q8cZ7akvtFUrzJIV6owPcaDUq
 +sSzOGAYBdH5z5cLjLnEHN2cOeJg4ltER+gYIs2wvU1hO514ltG0TPiEJUTXzIDPAxIRLFZhIb
 xk0=
X-SBRS: 5.1
X-MesageID: 45055839
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HEw44q1m0v9eYvNQKlxD0gqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.83,240,1616472000"; 
   d="scan'208";a="45055839"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
Date: Tue, 1 Jun 2021 16:41:47 +0100
Message-ID: <20210601154147.55799-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Commit cf8c4d3d13b8 made some preparation to have one day
variable-length-array argument, but didn't declare the array in the
function prototype the same way as in the function definition. And now
GCC 11 complains about it.

Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/foreignmemory/private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
index 1ee3626dd278..5bb0cefb0987 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
 void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
                                  uint32_t dom, void *addr,
                                  int prot, int flags, size_t num,
-                                 const xen_pfn_t arr[num], int err[num]);
+                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
 int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
                                  void *addr, size_t num);
 
-- 
Anthony PERARD


