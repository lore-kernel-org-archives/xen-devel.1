Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B75EC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 21:57:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412432.1642925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43or-0004Ox-FF; Tue, 08 Sep 2026 21:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412432.1642925; Tue, 08 Sep 2026 21:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43or-0004Oo-Bh; Tue, 08 Sep 2026 21:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1412432;
 Tue, 08 Sep 2026 21:57:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x43oq-0003xW-Ax
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 21:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x43op-005JD4-OE
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 23:57:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa0847a-2eae-0a2a0a5409dd-0a2a4506a8b0-48
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:27 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa084c7-195a-0a2a45060019-d155dd31a5b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:27 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4843e397f74so5544437f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:57:27 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883927a3sm30151604f8f.11.2026.09.08.14.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 14:57:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788904647; x=1789509447; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8nsY8C7Ub4Yq2VugNbgpd/jDfcIIEiXdpyQ8LzQ4e38=;
        b=StpWe4GOOjirw/+q+J8orS8Ej1gfFqGjM9dZRwCTfooAk6NVuXQP++zNmqLHwo+qS5
         wN5XEODCqo75jM12fJjGnXGK8XFFDqCBQLPQmdJuIGfrW03ftX+6mPkg6z6K4utFbBfG
         i0wx14lzIRTXh1FTg4JEER/pck65qikpcTPk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788904647; x=1789509447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nsY8C7Ub4Yq2VugNbgpd/jDfcIIEiXdpyQ8LzQ4e38=;
        b=We7Mwx1JhzK4bpR3rNBH7IJcy98BQqj61zlKNm7xLfY+zKHqfvWcsr35KrVmq0JEti
         WRQ5ABeenTC9Sp/vsxar/WolEFRMH30oMyE3FfQ8KHPtT7XqtJmNPx8XVhq8H1uyAL7m
         mEAa1w5OB/reMVUCTDV/ckY8NLW+Wm0439EQFoEjykptSrMKphyQCzFS1pn0UvLV0J61
         tRM86+r+wqIFg5jd/X68Jgn9m7/iQGr3qJszyYA7G754KsHnBRHIaW2dm5bPnD/4mchv
         768oMnWCMjbcNKDQ46RhqCrHzlF7c/FUrqjlFuSLDa7L9Jd8U+1FFoweNlLHpdgoLQtB
         5SOw==
X-Gm-Message-State: AFuF++lyCrziUljt0wGcTiU7EuLJBsVvZuJolHO1ntywu7UWDC5Tacxx
	aUgM3oKL+wUmvPyuyAia6EckHogEqzbvzBZuvWpObLM98zvpwhIHN1TAvvmiWfFk3V2Qa+RjEAf
	RPbRddmA=
X-Gm-Gg: AYBFou0O26E6riEjxyvbdfzIAwdfPjsNRWGHa0tpX34kGGuC80UieWSu0t6gIXhw00m
	2YiJSn6QCcOB3I8sFB+72bkYncmt0NbSNRwohQgT+0l3EuHrry23yqJHiTIT4GXHl26Gi7att9k
	wH6m/EJKOCfBdsG21lLioStuYkWsTcndL/hs8FMybUmHSuUY0i8yuVaXzoRSVqkrkQ+7ckJTI5b
	1hbAboO8LJ64hZ91gQJ3CGfzE3DwV3iG7uSYJkChdpT1Ac6BPK6NdOmOVWQx0/uIp4hewKGAE5o
	ziNlkwrtc4rhxWdNLlfDQVQ4jnoQAJOw+GmUMMglajP0sL8xEqVxOycsfuyR7mbz4lotjo0/2W0
	+VNqRF6wTi9P5dsd+RcjfFK1tft6TxPIL91eR7yUK2HVlb64/IvnynHv2NL8/qtKAgZZu3mG30c
	klXZs1tKSZtYbcTopG679FxezGd85udVL2Dvokcv/iPardE6vzdwqgWy1NY6LJCQ+UELLZxWkEY
	LRtyHlRPRu60JtuWFiXv8QJOhgkGfPod3tx2Usp9Xwdlht4pCQ=
X-Received: by 2002:a05:6000:26ca:b0:485:9309:6ec1 with SMTP id ffacd0b85a97d-485930976admr27972933f8f.13.1788904646454;
        Tue, 08 Sep 2026 14:57:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/3] x86/pv: Convert struct mmio_ro_emulate_ctxt to use pci_sbdf_t
Date: Tue,  8 Sep 2026 22:57:19 +0100
Message-Id: <20260908215721.3346842-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788904647-1EAC277B-4A539AA2/0/0
X-purgate-type: clean
X-purgate-size: 2450

This will be used to simplify some call chains.  Reposition the new field to
avoid creating a interior hole.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/pv/ro-page-fault.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index d89306d34fc6..e70e09a6a6a1 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -301,10 +301,10 @@ static int ptwr_do_page_fault(struct x86_emulate_ctxt *ctxt,
 
 struct mmio_ro_emulate_ctxt {
     unsigned long cr2;
-    /* Used only for mmcfg case */
-    unsigned int seg, bdf;
     /* Used only for non-mmcfg case */
     mfn_t mfn;
+    /* Used only for mmcfg case */
+    pci_sbdf_t sbdf;
 };
 
 static int cf_check mmcfg_intercept_write(
@@ -329,10 +329,10 @@ static int cf_check mmcfg_intercept_write(
     }
 
     offset &= 0xfff;
-    if ( pci_conf_write_intercept(mmio_ctxt->seg, mmio_ctxt->bdf,
+    if ( pci_conf_write_intercept(mmio_ctxt->sbdf.seg, mmio_ctxt->sbdf.bdf,
                                   offset, bytes, p_data) >= 0 )
-        pci_mmcfg_write(mmio_ctxt->seg, PCI_BUS(mmio_ctxt->bdf),
-                        PCI_DEVFN(mmio_ctxt->bdf), offset, bytes,
+        pci_mmcfg_write(mmio_ctxt->sbdf.seg, mmio_ctxt->sbdf.bus,
+                        mmio_ctxt->sbdf.devfn, offset, bytes,
                         *(uint32_t *)p_data);
 
     return X86EMUL_OKAY;
@@ -390,6 +390,7 @@ static int mmio_ro_do_page_fault(struct x86_emulate_ctxt *ctxt,
                                  unsigned long addr, l1_pgentry_t pte)
 {
     struct mmio_ro_emulate_ctxt mmio_ro_ctxt = { .cr2 = addr };
+    unsigned int seg, bdf;
     mfn_t mfn = l1e_get_mfn(pte);
 
     if ( mfn_valid(mfn) )
@@ -404,8 +405,12 @@ static int mmio_ro_do_page_fault(struct x86_emulate_ctxt *ctxt,
     }
 
     ctxt->data = &mmio_ro_ctxt;
-    if ( pci_ro_mmcfg_decode(mfn_x(mfn), &mmio_ro_ctxt.seg, &mmio_ro_ctxt.bdf) )
+    if ( pci_ro_mmcfg_decode(mfn_x(mfn), &seg, &bdf) )
+    {
+        mmio_ro_ctxt.sbdf = PCI_SBDF(seg, bdf);
+
         return x86_emulate(ctxt, &mmcfg_intercept_ops);
+    }
 
     mmio_ro_ctxt.mfn = mfn;
 
-- 
2.39.5


