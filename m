Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AF1C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 09:42:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948F82312E
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 09:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948F82312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70219.125946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nWI-0002YZ-AQ; Tue, 19 Jan 2021 09:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70219.125946; Tue, 19 Jan 2021 09:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nWI-0002YS-72; Tue, 19 Jan 2021 09:41:50 +0000
Received: by outflank-mailman (input) for mailman id 70219;
 Tue, 19 Jan 2021 09:41:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1nWG-0002YL-Hp
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 09:41:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42187236-1ff2-4d0a-8bb8-2515b3e197a6;
 Tue, 19 Jan 2021 09:41:47 +0000 (UTC)
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
X-Inumbo-ID: 42187236-1ff2-4d0a-8bb8-2515b3e197a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611049307;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RqDGCbnkVcCkS/5GCWA5bR/Hy7seXEub75ZukdOIMaE=;
  b=DlySqW0mr73BNEhPckTxoVuqVptl/PrKeJSTQeGFLLDWs7I+UeQievTN
   OEAYmt88gR7r6AekDtkZ/t4aUYXVV/vJNBvauxpKBgLndcv/cyCisluud
   42vIpXq+Fy+tAdrbNv9azMCHauUOnd0vJkIxtcpOwW+/kFjn7PP0JREx6
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xbay19q+oF/cuR8aAUWaQvr2niQsn9XbjBbBZVjgKm2VlJpyrDgtkpwCfvBrMiHtTTyHlKSJgC
 hMK1A9eJtzIwY5Zc9TSBhFBfXYP7qSrWhnlS5PThm2+1cONEC0MAc0TTHp5wowhzoUjXiGiei5
 HT6ZoDVPYFsDirFNCYpYcgrvizrbSRvWNEzCfsvrm75XmHigq/pmCJzBhpbpzx6pTtwYq3jBOp
 PaVPa0hYhZg6+yfGS4s8+blNMYACQ76wwShpZ9RO1D+aK1LKJYfUtUUrlv289k7jO64LCCvRvf
 u3A=
X-SBRS: 5.1
X-MesageID: 35729213
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="35729213"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH] x86/mm: Remove cascade damage from "fishy" ref/typecount failure
Date: Tue, 19 Jan 2021 09:41:22 +0000
Message-ID: <20210119094122.23713-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This code has been copied in 3 places, but it is broken and dangerous.

For all these cases, the domain destruction path will underflow the whichever
reference failed to be taken, leading to all kinds of more fun bugs.

Crashing instantly is strictly less-bad behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Paul Durrant <paul@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>

I'm pretty certain that underflowing the main refcount is a BUG() elsewhere.
I'm not certain what underflowing the typecount manages to do.
---
 xen/arch/x86/hvm/ioreq.c     | 3 +--
 xen/arch/x86/hvm/vmx/vmx.c   | 3 +--
 xen/arch/x86/mm/mem_paging.c | 4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 1cc27df87f..b2ceca7625 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -372,8 +372,7 @@ static int hvm_alloc_ioreq_mfn(struct hvm_ioreq_server *s, bool buf)
          * The domain can't possibly know about this page yet, so failure
          * here is a clear indication of something fishy going on.
          */
-        domain_crash(s->emulator);
-        return -ENODATA;
+        BUG();
     }
 
     iorp->va = __map_domain_page_global(page);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475ee3d..08f489d795 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3048,8 +3048,7 @@ static int vmx_alloc_vlapic_mapping(struct domain *d)
          * The domain can't possibly know about this page yet, so failure
          * here is a clear indication of something fishy going on.
          */
-        domain_crash(d);
-        return -ENODATA;
+        BUG();
     }
 
     mfn = page_to_mfn(pg);
diff --git a/xen/arch/x86/mm/mem_paging.c b/xen/arch/x86/mm/mem_paging.c
index 01281f786e..cfd91572b5 100644
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -388,9 +388,7 @@ static int prepare(struct domain *d, gfn_t gfn,
             gprintk(XENLOG_ERR,
                     "%pd: fresh page for GFN %"PRI_gfn" in unexpected state\n",
                     d, gfn_x(gfn));
-            domain_crash(d);
-            page = NULL;
-            goto out;
+            BUG();
         }
         mfn = page_to_mfn(page);
         page_extant = 0;
-- 
2.11.0


