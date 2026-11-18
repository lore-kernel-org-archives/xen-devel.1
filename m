Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F15606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D2572sYO
Received: from list by lists.xenproject.org with outflank-mailman.1494678.1694064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTh9l-00016d-KQ; Wed, 18 Nov 2026 15:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494678.1694064; Wed, 18 Nov 2026 15:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTh9l-00016W-HO; Wed, 18 Nov 2026 15:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1494678;
 Wed, 18 Nov 2026 14:53:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <devnull+shyckless.gmail.com@kernel.org>)
 id 1xTh2W-0007dW-6Q
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:53:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTh2V-002iV1-7r
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:53:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <devnull+shyckless.gmail.com@kernel.org>)
 id 6afdbbda-bab6-0a2a0a5309dd-0a2a450b8a90-36
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:53:35 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <devnull+shyckless.gmail.com@kernel.org>)
 id 6afdbbed-b7e8-0a2a450b0019-ac6904feb97e-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:53:34 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 22EE960F75;
 Wed, 18 Nov 2026 14:53:33 +0000 (UTC)
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPS id 678C31F000C4;
 Wed, 18 Nov 2026 14:53:32 +0000 (UTC)
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
 by lkml.kernel.org (Postfix) with ESMTP id ECFD04ADF5;
 Wed, 18 Nov 2026 14:53:31 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:Date:Subject:To:Cc:Reply-To"
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795013612;
	b=oGKtrIkr2Wv9BIdul9AeXXL/7AUJRYdXSPS3zAV1K9x8pOQptpFXrGZcmojnfDDQkSP+
	 fg52RYyL6E0ulGHomVvugDkwn4yxd3Mer0+f/nW3HyI8tWirFJ0TTXgwT0PTDQ0EtfUJK
	 SX/oW4fgkbR2QXxoBMcDgwucKP5BiAH0zB5XOU5Ika1qDB0zOsqel7BTNATbMqcQpmYV2
	 /8FHO3lewJn4yu7/1/kxuN/g7Oh1+j8byTQ+L0ZPu1/CVaHZi6r0zNYNkG8WNvO4J1cam
	 ziA1DEkn07QdNm3bMU6X+UcmBsJrbkTnjJT47zB2Gt9RvCv5fvDZBf2TcFeKzX3GYog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795013612;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JhqkB8+ikY0EQHy0mFR/yHf+TqnBEpjGFQ+Trl/H16U=;
	b=Sef5YFaPiNY9XIJ3KtqBbqW7W7u2RdSbkkrhfxw3xspkq+O793RyUove+h9c4rXp3WL5
	 snC+uAPOjkjEFjWVhIsW86BZYyYKYSSPVqiEfem5qj6omIc3A9Gpgt5v3BNafvvMdfR+x
	 BSdbRDFUUmJZHwbv/XerhMKDtKGOvGDL9F7CO/zSUxLVrEGKzJEZeUjQ4VFueVIDEJQOL
	 +RWyf8DykIs7Z1fvDoNHxmioAoCJwfw/VwbOa+1+yc/kcfmk7/qpfZEKRHw2t3hRtitIc
	 K+26OaAzV/AjIq+RqRUTHe9LoGGIMQhmT/AWTBeegzu+aUMHSN5YGPKSH6VHygYPvNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013612;
	bh=JhqkB8+ikY0EQHy0mFR/yHf+TqnBEpjGFQ+Trl/H16U=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=D2572sYOZOK3dO6DNHGR87m9WtzeiRfoNpMb4s+g3TzpORhBgYihQEU3Y5dOy6XI5
	 LQDe9PoOEQqeLmQDl8wQ9h/pCtRM4csAGtc9Jc7P5dJsdbO7YYzdP7x4E00s+PP8KV
	 IgqPQubm44A1KWorJMmEy/c/OQEdDAHLdMUUhg6NzEZFyVHZCHIdEn0k6hzow00pUl
	 o7rqgnsMAU4bHHTlDQznz5QrD/pWopIb8BlGilPfdiJ/SHhuo2Cj8qYol0xmCAAcEx
	 caT9+mMjhvSRJWij8MjhC22rjP0Mf0SxSYG1pMCp6JRGk4pIm97DmokvtysYKI/t4F
	 G8EKxg3LmJu2Q==
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 14:53:31 +0000
Subject: [PATCH] xen/pvcalls: return -EINTR from recvmsg when the wait is
 interrupted
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-xen-pvcalls-v1-1-5e9d662900a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOq7/WoC/yXMQQqDMBBG4avIrBvIBBHxKtKFib86ElLJtCKId
 29ql9/ivZMUWaDUVSdl7KLySgX8qCgsQ5phZCwmZ13DzK05kMy2hyFGNfCTr4Mdwd5RKbaMSY7
 71j//1o9fEd6/BV3XF046lM9vAAAA
