Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2EB606A330
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ME9Kaolz
Received: from list by lists.xenproject.org with outflank-mailman.1468930.1677926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4GZ-0006ut-78; Tue, 03 Nov 2026 02:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468930.1677926; Tue, 03 Nov 2026 02:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4GZ-0006um-3Z; Tue, 03 Nov 2026 02:28:51 +0000
Received: by outflank-mailman (input) for mailman id 1468930;
 Tue, 03 Nov 2026 02:28:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4GX-0006hu-TF
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4GX-009OZN-9z
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:49 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946df-bab6-0a2a0a5309dd-0a2a4502d736-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:49 +0100
Received: from [209.85.160.173] (helo=mail-qt1-f173.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946e0-6ca4-0a2a45020019-d155a0adb96a-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:48 +0100
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-5361e313e63so42598121cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:48 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498b49ce29sm13831151cf.4.2026.11.02.18.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:46 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672927; x=1794277727; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItNbbfoSMigin0nEzX5YnYh+yWL40HL4VuZt49ucLwc=;
        b=ME9KaolzjM0pMPlIz3gPR06dtDMkJRZTKvVMdA+uQesc+qSHd3VOt9hmJaDBbSmkpL
         ypG8vlsPOYZOyKCFY5cI86mIH4FlQK+oF7PpCvB38f6marJ80lRrXs2uN46RaY9p6udu
         dqqNyYVomtxrDs2MUHZc7iQm16qXmbcrBW12wejqAO1k09/6eo1jC8GZLfDAXv6A0JZN
         x+SUU4/ygwsjBbL7ll6MzCrHOQ6Nlf1T7IM8vK1zUNrrgYjrLbuABnO3pcR5LLyG5hQO
         lyxKy1kqBm2JQ3Bf8sisxamQ37ri2+mLcTKqmDFP84jvKHhLkVvxT6NZc014K7GWle6i
         Qu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672927; x=1794277727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItNbbfoSMigin0nEzX5YnYh+yWL40HL4VuZt49ucLwc=;
        b=T6wDgHnoF1UZFrxH/6SvlzZ1NC0nAlLirwN43RN6DJ9QRe/2Yid8NBxDPbQn+BHbYG
         S1Tw7UBQvmkqqUnpDjB1yGn+RpTl9i17lKHUihyeDlDFKWQi//3fH5TMH4XWjDCr90h+
         dKsNRxY8Gc4TH9/Wltt5rBULnGsJ+yr1CL3kKXmzwOYBA7I9PZRRkUZ4ZvRjUPDNLEAL
         I6mD5oUe8rdlgJIXkU1h6PKNhc2i9w/A8MTAF5gqKTO/39SCD8nrNRtw7AxJ9tXVe3BO
         Rg/+vZU9NRWuubTL4mQcvQA8vsMJgL/vDwwNrpxx2ZSyu0bQB/3GhubVEyTwnt437r29
         YamQ==
X-Forwarded-Encrypted: i=1; AKwUvByjQ/ZXRZXwjeggghgTZTfddp5H9YYLFgbtShEcKO9k8sDOGpsLg1CmAqCJXJR3HmjpuactVFV3XKI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL0PpZVWoq7XwyyGzsar0Rx/l9fI5ED48ZUqYWgPsE04J/044L6
	Q21DvyqY/WSGtG/44Jok2dcu0P+tDTTwN8RBZQEjvBVMzuUENoZR7EiOYVAQ+zZP470=
X-Gm-Gg: AYBFou2j0k0Rg8rkugt55np+K2DBMV8FHvuq2HnJqWx64zti0wT+oaC045XmdpDGdph
	t0b8NLQJwybcG2dxuV3ZUuaxq1QCeH8xRdNSeHNHIYZRQdJtp+RBYsBjVisdmG25sh3oLFa8SCB
	bDUtd0sWG3Wmv82AnCgJXkNV7yoGmY0XpAuUsG85n09iZihN8qFoK5pSqHOPotpCTi6Z2/D2V8/
	V9NumNkUyMJezVCyqwE/r6CKKmwfKmQjcEy5WGfHKaxhrzupEwXvW4ZzFnrPRt6VvxarmrEdyi7
	+LuwnG/DxzB+/N5VJV1Bu41jGIsxKLZZTX5URQJF/v2lsjTsSoJeogpa5hxyZo0HibJ9rMVs612
	SdLXbvZQmIFfqMevonZ/F/UwX2tjCS4GsmLB8RfVD/uNcIWa518Bwqdvr1tUmqY4MdbADaHiOs4
	P3jMoTQjne1YmFPXtIDKisgqkCQXMf3jroUuWrI9T5vSXbXsSkhCRFDOj6M7ZGOPppJ2UA8Zf57
	5XM9to3LUoC+UfHMl7VSGPgMCJo7AlYiImvOJYfsDjzroxcO+Xwk4MfS47wu8EulxXM9evdqll2
	PSaFVAG0Y8IWX4KJRg8BVqbK8oUpZm2tGlgnYz+qzQb/Gg==
X-Received: by 2002:a05:622a:394:b0:536:699d:9a1c with SMTP id d75a77b69052e-542b3979709mr204371611cf.2.1793672927274;
        Mon, 02 Nov 2026 18:28:47 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:27 +0000
Subject: [PATCH net-next v3 01/15] net: skbuff: make
 skb_copy_and_csum_bits() report unreadable frags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-1-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=13352;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=+G2u4WuzqFRwukhQ5bvu8a1h5fsGccFSEyEcvJUXbLo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHioHkzRf9qW/+GyWuZtNQbmDIwqaFZOeLV1PK/nMSdeCk5HhZyyNtfxFqCDDkBgs6hQVxRSgTd
 IkeyQ2Cw97w8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1793672929-F16AF2AC-A8D3A098/0/0
X-purgate-type: clean
X-purgate-size: 13354
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_copy_and_csum_bits() has no way to fail.  When it reaches unreadable
frags, or runs out of skb before @len, it zero-fills the rest of the
buffer and returns 0.  Its callers can't tell that the copy didn't
happen.

In the !sg && !csum branch of skb_segment() that turns a devmem TCP
payload into zeroes under a valid TCP checksum, and the peer accepts
them as stream data.  It takes a device with both SG and TX checksum
offload turned off.  A test module that segments an skb with 3000 bytes
in an unreadable frag gets 3 all-zero segments before this patch and
-EFAULT after it.

Return 0 or -EFAULT, hand the checksum back through a pointer, and mark
the function __must_check.  Every caller takes the error path it already
has for a failed copy.  skb_copy_and_csum_dev() can't return an error,
so it zeroes the whole frame.  csum_partial_copy_to_xdr() no longer
checksums the bytes it didn't copy.  That only ran when the function was
about to fail anyway, and skb_checksum() warns on an unreadable skb.

The frag_list loop takes the address of a local, so it moves into a
noinline function to keep a stack protector out of
skb_copy_and_csum_bits().

Found by the Sashiko AI review of commit ab9414ed70bd ("net: skbuff:
don't leave stale bytes in skb_copy_and_csum_bits()").

Fixes: ab9414ed70bd ("net: skbuff: don't leave stale bytes in skb_copy_and_csum_bits()")
Fixes: 417261779eab ("net: skbuff: don't BUG() on leftover length in skb_copy_and_csum_bits()")
Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Link: https://lore.kernel.org/all/179148235783.434549.14322374227477832817@kernel.org/
Suggested-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/sun/sunvnet_common.c |  10 ++-
 include/linux/skbuff.h                    |   4 +-
 net/core/skbuff.c                         | 133 ++++++++++++++++++++----------
 net/ipv4/icmp.c                           |   9 +-
 net/ipv4/ip_output.c                      |  11 ++-
 net/ipv6/icmp.c                           |   7 +-
 net/ipv6/ip6_output.c                     |  11 ++-
 net/sunrpc/socklib.c                      |   9 +-
 8 files changed, 127 insertions(+), 67 deletions(-)

diff --git a/drivers/net/ethernet/sun/sunvnet_common.c b/drivers/net/ethernet/sun/sunvnet_common.c
index 5cca95869052..4f229fcecc32 100644
--- a/drivers/net/ethernet/sun/sunvnet_common.c
+++ b/drivers/net/ethernet/sun/sunvnet_common.c
@@ -1167,9 +1167,13 @@ static inline struct sk_buff *vnet_skb_shape(struct sk_buff *skb, int ncookies)
 
 			/* copy the rest, with csum calculation */
 			*(__sum16 *)(skb->data + offset) = 0;
-			csum = skb_copy_and_csum_bits(skb, start,
-						      nskb->data + start,
-						      skb->len - start);
+			if (skb_copy_and_csum_bits(skb, start,
+						   nskb->data + start,
+						   skb->len - start, &csum)) {
+				dev_kfree_skb(nskb);
+				dev_kfree_skb(skb);
+				return NULL;
+			}
 
 			/* add in the header checksums */
 			if (skb->protocol == htons(ETH_P_IP)) {
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e..f4c092b78006 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4280,8 +4280,8 @@ void skb_free_datagram(struct sock *sk, struct sk_buff *skb);
 int skb_kill_datagram(struct sock *sk, struct sk_buff *skb, unsigned int flags);
 int skb_copy_bits(const struct sk_buff *skb, int offset, void *to, int len);
 int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len);
-__wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset, u8 *to,
-			      int len);
+int __must_check skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
+					u8 *to, int len, __wsum *csump);
 int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		    struct pipe_inode_info *pipe, unsigned int len,
 		    unsigned int flags);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 48f676411724..4ac2b476b0a9 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3620,14 +3620,74 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 }
 EXPORT_SYMBOL(skb_checksum);
 
