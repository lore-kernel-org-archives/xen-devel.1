Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B384CCA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 02:38:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441211.1658769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDv3i-0005ls-1T; Tue, 06 Oct 2026 02:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441211.1658769; Tue, 06 Oct 2026 02:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDv3h-0005lh-SO; Tue, 06 Oct 2026 02:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1441211;
 Tue, 06 Oct 2026 02:37:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xDv3f-0005lY-Hg
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 02:37:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDv3d-00ATbR-Gq
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 04:37:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac45eec-2eae-0a2a0a5409dd-0a2a4502a4d8-0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 04:37:32 +0200
Received: from [74.125.227.171] (helo=mail-pj2-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac45e72-6ca4-0a2a45020019-4a7de3ab8054-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 04:35:32 +0200
Received: by mail-pj2-f43.google.com with SMTP id
 98e67ed59e1d1-3a4c8262465so1896449a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 19:35:31 -0700 (PDT)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:5364:bba9:2adf:d611])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e5a5ef5b60sm15092255ad.73.2026.10.05.19.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 19:35:29 -0700 (PDT)
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
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791254130; x=1791858930; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FP6Cnv3Px2FrRBwEywG/gOFyPcxASJp/FvTXDyrwt5A=;
        b=w0kOzD0zHhfipQlw+VYUE310KQIVnZ9o90JvjMR1DNO19cclH0+Lj8S+4ETRYiHUqi
         r9l/rnjhrIwPfHBuJDfKqLyoYr0ugyKdYVXo3taKFPxkcrMk48dYXnqdgcTCeBhCBLDq
         kQdQMRGxi1/wtJahuRWRlkvV7uFwvJBNDyHPnyfIf/2SGBVvvNdR57AFur7VBeamvaUY
         BEHT6vYyvvIxp1eAQ8LSnrm7HBMO2vbT81Wi1gFHZ+satSJ41k8ehyinsbIiEuQJ+tfV
         dsvdrBcpk/PtNmQStMW5zbkHNjxfnMLiR487Q5byDOORa2iJFE6xNBbHcCOotDvW8fOR
         Jadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791254130; x=1791858930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FP6Cnv3Px2FrRBwEywG/gOFyPcxASJp/FvTXDyrwt5A=;
        b=Oi9D0KQ0RVTrWgSEo/ZKk4cFKBnmH215lT1GsrnT2wdzD2ID/5D1M///IsZzaUL3t7
         cQCTPwYPzJDYQXmxawFDnU39oz1kWV/WekO+wGvDZj/vWZNhCRCwcofnQ9XWjmBVpj9U
         sRO7ESlWcDy0kxcr3hMUQx/Z6wDIgS4FkjMkFyG7Pyakm1qKQOp1+AkPfgrYYKjj9bTH
         dLJazNEc2FuUs3TKXyNQgl8T9jZA8I6cXR9J7ucx7HvhVAWy+uS0JybMPYwwH4qTY1Zd
         1y5t+d+qK0LFo2cPtnVqNEKarsKsutLIrASg/mVquc2mtRzPf+93LX9/jVkEhkn2g4mF
         dhfg==
X-Forwarded-Encrypted: i=1; AKwUvBykssyqkWWhd9BtghHek9BcoU9PgWfOu77tpxDxoFTa/XIlDUsKA3VbX5h2XmvjgofRAkWWmppZV2s=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLwahBnOR/W8hgQgTKoaxdwAvkXmfe3kH2EF84iSa5PKBotr5H2
	6nh1G661ULDRlrpiurayXB+i3dSrg+i8uimCvNyLMfHdeBqyd8vfYViIRFGAPMyA0ic=
