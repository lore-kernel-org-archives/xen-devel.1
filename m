Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B9C624D4
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 22:29:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406267.1639632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1tRr-0001UD-Mw; Wed, 02 Sep 2026 22:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406267.1639632; Wed, 02 Sep 2026 22:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1tRr-0001U6-Ji; Wed, 02 Sep 2026 22:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1406267;
 Wed, 02 Sep 2026 22:28:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1tRp-0001U0-UO
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 22:28:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1tRo-00AqoI-Kj
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 00:28:48 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a98a2bb-2eae-0a2a0a5409dd-0a2a4507ee08-46
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:28:48 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a98a320-b4ea-0a2a45070019-d155802aec65-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:28:48 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso16068615e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:28:48 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e7315bsm9334035f8f.7.2026.09.02.15.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 15:28:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788388128; x=1788992928; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0F6Rl0EOuBQYSoHJasSlb1LYIqAoUFOni1obqAu3rw=;
        b=g/TDcFV7gHF37+Exm8Yn6ZvetLkPw/ILfK3nLMsstlv8jYlydYjoWi690TNAEtVG6n
         eTu8rmf1Efoech066sTw59VFVifg7OKWqnrYmXkhAH1Y3JdAXaE6Rkt1XK5SQSKkCd9O
         TX0BxnlfHgmvHmLRcmXc4yFPf1pswHNSQ8X00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388128; x=1788992928;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0F6Rl0EOuBQYSoHJasSlb1LYIqAoUFOni1obqAu3rw=;
        b=pSlHZNGYM0UG+frtv6O8OmmRAGqhkRDP0gdTmIIC+PWf29140hR5S2zx/7tUk4Lji+
         CX8mQwtHl9fHdFa1omNBNKMVoeFS3bmv75rVMe6IGAayzVC6ChY+1/syVE6z/nYXPCp1
         x2h/LQbOPYwYZHno8sDQSBJ4jzvrTm/dPm/w4+M77B2whpYMlnQMNS3LCbf8+4w2XNAP
         YHhrOB1ruz8J5Yvy4hTCurGIX/KUvGNVTRwhA58XneR1FxOT7AjSEU0Bhc61kYnL+Km1
         JKYxH8toDguWzIYtXdhnUiSGl/eMG/a/nKSRUxWArkOs8TezZFsyug22EJEgJK+TUckr
         ZV3w==
X-Gm-Message-State: AFuF++kfYMicrB7v87VaxjtoktoKe2KlAs1WN+Ct54QuPz6E1c2DUZrc
	/Sgd72NHoAYUPq5qop4bQkEPAw+++1icLtSej1zOKvnpB2bwoQiQj4gBcvnMzQb8eCcHpuiX6go
	5TjkEla4=
X-Gm-Gg: AYBFou0GXSrunhO/B/GI2EkFFDUHXDxCuVkllEFmAj1DRpXkPWQnOf0yf31bsmXixJM
	Rj/Ibgdof3flxScsRjv4iY+pO35euXt1yi8VAviWDEA6k03Mn4iXKEfD11k21pXFhqi5uuer15y
	sl3SbRKLNh79MVNVH9t0G8gr4i/Q02Mq3qxoX8b4wxRojAFR3/JNOWkNW2omhtQDwYYjkmO0zet
	r68wqX8xz+AWFEjVbngcNixIg9+jWJirbMjNW43w8/AED4ikUQXq3hajZ69tqMHSGO6NMRxgPex
	LU6tWiU0LYS2wFztXAElsp31DsMdvlbyVa+k76gY4gfWDjPc6IHY3HV72dAeXC4aOOdQqnyDDRy
	2c82k3KzDC0+dZBBeSe1zFsI5AVXXEAarhyQva96tHEDbSQxAzRGifpCaDsLbn/6mCn3USLQ13a
	/qaKy4UyHdj3wLe4k+re/F8eauzf4eGEhuKXSjXG2R0zebaIKdohpcWkJsrQ/flv8OVhhXKK2k9
	GFkBJg8kkD2jdcSxeAHvDB5h6yAFdKTRUB7Qxc=
X-Received: by 2002:a05:600c:c490:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49ce581f1ccmr116425215e9.13.1788388127890;
        Wed, 02 Sep 2026 15:28:47 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/pci: Perform XSM checks on the correct device in pci_conf_write_intercept()
Date: Wed,  2 Sep 2026 23:28:46 +0100
Message-Id: <20260902222846.2977800-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788388128-A76D2AE4-251DB5BF/0/0
X-purgate-type: clean
X-purgate-size: 1966

The requested PCI segment needs including in the call to
xsm_pci_config_permission().  Otherwise in a multi-segment system we can check
the perimssions on one device but operate on a different one.

This is only not a vulnerability because pci_conf_write_intercept() is only
reachable by the hardware domain.

Fixes: 300bb048ca31 ("x86/PCI: make all config space writes subject to XSM checking")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

This was going to be an XSA before realising that the scope was limited to the
hardware domain.
---
 xen/arch/x86/pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pci.c b/xen/arch/x86/pci.c
index 1aefeab66301..4c279875517b 100644
--- a/xen/arch/x86/pci.c
+++ b/xen/arch/x86/pci.c
@@ -76,8 +76,9 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                              unsigned int reg, unsigned int size,
                              uint32_t *data)
 {
+    pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
     struct pci_dev *pdev;
-    int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, bdf,
+    int rc = xsm_pci_config_permission(XSM_HOOK, current->domain, sbdf.sbdf,
                                        reg, reg + size - 1, true);
 
     if ( rc < 0 )
@@ -93,7 +94,7 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
 
     pcidevs_lock();
 
-    pdev = pci_get_pdev(NULL, PCI_SBDF(seg, bdf));
+    pdev = pci_get_pdev(NULL, sbdf);
     if ( pdev )
         rc = pci_msi_conf_write_intercept(pdev, reg, size, data);
 

base-commit: d5d126a225e78071fbb5db126744bc2a36d511df
-- 
2.39.5


