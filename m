Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E19C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 00:15:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1216144B
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 00:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1216144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119637.226278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKz-0007lw-Ds; Thu, 29 Apr 2021 00:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119637.226278; Thu, 29 Apr 2021 00:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbuKz-0007lk-7N; Thu, 29 Apr 2021 00:15:25 +0000
Received: by outflank-mailman (input) for mailman id 119637;
 Thu, 29 Apr 2021 00:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S48z=J2=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lbuKx-00072A-V3
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 00:15:23 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb983bb6-d786-472c-a295-f9d1d4d9f0d2;
 Thu, 29 Apr 2021 00:14:46 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id v23so13535198qkj.13
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 17:14:46 -0700 (PDT)
Received: from localhost.localdomain (c-73-89-138-5.hsd1.vt.comcast.net.
 [73.89.138.5])
 by smtp.gmail.com with ESMTPSA id r185sm1021694qkf.78.2021.04.28.17.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 17:14:45 -0700 (PDT)
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
X-Inumbo-ID: fb983bb6-d786-472c-a295-f9d1d4d9f0d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=MJAWGHEUAw5eoKAlFYrwM/9yu/NhcTzkr9C5oJHPCDA=;
        b=A3V+fBzZ4EoTKzTgolB/bZYw7Klk1qmndxu6OOWrHZBriH848HFpj4AEu43ZxF6Wmu
         yJpX+j6noOzGf1wgdYy3RhjwQj00aM7xzUVHjm7Q2kvLaNn4A/hVr3C1qjD+JJoZJcFS
         1LV+PiN6qBjgxBvVbDhf0xSu21N2oTVt7vF/YFRO/usUXBq5+8MrYTzUF4usUW4WHWkh
         2BMD+FbmZtTpNZDA19k1gbq+cgzcCKlbGLhRSf+IMdDCje/Q+KrXRXJwXhmjJKIAggXC
         NcGWgKJz0pRGyDVauXBKuz9/ohr0d54QDKyAj+KnGZKR/ypEa5frxpJ0FQ/+Deagxuvr
         g/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=MJAWGHEUAw5eoKAlFYrwM/9yu/NhcTzkr9C5oJHPCDA=;
        b=ca19crPCNWirTcF190tfRmB+J/3NcE6Dp/gUjHoX1bZqHWht058DVfwexiskjgnbRy
         b6K+RBwdmvYkWOYKHnWfJn5x01avan9WROV07iv4WnUxP2Miw8xUrJrtN6yP53QWrsiY
         RA7q3fUQZm5dMryZjj4psL/JyTlH/28KU4U3zx5gxbexqJYnpYMcN4+wbQCtQZXWJyrD
         T3SifoyTjwMapAL/mNFdgXcCBNJQk0D1BYONLVQ0tyRJHTwjs5jEqLpH3wh+kiHRwX3l
         sfwZWjJHLpdeuHTP3p/Yxmrrpzvu90IcSwEKtCTkuNmTaKB3Ob0YKvzcZVqSX60/wk1t
         H15g==
X-Gm-Message-State: AOAM532sin4EU3OiQ7oRmCKusYBaBqrf8ZE3p4RCvyW7PVeOO3SBo2wj
	OZN+JI2Ez5KqWtd4DQhXIg9mxsj5bNc=
X-Google-Smtp-Source: ABdhPJz213UIAeTBYH23T7QfFdK82E35bw+YhB4TQXfha7S9X87I0gsA002TsDpf/HqtYHz4Gy5emw==
X-Received: by 2002:a37:b807:: with SMTP id i7mr31446519qkf.126.1619655286335;
        Wed, 28 Apr 2021 17:14:46 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 09/12] golang/xenlight: add DomainDestroy wrapper
Date: Wed, 28 Apr 2021 20:14:31 -0400
Message-Id: <82c68547f4cec1c82132cd6a867696f4b38dcd3d.1619655104.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619650820.git.rosbrookn@ainfosec.com>
References: <cover.1619650820.git.rosbrookn@ainfosec.com>
In-Reply-To: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>
References: <29e665fc1c9313f5e221e9e5e15d7c2d9c1eb4a7.1619655104.git.rosbrookn@ainfosec.com>

Add a wrapper around libxl_domain_destroy.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 65f93abe32..1e0ed109e4 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1357,3 +1357,13 @@ func (ctx *Context) DomainCreateNew(config *DomainConfig) (Domid, error) {
 
 	return Domid(cdomid), nil
 }
+
+// DomainDestroy destroys a domain given a domid.
+func (ctx *Context) DomainDestroy(domid Domid) error {
+	ret := C.libxl_domain_destroy(ctx.ctx, C.uint32_t(domid), nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1


