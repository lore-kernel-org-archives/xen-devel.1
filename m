Return-Path: <SRS0=TguT=NK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB45C4320A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 19:06:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652F0610A6
	for <xen-devel@archiver.kernel.org>; Thu, 19 Aug 2021 19:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 652F0610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.169113.308917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnN9-00085Y-3v; Thu, 19 Aug 2021 19:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169113.308917; Thu, 19 Aug 2021 19:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGnN8-00085R-Vg; Thu, 19 Aug 2021 19:06:38 +0000
Received: by outflank-mailman (input) for mailman id 169113;
 Thu, 19 Aug 2021 19:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4yt=NK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGnN6-00085L-W1
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 19:06:37 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 924647a9-0120-11ec-a656-12813bfff9fa;
 Thu, 19 Aug 2021 19:06:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 653DB3200949;
 Thu, 19 Aug 2021 15:06:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Aug 2021 15:06:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 15:06:32 -0400 (EDT)
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
X-Inumbo-ID: 924647a9-0120-11ec-a656-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xhalzY
	k1hBhXm3piIxglJetr7aSFUgItjh7mKHD7vHs=; b=gpMLlwNpVGarWPTgBXEfI6
	FFSZHm+h0dQJ7IoOU3J54xvMUE8p/Bw3YqLf68scdBU+xEeEQzQJOOkDtPDHMskr
	+78jgG0shKfuf5fL/dcoOc42W/hR/k7IY4K90tGxITJqVQ+Do3QPqkjVyFJ3fX33
	gN2rHjn81uIHwDefpHjwTVFOSo0+FQS6lAjiwwhUCXzHmVGd/RPGUi5pwEnfvq1E
	8p5GCTgQpBG74gPzEqheO5iQcLFwrKk0XRf48IfUtMb7Ggy2SC58cF/GnrdQ0Ner
	hQLSMUQDXtdkp7vUuDWfljiJwCpYrfk/8Ca86Beb/ljFdxB+Ep1ZBDmjlW6jMYHg
	==
X-ME-Sender: <xms:uaseYXv8qrnS3FgOuNm4K44QRSZzdQkv9cnXc3VtccMUbwgpmPIHwA>
    <xme:uaseYYce_l_lea7S14lbkRG0eJwM3yu1UW09waE7VmB1nmYAfGRjpmVg_BLTYsm_h
    _EVhF2Dgj2YfA>
X-ME-Received: <xmr:uaseYayhdFwpq6UlHIRiDCyNiX6vH4fayN6hsHhf-5FbwEt1v0Xtl_hMt1XBrxT4lv7dF-8tUQ22yaSo9Q3Q1-p43RyJFp9ehwIGLyHzS-ooOKC88w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
    keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:uaseYWPKXJ7fO5-ubyTCFXs9PyYZCDJS4pLOSv4wnXdKJEWrZYePPw>
    <xmx:uaseYX_i3nRhLbFWuRWQvQ4mU_SIktlrDX0IMcBHdop6GsCWsruPWg>
    <xmx:uaseYWUmX3IF6HGu3q2iyZedHK5BOMRaOXGFL9nZX4pYpJrYh-6w7A>
    <xmx:uqseYXx2jK3D_krmG886FbzWqzS1Elb6IqXXstdP2xdSQ09mnSZVJA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] ns16550: specify uart param for ns_{read,write}_reg as const
Date: Thu, 19 Aug 2021 21:06:24 +0200
Message-Id: <20210819190625.476165-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

They don't modify it, after all.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v3. There was "ns16550: do not override fifo size if explicitly
set" here before, but it's already committed.
---
 xen/drivers/char/ns16550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 97b85b0225cc..20da8fd3b421 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -108,7 +108,7 @@ struct ns16550_config_param {
 
 static void ns16550_delayed_resume(void *data);
 
-static u8 ns_read_reg(struct ns16550 *uart, unsigned int reg)
+static u8 ns_read_reg(const struct ns16550 *uart, unsigned int reg)
 {
     void __iomem *addr = uart->remapped_io_base + (reg << uart->reg_shift);
 #ifdef CONFIG_HAS_IOPORTS
@@ -126,7 +126,7 @@ static u8 ns_read_reg(struct ns16550 *uart, unsigned int reg)
     }
 }
 
-static void ns_write_reg(struct ns16550 *uart, unsigned int reg, u8 c)
+static void ns_write_reg(const struct ns16550 *uart, unsigned int reg, u8 c)
 {
     void __iomem *addr = uart->remapped_io_base + (reg << uart->reg_shift);
 #ifdef CONFIG_HAS_IOPORTS
-- 
2.31.1


