Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FB60A260D
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pkEzOhXo
Received: from list by lists.xenproject.org with outflank-mailman.1457176.1670064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWew-00037x-Lj; Wed, 21 Oct 2026 13:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457176.1670064; Wed, 21 Oct 2026 13:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWew-00037q-IT; Wed, 21 Oct 2026 13:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1457176;
 Wed, 21 Oct 2026 13:47:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWeu-00031A-UO
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWeu-00AIAc-B4
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c259-8faa-0a2a0a5109dd-0a2a450cc678-20
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:12 +0200
Received: from [209.85.219.44] (helo=mail-qv1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c25f-f479-0a2a450c0019-d155db2cc99f-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:12 +0200
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-91b8306b9f8so11941166d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:11 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10c42b17sm25128096d6.40.2026.10.21.06.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:10 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590431; x=1793195231; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9xcHh2wY++h6+R9ioq32anwJ7T1kqXqVTQttxnVock=;
        b=pkEzOhXoywAEw9G3IJE2XrG9nlSG7LqRrXWGWHK5NZ7DmU648tJ7oWNLWB1NgNd93W
         PduirwpDmtViAJS5S1GDcmD8i0WKXO333Gq2TnVLJQvpc6b2o1I70tblTQn+xavXHAXA
         xihexU3NPp4qtunuKCjZ4xJ2KbISHPOZEl5vPycT1FF23BSSvNXPampymirOiYJWAGll
         g8FR7z+e1GOX4RB/5eZwkuCGzK/kpje9Co2pd4tC/zh8eRN+8LuiE8BZs9zN14RKCIbM
         i0bufPNDjnNP+9hFa1MSc14gW9ytycXY1I7rBE/n7BSN4C1aH+CJvMEaiL2SqWR75ReX
         eThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590431; x=1793195231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j9xcHh2wY++h6+R9ioq32anwJ7T1kqXqVTQttxnVock=;
        b=lMAUdh+Vgto/lN2Zx+X2FJJMdZMfE/j/i8YAVD7XwjiYCxQr3OG7T+eSWFCQ2DMMDq
         W1mdEH2s7Fpye+wdDx4bx9YYvFVOzTmDzP5QO2W2+P8gHa784o+87rVLp07HvRL/Z7ef
         aFLT6xgv2N9ah6Q4deuExRFzKpEKpczRy1gPlNVE9KBI4OoiPk7nc7crGv0snZSIRT2m
         SotulOQKz29V78Q45peNXDyqWmFM0fAi6O3t3SFmtjiMUOsWNJ4SSeQXUCXr1tSHO8mN
         W6RmZQoCrEry4tDh827STg15rXIfcQyT3lK/UhMNqv/li9KKcPVEjj9+vR5EFxwbLCMu
         /PXA==
X-Forwarded-Encrypted: i=1; AKwUvBy6npQKD3mq//zBUQbIjM/ur8npXnpEvMEPCzhgqDbWyt7XRQ0l1d2i4Oo9SyjDQE/Tcm7MMPWKTgA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLxj6pmu5wFziRuIApJ74Zp/NIvFYNdU9aZM7dt8DX3AJgCNoTD
	8WDLxhQij2F2WYffZKNOVS0uQFLchbusea7Ds4ndFBmZfbuaxl6G7NLi+kC5u53G8oQ=
X-Gm-Gg: AYBFou2Ddhn5VaPP7LlONronzXT+S7GzV0QBwIOnqdKI7f9Qb7ZKjNq6jGPXPWhF+/d
	ecXhBr6wJUxNOHwoDeoZB5q/7PR1JcGFbQ9x99Q9B1wAiG8/bkY2DP+u8fwH35xMbFH892LVXl/
	eEXJleK7Fo3sAoeqakyhTWOdcX+fYfDrW7Q9s6uNynyPc3WjQiJgBTqyJkohQ7g6luzeO9DhAZ6
	gyFHCW2oQhrUIms8C7lKGEAQUSY+8TtEC+VlSiQspSSyF41iU6GCkY8kxo+OEC+WlncgtPBKxs/
	HHZRtctsqZZKeHoHmgGK0DlR9nBH1cNQeP+ipdR4hEYbT0AI1jW+U6ZxBqwg3j7bJJ0Ljprh5mB
	HWq42IvyI6yPzDYDW9nW1x6Ae+Xz1I92eHanPSjIy3aBDVYNPjERnbmITEJDUeQECKVfAv5DrEQ
	fx2BQ5us9nBKWNmz2JDnVzMDeU/0r5rI86yDlNt7/vfuZQwXCd+zXA2pMa07VXF52WbLuqHGXvM
	uV+VGPZnnHsrfATR0ZqzkCAjQBBtepz0oCZAAKw4gTVVXsmc5rgRvEGeeDiAZoB6Vezy1CZRA==
X-Received: by 2002:a05:620a:468c:b0:93e:ce12:aadd with SMTP id af79cd13be357-93f57f47979mr408941985a.58.1792590430520;
        Wed, 21 Oct 2026 06:47:10 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:46 +0000
Subject: [PATCH net-next v2 02/15] net: skbuff: add skb_checksum_full()
 that reports failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-2-2aa780a03524@toxicpanda.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590422; l=5325;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ZlvWwY4Y8lGqu2UhxWxy8P8g8HVcQXW7x438vujwS94=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB9IaUyRRnrhDlcjRASKEoLr8PFoRFRxjWkPSpu94bv/cMt6C3uKGuj4pHXocRUTVQp2sAYCM4v
 P9XCyt8XsuQ0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1792590432-766DEA5B-85DC29EB/0/0
X-purgate-type: clean
X-purgate-size: 5327
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_checksum() can't fail.  When the range runs into unreadable frags
or past the end of the skb it returns 0, which is also a valid
checksum, so its callers can't tell the sum from a failure.  For the
receive-side validation helpers that means a packet whose payload was
never checksummed can pass, and commit 20ddd0fd2fcd ("net: skbuff:
don't BUG() on leftover length in skb_checksum() and friends") made the
past-the-end case one of those instead of a BUG().

Add skb_checksum_full(), which adds the range's sum to *@csump and
returns 0, or returns -EFAULT for unreadable frags or a range past the
end of the skb, and -EINVAL for a negative length, leaving *@csump
alone.  It's __must_check so a caller can't ignore the failure, and it
recurses into frag_list members through itself so a failure there
isn't lost either.

skb_checksum() becomes a wrapper around it that behaves as before for
the callers that haven't been converted: it returns 0 on failure and
warns once if that was because of unreadable frags.  The following
patches convert the core users, and the rest will follow per subsystem.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 56 +++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 09db32f70b53..969b1c3269ec 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4279,6 +4279,8 @@ int skb_copy_bits(const struct sk_buff *skb, int offset, void *to, int len);
 int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len);
 int __must_check skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 					u8 *to, int len, __wsum *csum);
