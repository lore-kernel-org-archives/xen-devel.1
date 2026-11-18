Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023C606A9C0
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edera.io header.i=@edera.io header.a=rsa-sha256 header.s=google header.b=TLIMjtIT
Received: from list by lists.xenproject.org with outflank-mailman.1495266.1694290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTp9j-000708-Py; Wed, 18 Nov 2026 23:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495266.1694290; Wed, 18 Nov 2026 23:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTp9j-000700-LZ; Wed, 18 Nov 2026 23:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1495266;
 Wed, 18 Nov 2026 23:33:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <benjamin@edera.dev>) id 1xTp9h-0006zu-RO
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 23:33:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTp9f-003qdR-M5
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 00:33:31 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <benjamin@edera.dev>)
 id 6afe35a1-e002-0a2a0a5209dd-0a2a450881b4-24
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 00:33:31 +0100
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <benjamin@edera.dev>)
 id 6afe35ca-f659-0a2a45080019-d15580afc1f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 00:33:31 +0100
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-8b502b9b702so16785667b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:33:31 -0800 (PST)
Received: from [192.168.1.113] ([174.80.170.224])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b4fe07408esm25655797b3.22.2026.11.18.15.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 15:33:29 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.io header.i="@edera.io" header.h="Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.io; s=google; t=1795044810; x=1795649610; darn=lists.xenproject.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNUicm6w6p3F05spqUThapxYplTksbIeS4ZiNmAJwHM=;
        b=TLIMjtITPsxfSyblHFStpCfjt0g4Met0IRKsiby0xkH6kJUHZhZPyFqOyOL+OjZhhi
         4PGiUI6Sf+qzxi7A2lu5WtKuYC233YC+bsLFT+77brrVhWqhTYvC8f+IZROiiJDT5xwD
         +o3k0YAeciUum1aRhP3oKwq4rN2DcFXVw3jugeqg+yOi3DKB5D+npHtuIa88aOu5ShsB
         mzbMZcR6efiusgrPTHYUV9rXkc46DgA/eIYgj20prbpYaqjOlhTy77ndsrVtwF1hC6b/
         7O2hvd0xyUk2Cyvlm1cF16Grxy+r7pKb6sA40I0eg9OySJSV68cS9udOlt4/M13c+j5Q
         9gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044810; x=1795649610;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNUicm6w6p3F05spqUThapxYplTksbIeS4ZiNmAJwHM=;
        b=P9qUfCCCA2lMX8Oxe2nR2t0R2PrSkn8NlO1wDwsBlBU89bXs/lz0r8FlCW7Ik1K3oF
         4XWYx3/3wvWaFwPQdoCOCu/GhyX4Pv9AlWrGtpSnZJpoSUHfUXpbzeqkZAYlYkD40FuH
         0rwZebgJMIgWQ7Qjr5azL+9CLPLutI9hGzM7f4x/E0hCYMnev4LEjNk8Q1YVVoN+6/Mh
         n12PjLpV3O/mK2CypLji6TvDAYLM7MVWFkEeEUHsD3PGAuzCvdCkF8acCBJwfcYhiYwb
         wV1V5rmjXxX/9d8zW70QhKVoBBPQrQe4taWlKpAIHIx3d8CEniTGoKE7N7WJS1JtsPgZ
         D6Rg==
X-Gm-Message-State: APuU4Z8lmSYcXd5H706diHF/QtxHSivmu2E8J761xSujEW2UpTr2gwkD
	f+FLM04CjXfs/s+S5/Elwzx+/TSVydlk5aaU771FRStQt6Pa8BEAI+1ehUCSgtsK17WwZkjwzYK
	OsWdpIYU=
