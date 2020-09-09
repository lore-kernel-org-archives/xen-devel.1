Return-Path: <SRS0=Kfrc=CS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C775C433E2
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 12:14:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5808421941
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 12:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5808421941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFyz8-000765-Ok; Wed, 09 Sep 2020 12:13:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c0kD=CS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFyz7-00075s-1u
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 12:13:57 +0000
X-Inumbo-ID: 54d206e6-2bc1-433d-a48a-d98498563517
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54d206e6-2bc1-433d-a48a-d98498563517;
 Wed, 09 Sep 2020 12:13:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EB95B233;
 Wed,  9 Sep 2020 12:14:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] maintainers: fix libxl paths
Date: Wed,  9 Sep 2020 13:59:43 +0200
Message-Id: <20200909115944.4181-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909115944.4181-1-jgross@suse.com>
References: <20200909115944.4181-1-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix the paths of libxl in the MAINTAINERS file.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 MAINTAINERS | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26c5382075..482407b049 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -357,7 +357,8 @@ M:	Ian Jackson <iwj@xenproject.org>
 M:	Wei Liu <wl@xen.org>
 M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
-F:	tools/libxl/
+F:	tools/libs/guest/
+F:	tools/libs/light/
 F:	tools/xl/
 
 LIVEPATCH
@@ -428,9 +429,9 @@ M:	Shriram Rajagopalan <rshriram@cs.ubc.ca>
 M:	Yang Hongyang <imhy.yang@gmail.com>
 S:	Maintained
 F:	docs/README.remus
-F:	tools/libxl/libxl_remus_*
-F:	tools/libxl/libxl_netbuffer.c
-F:	tools/libxl/libxl_nonetbuffer.c
+F:	tools/libs/light/libxl_remus_*
+F:	tools/libs/light/libxl_netbuffer.c
+F:	tools/libs/light/libxl_nonetbuffer.c
 F:	tools/hotplug/Linux/remus-netbuf-setup
 F:	tools/hotplug/Linux/block-drbd-probe
 
-- 
2.26.2


