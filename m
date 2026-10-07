Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818C0CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442673.1660236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC2-0000Q1-Ej; Wed, 07 Oct 2026 18:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442673.1660236; Wed, 07 Oct 2026 18:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWC2-0000Ps-Ai; Wed, 07 Oct 2026 18:16:42 +0000
Received: by outflank-mailman (input) for mailman id 1442673;
 Wed, 07 Oct 2026 18:16:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWC1-0000BC-11
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWC0-0013Km-EF
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c6a-2eae-0a2a0a5409dd-0a2a4502e452-40
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:40 +0200
Received: from [209.85.160.173] (helo=mail-qt1-f173.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c87-6ca4-0a2a45020019-d155a0ada878-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:40 +0200
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-53505bc6524so37826221cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-535720ea17csm25632781cf.12.2026.10.07.11.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:38 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791396999; x=1792001799; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=UO2ptSmgA1wjJ6CTlVpols8FA1KPXch5pZHHYE7v6pxJe9PAzbxxYvsZuM5ngP5/Rq
         Tepo5Wf01psoLxCdSRpGaYw0j8ZfOf3bXZ9vZKpAbH8OCDmI2i//EQir63qHr0XbNZIO
         3XUUzH4zs5IwAlUskAlx6d/u76mMc05dTy5U/eOYvggZiARoWJlcptMACgVvkZseOVmA
         Wr5fJDQtdvt0SUDfqEED2euN1AykNNH19HoWwMh8YDCGCSVW4uKA6OgUim4OjSwQ2C4T
         /lhVbzTV81aT63IX4cNKa/wVCDOKHsh6jpntpHOtDKJA4hquFRTOW3i9ivBXu4l+Zo/1
         bWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396999; x=1792001799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=Om+aTvqeUpTCqHyeTpc2F+NJ2hOAR0YHWeTzTrCDlmjUuo8Vkhlb93+BE4ToqQWNgh
         wwPqDhi5WNy8Pj9jV7O2cmT+tDA3Sw3Nq45vIHV/YSjYNCAKeN4Z6syg02NxkOR6aLyB
         LcJGN9j0B2zBd7uYzJ163h3eBO/jm7tPO9DCY+79GrB+VapJ9ghO4Drxd+faRT0QZiBP
         0iDE3sZJs4JNH3b3Au6JbNyn5O8WXxPCFju4Y2anrMH+q31h/NE1BPkFJbgqZcbO54dW
         Xc+JQxUfLh7PMHAn/DfiPa53ZgkxDoZji76oaNYWGFIrn1qEdT61JXZ+cDfSsaBZkjG2
         s5fA==
X-Forwarded-Encrypted: i=1; AKwUvBxNPBnBKbQfUfjUsefJXkdYknkrnYrJuFGyjGQV474q+V8GudeEw2EshYfdyPO26KbUU08XPpTtz38=@lists.xenproject.org
X-Gm-Message-State: AFuF++mdyYcheaPwoYxVKUjqJy0gF++EpulRbw0BE927fbOTzz+WTX9d
	9py8D/CjcdUcZbOHpHcaem9dUDEumcf/VLickCjdjOmlxBeEV1jSv1DOHr6F7c9nViCoIfReHkO
	BGZFjsV8vCA==
X-Gm-Gg: AYBFou0DZ4y80s9dO6148FrTDFtlm0B+NYYJnZSzgNv1/ubvY3V6opRcS+fp2ZByH7X
	p37UOvJp9cP1XMwvq2dqV+01ta92VgVzsN5kwSTVBuZaaBqsTBd8dAlNKdKTH5pQoqbNSnH3trC
	aPn/jovKi8JSZDxGa544rYP3czMkA6FBSxrTegC3rVmGcsWWxC9RC8t0dusswvV26rPYRSVe5NB
	slRtd5npitG0G/dkIvsd1DZLK4K8Cj41ipzBSPnLqaTZSher32N6gxfkMoKw3x7u1WjjKsH/2iJ
	ZbrmbEXMdOGAvT1lKTueGr6RnJ1yLe7mYvoyT45cgEMT4Ze95J7P/ULIVoYcrOVRpf0fRKl08g1
	Jmz7v4yzM07TYwlV2hc8xNTOdayLOvSIYIq19O7iqNV7vG2LdSIOm+JKh2/8fOsNplLSYP9HzAm
	muT64FJFhBYNJJzGbaru9DH1cxcpoeQhEP6Srsh3hqeCocbj5wR4/BL7224bxexnjeKcTWXL5Jv
	KFaH4dvhUYkXh6W3gBnRke7mw==
X-Received: by 2002:ac8:59d2:0:b0:535:1740:d334 with SMTP id d75a77b69052e-53575201aa2mr52033281cf.3.1791396998937;
        Wed, 07 Oct 2026 11:16:38 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:16 +0000
Subject: [PATCH net-next 3/9] net: niu: check for failure when pulling in
 the RX header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-3-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1236;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3f5WzTjnDsDOAnT0hR8gZXIWFT9KoT8c/AVMjDx6NOM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPE8F38TpAIjOskJy1CfHBTawvG2+Cdej+o6C6KckWCrmqZc3RT77tIgX51AS0sYEQy/f1nhpBP
 sPFJm2+lltwI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1791397000-F2AB52AC-D502BB7D/0/0
X-purgate-type: clean
X-purgate-size: 1238

niu_process_rx_pkt() uses __pskb_pull_tail() to pull the hardware RX
header and the Ethernet header into the skb head, and ignores the
return value.  If that pull failed, the skb_pull() of the RX header
right after it would BUG() in __skb_pull().

It doesn't fail today because the skb is freshly allocated, isn't
shared and has room in the head.  Use pskb_may_pull() anyway and drop
the packet if it fails, rather than depending on that.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/sun/niu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..d1c0e868004d 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -3488,7 +3488,11 @@ static int niu_process_rx_pkt(struct napi_struct *napi, struct niu *np,
 
 	len += sizeof(*rh);
 	len = min_t(int, len, sizeof(*rh) + VLAN_ETH_HLEN);
-	__pskb_pull_tail(skb, len);
+	if (unlikely(!pskb_may_pull(skb, len))) {
+		rp->rx_dropped++;
+		kfree_skb(skb);
+		return num_rcr;
+	}
 
 	rh = (struct rx_pkt_hdr1 *) skb->data;
 	if (np->dev->features & NETIF_F_RXHASH)

-- 
2.55.0