X-Gm-Gg: AZFdTZef99VDy68Uhyk3cg1RnAXjcEP4bx9YgxJvJauMCFcxYqapu/itmVSJSl1py15
	FwudoiOs4pNYH2Fb8LRv3W+8ANZLWyis2/LW4tmEejprfJDmYkLAFvwDG9PIdcZEx0z4EKWiXHm
	cKWhzqlkCmVct6G08RSDiVBRFu+NASjVV3il6n2CbyIPAk31srIv1VbcY2XynoMs9ZLpKCw9V7k
	NeyLdPcFOqcHb84Zknvc77ijBVyRfhII6BmN2bKgAwjyn7S0YQDKt3eG5IgzZ0VZa3Vpg72E8Fx
	Jw0lQ9jaLZWauz0wz2fIsr6KZEEzaphUlnH8gFNjpQAuC6UpwOvzJAJPT8eGc1JKh1dLac1NKYS
	idu8g5MixmcAQD1mYYdl30Bjss2OtXa4omn1HEMXSlQZxZnTiHBpIKkh6nPtya+Iipd0OQ12gyh
	U+82Kjz2lCSAWu4eSwB2qruN0abi8rLTi0eLI/yb7LeHJddT6Zew2z/OhEOHAUETGg48dSxQ263
	hR6uaNTrIPmaiGw8mn1QgwsofxNpY5VUy9uOeN3A1Hi7QClL2D1A/I3lp9R7ua63GDh1XMtFarC
	3/OhfhsUIkVn10Yd79kYu5ncpqq0oxDH
X-Received: by 2002:a05:690c:6990:b0:8a9:e801:231c with SMTP id 00721157ae682-8b4fecfa8f1mr13807737b3.20.1795044809832;
        Wed, 18 Nov 2026 15:33:29 -0800 (PST)
From: Benjamin Leggett <benjamin@edera.io>
Date: Wed, 18 Nov 2026 18:33:20 -0500
Subject: [PATCH] xen/xenbus: don't deliver user replies under
 msgbuffer_mutex
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-bleggett-xenbus-transactions-mutex-v1-1-6669e3f54955@edera.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrDIAwA0KtIvhtWhZXhVcY+1KY20KXDaBFK7
 z62C7x3glJhUvDmhEIHK+8C3tjBQFqDZEKewRtwo5ustQ+MG+VMtWIniU2xliAaUuVdFN+tUsc
 U3OzGyd0XO8Jg4FNo4f5Pnq/BQAxKGEuQtP7oTnLbWFpHoV7hur6c6XP6lQAAAA==
X-Change-ID: 20261118-bleggett-xenbus-transactions-mutex-ca2d20625f10
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Benjamin Leggett <benjamin@edera.io>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044808; l=6966;
 i=benjamin@edera.io; s=20260806; h=from:subject:message-id;
 bh=ikAauzb6a0/TX+AaZ3i5klnB/Enh22StcWv0nCHLJ5c=;
 b=RLLXy9iwdkw+0NAICJ6pY0UIbDJdVn2v9NrZpZkeQU7PkoPiDhV/PNyblSYbIINtz6MdRSlDM
 0Xgqwz+KA+EARPVQkN4W8z0ZLukGG01j+JOACoSonNQgjxlcKjV4Z/6
X-Developer-Key: i=benjamin@edera.io; a=ed25519;
 pk=prj3m3DtYeYw1akLHnM/sXm8eau0Ar/IO93YoYnOr+I=
X-purgate-ID: tlsNG-c1860d/1795044811-CDD4887B-D4C61E43/0/0
X-purgate-type: clean
X-purgate-size: 6968
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Found this while testing, and wrote a little reproducer. Seems like the
guest kernel's xenbus thread is stuck waiting for a lock, so no xenstore
replies reach the guest once this happens.

The lock involved, from what I can tell, is u->msgbuffer_mutex in
drivers/xen/xenbus/xenbus_dev_frontend.c:

- xenbus_file_write() takes the lock. For XS_WATCH/XS_UNWATCH it keeps
  the lock while it waits for the xenstored reply
  (unregister_xenbus_watch() -> xs_talkv).

