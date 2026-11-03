Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F832606A339
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kK5IkJRL
Received: from list by lists.xenproject.org with outflank-mailman.1468934.1677962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gh-0007qQ-91; Tue, 03 Nov 2026 02:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468934.1677962; Tue, 03 Nov 2026 02:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gh-0007qJ-4T; Tue, 03 Nov 2026 02:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1468934;
 Tue, 03 Nov 2026 02:28:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gf-0007jR-QR
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gf-009OZN-7M
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:57 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946be-bab6-0a2a0a5309dd-0a2a4505c0c4-32
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:57 +0100
Received: from [209.85.219.53] (helo=mail-qv1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946e8-4cb1-0a2a45050019-d155db35e98c-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:56 +0100
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-91c67992ce5so27746786d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:56 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7b779bdsm105433276d6.0.2026.11.02.18.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:55 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672935; x=1794277735; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPhoPgLC+8GlCU41+5ydGuziU72t8bYzLKeHnMqsGwE=;
        b=kK5IkJRLTIbsagTFDfiRsVqC45NZYCGAjO7bexZGI9llKknu57E8pIpa8u7tRL0h92
         4dFgAcspyAWd96Zir5QUTzzJ8vx4bPEazj0IVSJXsSdebTd02v3eUzt7wFa5wVttfP3Z
         VIGADzWywlQ6KfiLJK3OKMZxvlZ86GfSZw4Y8sy2jLjl9KPJAmpTa31V/pdzf+BgaETK
         KhUHhuDX8uRQIqRhn5vGeuXJ4sNSL0Y+wqHNbYLPqtM7Kk9AjybU8sACSqf3QNcp/U0F
         nKPm6CBG3OIPpPhPRXxAuZ8xJgQByJ9gZvvyHoA4gaHi9iVGKtGzYXtHygAaTuT6iUKv
         vL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672935; x=1794277735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPhoPgLC+8GlCU41+5ydGuziU72t8bYzLKeHnMqsGwE=;
        b=bVIaIEta88G6NRXy45IF9bawA1b/xO3DZfPVG0BxlkCTatAZ1YkmT1Mf4QIKwgq0jA
         uKlFp3jmPogcNdwHKHhABjOARYib02Ua8PKqZREy4vFEDBeB7Q+VRUzCL7anSol1dJrs
         k8z6WUHnfgyGl9+LID21eAiTGRpdO5qytL69PCN/yq9qM/AvpwPJBxgXDxHjvoAT7hNg
         olU8Ho+f4Qi6jPzQ2OHLN+2L9Dcfn002LVW2YHK/6CIwNI8At27hqWDo87cPBs0dXV0U
         U6cWbwu9zszimJxiDUG8abN29Dq0YFtRhIs1CasDtJC1YaiZo8iNRwT4b+q7a82p4YJP
         /CQw==
X-Forwarded-Encrypted: i=1; AKwUvBzPJ7T+EsgflnaeQqcBj+7Zh7Z7uUV27Fy0Y1MwuCuQv+MRt/XDOP+X3T8dCsp8aRVk+qVbNNM4T24=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+sBe4BZWBL40VJM/jGCS8p0cN3ZHcsL7hKurO9fjJqRvEm7EnR
	+3DleRy35zMSmyrnA7IuUfVUqQyDqltu1gs9aA5rWjGATpCA+bz2Njs8AuFivSiyIA8=
X-Gm-Gg: AYBFou1JuyTvffHR2jA1uBuwqT4xG3mx9CoVgfK0tbkP+uKqw+nAxEXCwXeGQUIli9S
	W5Zut76/oev/KgPWQ5gltfdIcAJHvh9AoWfXERjerKOj0AsZ+HC/Sh8FoQbo8SrAa2o6Qx32/a0
	5jEMWhjrI46ef4Pg/SBJk1uPN5ECFi6lANWb3+fykZEnp0POblHI0Z2KkIGGJ4KC8IKFHZIIVAb
	eEm0b+7vDq4iPD9IXiUlP74A2NVLe/+SRH7LgtR1DIk5snKYds0+hflzYOIdq7+5WVp7ypPlcRO
	Nlj5xFeSX4gFQUVFgAHCuUoCku61XCnaQpAhTSqXBUM2GlLkpVcY9D8jeLype0bG1OHxuf9EdTN
	1bp9LE3O8TG1ClkJ4yOBxyk42d55b26VMSj4lvi/gkDkeDWXn3mX+nubd8N3pqO5iCPRLj3sFCZ
	O/Pl4UTC0Gs5M5tY3RUDwpHkf5TztFWyThmWmdW4ASSuh+LJCjqpIFtlBe9NUu5tk0YbLTjvh+U
	AutdiKi9hphlR73tAd6X+UQE5AP/Yqb2VNx2GqNYmf6QJwerBB8jYWIJUHjv+J8aVVh9M/YyEFy
	5rACqi0C5srJ1tmjuPQ/YUjxVM/j581QJJod7Rr4hjQpOg==
X-Received: by 2002:ad4:4ead:0:b0:912:517b:7bdf with SMTP id 6a1803df08f44-91ca4b92850mr197093996d6.42.1793672935525;
        Mon, 02 Nov 2026 18:28:55 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:31 +0000
Subject: [PATCH net-next v3 05/15] net: skbuff: drop hw csum if trim can't
 checksum tail
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-5-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=2083;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WIgfTZtqwaWkzQDUXyCO+jFusNbjYdApARwauRRfo24=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKW99vHsClamyUP4X27NpnKqyTYOkfRWB4KW7NXTD/O0D66lYe+SBZBVME9SfN/NW1ccijRiLzr
 0OXJ6VI31mQw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1793672936-728B62A1-2A03643C/0/0
X-purgate-type: clean
X-purgate-size: 2085
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a CHECKSUM_COMPLETE skb, pskb_trim_rcsum() subtracts the checksum of
the trimmed bytes from skb->csum.  It gets that checksum from
skb_checksum(), which returns 0 if the trimmed range runs into an
unreadable frag_list member or past the end of the skb.  skb->csum then
still covers the trimmed bytes.

commit 2e357f002c61 ("net: Avoid checksumming unreadable skb tail on
trim") handles an skb that is itself unreadable, but not a readable head
with an unreadable frag_list member.

Use skb_checksum_full().  When it fails, do what pskb_trim_rcsum()
already does for an unreadable skb.  Set CHECKSUM_NONE if the remaining
packet can be read, so that software checksums it, and fail the trim
with -EFAULT if it can't.

The stale skb->csum was only reproduced with a hand-built skb in a test
module.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 5f997edf3519..68801a4f471b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2821,9 +2821,23 @@ static int pskb_trim_rcsum_complete(struct sk_buff *skb, unsigned int len)
 	int delta = skb->len - len;
 
 	if (skb_frags_readable(skb)) {
-		skb->csum = csum_block_sub(skb->csum,
-					   skb_checksum(skb, len, delta, 0),
-					   len);
+		__wsum csum = 0;
+		int err;
+
+		if (!skb_checksum_full(skb, len, delta, &csum)) {
+			skb->csum = csum_block_sub(skb->csum, csum, len);
+			return 0;
+		}
+
+		/* The trimmed bytes can't be checksummed, so skb->csum can't
+		 * be adjusted.  Software can checksum the remaining packet
+		 * after trimming, as long as it can read it.
+		 */
+		csum = 0;
+		err = skb_checksum_full(skb, 0, len, &csum);
+		if (err)
+			return err;
+		skb->ip_summed = CHECKSUM_NONE;
 		return 0;
 	}
 

-- 
2.55.0


