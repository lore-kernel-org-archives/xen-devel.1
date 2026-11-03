Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E1606A33B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OpGGdEmw
Received: from list by lists.xenproject.org with outflank-mailman.1468936.1677970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gj-00087i-Fb; Tue, 03 Nov 2026 02:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468936.1677970; Tue, 03 Nov 2026 02:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gj-00087X-C2; Tue, 03 Nov 2026 02:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1468936;
 Tue, 03 Nov 2026 02:28:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gh-0007sy-If
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gg-00143l-Vu
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:58 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae9469c-2eae-0a2a0a5409dd-0a2a4504d6de-38
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:58 +0100
Received: from [209.85.222.178] (helo=mail-qk1-f178.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946ea-b57f-0a2a45040019-d155deb2d447-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:58 +0100
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-93cc1ab5f6cso443009785a.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:58 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-945c1757d8fsm183190485a.2.2026.11.02.18.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:56 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672937; x=1794277737; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzfHr7VS3R55wgwqyUPsK6dja/9+8+R/PoE9WBcM+FY=;
        b=OpGGdEmw6WPOUHEl9RARlbY9EtpI6WFlI/7hrneD32wIY7Xdx5Rm1XQnrm/i40YypD
         JI7kKzN60hWD9M9xbZPSD/8c8Euec75JGqNOzEZhRJHjhsIdNn2J50hnwW4HY9P/Wnh3
         IvjZqur1qKf69I1HEllblijarL2upcomR98aHkisjn/SJMrCX1MrQnoBJeApOFjuGscF
         9rrCRWcDEp2KwaiY2sgVV0t68QT/d2zH6Wa8fQpag4B6weROMUoqIri1wMiYnBZzPU/M
         qpyL5JEuqibnHW7eUTH3tOrLWytxEy3rtj7Jpg3gN8W8RbHVk0MzADxKHig2Emm6qlJV
         4pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672937; x=1794277737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzfHr7VS3R55wgwqyUPsK6dja/9+8+R/PoE9WBcM+FY=;
        b=fphy/EGmGr05t7xK7c33HO7bUQIUNYu87yVgF753dN7gfZLMcoh2jImUapXoyqDhRS
         rVLBLmR66TvaKIztOrzQVduxOqy226JbltiBY4MQjeY39n9f8l2UIHmHCASSCJJs7x12
         fn2jYpjxM6FyCbd/kapFpjC4v8yyrqF+lSVpkC/Y1cPZpHfjjfmvqDnw/awvxVjiLact
         67/AhfVRuBF4F6zy9iiOe/i142Z3aLWElHYeauO7T1G34ClAEd26A+Fw3Clj2K3or3KB
         jBORY06PEkXQWAZ60sDTZkDbwC5lM4yrGEHpbYqIGPwrukIM30OhHddxQ2HacGD6oRXa
         ECvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc9MV9AhQWCTJm3D2oNcDTiHYRtUJfgWbda2ugKnJn4hsDsqxGDpFW5Bt0SNbLICEMTRQkZTgB8IQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ9vTuQmUckhkoKvkZsKHyRniIFdrQ1O+w0SKnKIN1xvKkWKsoH
	ib61QtlENJ9k1oWhN/dxo31JAGX4HL7J6vyUJGgT32toQiz0OwebEGXxd2LYLlRb5fQ=
X-Gm-Gg: AYBFou1x35RTGMUshIVP9MyesTIoliw0A5rd0WU+nMBYOVtXpmP4pDOn3itW7yAADEC
	TaPnQLW3ZHxkNZWk0ajrZDbIgsN5NJ7YfofwGJe+Edik6ViwDiuxAIgssuapCcIOusY6exaAZOD
	0kRai8Tit+oENYqgAUSlS1CdOOaAgX8azrFfl6UY2/yCrAUBrANnVAgDtSKzDOyZQ+N61JASGl3
	Qk434AaFYphhUIH4MzTWTLrppfbgj9eoVV82ynUz4jHBCqyqmXDxoAUkLmyqjBff2y0TXd6IUv/
	eXAAg8ub9eYiXcMaXUEb9bbqg3GJgUMXH1aDQSGsYq+9HsrGLJmy7+AZuLFb2/iCELqVOdwO7xq
	IGOM/pqzQ8+5x7MdgX/SbTYZnAayzLFo17VrNPB4A3Tck3yul2Yea6211cpwjEDoo6hKbgVqGWQ
	7qvsVopvrIaaCj7Ftnu/MIYZwDpRmyimUIZPGYGBPBr8ZzNGCxFVEicLCZ01QB7NWFDfB/dU1OL
	sz/vCBcJLpAzbActjsMyK2MEf3cF+AR1EbTI1TT1ThKIrukVCNuz3bZazdYGWaiPbwAOHOQPjLs
	MEW3IEjOgCur5H5BZuYkQk/0zVWYVZG0jj30KsWXbyjlG6M=
X-Received: by 2002:a05:620a:4515:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-944216f1f16mr2068343185a.61.1793672937350;
        Mon, 02 Nov 2026 18:28:57 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:32 +0000
Subject: [PATCH net-next v3 06/15] net: skbuff: add skb_crc32c_full() that
 reports failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-6-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=5927;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xQ13tNp8b5b8bmXMu0MecWu7GssBiAZfq3djIXb3o+I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMNAudkydV4sX8J5UoevpFC9R5qZwEOJDugWoZB2YvCOLWe1pQlj56Bu8v3uVapFQnfAVmE8Bqf
 3/smPffQ63AQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1793672938-C1AD0B50-0001E22A/0/0
X-purgate-type: clean
X-purgate-size: 5929
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_crc32c() has the same problem as skb_checksum().  When the range
runs into unreadable frags or past the end of the skb, skb_crc32c()
returns 0, which is also a valid CRC.  sctp_compute_cksum() and
skb_crc32c_csum_help() complement it, so a failed walk looks like a
checksum of 0xffffffff whatever the packet contains.

Add skb_crc32c_full(), which works like skb_checksum_full().
skb_crc32c() becomes a wrapper for the callers that aren't converted
yet.  The wrapper still returns 0 on failure, but it no longer warns
when only a frag_list member has unreadable frags.

Convert skb_crc32c_csum_help(), which can already return an error, so
that an SCTP packet that can't be checksummed is dropped on transmit.
The other callers will follow with the skb_checksum() callers.

Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |   2 +
 net/core/dev.c         |   7 +++-
 net/core/skbuff.c      | 100 +++++++++++++++++++++++++++++++++++++------------
 3 files changed, 83 insertions(+), 26 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 5a5354a6b6ba..5581ed3cbf47 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4332,6 +4332,8 @@ static inline int memcpy_to_msg(struct msghdr *msg, void *data, int len)
 
 __wsum skb_checksum(const struct sk_buff *skb, int offset, int len,
 		    __wsum csum);
+int __must_check skb_crc32c_full(const struct sk_buff *skb, int offset,
+				 int len, u32 *crcp);
 u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc);
 
 static inline void * __must_check
