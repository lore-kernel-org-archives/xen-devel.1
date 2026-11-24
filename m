Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305DF606A683
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 09:18:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1500689.1696735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVmfE-0000Hu-7z; Tue, 24 Nov 2026 09:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500689.1696735; Tue, 24 Nov 2026 09:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVmfE-0000Hn-4z; Tue, 24 Nov 2026 09:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1500689;
 Tue, 24 Nov 2026 09:18:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.syms@citrix.com>) id 1xVmfD-0000Hh-H4
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 09:18:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVmfC-00FcsF-Kl
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 10:18:10 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.syms@citrix.com>)
 id 6b05564c-bab6-0a2a0a5309dd-0a2a450184b8-18
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 10:18:10 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.syms@citrix.com>)
 id 6b055651-5bcc-0a2a45010019-a0658309c38a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 10:18:10 +0100
Received: from mewpvdipd1070.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 5CC6184D50E7;
 Tue, 24 Nov 2026 04:16:31 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Mark Syms <mark.syms@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	netdev@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	bpf@vger.kernel.org,
	Mark Syms <mark.syms@citrix.com>,
	stable@vger.kernel.org
Subject: [PATCH net] xen-netfront: unregister the XDP rxq before destroying its page_pool
Date: Tue, 24 Nov 2026 09:18:06 +0000
Message-ID: <20261124091806.2736453-1-mark.syms@citrix.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795511890-4D55D5FD-3AAC87C6/0/0
X-purgate-type: clean
X-purgate-size: 2448
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each receive queue registers its page_pool as the XDP memory model,
which takes a second reference on the pool. On disconnect,
xennet_disconnect_backend() calls page_pool_destroy() but never
unregisters the rxq, so the pool's user count never reaches zero and
the pool is never released, together with the receive buffers that
xennet_release_rx_bufs() has just recycled into it. Every
suspend/resume or backend reconnect therefore leaks one pool per
receive queue. The pool never begins shutdown, so the page_pool stall
warning does not fire and the leak is silent.

Unregister the rxq before destroying the pool, and clear the pointer
so that a second disconnect without a reconnect is harmless.

The leak was observed in CI testing: in XenServer suspend/resume
stress runs, HVM guests lost available memory on every cycle until
they stalled. Over 100 suspend/resume cycles the loss scaled with the
number of VIFs, on Debian 12 (6.1.0-50) and Ubuntu 26.04 (7.0.0-30)
guests alike; the missing unregister was then found by code
inspection. Reproducing it needs no kernel modification: suspend and
resume a guest repeatedly and compare MemAvailable.

Tested on Debian 12 HVM guests on XenServer 9 (Xen 4.21, AMD EPYC),
running two builds of the same 6.1.192 source with and without this
patch. Over 100 suspend/resume cycles the unpatched kernel lost
1107 KiB per cycle with one VIF and 2279 KiB with two; the patched
kernel lost 51 and 42 KiB. On current mainline the patch builds
without warnings at W=1 but was not boot-tested, and kernel selftests
were not run.

An AI coding assistant (Claude Code) was used to locate the cause,
write the fix and draft this changelog.

Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
Cc: stable@vger.kernel.org
Signed-off-by: Mark Syms <mark.syms@citrix.com>
---
 drivers/net/xen-netfront.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index fdcb91042..b82b3bdb2 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -1860,7 +1860,10 @@ static void xennet_disconnect_backend(struct netfront_info *info)
 		queue->tx.sring = NULL;
 		queue->rx.sring = NULL;
 
+		if (xdp_rxq_info_is_reg(&queue->xdp_rxq))
+			xdp_rxq_info_unreg(&queue->xdp_rxq);
 		page_pool_destroy(queue->page_pool);
+		queue->page_pool = NULL;
 	}
 }
 
-- 
2.56.0