-/* Both of above in one bottle. */
+/* The frag_list part of skb_copy_and_csum_bits().  It's out of line so that
+ * taking the address of csum2 doesn't cost every caller a stack protector.
+ */
+static noinline int skb_copy_and_csum_frag_list(const struct sk_buff *skb,
+						int start, int offset, u8 *to,
+						int len, int pos, __wsum csum,
+						__wsum *csump)
+{
+	struct sk_buff *frag_iter;
+	int copy, err;
 
-__wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
-				    u8 *to, int len)
+	skb_walk_frags(skb, frag_iter) {
+		__wsum csum2;
+		int end;
+
+		WARN_ON(start > offset + len);
+
+		end = start + frag_iter->len;
+		copy = end - offset;
+		if (copy > 0) {
+			if (copy > len)
+				copy = len;
+			err = skb_copy_and_csum_bits(frag_iter, offset - start,
+						     to, copy, &csum2);
+			if (err) {
+				/* The child zeroed its part; zero the rest. */
+				memset(to + copy, 0, len - copy);
+				return err;
+			}
+			csum = csum_block_add(csum, csum2, pos);
+			len -= copy;
+			if (len == 0)
+				goto out;
+			offset += copy;
+			to     += copy;
+			pos    += copy;
+		}
+		start = end;
+	}
+	if (unlikely(len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		/* Don't hand the caller a buffer with stale bytes in it. */
+		if (len > 0)
+			memset(to, 0, len);
+		return -EFAULT;
+	}
+out:
+	*csump = csum;
+	return 0;
+}
+
+/**
+ *	skb_copy_and_csum_bits - copy data out of an skb and checksum it
+ *	@skb: source buffer
+ *	@offset: offset in @skb to start copying from
+ *	@to: destination buffer
+ *	@len: number of bytes to copy
+ *	@csump: where to store the checksum of the copied bytes
+ *
+ *	Return: 0 on success, or -EFAULT if @skb has unreadable frags or runs
+ *	out before @len does.  On failure *@csump is not set and the part of
+ *	@to that couldn't be filled is zeroed.
+ */
+int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
+			   u8 *to, int len, __wsum *csump)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
-	struct sk_buff *frag_iter;
 	int pos = 0;
 	__wsum csum = 0;
 
