Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D53606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 12:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ABxqKfrZ
Received: from list by lists.xenproject.org with outflank-mailman.1462120.1673185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLgAu-0001aL-0y; Tue, 27 Oct 2026 12:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462120.1673185; Tue, 27 Oct 2026 12:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLgAt-0001aD-S8; Tue, 27 Oct 2026 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 1462120;
 Tue, 27 Oct 2026 12:21:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xLgAr-0001Zr-TO
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 12:21:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLgAr-00HDsD-5q
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 13:21:05 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ae09726-bab6-0a2a0a5309dd-0a2a450ba964-28
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 13:21:04 +0100
Received: from [209.85.216.44] (helo=mail-pj1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6ae095c5-b7e8-0a2a450b0019-d155d82ce0aa-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 13:15:03 +0100
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3856d6fbcb3so2680750a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:15:02 -0700 (PDT)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:df24:cbdb:a2dc:d464])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd8cc9073c2sm2915176a12.0.2026.10.27.05.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 05:15:00 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i="@isslab-korea-ac-kr.20251104.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1793103301; x=1793708101; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1s6Zqp4u3sfnKK/Y6nM0BOKcsidnRWEc87L5yFDAZSw=;
        b=ABxqKfrZY06t/5Fy3Bwkiip6n0lMZ6HK/uNfu/9y4iA53m3phbZU9JOnO99tCs+ylz
         wTFOWTcmsynVUlAa8GYE4ahLm3Kqd6uhw+3YQGCOv0iKhNERHKib3ppaYFghJRVGgPj8
         h1ZE0YT6RD9mUBV+Z/A/6L6mfmbNMfgSnIgjat3m4Y2GzpZR/NW/rayub0z+LjlsewGY
         GRznsIqmCi3wKZSInbh0/y4bTDJCviLf62iEqqU76nGGGAzf4KmIRlMLnHV+yrmu7SMe
         WLqTnw3SRqnfiD1W6xzqojhYnWUkkEr2cUYpn3d46v0VOcD/+wGuXZ/gizZUaAJrIFDN
         AU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103301; x=1793708101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1s6Zqp4u3sfnKK/Y6nM0BOKcsidnRWEc87L5yFDAZSw=;
        b=Zys2A3QrMtdBdRNXcMsTXoDODMVIgeLBshZFQJwIDBazRjklEQFttb3TZJto+lZf+y
         6L8pubi0QIjovU8RaXqDCRzOttoNnr6Xl9w4v8FIMAmkn7j5Nci2Pf/cgnXvKDFDjD57
         W3tDrFDaZFD3vCi+gLafIJmS5aqeoK7tfJXIfhRH9PmeFX8mXfI6+qG28zD3UAspMghF
         uFWu0BLmkMGgQP8lYdId+VqNPjhzALHOcCGcua7cuoBty7VLvL7t4X8xMmAuVgBO9Rw7
         pdZ6m0LiWFOOx6lM+Ab+X96ASsbkyYO2xXTM7VKwuFRIi4kmrW5W2df9ywkrygT8zwtF
         wUzg==
X-Forwarded-Encrypted: i=1; AKwUvBzY7JvtTsNeNqZdKwOxoZ2hxbxchSz8G7pnOaAMWkBhBkK2mzZrnVI28eCVNa/1kMNhx/Epz7XHEhs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLSw9iAxRKlgGGqbIk4avmyqY7zK8ZJg0OYOsHHT+lfdtP4gf+c
	/M+MBZ90rXrPGloUZXB0rR/e5ZSKhDY5298cWwCC7w/QU3yQkcG1elmu+mPKEyIG6tE=
