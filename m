Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C54606D80F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pYzibUXI
Received: from list by lists.xenproject.org with outflank-mailman.1468931.1677934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gb-000784-Cr; Tue, 03 Nov 2026 02:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468931.1677934; Tue, 03 Nov 2026 02:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gb-00077x-AH; Tue, 03 Nov 2026 02:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1468931;
 Tue, 03 Nov 2026 02:28:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4GZ-0006y7-J7
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4GZ-00CYCC-0A
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:51 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae94690-e002-0a2a0a5209dd-0a2a450cec40-12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:50 +0100
Received: from [209.85.160.180] (helo=mail-qt1-f180.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946e1-f479-0a2a450c0019-d155a0b4ac6d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:50 +0100
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-5363c8de563so45361171cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:50 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498b49dcbasm13852001cf.6.2026.11.02.18.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:48 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793672929; x=1794277729; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ozleYq79PAzQSOQnNjxaTI69FhB0adJYpSCNMdxkqo=;
        b=pYzibUXI1/oW5S55eD6PggpE28QTzPpONH/OD5Ss/E5yD8cTVAy8JFC58b/XXuhtCq
         vz+Gdw4xp0HX3tFzzpZdzd+RzFmrX902jrF0lgZcRPIW/4rYTcjVKlBZ2nFVZiajyplK
         Ex1LP611Y4oChvBi5lTVOxnNonknTQiNk0otv2PosX751dqVO9OUWdTT9aTKK570oobJ
         DTBXIJ7lSIUPGS7jDYbLDVmGkc3OnnO6cN4w6pUl4ga8Oa8a93Lw+3HnNTYN/dDi/E14
         FGcRpF/aSKAY13YOhExfl1HG9OHuis9f2BfgRTwVh7l7x/otsO0ySJzCIvblKP+MAtTh
         21dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672929; x=1794277729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ozleYq79PAzQSOQnNjxaTI69FhB0adJYpSCNMdxkqo=;
        b=mfC9m6VyXXWOzTJrM1doxVP+O/0CSRAwErk1WBzUX3iNzk6jnDdHiBQYtTD2HVrcoK
         3uwo+UD8kTsk2S6r4Eix165HxXLwkkOXKycI01MzPWUbTfSV8TdZePOdv6lpCOwfORw2
         7DA6uaR2svuLFPqlm9c6DqA6g5SJyM6aX7AuBPkzAXG1fMUkkxhbH1PZOzSPhQWkkk3R
         6xRyOaZL6EB3Om2bOLtHeyQvcGYakCB8yEe/SgobyUk1vl9mws493MLyF25sbgLGUfn8
         K7Abdzu+/tWpoOQD1xMEP/zLQJCpmYW6hSOrNLiSHH44DF+CN0PuN/h+W9v2+j9cuJuX
         KJIw==
X-Forwarded-Encrypted: i=1; AKwUvBwiXTNUYpc1Bpz2K9omtTwN7ZYd4hpD3ZG3ki96GS9tUlUYp2pOOgqykXmJDYIHeT3M6f3yuRIeENE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJv4PR+/Lmrr3Y7fm2VkfvRW2COtMQ3G23dpcOOS5UNsGO8S7Vn
	0p1S8/OSmQMWh+JM+4/YyVLMbCKQnQJXim89GbTfDoYAfoPu3P20Y4A0mI+KtxOJtJQ=
X-Gm-Gg: AYBFou3ePdJnetbUbuv2SsuwxWgA9/KY9GQhGukTqAycupeFpJUb4VaNgjq4GJ80J21
	i+AOB+7CqG/fxUnHu4vDN+R4Z6plp5/Tk7vjw0f0E3Z8G/p3ZF0oq1kfqRxwnesiVOT1lw5vpnW
	w6/G8aNoU30Dphe3+QZCWPxHFGKtoI+SRtxvVUi0N+o8MNJ2KWy+vNzhEqB1S8f7vjSgZEGBt1i
	K3wmzTCBYTtRl04SICB4MyaDmRJIGmNQ/KDPnepS5/FgzJdw8OGnNiJw4Beak0Xp64JASVT73cA
	me6jcJjWDOO3xAYtQXJAf7pRFpvo59SDmQMy5aVf8OU279/VQtASEVrAwQdbhrD6J7zLrXzzkcg
	Hnz2ZRlS5mF3Ykib/q5eFxpZCrN9rQUlLbMtJtv8STEVdgL+KPEbc7vff3NjDWvdfyiWmjwimWT
	NZesJ7hfrINc93jcatjFw7HYzTwl5+ZCKfqZLTjNmtD3XeqRlypimoyPPedIui6kUihx1gWmceo
	quLpnNvvXlTFfxhzVC3T7qfwma/Md52sRWh97QABo6EfTUeYVv2t3nKDr4gFhBIa+wSytLK3s59
	O3Z9yLVz+7HbRT43u2xBGl/w9w7Ttpq+1gu/x4kpPwNOdw==
X-Received: by 2002:a05:622a:5a18:b0:535:1f5c:e489 with SMTP id d75a77b69052e-542b3c7654amr201014651cf.5.1793672929169;
        Mon, 02 Nov 2026 18:28:49 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:28 +0000
Subject: [PATCH net-next v3 02/15] net: skbuff: add skb_checksum_full()
 that reports failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-2-54ad0ab57614@toxicpanda.com>
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=7462;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=iRXaavMuCCaIGwQeEKD5PODE5O9BI1CI4qAS/RRmb+g=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFbzfrMZOtH7r3Qw/39UwgOlx0VaLuRXbKWQmLqAJvZ0BPoJPrHv+hz+CnhxLSOHCSomsdC80Mi
 ocS25mNUyyQs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793672930-51936A5B-BF37BC5E/0/0
X-purgate-type: clean
X-purgate-size: 7464
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_checksum() can't fail.  When the range runs into unreadable frags or
past the end of the skb, skb_checksum() returns 0, which is also a valid
checksum, so its callers can't tell a sum from a failure.

Add skb_checksum_full(), which adds the range's sum to *@csump and
returns 0.  On failure it leaves *@csump alone and returns -EFAULT, or
-EINVAL for a negative length.  It is __must_check.  Its frag_list loop
sits in a noinline function so that taking the address of a local
doesn't give skb_checksum_full() a stack protector.

skb_checksum() becomes a wrapper for the callers that aren't converted
yet, and still returns 0 on failure.  Three things change for them:

 - When a frag_list member fails, skb_checksum() returns 0 for the whole
   range instead of the sum of the parts it could read.  Neither value
   is the checksum of the range.
 - skb_checksum() only warns about unreadable frags if @skb itself has
   them.
 - A negative length returns 0 instead of reaching csum_partial().

Convert skb_checksum_help(), which can already return an error, so that
a packet that can't be checksummed is dropped instead of sent with a
wrong checksum.  The following patches convert checksum validation,
skb_segment() and pskb_trim_rcsum().  The rest will follow per
subsystem.

Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |   2 +
 net/core/dev.c         |   7 +++-
 net/core/skbuff.c      | 111 ++++++++++++++++++++++++++++++++++++-------------
 3 files changed, 90 insertions(+), 30 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index f4c092b78006..608c1491597e 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4282,6 +4282,8 @@ int skb_copy_bits(const struct sk_buff *skb, int offset, void *to, int len);
 int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len);
 int __must_check skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 					u8 *to, int len, __wsum *csump);