@@ -3638,7 +3698,7 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 		csum = csum_partial_copy_nocheck(skb->data + offset, to,
 						 copy);
 		if ((len -= copy) == 0)
-			return csum;
+			goto out;
 		offset += copy;
 		to     += copy;
 		pos	= copy;
@@ -3648,7 +3708,7 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 		/* Don't hand the caller a buffer with stale bytes in it. */
 		if (len > 0)
 			memset(to, 0, len);
-		return 0;
+		return -EFAULT;
 	}
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
@@ -3680,43 +3740,18 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 			}
 
 			if (!(len -= copy))
-				return csum;
+				goto out;
 			offset += copy;
 			to     += copy;
 		}
 		start = end;
 	}
 
-	skb_walk_frags(skb, frag_iter) {
-		__wsum csum2;
-		int end;
-
-		WARN_ON(start > offset + len);
-
-		end = start + frag_iter->len;
-		if ((copy = end - offset) > 0) {
-			if (copy > len)
-				copy = len;
-			csum2 = skb_copy_and_csum_bits(frag_iter,
-						       offset - start,
-						       to, copy);
-			csum = csum_block_add(csum, csum2, pos);
-			if ((len -= copy) == 0)
-				return csum;
-			offset += copy;
-			to     += copy;
-			pos    += copy;
-		}
-		start = end;
-	}
-	if (unlikely(len)) {
-		DEBUG_NET_WARN_ON_ONCE(1);
-		/* Don't hand the caller a buffer with stale bytes in it. */
-		if (len > 0)
-			memset(to, 0, len);
-		return 0;
-	}
-	return csum;
+	return skb_copy_and_csum_frag_list(skb, start, offset, to, len, pos,
+					   csum, csump);
+out:
+	*csump = csum;
+	return 0;
 }
 EXPORT_SYMBOL(skb_copy_and_csum_bits);
 
