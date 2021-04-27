Return-Path: <SRS0=syOn=JY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FEEC433B4
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 00:23:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EEB613AA
	for <xen-devel@archiver.kernel.org>; Tue, 27 Apr 2021 00:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58EEB613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.117945.223875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBVu-0007o4-Nc; Tue, 27 Apr 2021 00:23:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117945.223875; Tue, 27 Apr 2021 00:23:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbBVu-0007nx-KG; Tue, 27 Apr 2021 00:23:42 +0000
Received: by outflank-mailman (input) for mailman id 117945;
 Tue, 27 Apr 2021 00:23:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jew=JY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lbBVt-0007mO-Hv
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 00:23:41 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff006c37-d6e3-459e-b112-eb77e50d2c5c;
 Tue, 27 Apr 2021 00:23:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D7155C0186;
 Mon, 26 Apr 2021 20:23:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 26 Apr 2021 20:23:36 -0400
Received: from localhost.localdomain (ip5b434f04.dynamic.kabel-deutschland.de
 [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id CFF411080069;
 Mon, 26 Apr 2021 20:23:35 -0400 (EDT)
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
X-Inumbo-ID: ff006c37-d6e3-459e-b112-eb77e50d2c5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=gATBZhf8O/GcC36i+t7uFp1kBc9s8YNPkw1529oUZ
	4k=; b=jDabQXVSz8HPFf8uOdBIg9gjT4yW2qRtksPiEFN70PJUfAz2iyfxz531N
	ReTWL4PfGcVaPcSr7Yj0Lui4DFicUWIUG+KKWzDX9tSJ9/M95IUnJ0ienNfRZngb
	H7KGDywlK/6aoJu2ISk2CgOTyHkYTTpr7EXlMvEyMYANVFhCDe09C39yvheh+zyn
	xwHdK1xvgMVQjgIX+gjB90c0TMmTtRnXC0MjWGUg76p573/TNjS/kR4SzpgIXNlx
	X5CJZ/wQE/mjUvT/5+0RVYcKKINqAKwP7Idy/4lNGcrqLhHCTi6+Rallqqk54WzB
	YlfAbBD+A8qLcOCYkPfmcRnzGnj9Q==
X-ME-Sender: <xms:iFmHYK6VOaSGXQ4VDvf4AD6MN7dxgcleu0RqFrfwSDid0vdeynw29Q>
    <xme:iFmHYMJZ5Pca2g5V-Zi07U0emXlnxnD6wDRgMoyaJEVABmEwjefATS0JOze47DRhs
    tC4FgGrrsqPnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeff
    ieeiuedvudekgfetgfelveffhfeuieejgeelhefhteethedtheeuteekvdeinecukfhppe
    eluddrieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:iFmHYPXTk63JSmeHGpsD2XXOIQa8I6nqYYLvJiMC9Wwl9vjTU9ZH2A>
    <xmx:iFmHYI15lQ8PUaffHYHetmWBUr32RyBGWkh6eaysaE08cYZqLeatkw>
    <xmx:iFmHYD1zncQdvgq6DzY_XIixOhlTKdkDTL4GCkUFrjm91c12ce2YBw>
    <xmx:iFmHYG1FMktnUxCrKAqzMR6WnA9MIYeEyGzFetsvsIxg24m_VBBiCA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC PATCH 1/2] libxl: rename 'error' label to 'out' as it is used for success too
Date: Tue, 27 Apr 2021 02:22:31 +0200
Message-Id: <ccd0fa66b7a87a66556e5494a9534873009b80bc.1619482896.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
References: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/libs/light/libxl_linux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_linux.c b/tools/libs/light/libxl_linux.c
index 8d62dfd255cb..cc8baf5c3eae 100644
--- a/tools/libs/light/libxl_linux.c
+++ b/tools/libs/light/libxl_linux.c
@@ -174,14 +174,14 @@ static int libxl__hotplug_disk(libxl__gc *gc, libxl__device *dev,
         LOGEVD(ERROR, errno, dev->domid,
                "unable to read script from %s", be_path);
         rc = ERROR_FAIL;
-        goto error;
+        goto out;
     }
 
     *env = get_hotplug_env(gc, script, dev);
     if (!*env) {
         LOGD(ERROR, dev->domid, "Failed to get hotplug environment");
         rc = ERROR_FAIL;
-        goto error;
+        goto out;
     }
 
     const int arraysize = 3;
@@ -194,7 +194,7 @@ static int libxl__hotplug_disk(libxl__gc *gc, libxl__device *dev,
     LOGD(DEBUG, dev->domid, "Args and environment ready");
     rc = 1;
 
-error:
+out:
     return rc;
 }
 
-- 
git-series 0.9.1