- xenbus_dev_queue_reply() takes the same lock. The xenbus thread
  calls it to deliver the reply of an earlier request on the same fd.

So if a fd still has a request waiting for its reply when it gets an
(UN)WATCH, the (UN)WATCH holds the lock and waits for the xenbus thread.
The xenbus thread waits for the lock, and at this point the whole guest
xenstore connection stops.

  sysrq: Show Blocked State
  task:xenbus          state:D stack:14672 pid:42
   __mutex_lock.constprop.0+0x3a2/0x9e0
   xenbus_dev_queue_reply+0x49/0x330
   xenbus_thread+0x221/0xa40
   kthread+0xff/0x250
  task:xenbus-unwatch- state:D stack:12760 pid:1353
   xs_talkv+0x27d/0x3a0
   unregister_xenbus_watch+0x171/0x320
   xenbus_file_write+0x491/0x670
   vfs_write+0x109/0x460
   ksys_write+0xc8/0xf0

This is reproducible by opening /dev/xen/xenbus, writing an XS_WATCH for
any path, then on the same fd write an XS_READ for that path followed by
an XS_UNWATCH, without reading the READ reply first.

Fix is the following:
 - xenbus_dev_queue_reply() needed the lock only for the transactions
   list.
 - That list now has its own mutex, taken in xenbus_write_transaction()
   and xenbus_dev_queue_reply().
 - xenbus_worker() keeps walking the list without a lock, because it
   runs after the last reference is gone.

On an unpatched guest kernel the first XS_UNWATCH never returns, and the
guest's watches stop firing. With this patch, a guest kernel built with
CONFIG_PROVE_LOCKING=y completes 100000 such rounds without a stall, and
lockdep stays enabled with the new lock ordered between the existing two:

  /proc/lockdep_stats:
   debug_locks:                             1
  /proc/lockdep:
   &u->msgbuffer_mutex
    -> &u->reply_mutex
    -> &u->transactions_mutex
   &u->transactions_mutex
    -> &u->reply_mutex

Fixes: fd8aa9095a95 ("xen: optimize xenbus driver for multiple concurrent xenstore accesses")
Cc: stable@vger.kernel.org
Signed-off-by: Benjamin Leggett <benjamin@edera.io>
---
 drivers/xen/xenbus/xenbus_dev_frontend.c | 46 ++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_dev_frontend.c b/drivers/xen/xenbus/xenbus_dev_frontend.c
