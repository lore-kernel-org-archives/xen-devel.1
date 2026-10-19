Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0075CCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454411.1668057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInmB-0002aj-Ar; Mon, 19 Oct 2026 13:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454411.1668057; Mon, 19 Oct 2026 13:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInmB-0002ZC-47; Mon, 19 Oct 2026 13:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1454411;
 Mon, 19 Oct 2026 13:51:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInm9-0002EX-Lv
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInm9-00BvR2-2G
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6205d-bab6-0a2a0a5309dd-0a2a4505991a-28
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:41 +0200
Received: from [209.85.160.172] (helo=mail-qt1-f172.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6206c-4cb1-0a2a45050019-d155a0acc469-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:40 +0200
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-5365d26ccbdso19540811cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:40 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a9dbdb5sm99695721cf.22.2026.10.19.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:38 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417899; x=1793022699; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBRr7gTw0LaEROSfxIaRRGeZueq1UExVdpAZr5NxHXs=;
        b=fZmjtsX3CVipSeD4msL1iBZbwG7MDQ4DbWGwwvEqELFHiUzWw5NIDeTm71iELlESRl
         z6lv5bSUnF4Cg6ecz62SZ9XIlhJG58pVKg/qImxaRo18yzWwGCmNMNZXMDIO1vl+8py6
         BxP0wfPE2tYpB7GmA9VulKJldlNhxsEZuOvpW82dWENkcC9dMQA2DlKNsfUbjeNTvnl+
         8DpYLga1vC/rjoDS/Q8/wdXvxkTXcJ1ex3jHTuDmtkI8s8t+lTJpUY+M7oqqPM90TZKr
         WHcqQRwKCg6/6eebXIqWzSRKwEDEr7qVgMmGtqH/iNRgzg6zS+J3oPcONTP2RdinbSlY
         W+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417899; x=1793022699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBRr7gTw0LaEROSfxIaRRGeZueq1UExVdpAZr5NxHXs=;
        b=Tmg6TigEA7Z17CdohTYBe/gtIH7JmOprPFVauBD1W/LgPDjMQWqsAp0p1mJCZ+nmxy
         GttdHFhkB/cnlFYpmIKZGcGbbb2DPTSsCmLxgGfuOQpa2N9EUJaECu7DkgWMW2wEmV54
         dl0Qz7R5WngtETZzMQwikkvv56NmdAgt7/6HsDp9TwDZTLM8NTqMmNKB5jH3FtBCNXxt
         2xuB5JjVm+cixCeL+iC8Jkfz73ckMlTYIZm6VKea02esqkHXKsRXuW2K3WeJWMV0QcKP
         pM3RJO5fFSlh8A9TCPr5hrwyDyn4RISdWb7YK+daaFQJsmUQ4Haj0ah5JmiHBTohzPQF
         A3wg==
X-Forwarded-Encrypted: i=1; AKwUvByjDEUDSZ4Ddf1+/74MDTD7Cq1g3ykR2uK+Iv+LaBGnX0afVo94PBIJLO6zsfpZF8txbKBcXVD11d0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLO68mPECVGHLWa+kAc8BK1UdyL7Lm5PUflo+zpT/Lfjwz5rLlm
	12zxgUL6zS9cUYOUUBz8SfQVjiDi4cA4H6C9ZdDcn58Xvc4AYAseX1/eUEhei4zpx4E=
X-Gm-Gg: AYBFou1rFcH71aJSHhu/Nu0I8dKtD3t46geBnN87S9ZwoSxccUZwu2ZPcgB2Uq3hnBI
	+XfEWODGY/vviP56XAfR7uKvpQRDzD2CVRbDaf+oEeaN/nP25uw0POLIEjCGkIN4M5O/fduq3jI
	e4Hi8KsFI4dYq2C1A2sYQnIgctg0SyeGPO3k5K+lVl54almEo+hTW4qkJZ8DOihRgl3CkM9bkdq
	MzGxgEGE88UuVw9gjj4OcCrwJpxVKAIJSUz5OuXvvC5B8XCZCSHhgxO6lbN1XHRE1jFECro/sNf
	NyBod1JBG/UB4QO2GPEsltlQ/qbR2ZmVQrssgGjV3P9ZmwhfLEH9uHhURDcvc4Ny6FHT2v4DlcE
	AYb49jv7W2OJ2sHZMw5jNVAMYbl339rAeCJMRK7YW/vcCbcsWJvVW3J/pcOcS6i0d3k6QjIMyAC
	10wfF754Zxt0H9QULX31nW/OUY2GxYIgZRWHAYVCw8kEwmJU3lAkkfnoMiCRZn7Ft/p34xTHZfh
	GhDLPiwlruYl/8=
X-Received: by 2002:ac8:5e0c:0:b0:530:1b1:72be with SMTP id d75a77b69052e-53646005c93mr115881901cf.40.1792417899549;
        Mon, 19 Oct 2026 06:51:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:48 +0000
Subject: [PATCH net-next 14/15] net/tls: don't BUG() on leftover length in
 __skb_nsg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com>
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=1174;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=a5Mq1Y08mQBlSbHPsSgUKJSU0iN0kG1IRQ6Z8TBZzAw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAaOzcOEyDqIT7ixMNNFAojpV49DkAGaMSTgMMsV3T+Kry+T59Y4cK1hbqIN6aNryN+eDJKEsst
 k24iTK/yjrAM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1792417901-2551A2A1-95AE5B7F/0/0
X-purgate-type: clean
X-purgate-size: 1176

__skb_nsg() counts the scatterlist entries for a range of an skb with a
copy of the __skb_to_sgvec() walk, including its BUG_ON(len) when the
skb runs out before the range does.  tls_decrypt_sg() calls it on the
same range it then passes to skb_to_sgvec(), so a bad range would BUG()
here before it got to skb_to_sgvec()'s error return.

__skb_nsg() already returns -EMSGSIZE for a frag_list nested too deep,
and tls_decrypt_sg() fails the record on any return below 1.  Return
-EINVAL for the leftover length too, with a DEBUG_NET_WARN_ON_ONCE() for
debug kernels.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/tls/tls_sw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 312e51270f29..1c578ea47a1b 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -142,7 +142,10 @@ static int __skb_nsg(struct sk_buff *skb, int offset, int len,
                         start = end;
                 }
         }
-        BUG_ON(len);
+	if (unlikely(len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
         return elt;
 }
 

-- 
2.55.0