@@ -4001,9 +4036,15 @@ void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to)
 	skb_copy_from_linear_data(skb, to, csstart);
 
 	csum = 0;
-	if (csstart != skb->len)
-		csum = skb_copy_and_csum_bits(skb, csstart, to + csstart,
-					      skb->len - csstart);
+	if (csstart != skb->len &&
+	    skb_copy_and_csum_bits(skb, csstart, to + csstart,
+				   skb->len - csstart, &csum)) {
+		/* Send zeroes rather than intact headers on a payload that
+		 * couldn't be copied.
+		 */
+		memset(to, 0, skb->len);
+		return;
+	}
 
 	if (skb->ip_summed == CHECKSUM_PARTIAL) {
 		long csstuff = csstart + skb->csum_offset;
@@ -5057,11 +5098,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 			if (!csum) {
 				if (!nskb->remcsum_offload)
 					nskb->ip_summed = CHECKSUM_NONE;
-				SKB_GSO_CB(nskb)->csum =
-					skb_copy_and_csum_bits(head_skb, offset,
-							       skb_put(nskb,
-								       len),
-							       len);
+				if (skb_copy_and_csum_bits(head_skb, offset,
+							   skb_put(nskb, len),
+							   len,
+							   &SKB_GSO_CB(nskb)->csum)) {
+					err = -EFAULT;
+					goto err;
+				}
 				SKB_GSO_CB(nskb)->csum_start =
 					skb_headroom(nskb) + doffset;
 			} else {
diff --git a/net/ipv4/icmp.c b/net/ipv4/icmp.c
index 90c0e22c29be..35008785e3d2 100644
--- a/net/ipv4/icmp.c
+++ b/net/ipv4/icmp.c
@@ -364,12 +364,15 @@ static int icmp_glue_bits(void *from, char *to, int offset, int len, int odd,
 	DEFINE_RAW_FLEX(struct icmp_bxm, icmp_param, replyopts.opt.__data,
 			IP_OPTIONS_DATA_FIXED_SIZE);
 	__wsum csum;
+	int err;
 
 	icmp_param = from;
 
-	csum = skb_copy_and_csum_bits(icmp_param->skb,
-				      icmp_param->offset + offset,
-				      to, len);
+	err = skb_copy_and_csum_bits(icmp_param->skb,
+				     icmp_param->offset + offset,
+				     to, len, &csum);
+	if (err)
+		return err;
 
 	skb->csum = csum_block_add(skb->csum, csum, odd);
 	if (icmp_param->data.icmph.type <= NR_ICMP_TYPES &&
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 3396f177a18d..f7da4538d05b 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -1162,9 +1162,14 @@ static int __ip_append_data(struct sock *sk,
 			data += fragheaderlen + exthdrlen;
 
 			if (fraggap) {
-				skb->csum = skb_copy_and_csum_bits(
-					skb_prev, maxfraglen,
-					data + transhdrlen, fraggap);
+				if (skb_copy_and_csum_bits(skb_prev, maxfraglen,
+							   data + transhdrlen,
+							   fraggap,
+							   &skb->csum)) {
+					err = -EFAULT;
+					kfree_skb(skb);
+					goto error;
+				}
 				skb_prev->csum = csum_sub(skb_prev->csum,
 							  skb->csum);
 				data += fraggap;
diff --git a/net/ipv6/icmp.c b/net/ipv6/icmp.c
index a95b0351824f..31ca3da80b1f 100644
--- a/net/ipv6/icmp.c
+++ b/net/ipv6/icmp.c
@@ -322,9 +322,12 @@ static int icmpv6_getfrag(void *from, char *to, int offset, int len, int odd, st
 	struct icmpv6_msg *msg = (struct icmpv6_msg *) from;
 	struct sk_buff *org_skb = msg->skb;
 	__wsum csum;
+	int err;
 
-	csum = skb_copy_and_csum_bits(org_skb, msg->offset + offset,
-				      to, len);
+	err = skb_copy_and_csum_bits(org_skb, msg->offset + offset,
+				     to, len, &csum);
+	if (err)
+		return err;
 	skb->csum = csum_block_add(skb->csum, csum, odd);
 	if (!(msg->type & ICMPV6_INFOMSG_MASK))
 		nf_ct_attach(skb, org_skb);
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 25fe0ba98b1a..d259e7dca8ba 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1724,9 +1724,14 @@ static int __ip6_append_data(struct sock *sk,
 			skb->transport_header = (skb->network_header +
 						 fragheaderlen);
 			if (fraggap) {
-				skb->csum = skb_copy_and_csum_bits(
-					skb_prev, maxfraglen,
-					data + transhdrlen, fraggap);
+				if (skb_copy_and_csum_bits(skb_prev, maxfraglen,
+							   data + transhdrlen,
+							   fraggap,
+							   &skb->csum)) {
+					err = -EFAULT;
+					kfree_skb(skb);
+					goto error;
+				}
 				skb_prev->csum = csum_sub(skb_prev->csum,
 							  skb->csum);
 				data += fraggap;
diff --git a/net/sunrpc/socklib.c b/net/sunrpc/socklib.c
index d8d8842c7de5..5d780ad4ae3a 100644
--- a/net/sunrpc/socklib.c
+++ b/net/sunrpc/socklib.c
@@ -49,7 +49,9 @@ xdr_skb_read_bits(struct xdr_skb_reader *desc, void *to, size_t len)
 	if (desc->need_checksum) {
 		__wsum csum;
 
-		csum = skb_copy_and_csum_bits(desc->skb, desc->offset, to, len);
+		if (unlikely(skb_copy_and_csum_bits(desc->skb, desc->offset,
+						    to, len, &csum)))
+			return 0;
 		desc->csum = csum_block_add(desc->csum, csum, desc->offset);
 	} else {
 		if (unlikely(skb_copy_bits(desc->skb, desc->offset, to, len)))
@@ -142,11 +144,6 @@ int csum_partial_copy_to_xdr(struct xdr_buf *xdr, struct sk_buff *skb)
 	desc.csum = csum_partial(skb->data, desc.offset, skb->csum);
 	if (xdr_partial_copy_from_skb(xdr, &desc) < 0)
 		return -1;
-	if (desc.offset != skb->len) {
-		__wsum csum2;
-		csum2 = skb_checksum(skb, desc.offset, skb->len - desc.offset, 0);
-		desc.csum = csum_block_add(desc.csum, csum2, desc.offset);
-	}
 	if (desc.count)
 		return -1;
 	if (csum_fold(desc.csum))

-- 
2.55.0


