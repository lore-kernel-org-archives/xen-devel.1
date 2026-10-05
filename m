Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8724DCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:38:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440871.1658385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDitJ-0005Br-3g; Mon, 05 Oct 2026 13:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440871.1658385; Mon, 05 Oct 2026 13:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDitJ-0005Bk-19; Mon, 05 Oct 2026 13:38:05 +0000
Received: by outflank-mailman (input) for mailman id 1440871;
 Mon, 05 Oct 2026 13:38:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xDitH-0005Bb-EG
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:38:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDitG-0092P8-Ob
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:38:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac3a82d-bab6-0a2a0a5309dd-0a2a450684a4-20
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:38:01 +0200
Received: from [74.125.228.37] (helo=mail-pz2-f37.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac3a694-195a-0a2a45060019-4a7de425b1a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:31:01 +0200
Received: by mail-pz2-f37.google.com with SMTP id
 d2e1a72fcca58-8873070bcd0so590803b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 06:31:00 -0700 (PDT)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:5364:bba9:2adf:d611])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-88b0b8f21e2sm3535988b3a.12.2026.10.05.06.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 06:30:58 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i="@isslab-korea-ac-kr.20251104.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791207059; x=1791811859; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLBHWc5heFG+SpSm8h2sc4e0OVYT+vhm1QY+Gsi3sRw=;
        b=DoPTTwJMejKSOG5xMH7snikaE3OyHHke365U6WkUsU2EyPTyDUl3A3vHSrxqw7cXT7
         Kh43D5w8NSRuAbwPDaUZJIbCL3aXs52FB0CZs5E1KFIlipvjsMVSC0bbUgkglqd0aSWE
         6L4OZKnp2L8KIpnJRx69+xtvLmnZNgcWrayMf3ShUHByNanF7Vlxh60NBwB1Lq4I0PU9
         LgZxJk3uD//IQ9PppFrGFqzLIVIQRyojJoYqaOAWYjnHEtHauA/o6Ho7Vgrf+BKZajdZ
         mwY2bUdnrRJi/zimEL3Cj40BAVfoJwNc/PKxjTek6AAcXRmhdiOCkHPuvve5ubXrrZA3
         wTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791207059; x=1791811859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLBHWc5heFG+SpSm8h2sc4e0OVYT+vhm1QY+Gsi3sRw=;
        b=imp9q9lVEoelphdPpzjGfrkN9TElHFhSMSgtG5lUFa5UMFVtXYpLlAwBEfQyag7nsP
         xrRGpdk9s8C5+RMOzGvIuxJ26jpOLz6+jWsIs9rQraPNCurCgAdNXjlcmpRoXH/iSugH
         pVKT+5qKEEC0hL4vAGRlvEFItvv80e8jG5mZ/rZQLz5q1BmKHFYt/1+rNVdJTj865eSy
         DkNiTFKgLl6V+b+GHetq7dVN6zybxeDCpXxw+E7udzD1+q7U2YXnvJhV7S1XMxk0ajwu
         jScZQ6hWBA/F6hSHeCQNlscBx8XSGYlyTUM7+Znv7SDLz7WTzzlP+BTRF7wiYWQbGvLp
         lIng==
X-Forwarded-Encrypted: i=1; AKwUvBwYcmh7RXVv23l+IE37MglofmfRuagvYvEm3rPzEO4YBq528mJSi2p851CrMoRRci08P4cPFA2CPvo=@lists.xenproject.org
X-Gm-Message-State: AFuF++l4Mvf9td7ydnDLr3Swj0Wugn65DIBhwrC5lGYRA9buShV7esVG
	eRH8GSCGr8Vzs+0pUWHDQoy5FXTU0SK8yNO4WLz6NsDwje4n2Hb67mM+rThf7qznuKg=
