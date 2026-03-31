Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D40E10F930A
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2026 23:29:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1269511.1558572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWp-0000jQ-Iu; Tue, 31 Mar 2026 23:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269511.1558572; Tue, 31 Mar 2026 23:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7iWp-0000id-Eh; Tue, 31 Mar 2026 23:29:47 +0000
Received: by outflank-mailman (input) for mailman id 1269511;
 Tue, 31 Mar 2026 23:29:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w7iWo-0000Ss-8j
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 23:29:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7iWn-004YwC-Lb
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 01:29:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc58e6-bab6-0a2a0a5309dd-0a2a4509c0a6-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:29:45 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cc57f8-e484-0a2a45090019-67a8ac99dbef-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 01:25:45 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2F7CB14001F5;
 Tue, 31 Mar 2026 19:25:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 19:25:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 19:25:43 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1774999544; x=1775085944; bh=EGvzpeUslV4ZxMlxG03hV
	fjuVidhGwwNq/GPCltvYJ4=; b=Ls52G0QdJcaWb2xaTKwVJSZWV/9gAtVPvZvCR
	2S6v5sYzLCNiL5qawm9t4FWA0kyDQyJSNSddYB3L1FrNbjneArsBAHa1YjmwiOuY
	bepxcdi1mEChLAVJ+lUFB6R+mjtvM4NxBkhSn6LIvwKmBTvelxBWN0dVKY+z+7+d
	5myw5NFSBOMl3DHPXxnbIame3D8oXvAGfffVX+fmaJqUBf2VnKUUj1snstWRUSSb
	PmQ43JJtSewe2RbdcQhQcZdufGJ9HthMFPHN4vnIUNZcI2ytT4rDD0OvciqWxA/r
	ac/yumO1cmzJ9tx5bvXjtSKEpBzK8BEyveXuvaamTUOzQMW9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774999544; x=1775085944; bh=E
	GvzpeUslV4ZxMlxG03hVfjuVidhGwwNq/GPCltvYJ4=; b=rf1sG/rCeeL5suX1a
	MdzAm6zyUJINxOYTvlfF8FTHBY8KsRUvphf6Sm5r8yJCw23MHBTo2iM7JUreqeoF
	1lGuaiZ4AVxpULVCChSqBoBarTC0ImQ6telNjfkIy5xYEBdx7P8kI2Y3MIN/52x9
	IHSjJ4TxIUSmg2+52LGQVTOp/Q2qQBcbte/MTpERc0CwQbbQJWF55s32k4Da5dw6
	4PVZF6u4NBfiblEtOE4G2cmqo4SoUEFOUVbBk1JLV91wLZ/gymj8/MmIdPCWkBmo
	KdBzjcmH4niWHC4CrhJ5puywS3+IA+BPedx57lYvkuKLdhSAtkLaXO0x/m4TT46g
	dJXXQ==
X-ME-Sender: <xms:-FfMaVB-bQDhv332LzUEhg96-0iyECrZFc5pr0_TIWMeBC4Dg5hq6g>
    <xme:-FfMaaaOB3vzEi8vDBV2T_k-6by6KJv4Dk2ibJ2S9pjkHx-zQ5YO1m1BrUFtiK4wz
    ZtEdPVcF3RtFeTCYxDsnpAQb-0BfLRFpgNj4BxHHZMzjvbfmA>
X-ME-Received: <xmr:-FfMaY5ze0T7wozkOynogwgfGdDclUIEVcH6ffiDlOtOT61Wa4WM1ulgow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeljeefhedv
    vddvieevfeejgfethfeutdejteevueffjeegkeevtddthefhgfdtnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhi
    gidrtghomhdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomh
X-ME-Proxy: <xmx:-FfMabbx6kJu-6cTG4AAU1GE7zKWY0SR4s80GWUyqzZp_WFeVMrdmA>
    <xmx:-FfMaXgrEHDVJkbdOj7HVCRtQkQAK-6DpThOtjnez4lt9NezAkw8aA>
    <xmx:-FfMac-rjGTqzgI7yq4-1wz_8RmxyRmRdJg_td7D0PdWPqRyHH8yjw>
    <xmx:-FfMaSppTm0mChi_QShOSQIZq9LK6L2mibfMq9y1K5VPx5NoPf09jw>
    <xmx:-FfMaYOhnPDsjYWoZlWig6WfWcnCmX1gXvl8QBs9dlPlFzQSwWG48GpR>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 6/6] [DO NOT MERGE] CI: example how to use ssh to extract logs
Date: Wed,  1 Apr 2026 01:24:55 +0200
Message-ID: <0e03180b8e69830df0d54b0a332b0f1fc88192d1.1774999414.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
References: <cover.ca38f9571ab23e254a985ecfd4715235675aa06e.1774999414.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774999545-6AB41A73-B6E458B4/13/0
X-purgate-type: clean
X-purgate-size: 696

---
 automation/scripts/qubes-x86-64.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 745fce6f9134..1cfe03d68747 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -296,6 +296,8 @@ export TEST_LOG="smoke.serial"
 export TEST_TIMEOUT="$timeout"
 ./automation/scripts/console.exp |& sed 's/\r\+$//'
 TEST_RESULT=$?
+ssh -o StrictHostKeyChecking=no root@$SUT_ADDR xl dmesg || :
+ssh -o StrictHostKeyChecking=no root@$SUT_ADDR dmesg || :
 
 if [ -n "$retrieve_xml" ]; then
     nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
-- 
git-series 0.9.1