index 61db6932a9d2..92ddc37311cf 100644
--- a/drivers/xen/xenbus/xenbus_dev_frontend.c
+++ b/drivers/xen/xenbus/xenbus_dev_frontend.c
@@ -89,8 +89,12 @@ struct xenbus_file_priv {
 	/*
 	 * msgbuffer_mutex is held while partial requests are built up
 	 * and complete requests are acted on.  It therefore protects
-	 * the "transactions" and "watches" lists, and the partial
-	 * request length and buffer.
+	 * the "watches" list, and the partial request length and buffer.
+	 *
+	 * transactions_mutex protects the "transactions" list.  It nests
+	 * inside msgbuffer_mutex, and xenbus_thread takes it alone to
+	 * deliver a reply, so a (UN)WATCH that holds msgbuffer_mutex
+	 * while it waits on xenbus_thread cannot stall that delivery.
 	 *
 	 * reply_mutex protects the reply being built up to return to
 	 * usermode.  It nests inside msgbuffer_mutex but may be held
@@ -99,6 +103,7 @@ struct xenbus_file_priv {
 	struct mutex msgbuffer_mutex;
 
 	/* In-progress transactions */
+	struct mutex transactions_mutex;
 	struct list_head transactions;
 
 	/* Active watches. */
@@ -369,7 +374,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 
 	xs_request_exit(req);
 
-	mutex_lock(&u->msgbuffer_mutex);
+	mutex_lock(&u->transactions_mutex);
 
 	if (req->type == XS_TRANSACTION_START) {
 		trans = xenbus_get_transaction(u, 0);
@@ -391,7 +396,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 		kfree(trans);
 	}
 
-	mutex_unlock(&u->msgbuffer_mutex);
+	mutex_unlock(&u->transactions_mutex);
 
 	mutex_lock(&u->reply_mutex);
 	rc = queue_reply(&staging_q, &req->msg, sizeof(req->msg));
@@ -413,7 +418,7 @@ void xenbus_dev_queue_reply(struct xb_req_data *req)
 	return;
 
  out:
-	mutex_unlock(&u->msgbuffer_mutex);
+	mutex_unlock(&u->transactions_mutex);
 }
 
 static int xenbus_command_reply(struct xenbus_file_priv *u,
@@ -453,6 +458,8 @@ static int xenbus_write_transaction(unsigned msg_type,
 		char body[];
 	} *msg = (void *)u->u.buffer;
 
+	mutex_lock(&u->transactions_mutex);
+
 	if (msg_type == XS_TRANSACTION_START) {
 		trans = kzalloc_obj(*trans);
 		if (!trans) {
@@ -462,24 +469,27 @@ static int xenbus_write_transaction(unsigned msg_type,
 		trans->generation_id = xb_dev_generation_id;
 		list_add(&trans->list, &u->transactions);
 	} else if (msg->hdr.tx_id != 0 &&
-		   !xenbus_get_transaction(u, msg->hdr.tx_id))
-		return xenbus_command_reply(u, XS_ERROR, "ENOENT");
-	else if (msg_type == XS_TRANSACTION_END &&
-		 !(msg->hdr.len == 2 &&
-		   (!strcmp(msg->body, "T") || !strcmp(msg->body, "F"))))
-		return xenbus_command_reply(u, XS_ERROR, "EINVAL");
-	else if (msg_type == XS_TRANSACTION_END) {
+		   !xenbus_get_transaction(u, msg->hdr.tx_id)) {
+		rc = xenbus_command_reply(u, XS_ERROR, "ENOENT");
+		goto out;
+	} else if (msg_type == XS_TRANSACTION_END &&
+		   !(msg->hdr.len == 2 &&
+		     (!strcmp(msg->body, "T") || !strcmp(msg->body, "F")))) {
+		rc = xenbus_command_reply(u, XS_ERROR, "EINVAL");
+		goto out;
+	} else if (msg_type == XS_TRANSACTION_END) {
 		trans = xenbus_get_transaction(u, msg->hdr.tx_id);
 		if (trans && trans->generation_id != xb_dev_generation_id) {
 			list_del(&trans->list);
 			kfree(trans);
 			if (!strcmp(msg->body, "T"))
-				return xenbus_command_reply(u, XS_ERROR,
-							    "EAGAIN");
+				rc = xenbus_command_reply(u, XS_ERROR,
+							  "EAGAIN");
 			else
-				return xenbus_command_reply(u,
-							    XS_TRANSACTION_END,
-							    "OK");
+				rc = xenbus_command_reply(u,
+							  XS_TRANSACTION_END,
+							  "OK");
+			goto out;
 		}
 	}
 
@@ -490,6 +500,7 @@ static int xenbus_write_transaction(unsigned msg_type,
 	}
 
 out:
+	mutex_unlock(&u->transactions_mutex);
 	return rc;
 }
 
@@ -669,6 +680,7 @@ static int xenbus_file_open(struct inode *inode, struct file *filp)
 
 	mutex_init(&u->reply_mutex);
 	mutex_init(&u->msgbuffer_mutex);
+	mutex_init(&u->transactions_mutex);
 
 	filp->private_data = u;
 

---
base-commit: 2b66f2cc753243a6adb3e9a5c038b0fc59ba7ec9
change-id: 20261118-bleggett-xenbus-transactions-mutex-ca2d20625f10

Best regards,
-- 
Benjamin Leggett <benjamin@edera.io>