diff --git a/net/core/dev.c b/net/core/dev.c
index 00a62c391056..f9878db781df 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3752,8 +3752,11 @@ int skb_crc32c_csum_help(struct sk_buff *skb)
 	if (ret)
 		goto out;
 
-	crc = ~skb_crc32c(skb, start, skb->len - start, ~0);
-	*(__le32 *)(skb->data + offset) = cpu_to_le32(crc);
+	crc = ~0;
+	ret = skb_crc32c_full(skb, start, skb->len - start, &crc);
+	if (ret)
+		goto out;
+	*(__le32 *)(skb->data + offset) = cpu_to_le32(~crc);
 	skb_reset_csum_not_inet(skb);
 out:
 	return ret;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 68801a4f471b..15d1f4142f29 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3825,23 +3825,79 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 EXPORT_SYMBOL(skb_copy_and_csum_bits);
 
 #ifdef CONFIG_NET_CRC32C
-u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
+/* The frag_list part of skb_crc32c_full().  It's out of line so that taking
+ * the address of crc doesn't cost every caller a stack protector.
+ */
+static noinline int skb_crc32c_frag_list(const struct sk_buff *skb, int start,
+					 int offset, int len, u32 crc,
+					 u32 *crcp)
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
+			copy = min(copy, len);
+			err = skb_crc32c_full(frag_iter, offset - start, copy,
+					      &crc);
+			if (err)
+				return err;
+			len -= copy;
+			if (len == 0)
+				goto out;
+			offset += copy;
+		}
+		start = end;
+	}
+	if (unlikely(len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EFAULT;
+	}
+out:
+	*crcp = crc;
+	return 0;
+}
+
+/**
+ *	skb_crc32c_full - CRC32C a range of an skb
+ *	@skb: buffer to read
+ *	@offset: offset in @skb to start at
+ *	@len: number of bytes to include
+ *	@crcp: the CRC to continue from; on success, updated with the range
+ *
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	runs out before @len does, or if the range goes past the linear area
+ *	of an skb, @skb or one on its frag_list, that has unreadable frags.
+ *	On failure *@crcp is not changed.
+ */
+int skb_crc32c_full(const struct sk_buff *skb, int offset, int len, u32 *crcp)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
-	struct sk_buff *frag_iter;
+	u32 crc = *crcp;
+
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
 	if (copy > 0) {
 		copy = min(copy, len);
 		crc = crc32c(crc, skb->data + offset, copy);
 		len -= copy;
 		if (len == 0)
-			return crc;
+			goto out;
 		offset += copy;
 	}
 
-	if (WARN_ON_ONCE(!skb_frags_readable(skb)))
-		return 0;
+	if (!skb_frags_readable(skb))
+		return -EFAULT;
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
@@ -3866,34 +3922,30 @@ u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
 			}
 			len -= copy;
 			if (len == 0)
-				return crc;
+				goto out;
 			offset += copy;
 		}
 		start = end;
 	}
 
-	skb_walk_frags(skb, frag_iter) {
-		int end;
+	return skb_crc32c_frag_list(skb, start, offset, len, crc, crcp);
+out:
+	*crcp = crc;
+	return 0;
+}
+EXPORT_SYMBOL(skb_crc32c_full);
 
-		WARN_ON(start > offset + len);
+/* skb_crc32c() has no way to report failure, so it returns 0, which is a
+ * valid CRC.  Use skb_crc32c_full() in new code.
+ */
+u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
+{
+	int err = skb_crc32c_full(skb, offset, len, &crc);
 
-		end = start + frag_iter->len;
-		copy = end - offset;
-		if (copy > 0) {
-			copy = min(copy, len);
-			crc = skb_crc32c(frag_iter, offset - start, copy, crc);
-			len -= copy;
-			if (len == 0)
-				return crc;
-			offset += copy;
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
 	return crc;
 }
 EXPORT_SYMBOL(skb_crc32c);

-- 
2.55.0