+int __must_check skb_checksum_full(const struct sk_buff *skb, int offset,
+				   int len, __wsum *csump);
 int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		    struct pipe_inode_info *pipe, unsigned int len,
 		    unsigned int flags);
diff --git a/net/core/dev.c b/net/core/dev.c
index 3ac700d37e59..00a62c391056 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3665,7 +3665,7 @@ void skb_warn_bad_offload(const struct sk_buff *skb)
  */
 int skb_checksum_help(struct sk_buff *skb)
 {
-	__wsum csum;
+	__wsum csum = 0;
 	int ret = 0, offset;
 
 	if (skb->ip_summed == CHECKSUM_COMPLETE)
@@ -3697,13 +3697,16 @@ int skb_checksum_help(struct sk_buff *skb)
 			  offset, skb_headlen(skb));
 		goto out;
 	}
-	csum = skb_checksum(skb, offset, skb->len - offset, 0);
+	ret = skb_checksum_full(skb, offset, skb->len - offset, &csum);
+	if (ret)
+		goto out;
 
 	offset += skb->csum_offset;
 	if (unlikely(offset + sizeof(__sum16) > skb_headlen(skb))) {
 		DO_ONCE_LITE(skb_dump, KERN_ERR, skb, false);
 		WARN_ONCE(true, "offset+2 (%zu) > skb_headlen() (%u)\n",
 			  offset + sizeof(__sum16), skb_headlen(skb));
+		ret = -EINVAL;
 		goto out;
 	}
 	ret = skb_ensure_writable(skb, offset + sizeof(__sum16));
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 4ac2b476b0a9..c5f8aca89221 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3536,27 +3536,88 @@ int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len)
 }
 EXPORT_SYMBOL(skb_store_bits);
 
