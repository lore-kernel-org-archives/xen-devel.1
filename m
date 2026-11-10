Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02407606A741
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ABxA9w8H
Received: from list by lists.xenproject.org with outflank-mailman.1481730.1685651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlbF-0001ZG-DT; Tue, 10 Nov 2026 13:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481730.1685651; Tue, 10 Nov 2026 13:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlbF-0001Z9-Al; Tue, 10 Nov 2026 13:09:21 +0000
Received: by outflank-mailman (input) for mailman id 1481730;
 Tue, 10 Nov 2026 13:09:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQlbD-0001Nx-FN
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:09:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlbC-0069tW-SD
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:09:18 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af31778-8faa-0a2a0a5109dd-0a2a450cd0fe-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:09:18 +0100
Received: from [74.125.82.45] (helo=mail-dl1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af31307-f479-0a2a450c0019-4a7d522dcc32-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:50:17 +0100
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-170135e43c7so2998791c88.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 04:50:16 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b79649sm7614830c88.21.2026.11.10.04.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:50:14 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315015; x=1794919815; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zzG+r0Nc7NWPddTHndjZ7UDJBk8q3WCOKQ3/5tvZ+I=;
        b=ABxA9w8H3FEgzNVx9AbTMuHpWFuC8wLNGC9bKDWUCLdnw9olSGeFOGZ7e26sKnPsRD
         7m2yE1y3ZFp4f1AWxwCNH/dGOFzF5dQiQcTGvZTFUdSE+ZWGY8lZFyOQ6Mn/Bv51dkGg
         yJ8mCoJPjY1+Zfa7ekxnlHPfM34RKGEcw4SCU07cLmbOyrHkpnTK576ZieQfR8r02lm4
         lSqiym9uilN197F6WT0Lb/z/NK9Mmf5pZ9Jq1Vd+u1ShjmWU4G5703i4b+2T7CFXHX3j
         GDCeKrghlBsNDJyVr6WLUAsk2IYNcMnL4uAWtwtIKRrYjPJM9jDxDj+LtYTWozdflieW
         gyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315015; x=1794919815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zzG+r0Nc7NWPddTHndjZ7UDJBk8q3WCOKQ3/5tvZ+I=;
        b=1g/0fIax+ahMeD1LaTf2+WEL7CRFpgkxUfqFLgwwLIPll19nQXM/YaxkFi+VmSvUZ/
         mnGb5sKG2BG2HS3vMLD4+dheqReWSu3tSZKSmy5mJRAy5Nkix1GrNYOIH7k5laJFP79X
         E99IeDJIADvbbmtXYU8shRw6oUXRwirFPVPKkfOs3c8BMLXT/YqtsnnBunwSCQ++E2Vf
         Sff/4swnyskkTjDAbLJUe3eMqp55+u1nVKBBDglucOSmWS83bENWm6WdyeYCzvy+8bE1
         oJ99xZXTA5v1o40/bYARlbVem45qcUPvhfaylDiVIzsF12KS3zNOZ+KDQcJYpAms6fCi
         F6qQ==
X-Forwarded-Encrypted: i=1; AL+hErHHRCouINxVV8hMILKhboEwXo+0MohHvaO+64X38Way1IevustRGTctg4rt7KDMEsIJmUUFTb28bek=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/3KPwpw+4dZi42ML19oovEtyZBzYb2SsXxEm0xNzpqMjfqdyZW
	uoIuc6n3X0PCL61BudDvEyCOW2uRjD3NPRlw98hv3pc4iwK5ZurYYSx/ik9dF2yDUCg=
X-Gm-Gg: AYBFou12TtI4pyrgrznQj4jM+agXrdRz9Pyhzos8Y0fPhKi6p/dN/+NJs7AoAxNn0qZ
	mznAMEeTUnMgxGA8ZeTAGZej/7+GCe+GZEL6v01ScM6oPnkRXpXCE4G1wZhPnkNlPJ1wpEkP4kQ
	2Zc3Amv7EuXUA8x7sMtRKX7CgU2QIp744JQQXhyVBdXUZNCkkT9DZoN1Jixm0o2V6x7BozTn2FH
	e+Z8TREynslObTCnIGvCJIfaXQuwvUn7iJJJm7bXvRFUw9gkxUC05edBCWVXU4i+Lkj93AUPzNy
	ahImOwSJ6HZZWCFDyRezhjyhnrJ8sD4HVYjDzfSY/67i7M8ax1N497ZselnP/b7oVWbIirTBJan
	8qd8wd0VmGrEe1gh0URFK7Ng8vs6styZXrTBANfqaB9eLtWAHQ46DdN1NsWQQpA50gB3c4FApDv
	s1QoBPtG94LZDhOcZP/GU+kuBLRAkTGpShNTrDngCTES85Y55FDMOQtL/PwR0e6q6b1v3T7ada+
	vC4fEWWPcO/7rNis3vOFI76I8TNxtJ3w3BJLytX7QzsoNLYYKV6kcc3t/d3fiJXL8FNAXyJmm+7
	dquPpdf9oFNi789S/jDr1aqS+Gm1iL5K7GKe3y2kWs32bPmr4HyWVLKgiXdu0u0e1F9JFiN4Zrj
	XvYWn7pNdx7mEdnNItiyEgCsmmFBySNmoYlvQgwNYzcyIulYZtFTX53xaRxs=
X-Received: by 2002:a05:701b:465c:b0:1b3:a8a3:c6de with SMTP id a92af1059eb24-1b3b5e65237mr3442597c88.5.1794315014837;
        Tue, 10 Nov 2026 04:50:14 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] xen/pvcalls: unwind pvcalls_new_active_socket() step by step
