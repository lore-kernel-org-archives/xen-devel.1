Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F92ACA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:17:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442682.1660289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWCD-00023j-9i; Wed, 07 Oct 2026 18:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442682.1660289; Wed, 07 Oct 2026 18:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWCD-00023T-6W; Wed, 07 Oct 2026 18:16:53 +0000
Received: by outflank-mailman (input) for mailman id 1442682;
 Wed, 07 Oct 2026 18:16:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWCC-0001tp-99
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWCB-002L24-Ld
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c79-bab6-0a2a0a5309dd-0a2a4509c082-10
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:51 +0200
Received: from [209.85.160.172] (helo=mail-qt1-f172.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c92-be1a-0a2a45090019-d155a0acb5dd-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:51 +0200
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-5352a876d5aso24839131cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:51 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5357214830fsm26034571cf.19.2026.10.07.11.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:49 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791397010; x=1792001810; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbLtENrG5I00kMX4i+UCiZIr5Qm/AkQbhE28uvMASeM=;
        b=ER52XcKVHz+2LK/IUppbJl73vyGbzmkolxsdnvfnTmtQjegJqXIQpplKzsuQH10fJs
         oQ4ngRw9OqcAPXR7qg3NbMuPM34JbxmxdaRXlr3Tn+xi+8hX/ZZvEYjzw0AvkguyB/l8
         8BZHGIEMs4U0P2NrzDb7cnHL51X4wZ4gcS3eFCwIBAB/QoU2WAZLy5Ur6tholirJOBFo
         YX1244kykN8FB7pNqA9WaVcAK/+VoxIp8niRAEoCSI9oSmy/0bO9EbxEXbUL1sZL/ee3
         NowU9Dgxeq9iffAuALFTRxAGFh2GuJxFPzDCKQUSmhfC5xGl2rQsQEEfex6AnaXhsJln
         tSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397010; x=1792001810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbLtENrG5I00kMX4i+UCiZIr5Qm/AkQbhE28uvMASeM=;
        b=CE4Uyp/pIYSbHcr3v+RNjrEsCvrMW7mxqMUvigKJDZBj3RMdWyy0oTZ48AIproGxWz
         wE7ytv1hgSBStvdWBO+/8mGLBPByH8kjYq7w+Wuev4JOn3jQxuT4JkzoLWipYVTIDsH9
         JfoYH/Nv6LgEkHTO8Oxssv918Xs8XuFbz+DcwZyZVIRw/YE2NxozdC+PMyryfP44qFM/
         A+Z1Bcuw3zCEFxit0LczGZ23EDK9SezqGxU1wnKYziCv6KeQ2vz5+YGI6H96H0SQSdoM
         EV9aj9smUKnLnxbqRMOpgMRvSBb/SCDBGYgS8b3bBJbXv1Dea3ZemuCOU6pxMCtr15SQ
         5BBQ==
X-Forwarded-Encrypted: i=1; AKwUvByCzrt25h7VyExqP8Ox5tI/Vrz/ssRz7J6g/XVVXsc1J8VaRFOhPWZENoSxatpPBrugSDxsGwjUVC8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lhjwSP5I/MapWhPu/X84rZ7ODSVMaju1AG9Kl0Ip4ZrKKvzUvY
	vu3EEuU21SadkG2wk0Tx2u/UAHljRpKMsvC+LFC+/qj/Yf2WNeTjx6ahjm9DBcoWzUERrIWCmc4
	iWuieaJ/zjQ==
X-Gm-Gg: AYBFou1+/OEvO+dtD2nEHERvEMOSc5Ntopxa7FToDcW3/Lz0Z7IJuM3+23IV8hYD4NS
	pl8e0/62gJ8FS9NicDysFIOn+RIrvkIkIApaRXrueHFL/mKbuWwwzqwoCw9Q5PB03KGBQUg9E1S
	rjH8lBRBehv2Tl1+lVSvwO/HflByMo2CnRMZni7bLm4c1WML22J7MrkUf7sdrb3nD4YOuBc6JSy
	RU/+kt7jW2Zj9u2wHO6du+Q2Ucqhb133joeyauQFc++3sVCbG87PPngGhf5mtTozcaDUR0TRRt6
	EP6y1Ed4Gqtl77Bm69mqyOcmESXlUTPS0QCT3QNUtLVc47o9gQMif7Dnr8ojUH3EKUk6vklEzN4
	8tOCwv2hxePrep5jBY36tNqHUnI6hgm3ZPtB/pxZ3Xu7v83GWYeIo89xZPIUBIN14O3TMt9hBsM
	4tl73FvTsIFpKQRn2E2G+yGqr/W+SddijVieXW+/XODCn+nc29p2dYztuuikoPHBlBc4nDJ3sW8
	OFKMNDcTk4mf+ZnTEcjXyce3Q==
X-Received: by 2002:a05:622a:60b:b0:533:94fc:1e69 with SMTP id d75a77b69052e-535755237d0mr54333081cf.21.1791397010017;
        Wed, 07 Oct 2026 11:16:50 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:22 +0000
Subject: [PATCH net-next 9/9] net: skbuff: don't reset truesize in
 skb_condense() if the pull fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-9-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1285;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=aE3S/MO9vLOemBhMvEWEtBv4CYrulZjUcAw8T5FEx9E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAKmlD/cXgBiooOoWC6A+H7tw5dWzG4gHatAYnnjbF9tFpPNqC/1rDXMvdLjveUvTCKNu/kJ24U
 cYCfNc2tlrQI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1791397011-BDEC6034-39718009/0/0
X-purgate-type: clean
X-purgate-size: 1287

skb_condense() pulls all of the frag data into the head and then sets
truesize to cover just the head, but it ignores the return value of
__pskb_pull_tail().  If the pull failed, the frags would still be
attached and truesize would undercount them.

It can't fail today.  The caller has checked that the head has room,
that the skb isn't cloned and that the frags are readable, and pulling
all of data_len eats every frag_list skb whole, so nothing is
allocated.  Check the result anyway and leave the skb alone on
failure, so this stays correct if any of that changes.  Use
__skb_linearize(), which is what this pull is.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 43ebe61c7fc4..70df607da05e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7118,7 +7118,8 @@ void skb_condense(struct sk_buff *skb)
 			return;
 
 		/* Nice, we can free page frag(s) right now */
-		__pskb_pull_tail(skb, skb->data_len);
+		if (__skb_linearize(skb))
+			return;
 	}
 	/* At this point, skb->truesize might be over estimated,
 	 * because skb had a fragment, and fragments do not tell

-- 
2.55.0


