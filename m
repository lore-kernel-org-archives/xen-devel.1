Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C8CA6017
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443811.1660973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHC-0005yG-0J; Thu, 08 Oct 2026 21:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443811.1660973; Thu, 08 Oct 2026 21:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvHB-0005y7-TN; Thu, 08 Oct 2026 21:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1443811;
 Thu, 08 Oct 2026 21:03:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvHA-0005tm-5d
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvH9-00Dh5Q-Iz
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80529-2eae-0a2a0a5409dd-0a2a450bdbd6-2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:39 +0200
Received: from [209.85.160.178] (helo=mail-qt1-f178.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac8052a-b7e8-0a2a450b0019-d155a0b2c82a-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:39 +0200
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-53504882980so48852351cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:39 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b7ecccdsm3179791cf.30.2026.10.08.14.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:37 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791493418; x=1792098218; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgpiLoGoqA0xV5yWN2rO1XVw1oOPWsG2lgMDpzrz1ts=;
        b=md3qrK4zoVnDvTnTVzK1hRtTapY6MH1o2579fsWFpmtykmtfGptcR40UblnMenYhxI
         +u0Uat4CNfjFhU0RuI4PF+3PIMEXba2is7ygX7b7xmBSO75aYFXH7z4zQhUPN5hKWe0s
         y6xT/8TKF8G3+XIT3vCyKiHpO7YqB2+OgX3ERgUW6K27V6gMHxTHjyeYibKuT8sJYD4X
         uCkXWdlzRsl7FOQrmZTHiawMF1IRyvk647KHCo+HQCMRiPPdolAU/DYTN5r/3d4+y+sV
         yQt3hrGhBrxoNC2I4H+2eJSKsPd4CTAAuf2nrcBJPcNLZ8RMwxPhnZUkVoaGQKIiCai4
         K8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493418; x=1792098218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgpiLoGoqA0xV5yWN2rO1XVw1oOPWsG2lgMDpzrz1ts=;
        b=p0uwXazXjkHsd7L8b6zb5b+DRr9gNomKGjJfnY4VRpGz1DDCAiMQtbBujEDje9Z2k1
         l2/LxiXlWyq+itSGXVXVu9GhNMoN1tHRBtnUbrYWgfELCIJEDZ3dpqEy7GIkl5AIYXcu
         kNYtgNHsl6OL+z6hf0G3IgK5cg1uLbDUIReLLHqWrO3AnuNfeDvAcCerCPGash7a00y6
         LcC0iEZqSiauO6Tprs10lXK2ii1wTV4djnO0Uw6KV79UUHC3sujEjlGC8RfX5qfjmEDw
         Rm6kyS0yoUMsj4VmvY8qNSeW+PkFlS4xztGWCeck8hPnsiUe5X1EoX0wzsXUpn0x9QmJ
         +X1Q==
X-Forwarded-Encrypted: i=1; AKwUvBymJ5S9hLB/THiMxymD5cMdsVJulYGXJtQ2LULGPp8LoQdrH84wn4o2yGNUutKEyvYKGHzlsUeTt0M=@lists.xenproject.org
X-Gm-Message-State: AFuF++kbyrsEuHP9xkJCbtIgXUPOFHthXzJQipLFxy3hK2bw1HO37vfb
	9J1h6Z1JJQTga1EbMHSTyD4xQvghBeujndoZA27FktHOwdHla4AhNhyf2vpKIbmL51M=
X-Gm-Gg: AYBFou0eL6DDhEwsbgFPTzi/IgaIUInLWAGPQBwfB5bP0etI38AiENAd+dkYFQeh/u4
	Qwkkl2u7E3rFGkVqUsYJ8fLgt4gnk6dEhtgT19DWPSE7AgHhzogppZvQCznfmc8rbegI9RkSmr6
	jQLwZ4KJsbQgLCqrNGTuISwyFhAMN1zcNXu9H+dM1vlv/QdZNfOpcS6KQSpf1UQIXPK4d0pY2Lu
	TWCaMspvyZbb4OgIIuRuf7cfwcuXUl1My3FruQkLm6T+E9Rc2BV0FFhy1BhjtsPauG5L6ImQMvc
	mnJZ+hBAKl1WewdsFM0aQ7p17wQ+A8kYpT58bSRIwfwTEeJMfdrF4rvRtvaCxZ33kvbmn/wYPCM
	nfP+Y5A3/aOvYk+HFYGrv/ZuYvmxqminLBro9XJaO6Blyk6gPDMNz934MTqyb40DXqSwIUfJqZo
	gfszusVR6KqzPZKJ5IXjAm8raMmtcpjkmMKMKueREljqLtZ/VYY1HlrFGWiy0o+ZJ50Dbdj5JF/
	i/x2Xr85Tth7Dg=
X-Received: by 2002:a05:622a:90a:b0:530:e52a:8ef0 with SMTP id d75a77b69052e-535754fe4e9mr117963541cf.26.1791493418024;
        Thu, 08 Oct 2026 14:03:38 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:54 +0000
Subject: [PATCH net-next v2 07/10] e1000e: use pskb_may_pull() in the
 82571/2/3 TSO workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-7-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1188;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2XY23bjEEEbmilzyi/OT0dLNP6D+zOB3zspYb8/aVZ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAo/dBnlSZS1Mj/EC08Jadkujj6NZVKDZ6T6FMxXeYq/Bm8xNWGafGFpWL2jadSBYVOawvF0VKq
 O0PAtfO9A+w0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1791493419-A9AC09EA-58F2B083/0/0
X-purgate-type: clean
X-purgate-size: 1190

e1000_xmit_frame() uses __pskb_pull_tail() to pull up to 4 bytes of
payload into the head when the head holds only the TSO headers.  It
already checks the result.  Switch to pskb_may_pull(), which takes the
length the head should end up with and checks it against the skb, so
this driver no longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 844f31ab37ad..e216868e15cb 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -5859,8 +5859,8 @@ static netdev_tx_t e1000_xmit_frame(struct sk_buff *skb,
 			unsigned int pull_size;
 
 			pull_size = min_t(unsigned int, 4, skb->data_len);
-			if (!__pskb_pull_tail(skb, pull_size)) {
-				e_err("__pskb_pull_tail failed.\n");
+			if (!pskb_may_pull(skb, len + pull_size)) {
+				e_err("pskb_may_pull failed.\n");
 				dev_kfree_skb_any(skb);
 				return NETDEV_TX_OK;
 			}

-- 
2.55.0