X-Gm-Gg: AYBFou0JDrw0ET74Qo4O1Yd4Qr6qbaREaBZWZskx9jXb7JkX0vO8LRAwyjPlBt/mYGo
	ZDsBS1ixKavQhoQX6gxi4zNyucK79ZdFSO3S157I6mpX0k86kB1HoWNieptKQ48vsDNPIGcllhq
	Khiy3OlpwMnz7ihIvghttLDzbYXE7KSCt+4cvSLTzFoSclQTa0c9FZK5/WSGN5vgz3h+yfdJHZH
	ll7nt6kWiKU6b87r8lrAwycmkZ2kZktyjw/joMxph8CYrIbUhLpWVkpVopcrNJtYOoqwELioXwc
	AH8hS3BLBIAxKoVVml1WzHcvBqfsmw6rUKLF4CtM/mIjG3Ekf/uack5QcZq/J8yQbrKv98vPRtm
	mcuGTAuH/Gro37hTNmMILjB12WfaJULjlu+2QMqLz17d2XS74l/zYy1+F5ka/gqPo1arBQl9Eur
	lNhrEsrsxQmiZWBnTdo14oo5fnhEmGp1OY38RkLKNCfeqqPCJIKBOI+rs37UxO2kgw5/31azBAh
	uI/3z2ZS049lyyZoCvbYohxNz/1BPgh
X-Received: by 2002:a17:90b:4fc8:b0:3a7:f7e7:df09 with SMTP id 98e67ed59e1d1-3a7f7e7e431mr4874845a91.55.1791254129975;
        Mon, 05 Oct 2026 19:35:29 -0700 (PDT)
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
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v2] xen/pcifront: check that an AER callback exists before calling it
Date: Tue,  6 Oct 2026 11:34:43 +0900
Message-ID: <20261006023443.338194-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1791254132-67EBB2AC-16CEBD4E/13/0
X-purgate-type: clean
X-purgate-size: 2925

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

Check each callback before calling it.  When mmio_enabled or slot_reset is
absent, return PCI_ERS_RESULT_RECOVERED so recovery proceeds, as the PCI
core does for a missing callback; returning PCI_ERS_RESULT_NONE would
instead make xen-pciback tear the guest domain down.

Fixes: 956a9202cd12 ("xen-pcifront: Xen PCI frontend driver.")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: return PCI_ERS_RESULT_RECOVERED for an absent mmio_enabled/slot_reset
    instead of PCI_ERS_RESULT_NONE, which xen-pciback treats as fatal and
    uses to tear the domain down.  (Bjorn acked v1; the ack is dropped here
    because v2 changes the value returned for an absent callback.)
v1: https://lore.kernel.org/all/20261005133019.284053-1-yhlee@isslab.korea.ac.kr/

There is an in-flight fix for a refcount leak in this same function
("xen/pcifront: Fix PCI device reference leak in AER handling"); this
change is orthogonal and applies in either order.

 drivers/pci/xen-pcifront.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index cffc32d660327..5c6f7796d204a 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -599,11 +599,16 @@ static pci_ers_result_t pcifront_common_process(int cmd,
 		case XEN_PCI_OP_aer_detected:
 			return pdrv->err_handler->error_detected(pcidev, state);
 		case XEN_PCI_OP_aer_mmio:
-			return pdrv->err_handler->mmio_enabled(pcidev);
+			if (pdrv->err_handler->mmio_enabled)
+				return pdrv->err_handler->mmio_enabled(pcidev);
+			return PCI_ERS_RESULT_RECOVERED;
 		case XEN_PCI_OP_aer_slotreset:
-			return pdrv->err_handler->slot_reset(pcidev);
+			if (pdrv->err_handler->slot_reset)
+				return pdrv->err_handler->slot_reset(pcidev);
+			return PCI_ERS_RESULT_RECOVERED;
 		case XEN_PCI_OP_aer_resume:
-			pdrv->err_handler->resume(pcidev);
+			if (pdrv->err_handler->resume)
+				pdrv->err_handler->resume(pcidev);
 			return PCI_ERS_RESULT_NONE;
 		default:
 			dev_err(&pdev->xdev->dev,
-- 
2.43.0


