Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0FDCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 05:17:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440564.1657977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDb4M-0002bB-6O; Mon, 05 Oct 2026 05:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440564.1657977; Mon, 05 Oct 2026 05:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDb4M-0002ar-1Q; Mon, 05 Oct 2026 05:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1440564;
 Mon, 05 Oct 2026 02:15:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDYEu-0001vP-2h
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 02:15:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDYEs-007D9q-Qp
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 04:15:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac30849-e002-0a2a0a5209dd-0a2a450ba642-0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 04:15:37 +0200
Received: from [74.125.227.140] (helo=mail-pj2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ac30793-b7e8-0a2a450b0019-4a7de38cca69-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 04:12:37 +0200
Received: by mail-pj2-f12.google.com with SMTP id
 98e67ed59e1d1-398beb616f5so443174a91.1
 for <xen-devel@lists.xenproject.org>; Sun, 04 Oct 2026 19:12:36 -0700 (PDT)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:7020:baaa:df0e:eada])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a78e61386csm9241660a91.17.2026.10.04.19.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 19:12:34 -0700 (PDT)
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
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791166355; x=1791771155; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8BtH1wOi3R0dL1LEJcbfIDWWZE0ydiC1A3fSU2odtA=;
        b=pKUoOnUsO9YtHu7NdYNrRck9SIdOSJWPeN7WzH48x9njEf6/Qpczhel7v67NjAYv5+
         YsiY73BWWOk5w9/iUwjFSe6EQokqXC/Bwti/IgY2pPXHwNiPmQZhLJLoqI+eitoDCOpZ
         NGYwo1Mgg757XB6ih4u/FMoTOAAY9gYBX5viYh1QwT6e/8oe0CoOAmOy44Soc3Lm6dNQ
         j9V7ZZHxHZvcsrmEL4AWFKZTlO47oUtkX9mcmZy+EREcMl6t//TXYLxW1AUhvUb2o+5L
         rKQlyXVm397RJrU0e6Ha5rPhF/e5v7EGYyfuF4JUkd5gxqqJj+INdScRdj3BnVVdoUGT
         oH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791166355; x=1791771155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8BtH1wOi3R0dL1LEJcbfIDWWZE0ydiC1A3fSU2odtA=;
        b=sX15l8UbvJ5eFObakA/EkscYl4PsG/eDiluXr758D/oBe/pmss1Yli+t0BDbaQK4gG
         keweqnsVBAIFmTmM+bqqbhaUrCaDpz9AadtovhixIE/NRXjOmnuDtJ4zM/tkbV9nZKEB
         uLjtjpYpa7BzEeNDgIXt+M0lre3UPF/PtVcsLpAgBnu7uuLmgAjC2kQtGIUOAsR+3KYN
         bhMtXj0+Hp4rSosF2Rsev/KQ9SdjvoehSlp2WL6y3y63ocnDNOjlPdpB3Lw3RcFT4iVF
         lXL23LJ/tDI2hzMWUlalk7PCi8YLiK1XSyhOvm6sq/lrBfzW29wZ48b8AgUerVIBNbML
         v2fA==
X-Gm-Message-State: AFq9FYIohrlLLga4+ESOy76CnldpjwnJ5zNCIG1Om06BuYEbQGf2LUl+
	N0R07z3+BIIy3Vq6n+0gFIMQmaHGGrQU3baTPrT70pxOOlAXlFrQd+SzHyCcHBxZ6W4=
