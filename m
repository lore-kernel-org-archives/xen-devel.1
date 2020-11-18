Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E0DC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 16:27:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAAE224819
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 16:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="DQPmyzHS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAAE224819
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30089.59816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQIi-0001Oj-4K; Wed, 18 Nov 2020 16:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30089.59816; Wed, 18 Nov 2020 16:27:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQIi-0001Oc-0s; Wed, 18 Nov 2020 16:27:20 +0000
Received: by outflank-mailman (input) for mailman id 30089;
 Wed, 18 Nov 2020 16:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1kfQIh-0001OX-LI
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:27:19 +0000
Received: from mail-qv1-xf2e.google.com (unknown [2607:f8b0:4864:20::f2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cde413ed-fffe-4560-a53e-974ee780306d;
 Wed, 18 Nov 2020 16:27:19 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id g19so1310103qvy.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:27:19 -0800 (PST)
Received: from localhost.localdomain
 (104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
 by smtp.gmail.com with ESMTPSA id k70sm17318603qke.46.2020.11.18.08.27.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 08:27:17 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
	id 1kfQIh-0001OX-LI
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:27:19 +0000
X-Inumbo-ID: cde413ed-fffe-4560-a53e-974ee780306d
Received: from mail-qv1-xf2e.google.com (unknown [2607:f8b0:4864:20::f2e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cde413ed-fffe-4560-a53e-974ee780306d;
	Wed, 18 Nov 2020 16:27:19 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id g19so1310103qvy.2
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cardoe.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zrqXFk4ShVAtVDE1F4lmJEb7S5DU3GeoqHDkSh87ftY=;
        b=DQPmyzHSPZeUv/5KH09b94VJM4dtmhlGhiBm4/oGKKVooNLbjgLuGMbwcrbPXqT3LD
         0LBAfTxQ1GsjWKiny93SaDIjb2YFKjwR6TShsmuKhNBeX6DXZWhxIsEe1rRd0nEkjkAx
         TgFpFK5BCyn/UZKZdMcsjTZYz0l6B+765o97c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zrqXFk4ShVAtVDE1F4lmJEb7S5DU3GeoqHDkSh87ftY=;
        b=lJ8Zklv2O4v4CL6OFYOXJWjYT3+/RMo954TLFqHtVloZccRi+TRBBxouyXaKv6IgZ+
         VrnUUGhRyyIWX6AOqvP90H7U56jOgayEB6biYdnojET26nmb86mkY39ufM3jJH+XBfuQ
         drK0PLyJzEFP5CSwB64fSE8bEp8eFJ+4VDWtRgurqg+O9KXfidDS06enEYLi5tCMrVIU
         PjwlaVpk3bGUWRoGV8g/SK+Y2SadaEZCjsr29TGvk5c5sjKKPPO0SgSgvwbiWTIdmM4e
         SujQWhvt5ndHSDyAGW2vUAmuxsdIQD8eGlkqMh/ViScxweqzrSzPs5cQttXUF2BP3mVX
         vBvg==
X-Gm-Message-State: AOAM532gy/FBklKZt38rm7+Muf2vSNCC0jszIdjGEP1Etro2mYMWLq3B
	KlkPvCE7EADV46DRz0ZJB4z790UbZ27bjKcu
X-Google-Smtp-Source: ABdhPJx2C/BCH+Or1fGS11XLEX17s8zzr4AL4qvaf/SCNTZDSHXAUXVqlajGXVxdmg7O2JWOeusjFw==
X-Received: by 2002:ad4:4743:: with SMTP id c3mr5638484qvx.62.1605716838439;
        Wed, 18 Nov 2020 08:27:18 -0800 (PST)
Received: from localhost.localdomain (104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
        by smtp.gmail.com with ESMTPSA id k70sm17318603qke.46.2020.11.18.08.27.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 08:27:17 -0800 (PST)
From: Doug Goldstein <cardoe@cardoe.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] ci: drop building on CentOS 6
Date: Wed, 18 Nov 2020 10:27:06 -0600
Message-Id: <20201118162706.66551-1-cardoe@cardoe.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CentOS 6 is no longer supported by upstream so we cannot test against it
for future Xen releases.

Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
---
 automation/gitlab-ci/build.yaml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1e61d30c85..4bd1cfc1c0 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -176,16 +176,6 @@ centos-7-gcc-debug:
   variables:
     CONTAINER: centos:7
 
-centos-6-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: centos:6
-
-centos-6-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: centos:6
-
 debian-jessie-clang:
   extends: .clang-x86-64-build
   variables:
-- 
2.21.0 (Apple Git-122)


