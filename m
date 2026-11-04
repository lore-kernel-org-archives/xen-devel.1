Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011F606C5A6
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=P8tOIqDw
Received: from list by lists.xenproject.org with outflank-mailman.1472763.1680647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtr-0004Sn-Ld; Wed, 04 Nov 2026 20:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472763.1680647; Wed, 04 Nov 2026 20:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtr-0004SC-E0; Wed, 04 Nov 2026 20:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1472763;
 Wed, 04 Nov 2026 20:48:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtp-00043D-M4
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtp-00BcE3-2b
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:01 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99ea-e002-0a2a0a5209dd-0a2a4507c1e0-26
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:01 +0100
Received: from [209.85.219.43] (helo=mail-qv1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a00-b4ea-0a2a45070019-d155db2bb83b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:00 +0100
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-91bb5795792so12669786d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:00 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e962b4403sm2743706d6.20.2026.11.04.12.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:58 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825279; x=1794430079; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0fgOhN7DOs5sphgS4nlyf+SCbWBYGAvkUGVDVkmjaU=;
        b=P8tOIqDwaUqwLbJ2UaNgF6Dcp9+03A/kyRo0thS6UWMn5A/cHsdYAkMlDtzo4C7E33
         DMJ8Bb0hOkz2fHBSy+xLVpMOMVnkL+IOCdAs3yg0c/J8OJuZ6CksHyCGtg+VRAKsWr23
         vVSwchGLyL14Cf/AkQO7LQVN1eo/XHYC6LWibUB47tssPKh/+Am22jj1fZ1zlLz8AtyS
         9r1QafQxPfB+4ih3zHScmmrjwsyC8X+J7bubyu/FSAGH3+UNnPrWktnvcB1+UENaG3hX
         6JEvgTs3dYsJ2uMFtNn3N9GnsitHyNvLyzSmzcUIs02arGMmjflQqIppNx2/XTqN6POD
         Oikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825279; x=1794430079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0fgOhN7DOs5sphgS4nlyf+SCbWBYGAvkUGVDVkmjaU=;
        b=IRqYaNztOkSmiS/qM0Qn27FOPTNVmmwHBKI1JSPXDLambcgsvQQ6l7JDu80ESY4rt6
         bJqk3pH0Xi1ioxv8eKy53b7sP8QwsYvd13iqQkrc0lqH9jL9EtrM5eK3E7VgtAmYxJ3Y
         Jj5cPsKtDtuR9EKciV+8SUcVm9COD8Z2xyQcqG/nVpuOdYQL1FbDHuZ6AWWDSKysKfN1
         7+FmtqcXzR5T9V+VW6/ozURUdsUUL4haFfRZHY1NQibJfLyNxegfsw6yOj7rZw4GAPdW
         8o6IBpUOZSETM5bb1scy12fymCv9BOtO32JNTjjiPSbERz7wxBjgPoTB0ewCisfr0/WP
         2SSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2QCcd7MR9a6OjpG9FjpSxtgvPoAPHACP3Ofg1g/E15jmVzZHTu9Uq66zw/hMt39LGNMXzxjN3GF4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z84J5KeW8nUtP07N2GSPcZ7YukiMX6z8ZnTVreCs6r5MIhVLh9w
	6b3zr9OIRuZq/C7FDUxXMki+tkHAP8CObib0/doKmjvbNRo6D09WIKiKIRYqu0zOdE4=
X-Gm-Gg: AYBFou1pvxi3Q5J+PDS4gwBghjs0x3g2bnTv5tI0/q8fwcbTiTaDiDwFGKmOdej9Kuf
	c30YGxf/dlC48HBOzHQDNoIeb0ntYEUouZQjf2HGejUhXEtksjt4tmP+4k6qJmlhrK7PlX+zzDU
	FDi+lUywjBbTAk1+7SO23GtJuCCddUpYZd3xOy0jS+xaU2sBU0mH+mwkeo8F6idqtE6FjeyWhmJ
	1dEAvAcQQTp5JATUmiW07DIRYd3P7hrTh7bM41rHWY1gjvdwoNy5vvxwc2FCvPH7kw/WJKXbGc3
	94kiSkgG22O/0YNqtLNKn4EJXUjY8n4R89dHewIFOgSAUO4x0iq3hF+yrUr2/+lYJa/aQq4wIqw
	hGl49enGKzkqSk2q45gswr3qN96hcSFm/urhPTFz2n6/RaXuGGZ8dfu25kJk1pzffzf0+IkdeWt
	AHzHp2BlOw6PneY1O+EZ7v3sIPKv2uGOEdxBG39/uaOfeUIoHcWWW1nu7kBrGcQ/hWZwkQ7wmN7
	inS9sGq2WD4YCrE9Rw0jiIimxaE0l/NdS+wHYiQhmcIgGbVCYrH5CBP/QHUVPs01fBxnCZctBZs
	IwV8xdo4P0qoWA2GnZNIp8MWdd9g9EnBgIp/A2M96E9Iwg==
X-Received: by 2002:a05:6214:3017:b0:914:1807:dc70 with SMTP id 6a1803df08f44-91ca4adcf1emr285668046d6.13.1793825279344;
        Wed, 04 Nov 2026 12:47:59 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:20 +0000
Subject: [PATCH net-next v4 08/15] net: skbuff: make skb_try_coalesce()'s
 len unsigned
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-8-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=3910;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=1Fxify4JpxLzLM1Ti2e+64TfuNshdGdOIM7pownAVrU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHxEsFLzJgR3nlUT1UdgoB00cssfz8v87Mti65uiGcMrjonP4uPcKrvqTbz8Wc8/j5y224vXNuI
 0BaUMX9dJ8Aw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ef75cf/1793825281-378D1AE4-4D669ED1/0/0
X-purgate-type: clean
X-purgate-size: 3912
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_try_coalesce() keeps from->len, which is unsigned, in an int.  A
corrupt from->len above INT_MAX turns negative, gets past the
len <= skb_tailroom(to) check, and reaches skb_copy_bits() as a negative
length.  skb_copy_bits() returns -EFAULT for most such skbs.  If
skb_headlen(from) is still a small positive value, skb_copy_bits()
clamps the head copy to the negative length and memcpy() takes that as
2GB or more.

skb_put() used to run before the copy, and its overflow check caught
most of these lengths, but not the ones that wrap skb->tail back below
skb->end.  commit 279877d86c82 ("net: skbuff: don't BUG() when
skb_copy_bits() fails in copy helpers") moved the copy ahead of
skb_put(), which left only the tailroom check.

Make len unsigned, like from->len, so that such an skb doesn't take the
copy path.  It gets to the truesize sanity check instead, which sees
that from->len is more than from->truesize can hold.  That check only
warns, and only after the head of @from has been added to @to as a frag
of that size.  Make the check refuse the coalesce, and move it ahead of
the head steal so that @to isn't touched.  The check compares the int
delta against len, so it now tests delta < 0 explicitly.

An skb from a driver that under-reports truesize used to warn once and
get coalesced.  It isn't coalesced any more.

A test module that coalesces an skb with a page frag head and a len of
0x80000010 gets false and an untouched @to.

Found by the Sashiko AI review of the BUG_ON() series.

Fixes: 279877d86c82 ("net: skbuff: don't BUG() when skb_copy_bits() fails in copy helpers")
Fixes: bad43ca8325f ("net: introduce skb_try_coalesce()")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index fd4689cea94b..2c246f563555 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6480,7 +6480,8 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		      bool *fragstolen, int *delta_truesize)
 {
 	struct skb_shared_info *to_shinfo, *from_shinfo;
-	int i, delta, len = from->len;
+	unsigned int len = from->len;
+	int i, delta;
 
 	*fragstolen = false;
 
@@ -6525,9 +6526,6 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		return false;
 
 	if (skb_headlen(from) != 0) {
-		struct page *page;
-		unsigned int offset;
-
 		if (to_shinfo->nr_frags +
 		    from_shinfo->nr_frags >= MAX_SKB_FRAGS)
 			return false;
@@ -6536,13 +6534,6 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 			return false;
 
 		delta = from->truesize - SKB_DATA_ALIGN(sizeof(struct sk_buff));
-
-		page = virt_to_head_page(from->head);
-		offset = from->data - (unsigned char *)page_address(page);
-
-		skb_fill_page_desc(to, to_shinfo->nr_frags,
-				   page, offset, skb_headlen(from));
-		*fragstolen = true;
 	} else {
 		if (to_shinfo->nr_frags +
 		    from_shinfo->nr_frags > MAX_SKB_FRAGS)
@@ -6551,7 +6542,19 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		delta = from->truesize - SKB_TRUESIZE(skb_end_offset(from));
 	}
 
-	WARN_ON_ONCE(delta < len);
+	/* @from claims more data than it has memory for.  Leave @to alone. */
+	if (WARN_ON_ONCE(delta < 0 || delta < len))
+		return false;
+
+	if (skb_headlen(from) != 0) {
+		struct page *page = virt_to_head_page(from->head);
+		unsigned int offset;
+
+		offset = from->data - (unsigned char *)page_address(page);
+		skb_fill_page_desc(to, to_shinfo->nr_frags,
+				   page, offset, skb_headlen(from));
+		*fragstolen = true;
+	}
 
 	memcpy(to_shinfo->frags + to_shinfo->nr_frags,
 	       from_shinfo->frags,

-- 
2.55.0


