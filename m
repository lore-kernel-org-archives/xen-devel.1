Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982A3C4363D
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 05:24:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D1C21D43
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 05:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RUT9iEX2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25D1C21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKxGD-00025x-O7; Wed, 23 Sep 2020 05:24:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eB7U=DA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKxGC-00025s-FN
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 05:24:08 +0000
X-Inumbo-ID: 4a300e74-1dff-473d-b8d4-6c32974861d4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a300e74-1dff-473d-b8d4-6c32974861d4;
 Wed, 23 Sep 2020 05:24:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600838646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y3ioi0GHlqq5R8420X951GHrFsZuID65/AlBGe4+uJI=;
 b=RUT9iEX2Fst/ABXFgl9W0VtG4TBXeikFr3JdbBlulAhQCNuciX8nEJihXDWfxlmLYaFm9F
 gGpV3dOxBZE00o2X8d/8whPBu8hFCHmXiqZ9hUEJaIm5/1TrPF51c0ft1AeyfsGNRiQuwx
 VrZhmpTaSaRokaCoMTK1tcC1gi3iieo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6ABDDAC19;
 Wed, 23 Sep 2020 05:24:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libs/guest: fix out of tree builds of libxenguest users
Date: Wed, 23 Sep 2020 07:24:01 +0200
Message-Id: <20200923052401.24917-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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

xenguest.h includes xenctrl_dom.h, which is including the Xen internal
xen/libelf/libelf.h. This results in build failures for components
using libxenguest when being built outside the Xen build environment.

Fix that by guarding the include of xenctrl_dom.h with
"#ifdef __XEN_TOOLS_".

Fixes: 7e0165c19387 ("tools/libxc: untangle libxenctrl from libxenguest")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/include/xenguest.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/include/xenguest.h
index 4643384790..5cd502f644 100644
--- a/tools/libs/guest/include/xenguest.h
+++ b/tools/libs/guest/include/xenguest.h
@@ -22,7 +22,9 @@
 #ifndef XENGUEST_H
 #define XENGUEST_H
 
+#ifdef __XEN_TOOLS__
 #include <xenctrl_dom.h>
+#endif
 
 #define XC_NUMA_NO_NODE   (~0U)
 
-- 
2.26.2