X-Change-ID: 20261118-xen-pvcalls-ebfb4c0de1b2
To: sstabellini@kernel.org, jgross@suse.com
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795013611; l=2573;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=JS0N2by4izL7XI6U/P5YKixzFBa9rEd0luLKdyK1x98=;
 b=8hmEpcRcMvT3FgZ8jhjQzuy6IWqP2SSP25b2VY+7+Za5wAoI5L6TaM8tQaT4ccyBoc61ubOsj
 qWwMBB2oqy8CsaiwHbH+gXaG7fcVtJyGssZTqMFDNLJySiPErW/J6DP
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com
X-purgate-ID: tlsNG-42698a/1795013615-AAEDE9EA-78EDC033/0/0
X-purgate-type: clean
X-purgate-size: 2626
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

pvcalls_front_recvmsg() waits for data in a loop and ignores what
wait_event_interruptible() returns:

    while (!(flags & MSG_DONTWAIT) && !pvcalls_front_read_todo(map)) {
            wait_event_interruptible(map->active.inflight_conn_req,
                                     pvcalls_front_read_todo(map));
    }

Once a signal is pending, wait_event_interruptible() returns
-ERESTARTSYS right away without sleeping, and the loop calls it again.
The caller then spins with map->active.in_mutex held until data arrives
or the backend reports an error. The signal can't be handled while it
spins, so the task can't be killed either, and other readers of the
socket block on in_mutex.

Return -EINTR when the wait is interrupted, as pvcalls_front_accept()
already does for its interruptible waits. Jump to the end of the
function so that in_mutex is released and pvcalls_exit_sock() is
called.

Found with a static analysis tool and checked by hand.

Fixes: ae0d04052e07 ("xen/pvcalls: implement recvmsg")
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
There are no in-tree callers of pvcalls_front_recvmsg(), so this only
matters to code built on the exported frontend API. That's why I left
out Cc: stable.

Compile tested only (x86_64 with CONFIG_XEN_PVCALLS_FRONTEND=y, W=1 and
sparse show no new warnings). I haven't run it in a Xen guest.
---
 drivers/xen/pvcalls-front.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 3e7aa807c317..5d6c8ba66849 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -693,8 +693,11 @@ int pvcalls_front_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 		len = XEN_FLEX_RING_SIZE(PVCALLS_RING_ORDER);
 
 	while (!(flags & MSG_DONTWAIT) && !pvcalls_front_read_todo(map)) {
-		wait_event_interruptible(map->active.inflight_conn_req,
-					 pvcalls_front_read_todo(map));
+		if (wait_event_interruptible(map->active.inflight_conn_req,
+					     pvcalls_front_read_todo(map))) {
+			ret = -EINTR;
+			goto out;
+		}
 	}
 	ret = __read_ring(map->active.ring, &map->active.data,
 			  &msg->msg_iter, len, flags);
@@ -706,6 +709,7 @@ int pvcalls_front_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	if (ret == -ENOTCONN)
 		ret = 0;
 
+out:
 	mutex_unlock(&map->active.in_mutex);
 	pvcalls_exit_sock(sock);
 	return ret;





