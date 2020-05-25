Return-Path: <SRS0=HK45=7H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7C5C433DF
	for <xen-devel@archiver.kernel.org>; Mon, 25 May 2020 02:51:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEBD52075F
	for <xen-devel@archiver.kernel.org>; Mon, 25 May 2020 02:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FE8JO6G2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEBD52075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3D5-0004c9-OI; Mon, 25 May 2020 02:51:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3D4-0004b4-FE
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:51:26 +0000
X-Inumbo-ID: 95a74246-9e32-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95a74246-9e32-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 02:51:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n11so10967497qkn.8
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vlm0vRlSx5YbGIPqCOuB7/AqLs+Hl6v+Oi0EjKoqVGw=;
 b=FE8JO6G2FC2LN9LRfxO8JC1zcOYD8p79JwblsTCdvw+HETKRl1qYtuFao3GJ1cn9k0
 Yu7pzPYZpk6OHjjdjoh1WBJZHt6s5cuE954MfHPoztKvITO1t8CBHOXMpHYMJfbDIHeH
 TJTAmrPKs0pL4avp+EMaOuclniWL0MjJ5URGDkD+KuHBlETcXHb9w9WniHEtvVIyiFhr
 qtoFhDkbx15ycWXpLAKr32KsrEn/QDEIidSpr4ZdWIELD6QcsirudHXGNknzdn7lx6Gp
 SAgbbd+HYRF4jJTsuEZ4jn7zdW2xJdDBPB0GFmO0PRE93q7iv0jcAMuCfsOU+hYrG31l
 0iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vlm0vRlSx5YbGIPqCOuB7/AqLs+Hl6v+Oi0EjKoqVGw=;
 b=Pld02SXTaGSR/kUZjD92aLWBP0wKdLAb0BQ87CZuM8WxIqHgR0LEo20uJqbFfcTn2r
 NMxNyJcEcm4zd7z7/z1b8DigesSukAhXI6qp86lvnihHxrWyZdnvJd6aDKWZt9SZ/sYz
 SAikjkixswIbGZGa6Py8avxEfgYtTYgjrwOM2jgLi6qYd21nZh8q3Ws9KMs5Irabyloh
 0QtHwtS2yX3bvCtyPD6xwACvQSLZ3W7xj3WeKvjx0Fmw2cHxoADZxNd8rfMNfUco6DTc
 6J/5S3EEmb2PBEqKI0NRfKu1H50aqaXlAvH1rz0+QY0kKLDiv/gIZ1mBHywMmn2ajTHv
 Lrow==
X-Gm-Message-State: AOAM5313bk61MvTgXuDS0g8XeIAw8TwgpMuSqZC9FETQQG/boZRP0GwX
 YfJcVlkkhZb9yZectfsjRrPU/iEw
X-Google-Smtp-Source: ABdhPJy3ohNXkaaZhuxn/Fk6T6gmp+Y4SLoqqiX7Y6XxduJszM+OOBBfOp6+MpVwoI2b1eYyXz9pDA==
X-Received: by 2002:a37:b3c7:: with SMTP id
 c190mr24190289qkf.466.1590375067957; 
 Sun, 24 May 2020 19:51:07 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:51:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 8/8] vchan-socket-proxy: Handle closing shared input/output_fd
Date: Sun, 24 May 2020 22:49:55 -0400
Message-Id: <20200525024955.225415-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200525024955.225415-1-jandryuk@gmail.com>
References: <20200525024955.225415-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

input_fd & output_fd may be the same FD.  In that case, mark both as -1
when closing one.  That avoids a dangling FD reference.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index a04b46ee04..07ead251a2 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -342,6 +342,8 @@ int data_loop(struct vchan_proxy_state *state)
                     libxenvchan_wait(state->ctrl);
                 }
                 close(state->input_fd);
+                if (state->input_fd == state->output_fd)
+                    state->output_fd = -1;
                 state->input_fd = -1;
                 /* TODO: maybe signal the vchan client somehow? */
                 break;
-- 
2.25.1


