Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C23606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 04:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLjfhC7S
Received: from list by lists.xenproject.org with outflank-mailman.1497678.1695839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUGCc-00016C-AN; Fri, 20 Nov 2026 04:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497678.1695839; Fri, 20 Nov 2026 04:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUGCc-000165-7i; Fri, 20 Nov 2026 04:26:22 +0000
Received: by outflank-mailman (input) for mailman id 1497678;
 Fri, 20 Nov 2026 04:26:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <devnull+shyckless.gmail.com@kernel.org>)
 id 1xUGCa-00015z-AB
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 04:26:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUGCZ-002bo0-MQ
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 05:26:19 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <devnull+shyckless.gmail.com@kernel.org>)
 id 6affcbd2-bab6-0a2a0a5309dd-0a2a450ce33c-30
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 05:26:19 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <devnull+shyckless.gmail.com@kernel.org>)
 id 6affcbea-f479-0a2a450c0019-ac6904fec218-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 05:26:19 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B9711611C0;
 Fri, 20 Nov 2026 04:26:17 +0000 (UTC)
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPS id E6E371F000C4;
 Fri, 20 Nov 2026 04:26:16 +0000 (UTC)
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
 by lkml.kernel.org (Postfix) with ESMTP id 64DDE495A0;
 Fri, 20 Nov 2026 04:26:16 +0000 (UTC)
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
	t=1795148777;
	b=KrVB86G+VLdQ5lvzKGgZ7mRSE7rBgjZJG3FD2Yayw+ObSZcjpALDLm9nWy6SqYSnd4yR
	 kDTXG/0vU2lYcNH7AB6pwfD05yVA0Z1vW4zuvMraGV9sjQwvQXkz010iuNrnCLrvLrFUH
	 qO2UNdbfIEX14j31eBOsx5xIKwQL/l8BlBq/EX4BYrq6DttldvRksKC51kqbtdioGwaNh
	 b/EiraX4L5mgRkzSlhk+U7Yb0W4tvmD4Dbw0CJkHbpWboolwqARKmrNZ2fuOWCuYyivgv
	 2JYbRo9etajRRZnRuATlmJIuRpCRh22Yk60orvc6OWE7hW9AmZhaVVSfEHUH3AADSsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795148777;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=qGC3Y4r7T20cQuoO4kDMAGiRID8rez9I459XavcFz0Y=;
	b=KBdHxITGeT/rH2lX2xEroxM+gSZ3kt7GpvvCwpPjedp9MCRvdcXVgC1HEU6dJfJe+Htr
	 RZrfBa4m61HZJux+H1Q1jX5KM03GbmFgrCCioXq4A/HXMlGir87QyT/wpqRURN6QZ8Ndx
	 +kKHdlps4kuLQOXQTqNpcbsHp1lPzw9DzgZtLkV2uJwI7E7RU2ywvUyo0k8t5hM3DJmYf
	 RekJ43CFVLw9DNhXfOVVGFR2IFAvOqWF1Ot+ofg8FK2NNSnY5CW6y7KhRhhFeoG3do9m9
	 cGMJSH+rYqlJVRckWciXvX7TY4uaGBXYD4ikGdvaQp+HqkSGQ4FR1w8shrF1rLdUrfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795148777;
	bh=qGC3Y4r7T20cQuoO4kDMAGiRID8rez9I459XavcFz0Y=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=VLjfhC7SSy6ue0An+s1KZaFSAYL2GE1B5ANxEU2fuAk5sUVy9OlIUPBr65FL+6hFQ
	 SHIZxG3xhQeNRoyHWgygo6V9G/C9O0Dk06CvfG8N7V9iZYboxvJxfKzqzJQg4e5PdO
	 yaJ4pAgrUaqMyVXQYTy6HWXHhZN+FUhiSttzCyA6NiJu/2lM3kaRHhOe07d86Vn6Fv
	 FAoudsrpuInRiQLkQ6YwKNWgQxczA6UTa2oqZbrqH+weN79VOHmbN1vS/3pvC2pn22
	 cqjkSqO4UfGcVCGDNPQ4RePI6Z7OGVUvjWs7cgDDZqdUoyN1EeUQG7bpLQPHsnX2XZ
	 c7I5RT7CYvgRw==
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 04:26:16 +0000
Subject: [PATCH v3] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-xen-tpmfront-v3-1-3ea2e3fd8611@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOfL/2oC/yXMQQ5AMBBA0avIrDWpqi5cRSwYU0aipC2RiLsrl
 m/x/wWBPFOAOrvA08GBV5dQ5hng1LmRBA/JoKQyRaGkOMmJuC3Wry4K1Eiy16hMZSElmyfL57d
 r2t9h72fC+D7gvh/w/tYMcAAAAA==
X-Change-ID: 20261120-xen-tpmfront-c4ce0b4c265f
To: jgg@ziepe.ca, jarkko@kernel.org
Cc: sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org, 
 linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795148775; l=2391;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=y48N31ZkViOWzWpWm3teQZk54JRgePEMfCs5wUrfGDI=;
 b=0aGMxum0hOy9buIFYkF9KMKvvK+7gQ4d4pH6piRdWeijez31/TgCv47CxSTssPFrw8PGRVo+T
 kKvn2MY1G2CBNupEha6M6Hdr1X/7rI0n8vlpeQPUJ7NaoZ9BDx6Cw+K
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com
X-purgate-ID: tlsNG-d25034/1795148779-51737A5B-686230B0/0/0
X-purgate-type: clean
X-purgate-size: 2444
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

When the backend moves to Closing or Closed, backend_changed()
unregisters the device and then keeps using it:

	device_unregister(&dev->dev);
	xenbus_frontend_closed(dev);

The xenbus watch callback that calls backend_changed() does not hold a
reference to the device. The tpm_chip registered by xen-tpmfront has dev
as its parent and holds a reference to it, but tpmfront_remove() drops
that reference when it unregisters the chip. So device_unregister() can
release the last reference and free the xenbus_device, and
xenbus_frontend_closed(dev) then accesses freed memory.

The stubdom based vTPM backend, the only one in use today, never
switches to Closing or Closed, so this path is not reached with it. It
is reached with any backend that follows the normal xenbus state
machine on shutdown.

Take a temporary reference before unregistering and drop it after
xenbus_frontend_closed(). This keeps dev alive for the last access and
keeps the existing order, in which TPM operations are stopped before
the frontend is marked Closed.

Found with a static analysis tool and checked by hand.

Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Changes in v3:
- Drop the Fixes tag (Jarkko). No code change.

Changes in v2:
- Say that the stubdom vTPM backend never reaches this path, and don't
  ask for a stable backport (Juergen, Jarkko). No code change.

Compile tested on x86_64 (W=1, no new warnings). Not run with a Xen vTPM
backend.

v2: https://lore.kernel.org/all/20261119-xen-tpmfront-v2-1-e0e51c36360d@gmail.com/
v1: https://lore.kernel.org/all/20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com/
---
 drivers/char/tpm/xen-tpmfront.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 3c0cce57c4ae..1be925cca535 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -397,8 +397,11 @@ static void backend_changed(struct xenbus_device *dev,
 
 	case XenbusStateClosing:
 	case XenbusStateClosed:
+		/* device_unregister() can drop the last reference to dev */
+		get_device(&dev->dev);
 		device_unregister(&dev->dev);
 		xenbus_frontend_closed(dev);
+		put_device(&dev->dev);
 		break;
 	default:
 		break;