-/* Checksum skb data. */
-__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
+/* The frag_list part of skb_checksum_full().  It's out of line so that taking
+ * the address of csum2 doesn't cost every caller a stack protector.
+ */
+static noinline int skb_checksum_frag_list(const struct sk_buff *skb, int start,
+					   int offset, int len, int pos,
+					   __wsum csum, __wsum *csump)
+{
+	struct sk_buff *frag_iter;
+	int copy, err;
+
+	skb_walk_frags(skb, frag_iter) {
+		int end;
+
+		WARN_ON(start > offset + len);
+
+		end = start + frag_iter->len;
+		copy = end - offset;
+		if (copy > 0) {
+			__wsum csum2 = 0;
+
+			if (copy > len)
+				copy = len;
+			err = skb_checksum_full(frag_iter, offset - start, copy,
+						&csum2);
+			if (err)
+				return err;
+			csum = csum_block_add(csum, csum2, pos);
+			len -= copy;
+			if (len == 0)
+				goto out;
+			offset += copy;
+			pos    += copy;
+		}
+		start = end;
+	}
+	if (unlikely(len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EFAULT;
+	}
+out:
+	*csump = csum;
+	return 0;
+}
+
+/**
+ *	skb_checksum_full - checksum a range of an skb
+ *	@skb: buffer to checksum
+ *	@offset: offset in @skb to start at
+ *	@len: number of bytes to checksum
+ *	@csump: the sum to add to; on success the range's sum is added to it
+ *
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	runs out before @len does, or if the range goes past the linear area
+ *	of an skb, @skb or one on its frag_list, that has unreadable frags.
+ *	On failure *@csump is not changed.
+ */
+int skb_checksum_full(const struct sk_buff *skb, int offset, int len,
+		      __wsum *csump)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
-	struct sk_buff *frag_iter;
+	__wsum csum = *csump;
 	int pos = 0;
 
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
 	/* Checksum header. */
 	if (copy > 0) {
 		if (copy > len)
 			copy = len;
 		csum = csum_partial(skb->data + offset, copy, csum);
 		if ((len -= copy) == 0)
-			return csum;
+			goto out;
 		offset += copy;
 		pos	= copy;
 	}
 
-	if (WARN_ON_ONCE(!skb_frags_readable(skb)))
-		return 0;
+	if (!skb_frags_readable(skb))
+		return -EFAULT;
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
@@ -3585,37 +3646,31 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 			}
 
 			if (!(len -= copy))
-				return csum;
+				goto out;
 			offset += copy;
 		}
 		start = end;
 	}
 
-	skb_walk_frags(skb, frag_iter) {
-		int end;
+	return skb_checksum_frag_list(skb, start, offset, len, pos, csum,
+				      csump);
+out:
+	*csump = csum;
+	return 0;
+}
+EXPORT_SYMBOL(skb_checksum_full);
 
-		WARN_ON(start > offset + len);
+/* skb_checksum() has no way to report failure, so it returns 0, which is a
+ * valid checksum.  Use skb_checksum_full() in new code.
+ */
+__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
+{
+	int err = skb_checksum_full(skb, offset, len, &csum);
 
-		end = start + frag_iter->len;
-		if ((copy = end - offset) > 0) {
-			__wsum csum2;
-			if (copy > len)
-				copy = len;
-			csum2 = skb_checksum(frag_iter, offset - start, copy,
-					     0);
-			csum = csum_block_add(csum, csum2, pos);
-			if ((len -= copy) == 0)
-				return csum;
-			offset += copy;
-			pos    += copy;
-		}
-		start = end;
-	}
-	if (unlikely(len)) {
-		DEBUG_NET_WARN_ON_ONCE(1);
+	if (unlikely(err)) {
+		WARN_ON_ONCE(err == -EFAULT && !skb_frags_readable(skb));
 		return 0;
 	}
-
 	return csum;
 }
 EXPORT_SYMBOL(skb_checksum);

-- 
2.55.0


