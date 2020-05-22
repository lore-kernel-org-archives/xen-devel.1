Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A192C433E1
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 16:13:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28473207F9
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 16:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28473207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAIE-000638-8A; Fri, 22 May 2020 16:13:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jcAID-00062x-12
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:13:05 +0000
X-Inumbo-ID: 1d602c9a-9c47-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d602c9a-9c47-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 16:13:04 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 22nWqa1HOEUlJZzT1IqShg9g3FD7lnx5clfJoCR5UU4RJeD7RLjKAHXlulsxeGBSZr9kwcBq6p
 Oy1ENo0CiMdKvFjQsIlR7atnKsxFqvzpZeFVLjQtBXShWl6iV4DI/1GAaoekfU6IuU4PohRQ5z
 UcyUoKQy+nuTnUzxsOgo8/6S66HWg2Rh4qxx9tDSbLlYQxPCxy9RfAfpX0QYJVLBFwb2Evo8/C
 vEDYjbxDqkVY7Yfqxa8Llk5WySqiiCRKAURglXu/Kd46UCLf0I7rLgDmrJQN3DGtI/YdUurAaA
 m0c=
X-SBRS: 2.7
X-MesageID: 18454768
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18454768"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 5/5] gitignore: Ignore golang package directory
Date: Fri, 22 May 2020 17:12:40 +0100
Message-ID: <20200522161240.3748320-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522161240.3748320-1-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Konrad Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall@arm.com>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 7418ce9829..caaaa15b49 100644
--- a/.gitignore
+++ b/.gitignore
@@ -406,6 +406,7 @@ tools/python/xen/lowlevel/xl/_pyxl_types.h
 tools/xenstore/xenstore-watch
 tools/xl/_paths.h
 tools/xl/xl
+tools/golang/src
 
 docs/txt/misc/*.txt
 docs/txt/man/*.txt
-- 
2.25.1


