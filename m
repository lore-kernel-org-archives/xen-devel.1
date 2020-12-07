Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2065BC433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 13:15:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D787C230FA
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 13:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D787C230FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.46534.82620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMe-0004Y1-A0; Mon, 07 Dec 2020 13:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46534.82620; Mon, 07 Dec 2020 13:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmGMe-0004Xr-6F; Mon, 07 Dec 2020 13:15:40 +0000
Received: by outflank-mailman (input) for mailman id 46534;
 Mon, 07 Dec 2020 13:15:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmGMc-0004Wp-DA
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 13:15:38 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 63393922-353a-4e65-bb1e-5e7fdb9f805a;
 Mon, 07 Dec 2020 13:15:37 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-4cPFA0F1OAGALI0DNt7TYw-1; Mon, 07 Dec 2020 08:15:35 -0500
Received: by mail-wr1-f72.google.com with SMTP id n13so4827371wrs.10
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 05:15:35 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c190sm14567845wme.19.2020.12.07.05.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:33 -0800 (PST)
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
X-Inumbo-ID: 63393922-353a-4e65-bb1e-5e7fdb9f805a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607346937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EJ4iyK07Ty3dzRyIkzOuiJNHq5RuTRyKsBVarixwBA=;
	b=ZL/h83rGNOMGpjTRKxZRwckMp5/hshrf+qb5BGg/Io6IiMEt6z8MBeTBZXayDbkoru0Qwc
	uKE83oTv3hoeoEdcGXKYKw0ozzafexk+3XS5Iz4xlFTSlQXJz56vj33ygsHjQVkRwtlv+m
	n/KMhdIM4tzaIeqfSm1MWGH15C+kn3U=
X-MC-Unique: 4cPFA0F1OAGALI0DNt7TYw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EJ4iyK07Ty3dzRyIkzOuiJNHq5RuTRyKsBVarixwBA=;
        b=oYZK2owXKJxg2CEFDxOEWsy1S+cMRQCWKc05E9WESXHXSuYWq6Qs46WMKjh/rV6QR3
         qnrrMtyuVz0/UiFUF4BnAPkjwh2/e+K+jLc37lNWEzU+FkAa8SoxsUSb+5lIm9bz8GER
         xYqwFyB/JFBs6umalRGOXGPe9eqaC7GzGkqmM2ySJBD9YUR4qWRulzGrp14wMyNejANM
         wDldif0zTwbRxfbOSwi4BcpyfWL4NpyTN3dfh/2fYLeIUPlh4q5Hw/0Y5JWDwjgTIE7i
         WoUh8cbRvwYFwpk8bPcqVd2QZf08sGbyuRqyuyDbZNmHRtspDg/LzA7GCFW/bZNMCFaR
         7t/w==
X-Gm-Message-State: AOAM5327Lk2BhYz+XQL2xnIh2w9YOq8VeQYMn7PAcVJiz8Y2MsAP3eom
	LqVENJ372aMNi4VMbfLvpmZPDVbVojf+Akp8XyKPzWJHwqtif/qJck5+46KzYErBNrjW4OJp1Xy
	ikFi6d4mPIGBEhFX2K8wCJDocNhY=
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr20011860wrt.30.1607346934123;
        Mon, 07 Dec 2020 05:15:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9XTTmfTlfqcd6ffk3O9VyZaaUJTIkcE7tELrfEhCU+PvMWzkv9xF2oA2F54WLRjz0+k84yQ==
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr20011839wrt.30.1607346933986;
        Mon, 07 Dec 2020 05:15:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 5/5] gitlab-ci: Add Xen cross-build jobs
Date: Mon,  7 Dec 2020 14:15:03 +0100
Message-Id: <20201207131503.3858889-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207131503.3858889-1-philmd@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 51896bbc9fb..bd6473a75a7 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -134,3 +134,17 @@ cross-win64-system:
   extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
+
+cross-amd64-xen-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    ACCEL: xen
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-xen-only:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: xen
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
-- 
2.26.2


