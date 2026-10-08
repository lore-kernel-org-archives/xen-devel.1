Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032CECA6019
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443808.1660964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH8-0005eT-Q8; Thu, 08 Oct 2026 21:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443808.1660964; Thu, 08 Oct 2026 21:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvH8-0005eF-MW; Thu, 08 Oct 2026 21:03:38 +0000
Received: by outflank-mailman (input) for mailman id 1443808;
 Thu, 08 Oct 2026 21:03:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvH7-0005bV-PQ
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvH7-00H9qs-6R
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804fd-e002-0a2a0a5209dd-0a2a4508bc14-46
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:37 +0200
Received: from [209.85.160.180] (helo=mail-qt1-f180.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80528-f659-0a2a45080019-d155a0b4d0a2-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:36 +0200
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-53391022dc0so36962751cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.241])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb986c0e9sm24158885a.20.2026.10.08.14.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:34 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493415; x=1792098215; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtyJNESs2NfaCrmwRAvvPnxlfOHCunirXFuek+zM5MM=;
        b=X9rg4hoBb1kp8i6mvaIkowGiJ5SkGMFsq74a3nCRquIBooj1UkdoMmaNn7REgb2GUq
         9E3MlvbP8ZimGv38qup69576zcpRy1Fm+O6c9dyu8fJRq2EtQ1y72kAs2LnT4dahQ5Zj
         QrLjASPXA9IohwgeFWTe4O9amr0HJuGVH5xOqr8FIzcHjd65z1MDsPe/XNDI9HKkfhHS
         74bC54GzLQiZtNDlWUPUXUult8uFR38M8TFnG6+eyPOHBOLvkPXOpSMMf5TqX8RUGqS7
         Pr6HMYxZt6AAngCvrvRD2wHVeMoaNUFITq3C9M1lySqD+w81Eic+BHlCWZQeC5LJRM6F
         UzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493415; x=1792098215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtyJNESs2NfaCrmwRAvvPnxlfOHCunirXFuek+zM5MM=;
        b=vhG5fnDJkC6HF5qd0wmeFAknufHa6RgRDyV7vIe5zV5LmH4h4wAiV2Nb/PmG4ItGYQ
         NCv+BUGh0l6ORnDwrX1Tbob7nm0DLywaHgWL4842wg26t6uSSKI2dmzBO/qLOGYCWigB
         NCckfIJapE/5pyRFkvxTX56z/JeJYjGB4LbfPjinMhwQoP7zNmYt6By6TUqWB8SjNy5p
         I+THuYMQMpGW4NVByg/6pEWo73FXb6O4YpKz3ugpzLaYIOo4qB8Q/+mO/p/3xObqKEMk
         wg1kj5Faem/Nw5sui+4W9ZZko6DVMZjeduMLJHpDOI9qeLg1xzBjiFALeiCLqL0vcFYS
         3rDg==
X-Forwarded-Encrypted: i=1; AKwUvByO/cp5uQKZDAG60qb5uS4LKQwPY+xowLERtUd5n9+Ra/z4CFnMJHS3rMDc5YK7iP8nN3tpmQcH6dM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mosBDKIDmcnycgs7IJT5E1L9qKBq5YPf8qldnFzgBKQ3yKIeb4
	A0/sd4YVcu6d6TZkAFqhcTYBgHnO/NapCyFJtq07vFlLWYVzz9FLim3168OOjNDpUC4=
X-Gm-Gg: AYBFou0EtiVMRz1v+YyBONAXK+As0s1sGCdJVaogGZsyQT2KwFDFMI/tbgIs0V4uEfx
	J8TnG3Xn1iMcde48nqBD4xpyB2z1lu0PoaKrZMQYYkY+6EAaPtP7Se+rgwaWM8ha2ShPvSnL5hF
	pgG88olPzI2zRiLcdAJJ1rLRHrNcerrqEw11zBa9w6E/0Y7fCokFMELJZfJ/1mKhQ8g3Z3ElUka
	MxhKe5U2mmtGLiNViWlp2dZEUtDkBpwz7KZF68h8HGiUY4HbfNCsWG+QwxG1R4S+zQFUjF0aZ+Z
	g/VPj+lXLrAmZatn1iYHf5oVEuI9K3AEQtxfxlcdQx66XcglQxDrqIjH105YJYVWeTM8eH+80cw
	xGNSBaYTHumh1znTjN+89gNMQa75imYBuEZnGL0QIvTkyxSBGXhqSshPccsHwmlWEQ/wXxmRc1h
	FKGpX1vmnI7FTJ0fnc4jhb9fd9QuoXkWNt1otCq9zr+6N8lT/KVzWQuzXKbVIFceaA5RcSXY/AY
	TLkQtCFhQsvrAs=
X-Received: by 2002:a05:620a:4613:b0:934:ab73:ac53 with SMTP id af79cd13be357-93e9af42cd2mr1369444185a.0.1791493415593;
        Thu, 08 Oct 2026 14:03:35 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:53 +0000
Subject: [PATCH net-next v2 06/10] e1000: use pskb_may_pull() in the 82544
 TSO workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-6-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1221;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=yldyXc+k9IUGHFBVvbXY7100U73O47dmandGyjhHpkE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO2CfzCzBOeK9ZW88WGSv+B3RUqXFGdARFKgVlna7gjBWdR0TdJniqj/mr2mdJ20mJNMEnviLw3
 DiEJcfynbhAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1791493417-CD94A87B-9BD72912/0/0
X-purgate-type: clean
X-purgate-size: 1223

e1000_xmit_frame() uses __pskb_pull_tail() to pull up to 4 bytes of
payload into the head for the 82544 TSO workaround.  It already checks
the result.  Switch to pskb_may_pull(), which takes the length the head
should end up with and checks it against the skb, so this driver no
longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/intel/e1000/e1000_main.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index d7f5c6f16142..3a55b211f5a6 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -3155,9 +3155,8 @@ static netdev_tx_t e1000_xmit_frame(struct sk_buff *skb,
 				    & 4)
 					break;
 				pull_size = min((unsigned int)4, skb->data_len);
-				if (!__pskb_pull_tail(skb, pull_size)) {
-					e_err(drv, "__pskb_pull_tail "
-					      "failed.\n");
+				if (!pskb_may_pull(skb, len + pull_size)) {
+					e_err(drv, "pskb_may_pull failed.\n");
 					dev_kfree_skb_any(skb);
 					return NETDEV_TX_OK;
 				}

-- 
2.55.0


