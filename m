Return-Path: <SRS0=cIP9=CB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5D0C433DF
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 09:46:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C6D2074D
	for <xen-devel@archiver.kernel.org>; Sun, 23 Aug 2020 09:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37C6D2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maE-0008AL-0s; Sun, 23 Aug 2020 09:46:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQR-0004t9-TR
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:31 +0000
X-Inumbo-ID: 289043b6-5232-4b76-a6dd-61807808931c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 289043b6-5232-4b76-a6dd-61807808931c;
 Sun, 23 Aug 2020 09:35:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00BBCAE02;
 Sun, 23 Aug 2020 09:35:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 34/38] tools/libxl: move xl parsing checks to tools/xl
Date: Sun, 23 Aug 2020 11:35:15 +0200
Message-Id: <20200823093519.18386-35-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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

check-xl-* scripts and data are not libxl- but xl-specific. Move them
from tools/libxl/ to tools/xl/.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/{libxl => xl}/check-xl-disk-parse                 | 0
 tools/{libxl => xl}/check-xl-vcpupin-parse              | 0
 tools/{libxl => xl}/check-xl-vcpupin-parse.data-example | 0
 tools/{libxl => xl}/check-xl-vif-parse                  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename tools/{libxl => xl}/check-xl-disk-parse (100%)
 rename tools/{libxl => xl}/check-xl-vcpupin-parse (100%)
 rename tools/{libxl => xl}/check-xl-vcpupin-parse.data-example (100%)
 rename tools/{libxl => xl}/check-xl-vif-parse (100%)

diff --git a/tools/libxl/check-xl-disk-parse b/tools/xl/check-xl-disk-parse
similarity index 100%
rename from tools/libxl/check-xl-disk-parse
rename to tools/xl/check-xl-disk-parse
diff --git a/tools/libxl/check-xl-vcpupin-parse b/tools/xl/check-xl-vcpupin-parse
similarity index 100%
rename from tools/libxl/check-xl-vcpupin-parse
rename to tools/xl/check-xl-vcpupin-parse
diff --git a/tools/libxl/check-xl-vcpupin-parse.data-example b/tools/xl/check-xl-vcpupin-parse.data-example
similarity index 100%
rename from tools/libxl/check-xl-vcpupin-parse.data-example
rename to tools/xl/check-xl-vcpupin-parse.data-example
diff --git a/tools/libxl/check-xl-vif-parse b/tools/xl/check-xl-vif-parse
similarity index 100%
rename from tools/libxl/check-xl-vif-parse
rename to tools/xl/check-xl-vif-parse
-- 
2.26.2


