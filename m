Return-Path: <SRS0=jQwh=BH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7D2C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 11:37:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A382065C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 11:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="L0Mz4JCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A382065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NvV-0006FD-6t; Tue, 28 Jul 2020 11:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0NvT-0006Bw-Pe
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:37:43 +0000
X-Inumbo-ID: ba9e3aa2-d0c6-11ea-a8af-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba9e3aa2-d0c6-11ea-a8af-12813bfff9fa;
 Tue, 28 Jul 2020 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595936255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9OlWrYwwBC2nlui7wolnYoUzIAvQh25bk2h1rFifnms=;
 b=L0Mz4JCHJQYSLsCUOIiX9d8Rt8Ofd/rtttuupIqrU1rBa5gOkv+x91v8
 hsrAi7I7tlEBe+zZ8p4K47qvl45IQFvREj4VV1iJ7/YcPDdLtjRkW1uWG
 cForkMqkSxWe0pBdQN+yvkgg3MEW1+TZ0nRQBcAEeNsYBeOjrwq2Hv8GO w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: m9XKyherp46SXYwrhXV7kJyXn2sW1WqwI7PhNSStILK1R1a6B7s+lNNAMvY7NJ74rwDWP3UBuv
 olRkvmTVZG1Jj3Oh2Vrhb+XUWNcZJ+r06st/fSD9kjuShRn45Oci6B+3QBg4JtFCmnPhi5kBYr
 GFqrFR6o1gKt147gUkmpPn3+xD/NQ2g64DQT09uG1lKFC6EEqZIXBP224VXDMSbEInZ4m1m1Da
 Tgp3k2gNjrjces4wgCWiDqdZ8fio1q1Dp+WMUG/29LEdv8+sSVBC0v+T2KEeXlqFhqev8N0NwE
 XnA=
X-SBRS: 2.7
X-MesageID: 23330309
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23330309"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/5] xen/memory: Fix compat XENMEM_acquire_resource for size
 requests
Date: Tue, 28 Jul 2020 12:37:09 +0100
Message-ID: <20200728113712.22966-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200728113712.22966-1-andrew.cooper3@citrix.com>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Micha=C5=82=20Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Copy the nr_frames from the correct structure, so the caller doesn't
unconditionally receive 0.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Michał Leszczyński <michal.leszczynski@cert.pl>
CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
---
 xen/common/compat/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 3851f756c7..ed92e05b08 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -599,7 +599,7 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
                 if ( __copy_field_to_guest(
                          guest_handle_cast(compat,
                                            compat_mem_acquire_resource_t),
-                         &cmp.mar, nr_frames) )
+                         nat.mar, nr_frames) )
                     return -EFAULT;
             }
             else
-- 
2.11.0


