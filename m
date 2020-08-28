Return-Path: <SRS0=+ST8=CG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0906FC433E2
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 15:08:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D018E2075B
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2020 15:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D018E2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfyx-0004er-6P; Fri, 28 Aug 2020 15:07:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfyw-0004eG-4q
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:07:58 +0000
X-Inumbo-ID: 7170e77f-2fca-4db4-a01f-791eb462f593
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7170e77f-2fca-4db4-a01f-791eb462f593;
 Fri, 28 Aug 2020 15:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9080AF2A;
 Fri, 28 Aug 2020 15:08:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 04/31] tools: fix pkg-config file for libxenguest
Date: Fri, 28 Aug 2020 17:07:20 +0200
Message-Id: <20200828150747.25305-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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

The pkg-config file for libxenguest is missing the private dependency
on libxenctrl.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libxc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index 315ac0b4f3..763231065c 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -178,7 +178,7 @@ $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_NAME = Xenguest
 $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_DESC = The Xenguest library for Xen hypervisor
 $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenguest)
 $(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_LIB = xenguest
-$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn
+$(PKG_CONFIG_DIR)/xenguest.pc: PKG_CONFIG_REQPRIV = xentoollog,xencall,xenforeignmemory,xenevtchn,xencontrol
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
 PKG_CONFIG_INST := $(PKG_CONFIG)
-- 
2.26.2