X-Gm-Gg: AYBFou0/WareucmOAuRq2k5EGfj4yi6CrdGwIZaf3MNscqrVx+Fn4A083qrwOt0uzWt
	d7Evggl4RpOCnFD7/T6QNy6Z3KMw1FGRhCTq4mVnWnjsKyDHribwIMNuyPGPcqnR8l0reBbdFLs
	mEETu8b9x2Hzw8k82c0YrmMBoCbfon0UUE8vkFdqTz/DaN1SqGLtTWuYa0oIhmGS5OzvK0lDemu
	FTQEcd4jnfUUFoUSUb9XBLRTeM/nyWg6dcVKvkH5kurN+MmElLGpXvqm58D2XHNBmjyJJqglxHS
	rkITUJo5RGklYgTmxpraupH5p3FjklSMV1gGo9BcLUrqkEe7W/4wDzRUSn+DbpFg5DxEY9NPn2K
	eKduXlhr9P94NjYa72mly+JLrRtPMJ/rvtG7vnRnHNle9+xU0HoVaADhvfQHcklSOqugIN/ttPH
	mNmIMQe51b6r+cI0JufE4iPLjw6R0tJ3dvrt6x/5/LAeuntZGNPzvBD3pl1RY1Yt1bCS7HwpSw+
	P8lKxNe7Wli5ArSTZR2ge3f57FbI+JUyB691eHZAHRv9eccA1xxBifnOS7vBwllModEcrQ0cOIy
	y4W7I020jGmVRiSYRGdOzagvzydqu5+O2nVHiDrQfgm7+lnYF0zl+3rcAAc3ik9hbA==
X-Received: by 2002:a17:90b:2542:b0:3ac:adce:60a8 with SMTP id 98e67ed59e1d1-3ade9b2cf27mr7977855a91.5.1793103301318;
        Tue, 27 Oct 2026 05:15:01 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH] xen-netback: wait for RCU readers before freeing queues on error
Date: Tue, 27 Oct 2026 21:14:38 +0900
Message-ID: <20261027121438.1266207-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793103303-1B4D39EA-D2B392F4/13/0
X-purgate-type: clean
X-purgate-size: 6308
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The connect() error path frees vif->queues without first waiting for
RCU readers, unlike backend_disconnect() which publishes num_queues = 0,
calls synchronize_net() and only then frees the array.

The net device is registered in xenvif_alloc() during probe, so it is
already live when connect() runs. xenvif_get_stats64() and
xenvif_get_ethtool_stats() read it through the usual stats paths, taking
rcu_read_lock(), sampling num_queues with READ_ONCE() and then
dereferencing vif->queues[i].

A guest can drive connect() into the error path by handing the backend a
bad ring reference or event channel for one of its queues, which makes
connect_data_rings() fail and connect() jump to err: with num_queues
still counting the queues already set up. The error path calls
vfree(vif->queues) without a preceding synchronize_net(), so a reader
that has already sampled a non-zero num_queues and loaded the vif->queues
pointer goes on to dereference the freed vmalloc array.

