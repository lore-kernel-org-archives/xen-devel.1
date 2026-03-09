Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97953F3C245
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 12:18:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249368.1546826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZYW-00016x-MY; Mon, 09 Mar 2026 12:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249368.1546826; Mon, 09 Mar 2026 12:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZYW-00016q-JE; Mon, 09 Mar 2026 12:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1249368;
 Mon, 09 Mar 2026 12:17:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akxf=BJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzZYU-00016k-ID
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:17:50 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb77f53f-1bb1-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:17:47 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 29D1D14000F3;
 Mon,  9 Mar 2026 08:17:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 09 Mar 2026 08:17:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Mar 2026 08:17:44 -0400 (EDT)
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
X-Inumbo-ID: fb77f53f-1bb1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1773058666; x=1773145066; bh=YpKQcaQQ0Co1PPHvvVGmm/YJrK5gAvd6
	rTDRRxrgn/w=; b=Qhw3R8LlnKvaO+yPoBNDyI+Es8t1LeIdR95zYRIF1L9oojUK
	f/r0cWYGZJ0SNPeGM0MweELryPe7qmse5wH3RENIm/DRKmiSfs1fdo8OGMFUqtXw
	zGUkE82iPbtHmG4qdWBRSco3hNSD5nhgMnm6c50Ncawl6DeadoqL2lQol6H47YqL
	M9huUn6CBWxxK3ltASxuRARSlMu43KcfvOiuIr0lPASFtI6rrO1qFLgC8U1jGEmC
	xmrK6mXIgrG4P33as8TLvdaCgOCMdU094eLgYot8ApTBLQg9REkhydWmMOFLfy1a
	eNiO03mOq9td+PGwWWib3KpMq2XGLmEkznw3Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773058666; x=1773145066; bh=YpKQcaQQ0Co1PPHvvVGmm/YJrK5g
	Avd6rTDRRxrgn/w=; b=DFa9/9QmMsHdzfHVzfbaS9LHCjf7/BIHA6rrRoeXiRkQ
	J15KQ2vtiHoNOUhF/nqFsXdi7Ew4TTaM3H/oiv0o5Dq5pxYtLYwJMh+bsf+qCbPX
	0zUSs1UEOODu2o3C6rfwbMQyZicWhjjmcJVZE/5IyIxhW+CVWeBvZvA4U1AhuokZ
	zQgNy2B7r0726DN39nOD0fkXMUl/h5HMtIVtHL4xsk98UxD5NSB/WHTX+QlQv692
	7LBc6gxn2rCqDnMcQAV/kUgrfXqiQqwVUqDOgQmg6FtZOj4m2y2Q3GTa8oN4zuNo
	CjX5KSWaGP0rguhIFVGsYqZ+vY1w154or5fJkcp4sQ==
X-ME-Sender: <xms:abquaeAOTp725-iO3nxJwx6tp9PTqcmXooGfBD1guHO02MPBcRGeWg>
    <xme:abquaSn1ZtFe584fQy9KI3lWgxwoKl6IdhFVwzYq4QhrRLJF3foccr_uT1dJxpX-O
    lj665UizY7-g4plr0qoS6gNRuN4Xsd00hkF46TeNoqHnIE>
X-ME-Received: <xmr:abquaReUv6xJkJKlq5Q9XOMmLSAK4IaFkg8kXnW220BhvCDX0cnWpwVHE6gPI8hXkoRggOnbqdPAmUiWXw0K6QzXBUco9YQAZ1XyxTES6Bo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeektdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeeiveek
    ueehfeegveejveevuedtjeeiveeguefhvdffueetfedtuddvueetveenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepshhouhhmhigrjhihohhtihhsrghrkhgrrhdvfeesghhmrghilhdrtghomhdprhgt
    phhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
    dprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hilhhirghsrdgrphgrlhhoughimhgrsheslhhinhgrrhhordhorhhgpdhrtghpthhtohep
    lhhinhhugidqvghfihesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:abquaeSyO7IY9k3xkXIhcyTD-TANVtwzvhshxBu4bON2d_H-r7B5RQ>
    <xmx:abquaQvB4Lsig2u2tLLPDKemmVUYcBT74rUNkml-2Wj85a8CRtFSGw>
    <xmx:abquaXcxL-Gxq_bgpImmrtrrdBE-tvBWCtZVMqU6UevckmpqWWsVwQ>
    <xmx:abquaSaIezv1aoKzOiFbqiDyNANC1lfEw_7CIT6W3LDh4d_NEFTrDA>
    <xmx:arquaZkU6g1ycNUjwqaA3pCyyz_0MbVtgz_wtesb5XSs6Jm0OBmHQrdt>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org
Subject: [PATCH 0/2] Allow using BGRT table under Xen dom0
Date: Mon,  9 Mar 2026 13:17:21 +0100
Message-ID: <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For a long time Xen was invalidating BGRT table as it was reclaiming
BootServicesData memory (where boot graphics is located). This is now changing,
and the boot graphics is preserved. This series has necessary changes to
actually make Linux use the preserved graphics.

This is a companion series to Xen side at
https://lore.kernel.org/xen-devel/20260305191810.31033-1-soumyajyotisarkar23@gmail.com/

CC: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org
Cc: Ard Biesheuvel <ardb@kernel.org> (maintainer:EXTENSIBLE FIRMWARE INTERFACE (EFI))
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org> (reviewer:EXTENSIBLE FIRMWARE INTERFACE (EFI))
Cc: linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI))

Marek Marczykowski-Górecki (2):
  efi: make efi_mem_type() and efi_mem_attributes() work on Xen PV
  efi: Enable BGRT loading under Xen

 drivers/firmware/efi/efi-bgrt.c |  7 +++++--
 drivers/firmware/efi/efi.c      | 27 +++++++++------------------
 2 files changed, 14 insertions(+), 20 deletions(-)

base-commit: 7e1526209cf972f51281558f1cb979d18e49cdd1
-- 
git-series 0.9.1

