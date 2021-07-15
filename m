Return-Path: <SRS0=F++z=MH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB54C07E96
	for <xen-devel@archiver.kernel.org>; Thu, 15 Jul 2021 15:12:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193A061183
	for <xen-devel@archiver.kernel.org>; Thu, 15 Jul 2021 15:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 193A061183
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.156672.289113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m431u-0001O5-UC; Thu, 15 Jul 2021 15:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156672.289113; Thu, 15 Jul 2021 15:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m431u-0001Ny-R7; Thu, 15 Jul 2021 15:12:02 +0000
Received: by outflank-mailman (input) for mailman id 156672;
 Thu, 15 Jul 2021 15:12:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyhT=MH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m431s-0001Ns-W8
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 15:12:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d61e2eeb-1b97-451e-81c4-15fb2a2c0c11;
 Thu, 15 Jul 2021 15:11:59 +0000 (UTC)
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
X-Inumbo-ID: d61e2eeb-1b97-451e-81c4-15fb2a2c0c11
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626361919;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=UZjlK9LK1xaqhyMtY1pblmrS8hb2WALur6udawvdLkc=;
  b=hipvE9+lAadfTzWgdV4msPOizmRXKKw1nFtBxgF23wPt//+/dmpakJlr
   AXPq0VVOYDLV7EdvdlejCDL+kfExG8ZcKVTACclCj3hESm/bTtwfbmHZ2
   wyFn5HKT6ERwN39YF2xSTIKBF9oH9eYJZKjfElVkxZ16nUWo6mqTJVPRu
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ndns/LF2JuS2bPFL7b/KUki6wJM08yF3uv+WUMxnmQ87I1y5P4dQfTHuuDdP6HxuYdj8hweAef
 /vcogz9aCppvN8tX/KjnkaWWsgTEpsPA1tWUdgKfGFAPtoQB8hd/diXAUotmTR/RPQdonhsqOa
 Qrzld9OcmEJlHeyIrqzLrKDeyDIfppad1OnjKCCpVc9KB/uSp+HJWlunMoR1tyWhK9sztaSOdy
 iD0913ItUeQXhTfD09CZBJGJ8nblYXmuoA7yINimITLvYx52z8ISiW8LSNlIODjfvD+9ARCArN
 iRg=
X-SBRS: 5.1
X-MesageID: 50013535
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:e+CDKarOuuX6r5vnWuOB+0UaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.84,242,1620705600"; 
   d="scan'208";a="50013535"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.13] x86/tsx: Fix backport of "x86/cpuid: Rework HLE and RTM handling"
Date: Thu, 15 Jul 2021 16:10:50 +0100
Message-ID: <20210715151050.6514-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The backport dropped the hunk deleting the setup_clear_cpu_cap() for HLE/RTM,
but retained the hunk adding setup_force_cpu_cap().

Calling both force and clear on the same feature elicits an error, and clear
takes precedence, which breaks the part of the bufix which makes migration
from older versions of Xen function safely for VMs using TSX.

Fixes: f17d848c4caa ("x86/cpuid: Rework HLE and RTM handling")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
---
 xen/arch/x86/spec_ctrl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 33343062a7b6..1cfd02d7d7cf 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1150,9 +1150,6 @@ void __init init_speculation_mitigations(void)
          ((hw_smt_enabled && opt_smt) ||
           !boot_cpu_has(X86_FEATURE_SC_VERW_IDLE)) )
     {
-        setup_clear_cpu_cap(X86_FEATURE_HLE);
-        setup_clear_cpu_cap(X86_FEATURE_RTM);
-
         opt_tsx = 0;
         tsx_init();
     }
-- 
2.11.0


