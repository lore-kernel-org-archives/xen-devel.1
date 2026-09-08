Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E27AC79FA1
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 21:57:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412431.1642909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43oq-0003vV-3Y; Tue, 08 Sep 2026 21:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412431.1642909; Tue, 08 Sep 2026 21:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x43op-0003vN-VY; Tue, 08 Sep 2026 21:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1412431;
 Tue, 08 Sep 2026 21:57:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x43on-0003mr-Kz
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 21:57:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x43om-00Ebur-9q
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 23:57:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa08476-e002-0a2a0a5209dd-0a2a4502d8d0-46
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:28 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa084c7-6ca4-0a2a45020019-d155dd33d96f-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:57:28 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-485850cf499so3423721f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:57:28 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883927a3sm30151604f8f.11.2026.09.08.14.57.26
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
        bh=mx0mbQyAO+ZqGpRbcIGGYFMcnA7LXXlkWe7jpOQ9f0A=;
        b=gpsNh0Ucct2iiMFHjLtfQLQ3uVd9eO9XQuXfjoa1ELh7w7TiT90rtU3r4Zsa20ys5Q
         y0X9rEjzgkonET3buSz6YsLbVXZ/8x6Z7XArPTTUIMYas+rpBg6zeRHknRUuNeW2meZq
         CXhMoSoaIJzkaZuYKjY+A3RlNCMjoKv1ZV1wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788904647; x=1789509447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mx0mbQyAO+ZqGpRbcIGGYFMcnA7LXXlkWe7jpOQ9f0A=;
        b=pAZmlBWOT7P+xlcLiy+Y/4EfkQ3wkJfJGpc1zysLVL9fJSbsRJTKbH8Pne0surOuhk
         E0dz2Pq2IMs4FMRuVcqerPW9skcadmovmBDQpPk0uIikX72X6BiqUROIfVBRjznYIBZZ
         chkr4Ox7X6k3PXuznwZKUWM16O8khO9dlLYsCSMqmewXWiILbrn6gtv+ORRoQ+29IFDV
         qpDS+MJ5V7xXj79YoUBzFR6cxozZHuzuT1l7mBiWaRCETOkqvrGnivs3QiYkUlOB+59/
         aEcrchw9Nd/gmsDzJRW6K0VYS7Xpoq54X9dQKWM3/ZGOm8WBkisMAJ8lNqcBuVOI5zZa
         FrJA==
X-Gm-Message-State: AFuF++kXyQyaNWpBotq5Oel7EQqASw3EgKZe6jWIAdQhk8i5bRJiTfJX
	+oQlGvtkV60kL4pyfKhk3YFuWOWjk/ohBBfXHCT4dy7I33V+T/uzjC/MUWj5PgoGZYFYEQBfQbu
	fJYQZ
X-Gm-Gg: AYBFou1jg+sI2yeAK7OD4Kz96VORHkrprB9mERhlZGIB9jjCQPEY9Ws+2dQnEMeq2be
	MdMkqD+6vhg/tWPS6ZQLrbR2qz91qfm9y3A4tGiuNI0Kv7t2x6ww4xYLxRLIdnHGJ2nfFw757H4
	tRwdZ5TMkDofwhiZbgb/x2vy0SXveryHgX5kf+KycHM/FP6rvYY9lm2R+MrwhqDG4lqVl15o8tB
	MuZqlTHNYp+qiPPRDH5IYQftsIxrtIlDz+jBPLkoBvKtYXQFdTGo8zd5EqqO8xgVulgR90373Mu
	riDrz08m/hZiEznjksCUCi5mVWYQS3h4HBO00H8cDdpuhNYtW1YUw/oq1swwondq3FA1TxHl1XJ
	wJ6oqJypYft3DnK2PzaHfezzXdHBh4/FQW4Vtq26uMNIk++cJl6DJYogDv8bnflc8sPruFH2d/F
	+Y5fWtT4B2yd9Kpzxo7eAsYa1u8AYpTeJObvOdGh4+lTtKGmzGDb7gaziao18cnde7j6cWMn4cL
	yPfW/sRFtDrnCHmeiswYkpz11WtbIe6MAwUXFg=
X-Received: by 2002:a05:6000:4694:b0:47f:80d1:be0a with SMTP id ffacd0b85a97d-485872a0086mr28634604f8f.14.1788904647115;
        Tue, 08 Sep 2026 14:57:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/3] x86/pci: Convert pci_mmcfg_{read,write}() to use pci_sbdf_t
Date: Tue,  8 Sep 2026 22:57:20 +0100
Message-Id: <20260908215721.3346842-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788904648-F26B72AC-741A4236/0/0
X-purgate-type: clean
X-purgate-size: 6680

All callers now have an sbdf already.  Pass it down directly, rather than
splitting into three parameters.