X-Gm-Gg: AYBFou3j6LoCEmDRgWrt53277uJWsOAcreoJKed5Nwmobn1Bvv6HG1EHisFPdWkE9Lb
	zBVz4dxPn/NIVp27qJYV93sWeytWpuNIqLJ/R4/ur2td3YpuH71DFEVe3n/ZHWL+3fOCLJAhJHX
	aCNsybc8sXmOHogmBI9PqqjSp4LEOabKrGs9vSAr7ovrabD3LCktFG63ZerWPCEofaqiDvyLSfJ
	+5c8pjO9ECg2IL3NRTvu+nryhsI68djuK96CmxB2KxFo1foRQ46JfOjd/218rA83FrBtCs4bMDb
	zoc/yxTEN8rN8SCIUISfoDzd+qzgBHaXjrSy5bAsu1Rpc2oIm8l9ukY37N7STXblH2ho7G/abcL
	qLSrYnypgnglBTCg4YyUHgsBe64P0mE7VVSLKjaxAWVM6zcDpOmQHIKA+18sLnncZnl9k91Hp68
	yMtY3Z+r4L2+a5j8UCSyxPHfFreuFgoyABP2vYUg5mEFQtsQOyRNbQ67CNmCSqMwVaUNKohMysI
	TkItM09O0NwfXBcjkYBig==
X-Received: by 2002:a17:90a:701:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a6d2ac75d9mr3440094a91.19.1791166355134;
        Sun, 04 Oct 2026 19:12:35 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH] 9p/xen: validate the response size from the backend
Date: Mon,  5 Oct 2026 11:11:55 +0900
Message-ID: <20261005021157.207947-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791166357-190CD9EA-E4BD49AA/13/0
X-purgate-type: clean.bounce
X-purgate-size: 3213

p9_xen_response() takes the length of an incoming response from the ring
-- the first field of the 9p header, which the Xen transport reuses as
its framing header -- and uses it to advance the consumer index, but
never checks that it is at least the header size or no larger than the
number of bytes the backend has actually produced.

A malicious or buggy backend can post a response whose size is smaller
than the header (for example 0). The consumer index then never advances,
so the response work re-reads the same ring contents instead of making
progress. In testing this raced with the teardown that the malformed
reply triggers and dereferenced a freed p9_client:

  9pfs 9pfs-0: Wrong req tag=ffff
  BUG: kernel NULL pointer dereference, address: 0000000000000060
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] SMP NOPTI
  CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 7.2.0-rc5 #6 PREEMPT(lazy)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
  Workqueue: events p9_xen_response
  RIP: 0010:idr_find+0x4/0x10
  RSP: 0018:ffffbf5d80063de8 EFLAGS: 00010202
  RAX: 0000000000000001 RBX: ffffa229c21195a0 RCX: ffffa229c2400000
  RDX: ffffa229c11c2200 RSI: 000000000000ffff RDI: 0000000000000050
  RBP: 000000000000ffff R08: 3fffffffffffdfff R09: ffffffffffffffff
  R10: 3fffffffffffdfff R11: ffffffff87a60e80 R12: 0000000000000050
  R13: 0000000000000000 R14: 000000000000ffff R15: 0000000000100000
  FS:  0000000000000000(0000) GS:ffffa22a7661c000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 0000000000000060 CR3: 000000003ac34002 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   p9_tag_lookup+0x2b/0x90
   p9_xen_response+0x17c/0x2e0
   process_one_work+0x16a/0x3a0
   worker_thread+0x172/0x2e0
   kthread+0xdd/0x110
   ret_from_fork+0x18b/0x240
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Modules linked in:
  CR2: 0000000000000060
  ---[ end trace 0000000000000000 ]---

Reject a response whose size is outside [sizeof(header), queued] before
using it, matching the validation the backend already applies to
incoming requests.

Fixes: f66c72bea129 ("xen/9pfs: receive responses")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 net/9p/trans_xen.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index f9fb2db7a0663..685523be16f0a 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -200,6 +200,14 @@ static void p9_xen_response(struct work_struct *work)
 				     masked_prod, &masked_cons,
 				     XEN_9PFS_RING_SIZE(ring));
 
+		if (h.size < sizeof(h) ||
+		    h.size > xen_9pfs_queued(prod, cons,
+					     XEN_9PFS_RING_SIZE(ring))) {
+			dev_warn(&priv->dev->dev,
+				 "bad response size %u from backend\n", h.size);
+			break;
+		}
+
 		req = p9_tag_lookup(priv->client, h.tag);
 		if (!req || req->status != REQ_STATUS_SENT) {
 			dev_warn(&priv->dev->dev, "Wrong req tag=%x\n", h.tag);
-- 
2.43.0


