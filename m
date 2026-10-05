Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52220CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 12:55:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440801.1658277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiDp-00023U-FD; Mon, 05 Oct 2026 12:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440801.1658277; Mon, 05 Oct 2026 12:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiDp-00023N-Cd; Mon, 05 Oct 2026 12:55:13 +0000
Received: by outflank-mailman (input) for mailman id 1440801;
 Mon, 05 Oct 2026 12:55:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xDiDn-00023E-RW
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:55:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDiDl-007NZE-S0
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:55:09 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac39e19-8faa-0a2a0a5109dd-0a2a450ac042-40
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 14:55:08 +0200
Received: from [74.125.227.169] (helo=mail-pj2-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac399b6-f2d2-0a2a450a0019-4a7de3a98f00-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 14:36:07 +0200
Received: by mail-pj2-f41.google.com with SMTP id
 d9443c01a7336-2e4ba8555fdso5333875ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 05:36:07 -0700 (PDT)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:5364:bba9:2adf:d611])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e5a5caea48sm6542495ad.14.2026.10.05.05.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 05:36:04 -0700 (PDT)
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
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791203765; x=1791808565; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4jU8vbkoMdpm/iDka5HS8l6OLmahdMWqgTkrbnwvknU=;
        b=bEUPx5wMGg0RBJMJTEEUQsbTOTMHz6eyoti8mRXatBFu8OqHK59r5hORbSHdN6cNGq
         9AI+mah4WMHxinLr0F8VtekM+gPQG98wGo+RPRAbwvaTv0r8GD3trrH/CnXHuOwqL0pl
         +v238Yk/+6hUqTiFLr4jotmiFh28KyCej2KXzuQDCn2cD3/PmTdi0WJNkU62jzucm6Ij
         DFNya7xz7k6TZAI5AMulN3H0Gli9YjbrL/M/9tX0ayRGmTVrHT3wXfQ6iBAlbEdexNMU
         8bbPX6gK6RjBgHZRq26gY4cVj+M8S61IsY05+AiwGJfSOk9/OyPsuFbnQYq0gflEdbm+
         jBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203765; x=1791808565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jU8vbkoMdpm/iDka5HS8l6OLmahdMWqgTkrbnwvknU=;
        b=p6Lnoyh8SV1UNhWfuKRZEbQ0AL9VM560TQdXa4hjgO3+ummRd3JTABkOBzVdvyB/PF
         afxA9uU8jMMsGkxF9cexu06p3kTJj1xTIBwgnVx4Dcr5r1mtHGkj2lSKtF1G25HC1iq7
         EKJ+BjHPtzCrPVJ9uxFezwsUx5QzUpoMxR4/Wgr9I3iMtIdgT1S1W8yAROaZBQvoUiwe
         D/zPyU/JzFGE4B6YFkpHt9+MGnIgMbQm/GTrHr0svvTt4J/irUEQnnWoS9uca/sBCNL9
         ymCNoJQ0GO6fhp6ghYHtssUd2WRgmMnOHau3javz/j3FZ7IM35yOXSvlljWW8LxW3MGx
         AH4g==
X-Forwarded-Encrypted: i=1; AKwUvByo24+rJUoDglTS8n/yNFx2kDl4dxj6bsclqO/iEGH3Rk8di+YCR13sAH0ftyX8UDbuyaGUmBmnbug=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJcH9zVKhkwXCNBbFW2YKO3vnsQtGzwjRVzSbQZMR01dIYSc8DQ
	yqXyFiTg4gxVe/1C6Z4sIkLzeo7Hd8OPRUnJWaE80xQvi2gZVl2cka0uDa+D7IsRVSs=
X-Gm-Gg: AYBFou1m5S3akD/FnhfjJXYZRl2fS/k3wYmfWEWS+xp49aj6hCI94PAobWsjaST8EHv
	XqY87tIBluA/Km/a16ThQx4KHs1Wf3VHeuPOaRPM2SqJj0/vCXSkYl9DGOoDOPqWHRCq44yuNpO
	w01ZS6/e8/BMujjfx+x6pKCqSwbQoEIJsEb1LOGhlmZI1/ZE8RJOtrA5ljuJjS+bUFskUXBxDtY
	VXxOh7Oo8lOodcG9HE/WsbnL/n2IKGctB3vYsjj/S2ValrD1gRSmcK6+NiguQSQwKmT7yfdJYjZ
	JiSGQqCBDdGsv/z0CEV+by7ULY0NS6KsfShEUMEGCoLH+k91rnlSKgFNHSWZrNFKxm/tvUJHCcC
	gotrD5Tl8AxAvKxTtjWq6VsbmQOij3DJRz7SNfFsXEsqY4ICELzw8UPxaUJYROAYZSqDTlUrEu5
	x7/HZJxUNMGHIOgJpxdxiThYQf9fYI2xdWVh01CQ7plPhxthv8E9DmgqR3ETNVq9xoRZrUejIt1
	YeTq9muluxgn5N/PcI5MA==
X-Received: by 2002:a17:903:186:b0:2dd:c053:c209 with SMTP id d9443c01a7336-2e49b6df076mr106567665ad.37.1791203765331;
        Mon, 05 Oct 2026 05:36:05 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] xen/scsifront: check for a NULL shadow entry on a backend response
Date: Mon,  5 Oct 2026 21:35:54 +0900
Message-ID: <20261005123555.253995-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1791203767-53CD3CFC-FEF97E3F/10/78177266408
X-purgate-type: clean
X-purgate-size: 1724

scsifront_do_response() validates the rqid in a backend response against
VSCSIIF_MAX_REQS before using it to index info->shadow[], but then
dereferences the entry to test ->inflight without checking that the slot
is populated.  Shadow slots are NULL before a command is submitted (the
host private area is zeroed at allocation) and are reset to NULL in
_scsifront_put_rqid() once a request completes, so an in-range rqid that
does not correspond to an outstanding request makes the frontend
dereference a NULL pointer.

A malicious or buggy backend can thus crash the guest by returning a
response whose rqid is in range but not in flight -- for example a
spurious response before any command has been issued, or a duplicate of
one already completed.  The ring has only VSCSIIF_MAX_REQS (16) slots, so
before the first command every in-range rqid selects a NULL slot.

Reject a response whose shadow slot is not populated.

Fixes: 6d1c2f48f3fc ("xen/scsifront: harden driver against malicious backend")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/xen-scsifront.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 989bcaee42caf..aa44a233eac8d 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -367,6 +367,7 @@ static void scsifront_do_response(struct vscsifrnt_info *info,
 	struct vscsifrnt_shadow *shadow;
 
 	if (ring_rsp->rqid >= VSCSIIF_MAX_REQS ||
+	    !info->shadow[ring_rsp->rqid] ||
 	    !info->shadow[ring_rsp->rqid]->inflight) {
 		scsifront_set_error(info, "illegal rqid returned by backend!");
 		return;
-- 
2.43.0


