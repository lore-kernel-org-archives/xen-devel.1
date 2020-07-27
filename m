Return-Path: <SRS0=5MCE=BG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D73C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 17:06:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3562064B
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 17:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="gRRbpzVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3562064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k06Zn-0006uz-Ef; Mon, 27 Jul 2020 17:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k06Zm-0006qK-89
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 17:06:10 +0000
X-Inumbo-ID: 71a883fc-d02b-11ea-a7b1-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71a883fc-d02b-11ea-a7b1-12813bfff9fa;
 Mon, 27 Jul 2020 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595869560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UrtDnq8F4eKIjcjNHn8k54mlLah4ENCqM3HBW0OiIE=;
 b=gRRbpzVUawqj5TxHdGBpiyB8+CjxxNXjIzboe1SnfvadfwT5M2EsUUwh
 Kjg1TfG5DXv03E9UiHCLg5gwGE+PuJPipuXRFkvSaDxs/90gC5UqXrK+Z
 cEQ+E8J8ALjVCfibQqSvUmp39D1ufBhZjR5qnExFxGBL6n75swfD9TgyU s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2dtOmp8c2Nwrd+LUQ4J9RPBxhaEZfrC856jhgoQ+7Bw5E1CyN4gbGYR9OyI4x1PcqlfV58Rzqv
 3BYXLDz/Ea9OY0JQoggv3zA2atPYZ4/eDbCaHnUWPnMKbItTX+9PXbzrDbNwarHC5a6JGoSYAx
 ula5+FWpHzijYGbT0T7FlaRq/o37xxIxQfcvkOcVEsVZcjOL/NJW//1i4FwzODJ1sqz9KMRvFz
 cPShm+jK6lXrdXtwg916Ne5pDATSeQQdQMXceGKkZia2/X8QR2tv6kFoIVuxJnwHwC7GCsXlNQ
 U/s=
X-SBRS: 2.7
X-MesageID: 24144262
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="24144262"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 4/5] x86/vpt: only try to resume timers belonging to
 enabled devices
Date: Mon, 27 Jul 2020 19:05:38 +0200
Message-ID: <20200727170539.55798-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727170539.55798-1-roger.pau@citrix.com>
References: <20200727170539.55798-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Check whether the emulated device is actually enabled before trying to
resume the associated timers.

Thankfully all those structures are zeroed at initialization, and
since the devices are not enabled they are never populated, which
triggers the pt->vcpu check at the beginning of pt_resume forcing an
exit from the function.

While there limit the scope of i and make it unsigned.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/vpt.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 47f2c2aa64..62c87867c5 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -636,14 +636,19 @@ static void pt_resume(struct periodic_time *pt)
 
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt)
 {
-    int i;
-
     if ( d )
     {
-        pt_resume(&d->arch.vpit.pt0);
-        pt_resume(&d->arch.hvm.pl_time->vrtc.pt);
-        for ( i = 0; i < HPET_TIMER_NUM; i++ )
-            pt_resume(&d->arch.hvm.pl_time->vhpet.pt[i]);
+        if ( has_vpit(d) )
+            pt_resume(&d->arch.vpit.pt0);
+        if ( has_vrtc(d) )
+            pt_resume(&d->arch.hvm.pl_time->vrtc.pt);
+        if ( has_vhpet(d) )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < HPET_TIMER_NUM; i++ )
+                pt_resume(&d->arch.hvm.pl_time->vhpet.pt[i]);
+        }
     }
 
     if ( vlapic_pt )
-- 
2.27.0