X-Gm-Gg: AYBFou35KGimlc+kPaAOPdGdyUtXLg8RmuqdbPotIinVlNY46uvD9EabUICOcAvHfWa
	LtfNU6RiVkcJi/wcYF73o+h6iIrgCtbAuNNmtbEeLbVX2rPC1SJRziuZdcgm/1hDo1M2XNYvey4
	CXR24AOdgwSMfhGhhTEYFqApOfDz8fpyj3RQQwfBkft98hNFIVcffHIkfWRij9jMrKQQoNl8K4f
	H2OrkTpGJ+jMlFRuUO1FaPLt5Ef6bcxr7tgq4+lDLZGlj5Y6OXeh0PX4tJaGlyB3Kv7jxbtppL+
	AQdwlJXZwUYQx20qQFjwL+PEWKaUIdXZL6CLVUH9gUtGCDg8R3XSgXsjsuCwllVFWx8tsui2km0
	1uzlcKGgLti6aob9OIcnfd0PyGMv0ixlTohcLNe0ptzVsp4IqKPSbvpCLFMmnzduEfbm2ol2Zvu
	8e8u42lXEhoe+vZ6voy/JvzwQ3g6SeFjuqo9EZzeMHSqpQyBkxlGpu5dzT+7nzcT8UyPOQP3oKN
	O3EOXdHbOuLzukg6qXsYA==
X-Received: by 2002:a05:6a00:1595:b0:88d:20ff:15c0 with SMTP id d2e1a72fcca58-88d20ff2cacmr5378745b3a.11.1791207059207;
        Mon, 05 Oct 2026 06:30:59 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	bhelgaas@google.com,
	jbeulich@suse.com,
	konrad.wilk@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	Jan Beulich <JBeulich@novell.com>
Subject: [PATCH] xen/pcifront: check that an AER callback exists before calling it
Date: Mon,  5 Oct 2026 22:30:18 +0900
Message-ID: <20261005133019.284053-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791207061-F440377B-7E978946/13/0
X-purgate-type: clean
X-purgate-size: 2413

pcifront_common_process() handles an AER request from the backend by
dispatching on aer_op.cmd to the bound driver's PCI error handler.  It
only checks that err_handler and err_handler->error_detected are present,
then for the mmio_enabled, slot_reset and resume commands it calls the
corresponding callback unconditionally.  Those three callbacks are
optional -- the PCI core NULL-checks each of them individually before
use -- and many drivers (for example igb, igc, ice and ixgbevf) install
error_detected without all of them.

aer_op.cmd comes from the shared ring, so a malicious or buggy backend
can send XEN_PCI_OP_aer_mmio (or _slotreset/_resume) for a device whose
driver leaves that callback NULL and make the frontend call through a
NULL pointer, crashing the guest.

Check each callback before calling it, as the PCI core already does, and
fall through to PCI_ERS_RESULT_NONE when it is absent.

Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
There is an in-flight fix for a refcount leak in this same function
("xen/pcifront: Fix PCI device reference leak in AER handling"); this
change is orthogonal and applies in either order.

 drivers/pci/xen-pcifront.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index cffc32d660327..490913676f244 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -599,12 +599,17 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 		case XEN_PCI_OP_aer_detected:
 			return pdrv->err_handler->error_detected(pcidev, state);
 		case XEN_PCI_OP_aer_mmio:
-			return pdrv->err_handler->mmio_enabled(pcidev);
+			if (pdrv->err_handler->mmio_enabled)
+				return pdrv->err_handler->mmio_enabled(pcidev);
+			break;
 		case XEN_PCI_OP_aer_slotreset:
-			return pdrv->err_handler->slot_reset(pcidev);
+			if (pdrv->err_handler->slot_reset)
+				return pdrv->err_handler->slot_reset(pcidev);
+			break;
 		case XEN_PCI_OP_aer_resume:
-			pdrv->err_handler->resume(pcidev);
-			return PCI_ERS_RESULT_NONE;
+			if (pdrv->err_handler->resume)
+				pdrv->err_handler->resume(pcidev);
+			break;
 		default:
 			dev_err(&pdev->xdev->dev,
 				"bad request in aer recovery operation!\n");
-- 
2.43.0