In turn this shows that bus and devfn bounds checks were unreachable, making
them safe to drop.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/pv/ro-page-fault.c   |  4 +---
 xen/arch/x86/x86_64/mmconfig_64.c | 18 ++++++++----------
 xen/arch/x86/x86_64/pci.c         | 12 ++++++------
 xen/include/xen/pci.h             |  8 ++++----
 4 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index e70e09a6a6a1..c10541709e8b 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -331,9 +331,7 @@ static int cf_check mmcfg_intercept_write(
     offset &= 0xfff;
     if ( pci_conf_write_intercept(mmio_ctxt->sbdf.seg, mmio_ctxt->sbdf.bdf,
                                   offset, bytes, p_data) >= 0 )
-        pci_mmcfg_write(mmio_ctxt->sbdf.seg, mmio_ctxt->sbdf.bus,
-                        mmio_ctxt->sbdf.devfn, offset, bytes,
-                        *(uint32_t *)p_data);
+        pci_mmcfg_write(mmio_ctxt->sbdf, offset, bytes, *(uint32_t *)p_data);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/arch/x86/x86_64/mmconfig_64.c b/xen/arch/x86/x86_64/mmconfig_64.c
index 91b1a398e646..6477bf8b44bd 100644
--- a/xen/arch/x86/x86_64/mmconfig_64.c
+++ b/xen/arch/x86/x86_64/mmconfig_64.c
@@ -55,19 +55,18 @@ static char __iomem *pci_dev_base(unsigned int seg, unsigned int bus, unsigned i
      return addr + ((bus << 20) | (devfn << 12));
 }
 
-int pci_mmcfg_read(unsigned int seg, unsigned int bus,
-              unsigned int devfn, int reg, int len, u32 *value)
+int pci_mmcfg_read(
+    pci_sbdf_t sbdf, unsigned int reg, unsigned int len, uint32_t *value)
 {
     char __iomem *addr;
 
     /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
-    if (unlikely((bus > 255) || (devfn > 255) ||
-                 (reg + len > PCI_CFG_SPACE_EXP_SIZE))) {
+    if (unlikely(reg + len > PCI_CFG_SPACE_EXP_SIZE)) {
 err:        *value = -1;
         return -EINVAL;
     }
 
-    addr = pci_dev_base(seg, bus, devfn);
+    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
     if (!addr)
         goto err;
 
@@ -86,17 +85,16 @@ err:        *value = -1;
     return 0;
 }
 
-int pci_mmcfg_write(unsigned int seg, unsigned int bus,
-               unsigned int devfn, int reg, int len, u32 value)
+int pci_mmcfg_write(
+    pci_sbdf_t sbdf, unsigned int reg, unsigned int len, uint32_t value)
 {
     char __iomem *addr;
 
     /* Why do we have this when nobody checks it. How about a BUG()!? -AK */
-    if (unlikely((bus > 255) || (devfn > 255) ||
-                 (reg + len > PCI_CFG_SPACE_EXP_SIZE)))
+    if (unlikely(reg + len > PCI_CFG_SPACE_EXP_SIZE))
         return -EINVAL;
 
-    addr = pci_dev_base(seg, bus, devfn);
+    addr = pci_dev_base(sbdf.seg, sbdf.bus, sbdf.devfn);
     if (!addr)
         return -EINVAL;
 
diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
index 6298141c3ca7..970c010e12f6 100644
--- a/xen/arch/x86/x86_64/pci.c
+++ b/xen/arch/x86/x86_64/pci.c
@@ -17,7 +17,7 @@ uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
 
     if ( sbdf.seg || reg > 255 )
     {
-        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, &value);
+        pci_mmcfg_read(sbdf, reg, 1, &value);
         return value;
     }
 
@@ -30,7 +30,7 @@ uint16_t pci_conf_read16(pci_sbdf_t sbdf, unsigned int reg)
     {
         uint32_t value;
 
-        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, &value);
+        pci_mmcfg_read(sbdf, reg, 2, &value);
         return value;
     }
 
@@ -43,7 +43,7 @@ uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg)
     {
         uint32_t value;
 
-        pci_mmcfg_read(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, &value);
+        pci_mmcfg_read(sbdf, reg, 4, &value);
         return value;
     }
 
@@ -53,7 +53,7 @@ uint32_t pci_conf_read32(pci_sbdf_t sbdf, unsigned int reg)
 void pci_conf_write8(pci_sbdf_t sbdf, unsigned int reg, uint8_t data)
 {
     if ( sbdf.seg || reg > 255 )
-        pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 1, data);
+        pci_mmcfg_write(sbdf, reg, 1, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 3, 1, data);
 }
@@ -61,7 +61,7 @@ void pci_conf_write8(pci_sbdf_t sbdf, unsigned int reg, uint8_t data)
 void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data)
 {
     if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 2) )
-        pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 2, data);
+        pci_mmcfg_write(sbdf, reg, 2, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), reg & 2, 2, data);
 }
@@ -69,7 +69,7 @@ void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data)
 void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data)
 {
     if ( sbdf.seg || reg > 255 || !IS_ALIGNED(reg, 4) )
-        pci_mmcfg_write(sbdf.seg, sbdf.bus, sbdf.devfn, reg, 4, data);
+        pci_mmcfg_write(sbdf, reg, 4, data);
     else
         pci_conf_write(PCI_CONF_ADDRESS(sbdf, reg), 0, 4, data);
 }
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index ade882caeef4..b7a35371a71a 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -258,10 +258,10 @@ void pci_conf_write16(pci_sbdf_t sbdf, unsigned int reg, uint16_t data);
 void pci_conf_write32(pci_sbdf_t sbdf, unsigned int reg, uint32_t data);
 uint32_t pci_conf_read(uint32_t cf8, uint8_t offset, uint8_t bytes);
 void pci_conf_write(uint32_t cf8, uint8_t offset, uint8_t bytes, uint32_t data);
-int pci_mmcfg_read(unsigned int seg, unsigned int bus,
-                   unsigned int devfn, int reg, int len, u32 *value);
-int pci_mmcfg_write(unsigned int seg, unsigned int bus,
-                    unsigned int devfn, int reg, int len, u32 value);
+int pci_mmcfg_read(
+    pci_sbdf_t sbdf, unsigned int reg, unsigned int len, uint32_t *value);
+int pci_mmcfg_write(
+    pci_sbdf_t sbdf, unsigned int reg, unsigned int len, uint32_t value);
 unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
 unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
                                    const unsigned int caps[], unsigned int n,
-- 
2.39.5