KASAN catches the read of the freed queue array in xenvif_get_stats()
while a guest repeatedly forces the error path and dom0 reads
/proc/net/dev. Generic KASAN labels a freed vmalloc region
vmalloc-out-of-bounds, since the use-after-free label is reserved for
slab and page objects:

  [  160.524029] ==================================================================
  [  160.527557] BUG: KASAN: vmalloc-out-of-bounds in xenvif_get_stats+0x28f/0x390
  [  160.530848] Read of size 8 at addr ffffc90005de06a8 by task cat/10519
  [  160.533831]
  [  160.534844] CPU: 1 UID: 0 PID: 10519 Comm: cat Not tainted 7.3.0-kCTLwide2-15482-g21a7f44fd076-dirty #2 PREEMPT(full)
  [  160.534849] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  [  160.534855] Call Trace:
  [  160.534868]  <TASK>
  [  160.534870]  dump_stack_lvl+0x64/0x80
  [  160.534885]  print_report+0xd0/0x630
  [  160.534918]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  [  160.534933]  ? xenvif_get_stats+0x28f/0x390
  [  160.534938]  kasan_report+0xce/0x100
  [  160.534943]  ? xenvif_get_stats+0x28f/0x390
  [  160.534947]  xenvif_get_stats+0x28f/0x390
  [  160.534952]  dev_get_stats+0x2db/0xb50
  [  160.534961]  ? dev_seq_printf_stats+0x446/0x7b0
  [  160.534979]  dev_seq_printf_stats+0x9e/0x7b0
  [  160.534982]  ? __pfx_dev_seq_printf_stats+0x10/0x10
  [  160.534987]  ? dev_seq_next+0xe0/0x1b0
  [  160.534990]  ? __pfx_dev_seq_next+0x10/0x10
  [  160.534993]  ? __asan_memcpy+0x3c/0x60
  [  160.534997]  dev_seq_show+0xf/0x30
  [  160.535000]  seq_read_iter+0x8f3/0x1190
  [  160.535018]  ? alloc_pipe_info+0x2c2/0x430
  [  160.535030]  seq_read+0x267/0x3d0
  [  160.535033]  ? __pfx_seq_read+0x10/0x10
  [  160.535038]  ? __pfx_do_mmap+0x10/0x10
  [  160.535054]  proc_reg_read+0x1ab/0x270
  [  160.535077]  vfs_read+0x177/0xa20
  [  160.535085]  ? __pfx_vfs_read+0x10/0x10
  [  160.535089]  ? vm_mmap_pgoff+0x24b/0x310
  [  160.535108]  ? __pfx_vm_mmap_pgoff+0x10/0x10
  [  160.535116]  ? fdget_pos+0x1ca/0x4b0
  [  160.535124]  ksys_read+0xf7/0x1c0
  [  160.535128]  ? __pfx_ksys_read+0x10/0x10
  [  160.535132]  do_syscall_64+0xe2/0x4b0
  [  160.535141]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  [  160.535149] RIP: 0033:0x463aa1
  [  160.535156] Code: 00 4c 89 d2 4c 89 c6 e9 fd fd ff ff 0f 1f 44 00 00 31 c0 c3 0f 1f 44 00 00 f3 0f 1e fa 80 3d ec 22 1a 00 00 74 13 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 4f c3 66 0f 1f 44 00 00 55 48 89 e5 48 83 ec
  [  160.535168] RSP: 002b:00007fff303dbeb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
  [  160.535176] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000463aa1
  [  160.535178] RDX: 0000000000010000 RSI: 00007f9becf9f000 RDI: 0000000000000003
  [  160.535180] RBP: 00007fff303dbee0 R08: ffffffffffffffff R09: 0000000000000000
  [  160.535182] R10: 0000000000000022 R11: 0000000000000246 R12: 00007f9becf9f000
  [  160.535183] R13: 0000000000010000 R14: 0000000000000001 R15: 0000000000000000
  [  160.535186]  </TASK>
  [  160.535188]
  [  160.636633] The buggy address belongs to a vmalloc virtual mapping
  [  160.639416] Memory state around the buggy address:
  [  160.641738]  ffffc90005de0580: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  [  160.662534]  ffffc90005de0600: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  [  160.665865] >ffffc90005de0680: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  [  160.669222]                                   ^
  [  160.671430]  ffffc90005de0700: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  [  160.674771]  ffffc90005de0780: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
  [  160.678102] ==================================================================

Mirror the teardown that backend_disconnect() already performs. Snapshot
num_queues, publish num_queues = 0, call synchronize_net() to wait for
in-flight readers, and only then deinit and free the array using the
snapshot.

Fixes: b17075d5c198 ("xen-netback: fix race condition on XenBus disconnect")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/xen-netback/xenbus.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index e020f44ac2c717..d1c9e38cfb8ef2 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -835,10 +835,21 @@ static void connect(struct backend_info *be)
 	return;
 
 err:
-	if (be->vif->num_queues > 0)
+	if (be->vif->num_queues > 0) {
+		unsigned int num_queues = be->vif->num_queues;
+
 		xenvif_disconnect_data(be->vif); /* Clean up existing queues */
-	for (queue_index = 0; queue_index < be->vif->num_queues; ++queue_index)
-		xenvif_deinit_queue(&be->vif->queues[queue_index]);
+
+		/*
+		 * Mirror backend_disconnect(): publish num_queues == 0 and
+		 * synchronize_net() so RCU stats readers finish before the free.
+		 */
+		be->vif->num_queues = 0;
+		synchronize_net();
+
+		for (queue_index = 0; queue_index < num_queues; ++queue_index)
+			xenvif_deinit_queue(&be->vif->queues[queue_index]);
+	}
 	vfree(be->vif->queues);
 	be->vif->queues = NULL;
 	be->vif->num_queues = 0;
-- 
2.43.0