Date: Tue, 10 Nov 2026 21:50:01 +0900
Message-ID: <20261110125002.46683-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
References: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794315017-76ADCA5B-EEAB3CB7/10/78177266408
X-purgate-type: clean
X-purgate-size: 7181
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every error path in pvcalls_new_active_socket() jumps to one shared label
that does list_del(&map->list) and then hands map to
pvcalls_back_release_active().  But map comes from kzalloc() and its
list_head is only published at the very end of the function, after the last
of those jumps:

	down(&fedata->socket_lock);
	list_add_tail(&map->list, &fedata->socket_mappings);
	up(&fedata->socket_lock);

so on the error path map->list is still {NULL, NULL} and __list_del()
writes through a NULL pointer.

A frontend gets there with one value it owns: the ring_order field of the
page it granted.  Anything above MAX_RING_ORDER takes the second goto, and
nothing else in the function has run by then.

The result is an oops in whichever context handled the request - the
pvcalls-back threaded IRQ handler for PVCALLS_CONNECT, mappass->wq for
PVCALLS_ACCEPT - and because it happens after down(&fedata->socket_lock)
that semaphore is never released, so every later operation on the frontend
blocks on it and the backend never completes backend_disconnect().  (With
CONFIG_DEBUG_LIST the list_del() only reports and returns, and
pvcalls_back_release_active() then runs on a map whose irq is still 0 and
whose bytes, ioworker.wq and saved_data_ready are all NULL.)

A frontend asking for ring_order 5, on a dom0 built with KASAN
(the request was issued by a test-only change to the frontend):

[  133.728877] pvcalls_new_active_socket frontend requested ring_order 5, which is > MAX (4)
[  133.732868] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
[  133.737910] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
[  133.741666] CPU: 0 UID: 0 PID: 133 Comm: irq/39-pvcalls- Not tainted 7.3.0-kCTLblk2-15482-g21a7f44fd076-dirty #1 PREEMPT(full)
[  133.746986] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  133.751512] RIP: 0010:pvcalls_new_active_socket+0x821/0xb90
[  133.754237] Code: 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 f6 01 00 00 48 8d 79 08 4c 8b 6b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 14 02 00 00 4c 89 ea 4c 89 69 08 48 b8 00 00 00
[  133.763126] RSP: 0018:ffffc900004afb38 EFLAGS: 00010202
[  133.765861] RAX: dffffc0000000000 RBX: ffff88810886c900 RCX: 0000000000000000
[  133.769348] RDX: 0000000000000001 RSI: 0000000000000246 RDI: 0000000000000008
[  133.772787] RBP: 1ffff92000095f6b R08: 0000000000000001 R09: fffff52000095f58
[  133.776260] R10: 0000000000000003 R11: ffff888100077320 R12: ffff88810858b410
[  133.779823] R13: 0000000000000000 R14: ffff88810858b460 R15: ffff88810858b400
[  133.783382] FS:  0000000000000000(0000) GS:ffff8881b034c000(0000) knlGS:0000000000000000
[  133.787351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  133.790308] CR2: 00000000006042c0 CR3: 0000000108400001 CR4: 0000000000770ef0
[  133.793822] PKRU: 55555554
[  133.795347] Call Trace:
[  133.796778]  <TASK>
[  133.798082]  ? __pfx_pvcalls_new_active_socket+0x10/0x10
[  133.800801]  ? security_socket_post_create+0x4d/0x60
[  133.803275]  ? release_sock+0x1a/0x1d0
[  133.805182]  pvcalls_back_event+0x1b09/0x23e0
[  133.807431]  ? __pfx_pvcalls_back_event+0x10/0x10
[  133.809814]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  133.812251]  ? __pfx_pvcalls_back_event+0x10/0x10
[  133.814554]  irq_thread_fn+0x86/0x150
[  133.816468]  irq_thread+0x2da/0x580
[  133.818363]  ? __pfx_irq_thread_fn+0x10/0x10
[  133.820586]  ? __pfx_irq_thread+0x10/0x10
[  133.822670]  ? __kthread_parkme+0x88/0x170
[  133.824803]  ? __pfx_irq_thread+0x10/0x10
[  133.827153]  ? __pfx_irq_thread+0x10/0x10
[  133.829304]  kthread+0x2c8/0x3b0
[  133.831176]  ? recalc_sigpending+0x15c/0x1e0
[  133.833570]  ? __pfx_kthread+0x10/0x10
[  133.835572]  ret_from_fork+0x373/0x5b0
[  133.837581]  ? __pfx_ret_from_fork+0x10/0x10
[  133.839978]  ? __switch_to+0x3c4/0xb40
[  133.841984]  ? __pfx_kthread+0x10/0x10
[  133.843970]  ret_from_fork_asm+0x1a/0x30
[  133.846031]  </TASK>
[  133.847420] Modules linked in:
[  133.849240] ---[ end trace 0000000000000000 ]---

