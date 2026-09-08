Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E759C79FAA
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 21:57:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412430.1642902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43op-0003pm-Qj; Tue, 08 Sep 2026 21:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412430.1642902; Tue, 08 Sep 2026 21:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43op-0003pf-NG; Tue, 08 Sep 2026 21:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1412430;
 Tue, 08 Sep 2026 21:57:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x43on-0003ms-KP
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 21:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x43om-00Ebur-Fg
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 23:57:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa084c6-e002-0a2a0a5209dd-0a2a45099166-6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:28 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa084c8-be1a-0a2a45090019-d155dd2bd999-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:28 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-485850cf499so3423728f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:57:28 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883927a3sm30151604f8f.11.2026.09.08.14.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 14:57:27 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788904648; x=1789509448; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vti7XuJny5sukz1d1q8fbM2VnpDn4fSAdXusGCg11E8=;
        b=LwDth/1xbthXUCa1pjtOyVYtPb+FxMjT4/TMBaqsh+5MnMb76H7LAHbgKS5LqdqRMW
         +NaYs6p8eQKggHlYrVtfXefAUROW/nQfoETQx1Gi53tZcraDdcWsrq1GvuVyL8nyyqzf
         bOXY2BwRIGkoTT2DGPMUo7DLOdrmDL22TLNKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788904648; x=1789509448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vti7XuJny5sukz1d1q8fbM2VnpDn4fSAdXusGCg11E8=;
        b=ZnVKnten+3JDd79hlyhO1gXw+73vQ8NVrKra9GqzxWfg0EtdFf3T6a7yxPK8nonIwn
         Ne9A+fYP5emP6A0VEA0OLm7oLYO7iyLd6reJSMUfUFxbul290OWcq7JJ3gfnW7T9BBud
         qusnHAM3clInkpcKTX4dWfiwaBhfUodSB7u2uQ3DcIP+F7EsYmSbUhcghuyUywQRygDe
         Gi4IPTPHJLS0jt+029m/xunxXWptaA7nBO2nyd7YK9YEdSRUU/7Kq6uPkNaTVNYdBE+x
         NgVJur1/PoDxuddXb9MEfXuD4DdjoCuNtuNjtTwxWiMnYuxmRCq9laoMu06SrFWlzJJT
         oxtg==
X-Gm-Message-State: AFuF++nvQ/mLOnnJgSwLTMZXu4zVje/pDJI2GL4L8kGZQnY8GMRA3QS1
	4fCCno0H/BRbLJ4646l132WwSY8LzfW2qr/YKyqi0/OP31BZ0m9dj1Fx2tlDzX1Zp8agH0wjzBh
	ZAkprOSw=
X-Gm-Gg: AYBFou2xg2rGFc3AR7+B3luIkffatxzLvVd8EE4n5rd/z26ipff86JqxDjgRk49hfKr
	xVMhFL49Gc4fVb6PMlhNXl9pXhTmP/sHrlO9mth7oDXt4hTMPNH/xPlESy4Ly/Mc9Z1VueRZya2
	pF6guU+k5s2MQ7w+QN8wBu3fg+rMa9GXQSgUN9GhbBuSvRnxF/dlDiYlGAERZ77ZYeGIEs63Gvp
	5Hfh+xvQfhPn9c+rJCjwyj7gc/2QvJkc7yds4KuU+qwltlSCFRlBNVGQuk7zlCjGnhi2X8m/H9B
	Sh4h8ItV5yBEWF+J4+pjFFrzfyh/SaYyQC9G0flpKINHb5/SI3fNUhbTxp/mbeAg8AOyHy7lqWn
	UsAEnZwN8zjGSN5HRnylTGWj/ainZ8E7KCqhNnyUAlwoMOTCgRr3Of/hpt2njbIAzi6GibKvd2f
	QSoQ5S7UXahIF1qUaMLfy3DXxDC5Q6yHi2bf2N3HEETGbZGAREVNJWoxvkaQDstvDRbgFsd8XuO
	y1VHeWHtsX3w8YeahKx+tGP9Ou6O8d7+/4J76A=
