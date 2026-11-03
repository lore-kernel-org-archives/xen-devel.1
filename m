Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88518606A33D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ZURCodQM
Received: from list by lists.xenproject.org with outflank-mailman.1468941.1677988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gm-0000CF-BC; Tue, 03 Nov 2026 02:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468941.1677988; Tue, 03 Nov 2026 02:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gm-0000Ax-5o; Tue, 03 Nov 2026 02:29:04 +0000
Received: by outflank-mailman (input) for mailman id 1468941;
 Tue, 03 Nov 2026 02:29:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gl-0008O5-3r
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gk-006j9s-HA
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:02 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946e3-8faa-0a2a0a5109dd-0a2a450bb658-2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:02 +0100
Received: from [209.85.219.54] (helo=mail-qv1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946ed-b7e8-0a2a450b0019-d155db36a57d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:02 +0100
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-91b9e758c50so3096676d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:02 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91cb4478981sm75612356d6.35.2026.11.02.18.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:00 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672941; x=1794277741; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bijbOirZ4Girus6JZtdOIUGExRiLbvnwYnc1tpajYRo=;
        b=ZURCodQMdHCoo1vJxPygv3+zeng+Nb1PfSYWXtL3KTzB42SnFzin1GAXcVWKCvMUdz
         cAsSdk4aJe2i3Ubseu19Be9EfTuLlMus34pzuBhZLeLRdkTK3fXKbHxe/93NeCVMVYtO
         HJrXki9Y0IC2ZVf5WZR3/OZX1lrRphLZTsjm4ki41edvv5lWt9XT2OwBBgyYedn2PBrz
         zuL5ztz3U0vIiduNU81XobD/IQiX3uq7mgIjtRc5VOpJfeAz0VdQ9apvRwdpPbZTL+rc
         4VI26aK3TcO6nCDJ9/uVHS7rxNifyUl2GxC30b3t+xYwSAiAWqymZJaUzy62mIQ26+TS
         JRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672941; x=1794277741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bijbOirZ4Girus6JZtdOIUGExRiLbvnwYnc1tpajYRo=;
        b=E5I6ee+M9ivbA0aMjLHQR+LIaJ29PZmKBfR/OyDti2NVA6Zdw6j4R2l1e3mt8JYts8
         q4ZWFGqyZPJd4e+EbnWWa5LeCdHD9H65aRmSDMH1LJ5ahc7vS+HMHKVKm4207pGUfCyY
         +M9O4ZykXWngH9ErlV1OlMrFrrhH3L/czqOfBaP+u5n+OQOaXXaHmtwuGDsX9QI0HQCX
         03GmUCLGMsaNlDCgrwZIjf1W9dIbXYuHl5Zo/kclRKWYe5Fm5+YYhE6uZ746XgaLIYbo
         sdyTLUShwqjMIlVBFoQZzAtM0VqJUI8Pmjq7HMaoWkNG2Mnftog4BcdQLfE5Y1jlElaX
         4dzw==
X-Forwarded-Encrypted: i=1; AKwUvBxq+1QZdlCn1J4NzsxqnfVF9b9aaZt6jlszT5oSpJL789dmsZpHNr7kZCSPSYWYaaVMJfrNQEW7CE0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z87no2b1Sm4gbdkvHrBGz3RA3HQIbzSFiuhtojOAhHrN5al2oOE
	9VPO0yqt5gU+7UWA+Hl6dlKwHWse/aednLYOQpns7a2jMLiZDWPsXkcat71+3LkK9w8=
X-Gm-Gg: AYBFou0EVRKWGE78zEx5QBEONyhVZ7m4WGZtvPIp7ZddGTkXLhYS51cJvg48RTpLnW8
	x6d2/PGyH+rrTUZR+i3yruAKEsF79/UtgBUorWwSf13Z0Uhvw8+dmZJdyxOL+C+ksiMLztstutK
	M3SxHl/no2AasdOfWq8YhJN02m4pXRcw9gcLbYHfw78Bmos5lZt2cLMgFS73WNDGgbtsznVLhez
	3IA19V/AahE9zHE0yJTjrvJ2r+QITfe1OO+B1Iy7BnpzYMSIhsCTy29/EP/VW266JO1xDn/QDNe
	IpVYcWT6krE8Dr6FDtS9rmu6V1MUs7t5XNcdsiVYE4yeXELhv7bhWXd3J7IzATF7Z/aDMrVoE/U
	Crn50f6Osd9DaTAkZu0jvhWaIt0YZiehnkmNf7yclbcXAR9gavOx+iWPBuDgGJ7UqzOosZ/CX0p
	/Riwp3wj7kSsfxhstLGOvxTC/hAxI9NsWxYtJMuyhZcKQrGn3nR7h4ZQQLp/w7haqISCUo0WIPo
	EFll5nxin6CWeb2lNuW3+wm83ytTHjDnfTGy5YpmV9t6I4ZVNSaHAlJIDI+NA+sZOqmBc7PDG6R
	gGUqrvb7ecT8bqR6ecZ3ukFW9u8PLxcNrTt7lbZHu7cJ0w==
X-Received: by 2002:ad4:596c:0:b0:91b:b26a:9793 with SMTP id 6a1803df08f44-91c9089912dmr253427966d6.35.1793672941013;
        Mon, 02 Nov 2026 18:29:01 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:34 +0000
Subject: [PATCH net-next v3 08/15] net: skbuff: make skb_try_coalesce()'s
 len unsigned
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-8-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=3910;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=1Y0cvQvaM5FSv1SKjKnlMhZ0E3xrC/xLgZhh+okRfpo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBH7ZWBZQqHx6yS5pMlRH07gVqL72akx3JP37eJaittte4ldQJH4Xai9J9l8tM0eu/jylaeSWnS
 SeZVX/4+BAQo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1793672942-2C39B9EA-AAFA9BBE/0/0
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
index d79d8463c44e..e400990595f8 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6478,7 +6478,8 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		      bool *fragstolen, int *delta_truesize)
 {
 	struct skb_shared_info *to_shinfo, *from_shinfo;
-	int i, delta, len = from->len;
+	unsigned int len = from->len;
+	int i, delta;
 
 	*fragstolen = false;
 
@@ -6523,9 +6524,6 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		return false;
 
 	if (skb_headlen(from) != 0) {
-		struct page *page;
-		unsigned int offset;
-
 		if (to_shinfo->nr_frags +
 		    from_shinfo->nr_frags >= MAX_SKB_FRAGS)
 			return false;
@@ -6534,13 +6532,6 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
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
@@ -6549,7 +6540,19 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
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