Give each failure its own label, so that only resources that were actually
acquired are released and the list the map was never added to is left
alone.  The map is not published anywhere at that point, so the error path
needs no socket_lock at all.  sock_release() stays in the callee on every
error path, the way
commit 8fafac202d18 ("xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()")
arranged it.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Cc: stable@vger.kernel.org
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: no change (Reviewed-by added).  v1: https://lore.kernel.org/all/20261109122324.30134-1-yhlee@isslab.korea.ac.kr/

 drivers/xen/pvcalls-back.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index ba62651a7f338b..dcefa91a40cd05 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -337,7 +337,7 @@ static struct sock_mapping *pvcalls_new_active_socket(
 
 	ret = xenbus_map_ring_valloc(fedata->dev, &ref, 1, &page);
 	if (ret < 0)
-		goto out;
+		goto out_map;
 	map->ring = page;
 	map->ring_order = map->ring->ring_order;
 	/* first read the order, then map the data ring */
@@ -345,19 +345,19 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	if (map->ring_order > MAX_RING_ORDER) {
 		pr_warn("%s frontend requested ring_order %u, which is > MAX (%u)\n",
 				__func__, map->ring_order, MAX_RING_ORDER);
-		goto out;
+		goto out_unmap_ring;
 	}
 	ret = xenbus_map_ring_valloc(fedata->dev, map->ring->ref,
 				     (1 << map->ring_order), &page);
 	if (ret < 0)
-		goto out;
+		goto out_unmap_ring;
 	map->bytes = page;
 
 	ret = bind_interdomain_evtchn_to_irqhandler_lateeoi(
 			fedata->dev, evtchn,
 			pvcalls_back_conn_event, 0, "pvcalls-backend", map);
 	if (ret < 0)
-		goto out;
+		goto out_unmap_bytes;
 	map->irq = ret;
 
 	map->data.in = map->bytes;
@@ -365,7 +365,7 @@ static struct sock_mapping *pvcalls_new_active_socket(
 
 	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);
 	if (!map->ioworker.wq)
-		goto out;
+		goto out_unbind;
 	atomic_set(&map->io, 1);
 	INIT_WORK(&map->ioworker.register_work,	pvcalls_back_ioworker);
 
@@ -381,11 +381,16 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	write_unlock_bh(&map->sock->sk->sk_callback_lock);
 
 	return map;
-out:
-	down(&fedata->socket_lock);
-	list_del(&map->list);
-	pvcalls_back_release_active(fedata->dev, fedata, map);
-	up(&fedata->socket_lock);
+
+out_unbind:
+	unbind_from_irqhandler(map->irq, map);
+out_unmap_bytes:
+	xenbus_unmap_ring_vfree(fedata->dev, map->bytes);
+out_unmap_ring:
+	xenbus_unmap_ring_vfree(fedata->dev, (void *)map->ring);
+out_map:
+	sock_release(sock);
+	kfree(map);
 	return NULL;
 }
 
-- 
2.43.0


