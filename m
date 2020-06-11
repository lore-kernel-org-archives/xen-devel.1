Return-Path: <SRS0=JrVi=7Y=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B437C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2020 03:36:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF66C2072F
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2020 03:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M48EJOMI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF66C2072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjE1E-0000Ys-5z; Thu, 11 Jun 2020 03:36:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvn-0007xd-T0
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:31:07 +0000
X-Inumbo-ID: ebcd4792-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebcd4792-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:39 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g62so3610368qtd.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=khKs/ueL3SKxrTYIvshrhZXLqxoI5KFK9g9nhuvMTiw=;
 b=M48EJOMIzperQGLcjFAMzo6UJzx6vE/5utVAUhmsnb5gX/0yhT9UkQIc/2ewu5q7vu
 qG1JtDY8t4coEvAkbyiMff2EyUOd/qsb6bXPz1cDbtbzJRZ0woc0FxjunV3XgUdYMLp5
 byeQw4/DhQrQKgOQ1sWB7kEmNQwacDmy7x6c5VCanLS9bjhcd9msTUilIWIf2vnlMJha
 uoAx7ggRaq4iPdA9wXn3d+JMh8OZzSqJKMvqamstebItR5lrKQaKQZ1LqgLajPbVrWh5
 MqP9Y0NtPT+MLnqlMNbOrwVsNHM6MhnSauSruqBPvKnrbEbCEWXFCGh7WR0y0hykLn+T
 Q7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khKs/ueL3SKxrTYIvshrhZXLqxoI5KFK9g9nhuvMTiw=;
 b=mKi4c3LrZmw7jHAVRpQVfNdiAl5CghU6BJFtbG+89rIEN5hoYn4APSgG1vS9jdjL9F
 zgE3oT3n9nisOQJQ2F16AwNJF4Dt/By9cVv3Y+MPXmL4LAGADNuj0u4fsviwrDMz73YX
 x1DDdbPrY82TuSFq732OWJ2+RFVwgE4fVOPpEfPGWNjgY1IDc5B0uKHrC2aEtka2eKO5
 KAgbNVWYxtuBWTiCOsoSj81zwO8MCIw4cqXwvwmbByzJsxWQavM4ey8D98LfxDQH9AtP
 t8rPZHQb3zw8i6erGGMkZX4TgZy03GaBZ39HTM5QL6HS0RWcE47nF6cZoMpFJmbnEY+d
 UT0A==
X-Gm-Message-State: AOAM531ZWG6nJJAEur1KaXRZNgKhUauaDYfH7jzNx2YyMdUgqj9HPoBi
 RsK0P/zUg988PylZLvm4M24VfVLo
X-Google-Smtp-Source: ABdhPJw8KtmXLensobiDVVb6TjPFlvpUQ+j3O+FqXc7Hj+hM6FWMuk/H1OsnljFEAFJkGcJ/Ig7d9w==
X-Received: by 2002:ac8:7b4d:: with SMTP id m13mr6922467qtu.165.1591846238793; 
 Wed, 10 Jun 2020 20:30:38 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:38 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 10/10] vchan-socket-proxy: Handle closing shared
 input/output_fd
Date: Wed, 10 Jun 2020 23:29:36 -0400
Message-Id: <20200611032936.350657-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200611032936.350657-1-jandryuk@gmail.com>
References: <20200611032936.350657-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

input_fd & output_fd may be the same FD.  In that case, mark both as -1
when closing one.  That avoids a dangling FD reference.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 3552783ec2..e1d959c6d1 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -349,6 +349,8 @@ int data_loop(struct vchan_proxy_state *state)
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


