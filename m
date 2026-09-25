Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB31C9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 09:22:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433557.1654052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA28Q-0000bj-2p; Fri, 25 Sep 2026 09:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433557.1654052; Fri, 25 Sep 2026 09:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA28P-0000bb-V2; Fri, 25 Sep 2026 09:22:25 +0000
Received: by outflank-mailman (input) for mailman id 1433557;
 Fri, 25 Sep 2026 09:22:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xA28N-0000bS-SY
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 09:22:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA28N-002HFj-4J
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 11:22:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d7df70c000072c4@swg.vates.tech>)
 id 6ab63d45-e002-0a2a0a5209dd-0a2a45078186-44
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:22:22 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d7df70c000072c4@swg.vates.tech>)
 id 6ab63d4e-b4ea-0a2a45070019-b9ff1c23a851-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 11:22:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d7df70c000072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 25 Sep 2026 09:22:19 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id AF777823F1;
 Fri, 25 Sep 2026 11:22:17 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=QHPOElREch3bYfWmG37dlv+FoSXbV4m95OGl/iOUKBM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=UJy8hmDMML7yWjxReCBIXrlZB9/Zp6IfkXKUDwVArIaH/zfR8DFj3r3aNJOeT2eCK5taiT2Zz
 xcjQNTZ+pY2ZDH/dkA3C/GlZ1F1l5iY36Yg08ZhK10DG/zrmS4I6JO5pcF7QVDWX8uEYes5uAJv
 BcPXJJd9SgNgrHfRv1UWIlHpAp1I10afu3/07w6hfReGIEfeaBruuGjzENJxq/SdgjfFoQErSZ9
 RSKstCCEdgHahtTE95yypVxiLDH/LrBvz/Zi/V7V+kMlSTeUVEJBCyi3wKdXPyYl9hooQ9a+jgj
 t840dUjDes5QrXcdMX0bt/jwKmDqVhg7MaoNQiL52/wg==
X-Zone-Loop: c344f5f1c9bc4989ea0b965368847d4be65687a8b98a
x-campaign-type: default
x-transaction-id: f39eb999-6f23-4021-809f-dfcec5fc651c
x-swg-uid: 01-cd384bd3-8b9e-4d0a-881c-4cdfd99bb011
X-Mailer: Sweego
Message-ID:
 <1790328140.8631fc262581453bbf619ec5b2062170.1a0d7df70c000072c4@vates.tech>
x-swg-bid: 1790328140.8631fc262581453bbf619ec5b2062170.1a0d7df70c000072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 37/39] xen/riscv: map IMSIC interrupt file for vCPUs
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <ae5965ba43eb691b078f4a6bcf8a87a1f7a5aac5.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <ae5965ba43eb691b078f4a6bcf8a87a1f7a5aac5.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 25 Sep 2026 11:22:11 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790328132; l=647;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Z4dh3PTbP4Oxu2clZeoh3IcndyifA3q3L6A72ikO7VY=;
 b=kpKltQiNrVURi/5XqnGPz8wN1FLf8XIRWYCW+b89grT4DMJwYDV/snWdSIuYVdTwAFl3HEOSn
 wQKPH0YXgTtBnJt8tTkuRlGAZ5UdFb5wiU4TKX7OZydx1FVpOWMQCPe
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790328137926
X-purgate-ID: tlsNG-ef75cf/1790328142-3C411AE4-0F028921/10/73395122804
X-purgate-type: spam
X-purgate-size: 647

On Thu, 27 Aug 2026 17:21:21 +0200, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
> the specific physical guest-file page.
> 
> [...]

Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

