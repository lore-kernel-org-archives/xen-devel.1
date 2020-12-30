Return-Path: <SRS0=rAmU=GC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9DAC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 16:03:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33DC20727
	for <xen-devel@archiver.kernel.org>; Wed, 30 Dec 2020 16:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33DC20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.60206.105542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kudvn-0002bW-4W; Wed, 30 Dec 2020 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60206.105542; Wed, 30 Dec 2020 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kudvn-0002bP-16; Wed, 30 Dec 2020 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 60206;
 Wed, 30 Dec 2020 16:02:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8On=GC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kudvm-0002bK-EM
 for xen-devel@lists.xenproject.org; Wed, 30 Dec 2020 16:02:34 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 801d120e-f136-4e6a-b161-8962f49d89ce;
 Wed, 30 Dec 2020 16:02:33 +0000 (UTC)
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
X-Inumbo-ID: 801d120e-f136-4e6a-b161-8962f49d89ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609344153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QS8M7hzLf9VUE1e7vMISP3JN5tbqz8IX1YFxd9Ez8tc=;
  b=iKh0m5SoTJjOaCbp0OIjnNJgFHZDN1pEue6CtkDmaSjCoozW/PhcgE+z
   +IFCFxQf6Fg+6saDtqMa0X7uBVDvhxT0roE4GklGvQADBz+XlSsG73RMV
   vzaO3rk4GhBJj2iog9FBdCjQyU5c14BWhEQyh49l2irVFKLnGm4K5fveW
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jZmTVB76mOvNaaW4XBec8r96iUpZ1zC7j581YAQLCkQdv8pYrlu8lN/rIX2dldROJ0d1CDwV35
 XHe8ErerO2zkkQ4yna1QJKY0MTZg+GX0XaZTPp4jS59oXEeHIle6m9teIhD0+U9n8KWTlYMYLy
 mATh1H/lV9IawV7cTrq1+VMSq4HCL0D6+8LmqZYyfN3vndWKM5UXlGRsi8iXKbrk75M32p7lXe
 fzWtEb0aaHByzmEEvBsJ5QkCTU1X1IiKnJKMrELakRAKFeD31zyS50+AwYntr+LA8qIlP6YxGO
 wf0=
X-SBRS: 5.2
X-MesageID: 34166451
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,461,1599537600"; 
   d="scan'208";a="34166451"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hpet: Fix return value of hpet_setup()
Date: Wed, 30 Dec 2020 16:02:08 +0000
Message-ID: <20201230160208.18877-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

hpet_setup() is idempotent if the rate has already been calculated, and
returns the cached value.  However, this only works correctly when the return
statements are identical.

Use a sensibly named local variable, rather than a dead one with a bad name.

Fixes: a60bb68219 ("x86/time: reduce rounding errors in calculations")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hpet.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index a55e68e6f7..e6fab8acd8 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -759,7 +759,7 @@ u64 __init hpet_setup(void)
 {
     static u64 __initdata hpet_rate;
     u32 hpet_id, hpet_period;
-    unsigned int last;
+    unsigned int last, rem;
 
     if ( hpet_rate )
         return hpet_rate;
@@ -789,9 +789,11 @@ u64 __init hpet_setup(void)
     hpet_resume(hpet_boot_cfg);
 
     hpet_rate = 1000000000000000ULL; /* 10^15 */
-    last = do_div(hpet_rate, hpet_period);
+    rem = do_div(hpet_rate, hpet_period);
+    if ( (rem * 2) > hpet_period )
+        hpet_rate++;
 
-    return hpet_rate + (last * 2 > hpet_period);
+    return hpet_rate;
 }
 
 void hpet_resume(u32 *boot_cfg)
-- 
2.11.0


