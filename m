Return-Path: <SRS0=hXTC=54=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCB0C2BB85
	for <xen-devel@archiver.kernel.org>; Sun, 12 Apr 2020 22:03:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CFB20644
	for <xen-devel@archiver.kernel.org>; Sun, 12 Apr 2020 22:03:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX/Q6FfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CFB20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNkgr-0003F9-Et; Sun, 12 Apr 2020 22:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Dwh=54=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jNkgq-0003Et-JU
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 22:02:56 +0000
X-Inumbo-ID: 58aeefa0-7d09-11ea-b4f4-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58aeefa0-7d09-11ea-b4f4-bc764e2007e4;
 Sun, 12 Apr 2020 22:02:48 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v38so3606207qvf.6
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 15:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=C5Z/EnHHQ5Xpy674QajNb7wsUJqqHSMnmxzzSFt1iQQ=;
 b=MX/Q6FfLCQ5XTurVk020jRSRyuuilXNSsBai31olDuDsraqXF1lGZzQn+BwtH4lbMF
 q0Rj6sCHgYga6RnOGwPn7u8CXcW5jo/Z2H+x18AFRaRvaPzNjE38FqBGQwOZ4Q3ETFPX
 M4fraq3B0ZLxY+3TFH8jWYClekWROyeb/r3zs9FnIQMz/2Gp+RzEZcc6HvlHt2UyAJdt
 KAt1dBVyuqs75pE2e+KR1FiKf9TBJcilmzCsd1Eep8lAz5RzbRBrBsJLxZSzQm46ncqO
 zGOyFM2U20EgHH5t9gn9OMS6Daz5w4J1oVeLLETydITTYhPtWykgvp3iMXdjyb0GeoGY
 VcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=C5Z/EnHHQ5Xpy674QajNb7wsUJqqHSMnmxzzSFt1iQQ=;
 b=n831loBBNNqke7AqYfna+NLcxz3BNkMBQrPT/oGJXB6/ww/xUWcxnvC2sGA4OJSLuN
 XsIZ26TfNl1gO9aZxIeJwhj3u/D1IB7+TZQ6VC5tgwUsEMvnsBkJiqfwI+BwtWZK+CN3
 OcOfcTtvwHn4NcnUZNhYs08Wpv7/GwPd+CDZibdwvnNxiUxKooxJSKROdMhoWQaOP011
 8IYVmxPpgyPVxzliED6qsjX1sNpL8jnKi5qrg/mVJQt1TsqowNIkXwLiAv9FpAOA6Cc3
 DyzKWNvf2lYdpsvb4G9CZyUrsZQCAq2W2RxSyhsz6JgCHEM9SV/Q0uTHX3f7nuZC7SPT
 rrgw==
X-Gm-Message-State: AGi0PuaiQ8bAUbsoQMY1naeqeG25nnzVslzh+OsFWoRpcaUdMWsuGh8x
 Y1CbdeCcFFSb86oeilzMNazccuZA
X-Google-Smtp-Source: APiQypIS/w2ctfqHkQIrT294kCGqJR6TnqQmLIUCoTCg63aIBkpeaw0jq/qYc2pAYJtgwrZmFDMcaQ==
X-Received: by 2002:ad4:5184:: with SMTP id b4mr14550655qvp.221.1586728967851; 
 Sun, 12 Apr 2020 15:02:47 -0700 (PDT)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 s14sm3691128qts.70.2020.04.12.15.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:02:47 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/4] golang/xenlight: add DeviceNicAdd/Remove wrappers
Date: Sun, 12 Apr 2020 18:02:40 -0400
Message-Id: <87323a6eb60fd908ea2f792c9754cb88b283c5a6.1586727061.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add DeviceNicAdd and DeviceNicRemove as wrappers for
libxl_device_nic_add and libxl_device_nic_remove.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index 8492bcec4e..a56f913b81 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1068,3 +1068,37 @@ func (Ctx *Context) PrimaryConsoleGetTty(domid uint32) (path string, err error)
 	path = C.GoString(cpath)
 	return
 }
+
+// DeviceNicAdd adds a nic to a domain.
+func (Ctx *Context) DeviceNicAdd(domid Domid, nic *DeviceNic) error {
+	var cnic C.libxl_device_nic
+
+	if err := nic.toC(&cnic); err != nil {
+		return err
+	}
+	defer C.libxl_device_nic_dispose(&cnic)
+
+	ret := C.libxl_device_nic_add(Ctx.ctx, C.uint32_t(domid), &cnic, nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
+
+// DeviceNicRemove removes a nic from a domain.
+func (Ctx *Context) DeviceNicRemove(domid Domid, nic *DeviceNic) error {
+	var cnic C.libxl_device_nic
+
+	if err := nic.toC(&cnic); err != nil {
+		return err
+	}
+	defer C.libxl_device_nic_dispose(&cnic)
+
+	ret := C.libxl_device_nic_remove(Ctx.ctx, C.uint32_t(domid), &cnic, nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1


