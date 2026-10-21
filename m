Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED486606A335
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=iLDanUPT
Received: from list by lists.xenproject.org with outflank-mailman.1457179.1670086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf1-0003eT-Cg; Wed, 21 Oct 2026 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457179.1670086; Wed, 21 Oct 2026 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf1-0003ck-7S; Wed, 21 Oct 2026 13:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1457179;
 Wed, 21 Oct 2026 13:47:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWf0-0003ad-J3
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWez-00AIGi-Vy
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c261-e002-0a2a0a5209dd-0a2a4504eaf4-16
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:17 +0200
Received: from [209.85.219.45] (helo=mail-qv1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c264-b57f-0a2a45040019-d155db2dcdc9-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:17 +0200
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-91c19fc50abso3885006d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:17 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10b736adsm24541336d6.7.2026.10.21.06.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:15 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590436; x=1793195236; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5hhezvrkrPsILbBbBLRGuH3wT+463IdJ8u+tbtUXF4=;
        b=iLDanUPTnWyCQhL5NCmjMaxftP1+znmIm44ZIgmo5+i8CqyBFX399Aegm2N82c1A+3
         AAc5Iz79houwcd9KfEWobTrYPNJuqw39oLqjg+COjEhKNQgZ5O/gRHggtq7KXYmCthke
         CPoW00/JywtwZAbMgaP6zfVYsv/HWy8YfprlIzM0lslORlM9efY3mfE/dnZ4FaWsayIp
         YaRSPlDZxFKiDBsDrzStbVZsePHmR2tAIrvddfv5Lyv1prI2T62SQvVisJxjotDWv496
         LRA4zsWhBzND0S2K8DhMEDwUK5p4fffk1mP4v3FjugDX/f0pnAkFn29h/QO3cTxaIG49
         +LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590436; x=1793195236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5hhezvrkrPsILbBbBLRGuH3wT+463IdJ8u+tbtUXF4=;
        b=iA++AGm0cFMohKsRMLS9eobKdRk0rnQ4vwzFkenfk9wPXFV0ewv+K9TNpqQqfHWh9b
         1dqSVryOwCrhhxDUv6FPt6WigUexrSnFon4jUBGQfzLjjOswpLdYX+aoqjSgaa4J69KV
         e8sBxGv+/8eBVbrhOUSLlMjVrBZ4F4fF/LKajPgR24Mkj2dvSEtcMinFz5L7Ya+2/iuB
         wkBgMSwqqPhqFaVOLhxuuIBhWRccNcZ+c3PO/CliEWFO6adzyGdOSEYyY4trpQnnmIUn
         NF3GrP5JJqtY9GBDHxy9gt7aeygj7eIDatYVJ20buEL+KHP254Z6A+T6m+uxdUFpM8Zx
         zNtw==
X-Forwarded-Encrypted: i=1; AKwUvBwf7/gW32qG0QBpImoYaxs/JrkXJSV4GVI+S7PMltsScm75P4O8Vocrc0hy383e/0MgvkMVzN2k6Io=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIRGjXbv7ndL3ticXxDBWYxozGetbgRL0gdbyr9+NR3DG5OvsVq
	SXaA6aQJDDN0SFzvqlh7UBiMdeW/M796Vw74AEIhk5k9IGhlSdZCRcYF6BuOv/k5K+M=
X-Gm-Gg: AYBFou1+MEEMqDlaPUdOAfYP5iElD1BqJ5NNf6G7MRurLbS33GaVMaptUmFsekq+sra
	CQmkHP05H737xW/fftW3biwuRClStSAHOnbFSOymQFXVANx85zaw09x5THll47BKR9nE2xcPsWL
	prZakohSEEoEXNQRcZs7Rq522z5zlArMKVb+jmnYyVJQ8y4GOsoz03GyplA6l8ilqpRwUPlRGpq
	VT+OHezBg1uEzLnhOrlwMDhJDt3tw80ExefjBEiIMfVyvVzqvn3ytpM21xnQjTLrgZCARCM6pqh
	Tx9mX8X9wew+eOPqI2U8Rn473iq+89VDHBy9CB5Vs5MP6X6DayyLAkTfg9SIuAvXK9EUIpkj8NU
	C+AOoIiHoDtuvngo+JNQ4fDPuLXm3cp9GdXb9LGZ8OrqgQcDUAss6FXWUIQLPHM8yVAzICMGwzh
	pjbDNNcUbyQZQ+wDnFhzW0JxprdgCfAfaNqMHFglf9XVg6Wc7Vngd87p/GdWVPI4F6GE3mK3sAI
	erW328KyR1Gsow31oHCPKSoUg1KhAN0JHfylK5brOjRJK51iv8nPr4jFDDl4oshwdTvimST
X-Received: by 2002:a05:6214:5910:b0:917:bebe:9be5 with SMTP id 6a1803df08f44-91c12eec79emr37007046d6.37.1792590436396;
        Wed, 21 Oct 2026 06:47:16 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:49 +0000
Subject: [PATCH net-next v2 05/15] net: skbuff: fail pskb_trim_rcsum() when
 it can't checksum the tail
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-5-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=1264;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=+TWKmcN/9YISrCDdUhnWQSTAcvPk81OG628CQR0a1S8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFTlNfGUcXXV3pjdWKViUvre5XIQ/uvNasCkIWODiOg4AiKOk9pUX7ncc6s9bQlJoyAZkqeFxAv
 XxSpKAAtILwU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792590437-C18D1B50-C5E67439/0/0
X-purgate-type: clean
X-purgate-size: 1266
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a CHECKSUM_COMPLETE skb, pskb_trim_rcsum() subtracts the checksum
of the bytes it trims from skb->csum.  It gets that checksum from
skb_checksum(), so if the trimmed range runs into unreadable frags in a
frag_list member, or past the end of the skb, it subtracts 0 and
leaves skb->csum covering bytes that are no longer in the packet.

pskb_trim_rcsum() can already fail, and its callers drop the packet
when it does.  Use skb_checksum_full() and return its error.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 88ed2dd99dc0..de433d452939 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2829,9 +2829,13 @@ static int pskb_trim_rcsum_complete(struct sk_buff *skb, unsigned int len)
 	int delta = skb->len - len;
 
 	if (skb_frags_readable(skb)) {
-		skb->csum = csum_block_sub(skb->csum,
-					   skb_checksum(skb, len, delta, 0),
-					   len);
+		__wsum csum = 0;
+		int err;
+
+		err = skb_checksum_full(skb, len, delta, &csum);
+		if (err)
+			return err;
+		skb->csum = csum_block_sub(skb->csum, csum, len);
 		return 0;
 	}
 

-- 
2.55.0


