Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE73606A336
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:11:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1502047.1698052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAuV-0003t3-Ez; Wed, 25 Nov 2026 11:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502047.1698052; Wed, 25 Nov 2026 11:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAuV-0003sw-CJ; Wed, 25 Nov 2026 11:11:35 +0000
Received: by outflank-mailman (input) for mailman id 1502047;
 Wed, 25 Nov 2026 11:11:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.syms@citrix.com>) id 1xWAuU-0003sl-6Z
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:11:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAuT-003msy-8D
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:11:33 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.syms@citrix.com>)
 id 6b06c258-8faa-0a2a0a5109dd-0a2a450ca48c-30
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:11:33 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.syms@citrix.com>)
 id 6b06c264-f479-0a2a450c0019-a0658309c610-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:11:33 +0100
Received: from mewpvdipd1070.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id AC75D8513E86;
 Wed, 25 Nov 2026 06:09:52 -0500 (EST)
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
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: hawk@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	netdev@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	bpf@vger.kernel.org,
	mark.syms@citrix.com,
	stable@vger.kernel.org
Subject: [PATCH net] xen-netfront: unwind created queues when page_pool creation fails
Date: Wed, 25 Nov 2026 11:11:29 +0000
Message-ID: <20261125111129.3109095-1-mark.syms@citrix.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1795605093-028DDA5B-5D2B83AE/0/0
X-purgate-type: clean
X-purgate-size: 2801
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If xennet_create_page_pool() fails for any queue after the first,
xennet_create_queues() returns without undoing the queues it has
already set up, and talk_to_netback() then frees info->queues. The
NAPI instances of those queues stay on the netdev's napi_list,
pointing into the freed array, and their page pools, XDP rxq
registrations and grant references leak, as do the grant references
of the queue that failed. Reaching this needs an allocation failure
in page_pool_create() or the XDP rxq registration during connect or
resume.

Release the failing queue's grant references and unwind every queue
created before it inside xennet_create_queues(). talk_to_netback()
still frees the array; on this path neither
xennet_disconnect_backend() nor xennet_destroy_queues() sees the
queues, so nothing is released twice.

sashiko-bot found the bug while reviewing an unrelated netfront fix.

The patch builds without warnings at W=1 on net (gcc 12.4) and passes
checkpatch --strict. The failure path was not exercised: no fault
injection or boot test was run.

An AI coding assistant (Claude Code) was used to confirm the report,
write the fix and draft this changelog.

Link: https://lore.kernel.org/r/sashiko-outbox-232996@kernel.org
Fixes: 6c5aa6fc4def ("xen networking: add basic XDP support for xen-netfront")
Cc: stable@vger.kernel.org
Signed-off-by: Mark Syms <mark.syms@citrix.com>
---
 drivers/net/xen-netfront.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index fdcb91042f29..9abae76871f3 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -2244,8 +2244,9 @@ static int xennet_create_queues(struct netfront_info *info,
 		ret = xennet_create_page_pool(queue);
 		if (ret < 0) {
 			dev_err(&info->xbdev->dev, "can't allocate page pool\n");
-			*num_queues = i;
-			return ret;
+			gnttab_free_grant_references(queue->gref_tx_head);
+			gnttab_free_grant_references(queue->gref_rx_head);
+			goto err_unwind;
 		}
 
 		netif_napi_add(queue->info->netdev, &queue->napi, xennet_poll);
@@ -2260,6 +2261,21 @@ static int xennet_create_queues(struct netfront_info *info,
 		return -EINVAL;
 	}
 	return 0;
+
+err_unwind:
+	while (i--) {
+		struct netfront_queue *queue = &info->queues[i];
+
+		if (netif_running(info->netdev))
+			napi_disable(&queue->napi);
+		netif_napi_del(&queue->napi);
+		xdp_rxq_info_unreg(&queue->xdp_rxq);
+		page_pool_destroy(queue->page_pool);
+		gnttab_free_grant_references(queue->gref_tx_head);
+		gnttab_free_grant_references(queue->gref_rx_head);
+	}
+	*num_queues = 0;
+	return ret;
 }
 
 /* Common code used when first setting up, and when resuming. */
-- 
2.56.0