X-Received: by 2002:a05:6000:2287:b0:485:8c17:975c with SMTP id ffacd0b85a97d-4858c179908mr27978280f8f.30.1788904647749;
        Tue, 08 Sep 2026 14:57:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 3/3] x86/pci: Update pci_conf_write_intercept() to use pci_sbdf_t
Date: Tue,  8 Sep 2026 22:57:21 +0100
Message-Id: <20260908215721.3346842-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788904648-39AC0034-FC394EDA/0/0
X-purgate-type: clean
X-purgate-size: 4452

... rather than splitting across two parameters.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/pci.h  |  5 ++---
 xen/arch/x86/pci.c              |  6 ++----
 xen/arch/x86/pv/emul-priv-op.c  | 10 +++++-----
 xen/arch/x86/pv/ro-page-fault.c |  3 +--
 4 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index 0b98081aeaa4..8d8e66928d7f 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -36,9 +36,8 @@ struct arch_pci_dev {
     struct page_list_head pgtables_list;
 };
 
-int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
-                             unsigned int reg, unsigned int size,
-                             uint32_t *data);
+int pci_conf_write_intercept(
+    pci_sbdf_t sbdf, unsigned int reg, unsigned int size, uint32_t *data);
 int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
                                  unsigned int size, uint32_t *data);
 bool pci_mmcfg_decode(unsigned long mfn, unsigned int *seg,
diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 4c279875517b..0731f7e762b8 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -72,11 +72,9 @@ void pci_conf_write(uint32_t cf8, uint8_t offset, uint8_t bytes, uint32_t data)
     spin_unlock_irqrestore(&pci_config_lock, flags);
 }
 
-int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
-                             unsigned int reg, unsigned int size,
-                             uint32_t *data)
+int pci_conf_write_intercept(
+    pci_sbdf_t sbdf, unsigned int reg, unsigned int size, uint32_t *data)
 {
-    pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
     struct pci_dev *pdev;
     int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, sbdf.sbdf,
                                        reg, reg + size - 1, true);
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index dc21515e447b..fd9b533e57c7 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -228,7 +228,7 @@ static bool admin_io_okay(unsigned int port, unsigned int bytes,
 static bool pci_cfg_ok(struct domain *currd, unsigned int start,
                        unsigned int size, uint32_t *write)
 {
-    uint32_t machine_bdf;
+    pci_sbdf_t sbdf = {}; /* Seg always 0 for IO port CFG accesses. */
 
     if ( !is_hardware_domain(currd) )
         return false;
@@ -236,12 +236,12 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     if ( !CF8_ENABLED(currd->arch.pci_cf8) )
         return true;
 
-    machine_bdf = CF8_BDF(currd->arch.pci_cf8);
+    sbdf.bdf = CF8_BDF(currd->arch.pci_cf8);
     if ( write )
     {
         const unsigned long *ro_map = pci_get_ro_map(0);
 
-        if ( ro_map && test_bit(machine_bdf, ro_map) )
+        if ( ro_map && test_bit(sbdf.bdf, ro_map) )
             return false;
     }
     start |= CF8_ADDR_LO(currd->arch.pci_cf8);
@@ -259,9 +259,9 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     }
 
     return !write ?
-           xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
+           xsm_pci_config_permission(XSM_HOOK, currd, sbdf.sbdf,
                                      start, start + size - 1, false) == 0 :
-           pci_conf_write_intercept(0, machine_bdf, start, size, write) >= 0;
+           pci_conf_write_intercept(sbdf, start, size, write) >= 0;
 }
 
 static uint32_t guest_io_read(unsigned int port, unsigned int bytes,
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index c10541709e8b..34349e9437eb 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -329,8 +329,7 @@ static int cf_check mmcfg_intercept_write(
     }
 
     offset &= 0xfff;
-    if ( pci_conf_write_intercept(mmio_ctxt->sbdf.seg, mmio_ctxt->sbdf.bdf,
-                                  offset, bytes, p_data) >= 0 )
+    if ( pci_conf_write_intercept(mmio_ctxt->sbdf, offset, bytes, p_data) >= 0 )
         pci_mmcfg_write(mmio_ctxt->sbdf, offset, bytes, *(uint32_t *)p_data);
 
     return X86EMUL_OKAY;
-- 
2.39.5


