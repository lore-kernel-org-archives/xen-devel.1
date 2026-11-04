Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF460B90AF
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=V5xN3Mfy
Received: from list by lists.xenproject.org with outflank-mailman.1472756.1680581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtj-0002fk-U2; Wed, 04 Nov 2026 20:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472756.1680581; Wed, 04 Nov 2026 20:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtj-0002fW-QK; Wed, 04 Nov 2026 20:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1472756;
 Wed, 04 Nov 2026 20:47:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhti-0002bo-2g
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:47:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhth-00FYWL-Fr
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:53 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99e8-bab6-0a2a0a5309dd-0a2a450c9a30-18
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:53 +0100
Received: from [209.85.219.52] (helo=mail-qv1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99f8-f479-0a2a450c0019-d155db34aca4-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:53 +0100
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-91c76540d0bso12576946d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:53 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e8dac2a3esm13006576d6.1.2026.11.04.12.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:51 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825272; x=1794430072; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gH271GlUICfDLFVrS64JI/r5nC3Lsa5y8Cpm0L9A1DU=;
        b=V5xN3MfyqbiSFu/dJDdo1wtIzbUIpfHKmj4mfgS3QM4exmmZUIEMV/kbpSFNMKMRuX
         iMkfdPpQwnhUtGeoB+YzBz9aCAp6t/S8xv+0n8LMvYoixpW8EyQ7A/QAF6kE1MfSXzIy
         aKCjnO+QniVQL8TTKnHyZ/MRT0gxtJ932lb6h974pN9Q+J2WJo56+IZlWGsQkCqWQZSP
         XNOFkfA7RuPrwOgbRnbLNgt5vQol9iv9Kt5uXJfbUbOlcGZneRXLQrZeF+Mj9VIYtpij
         spDsDv4UdEEa+9fnhto9Wxg6Wyn47dpyFMQYtfFRsRKDEZEa/w8HJSq5sHndehguLgpC
         OOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825272; x=1794430072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gH271GlUICfDLFVrS64JI/r5nC3Lsa5y8Cpm0L9A1DU=;
        b=Lj7Ze0nLbBEs2kmo0jK7zuUhKWXabiOuJ1lx9Vvxf0TKNgo9Gi/s/mwvvkQlCww8rL
         /Rbjaisz4Yi4kyvqoojmr6Bd/zVtCCz5s1kS0XtX/Y0QiwEjogm4X92CRcOx8R0/wAh0
         lJAH+i3S+h7qL00N/PpkCpKfpZ6wPPuAhX/nVcF/tpAnT67nOiHgSnpisc1n0ailfE9k
         e2likeOqIjB5VI6fKprJarsAESvP8lcDIiv0SNH/QTYqLwbabAeh6rsBq5ZFqc4nGLku
         14taHmR1SvL1OHVJfnfeKFIbRD/Nk7Rr/TQeV2lbCWZMggoNRT3NiZcnBmxEkL3HnEWz
         S7Rw==
X-Forwarded-Encrypted: i=1; AKwUvBwZlr/bm5HEIJCLLAWhye6R9OrSbv9VghzehrlPt6tySX58EIB5D+hWXMQlyO21abdh9lcvueuRzpQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z87Vk4s/T4AB3RR7wb3i/xazhP3qUQg3ydrR6gCqGV+AeTKQHI3
	GSQPuffQXvEhe3po32d7tfaSndsr9FHpd2u2sA/2u/hb1ziaGtOmZoTWQHr7dYAzjhk=
X-Gm-Gg: AYBFou2zxoGL4Im4F4cbC08kZw3C9hP+/FcPCFiv5Eplx91MF5++bCOUk4/YhIRprcX
	QscDX85M2zIXYF/0mZK0PFsfnPvcP2aVlSO5n/XrGqm2QEiwHdtDbWxy/vSLnnDw1CztB0qq2nw
	bBBB2Kl2i1uEMZHc5bxBi1oKVMtf3X1cUN4HS+h3nbe5ZFjlXa/EwNxgW1DhCXGkg5O1FcmE75M
	OITFh4Rlle0jESy30umLWET1DDngJBqHdvUqZLU2Z/pqYT5Rnion4Y6PtFSdfbMkdXlujDyJwBp
	oLCLAeZBW3kNgNynXo5lab2i0tbZxW9leCFyJHRxW9XinKCqMqjjOuR/8FfQz92K7saEwpR4mox
	hMOJ8HBpa8uVai/AEjCAm/28hVF84wP19gCQ4sdBrLSyThC/u09qWzSA21Ohc9faMGI/mrktAIn
	4KJwHzbQS0bpJzvgRJpV2phrwncNb0zHJfMWWz9B/9peHaylgzL0EZeDypAqFA5UdPKR3FqcqfQ
	6MaxpzMyaYXdML80Md5uv/udk12cKEkX8iTrUUlRaG8NqLUJxsChbR5L81eEL7vtsKLhsvRHZXT
	XfGTozwS//7I+sntZVIMa51FCXZjBAoukSncsWhug2/+11o+Xs2zw9vkelLc9njqchtn
X-Received: by 2002:a05:6214:5bc5:b0:91c:7da5:2185 with SMTP id 6a1803df08f44-91ca4bb4a15mr307849916d6.38.1793825271664;
        Wed, 04 Nov 2026 12:47:51 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:13 +0000
Subject: [PATCH net-next v4 01/15] net: skbuff: make
 skb_copy_and_csum_bits() report unreadable frags
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-1-b7ffeb364f5d@toxicpanda.com>
References: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
In-Reply-To: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825268; l=13813;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=EWpLlq8Mw3XxwjVP1ClwIfXj7doLlC4zD1PirZnOhYE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJqO/KYWLso78B3NTCNEG4Z4lztm1S6ZIMPwryAlJHaZV5533DWzIbtoHA2wJ0OEbED8w0X7uPN
 RS3fTmef4xAo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793825273-5093EA5B-E2411D77/0/0
X-purgate-type: clean
X-purgate-size: 13815
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

The !sg && csum branch of skb_segment() copies with skb_copy_bits() and
returns -ENOMEM when that fails.  Make it -EFAULT as well, so that both
branches report the same failure the same way.

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
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/sun/sunvnet_common.c |  10 ++-
 include/linux/skbuff.h                    |   4 +-
 net/core/skbuff.c                         | 137 ++++++++++++++++++++----------
 net/ipv4/icmp.c                           |   9 +-
 net/ipv4/ip_output.c                      |  11 ++-
 net/ipv6/icmp.c                           |   7 +-
 net/ipv6/ip6_output.c                     |  11 ++-
 net/sunrpc/socklib.c                      |   9 +-
 8 files changed, 130 insertions(+), 68 deletions(-)

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
index 48f676411724..f52b0717e4da 100644
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
+
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
 
-__wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
-				    u8 *to, int len)
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
@@ -5057,16 +5098,20 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
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
-				if (skb_copy_bits(head_skb, offset, skb_put(nskb, len), len))
+				if (skb_copy_bits(head_skb, offset, skb_put(nskb, len), len)) {
+					err = -EFAULT;
 					goto err;
+				}
 			}
 			continue;
 		}
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