+int __must_check skb_checksum_full(const struct sk_buff *skb, int offset,
+				   int len, __wsum *csump);
 int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		    struct pipe_inode_info *pipe, unsigned int len,
 		    unsigned int flags);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a2b52a5a61a9..061c61422a38 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3545,12 +3545,31 @@ int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len)
 EXPORT_SYMBOL(skb_store_bits);
 
 /* Checksum skb data. */
-__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
+/**
+ *	skb_checksum_full - checksum a range of an skb
+ *	@skb: buffer to checksum
+ *	@offset: offset in @skb to start at
+ *	@len: number of bytes to checksum
+ *	@csump: the sum to add to; on success the range's sum is added to it
+ *
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	has unreadable frags in the range or runs out before @len does.  On
+ *	failure *@csump is not changed.
+ */
+int skb_checksum_full(const struct sk_buff *skb, int offset, int len,
+		      __wsum *csump)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
 	struct sk_buff *frag_iter;
+	__wsum csum = *csump;
 	int pos = 0;
+	int err;
+
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
 	/* Checksum header. */
 	if (copy > 0) {
@@ -3558,13 +3577,13 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
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
@@ -3593,7 +3612,7 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 			}
 
 			if (!(len -= copy))
-				return csum;
+				goto out;
 			offset += copy;
 		}
 		start = end;
@@ -3606,14 +3625,17 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 
 		end = start + frag_iter->len;
 		if ((copy = end - offset) > 0) {
-			__wsum csum2;
+			__wsum csum2 = 0;
+
 			if (copy > len)
 				copy = len;
-			csum2 = skb_checksum(frag_iter, offset - start, copy,
-					     0);
+			err = skb_checksum_full(frag_iter, offset - start, copy,
+						&csum2);
+			if (err)
+				return err;
 			csum = csum_block_add(csum, csum2, pos);
 			if ((len -= copy) == 0)
-				return csum;
+				goto out;
 			offset += copy;
 			pos    += copy;
 		}
@@ -3621,9 +3643,23 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 	}
 	if (unlikely(len)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
-		return 0;
+		return -EFAULT;
 	}
+out:
+	*csump = csum;
+	return 0;
+}
+EXPORT_SYMBOL(skb_checksum_full);
 
+/* skb_checksum() has no way to report failure, so it returns 0, which is a
+ * valid checksum.  Use skb_checksum_full() in new code.
+ */
+__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
+{
+	if (unlikely(skb_checksum_full(skb, offset, len, &csum))) {
+		WARN_ON_ONCE(!skb_frags_readable(skb));
+		return 0;
+	}
 	return csum;
 }
 EXPORT_SYMBOL(skb_checksum);

-- 
2.55.0


