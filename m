Return-Path: <SRS0=B3Pa=KA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49570C433ED
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 11:45:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF3E610A0
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 11:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF3E610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123029.232094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFxx-00035X-R7; Wed, 05 May 2021 11:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123029.232094; Wed, 05 May 2021 11:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leFxx-00035Q-Np; Wed, 05 May 2021 11:45:21 +0000
Received: by outflank-mailman (input) for mailman id 123029;
 Wed, 05 May 2021 11:45:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Xmi=KA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1leFxw-00035J-89
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 11:45:20 +0000
Received: from mail-wr1-f42.google.com (unknown [209.85.221.42])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1e3b9e7-d487-485d-9c57-e7b523225091;
 Wed, 05 May 2021 11:45:19 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id a4so1500026wrr.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 May 2021 04:45:19 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i13sm19515910wrs.12.2021.05.05.04.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 04:45:18 -0700 (PDT)
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
X-Inumbo-ID: f1e3b9e7-d487-485d-9c57-e7b523225091
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yc3qfvRBIlQciQW275VLB+NRL0ob1SeLZz9oTRIVCJA=;
        b=GaF//sjryWaAq21U9OLjOsP8xNDSQUOtgWOeVJjjIfmGtOfCC1zcOcFV+V0WQ9TDsJ
         AlxsXqyzQ6kdVZp8yY/tD2t9BBwmiSvch0yiWZ7KQHQIeTi6r7IvfIcdXV7nDw9pJneN
         xHshA9NiDsxHKZAgh3TpVenMEkUrSgNzYuhSlHvbSi4T25Jrbj1pBXP1pSf7mmdvSCxZ
         qayjKrK4jpFPIQ5a6GwwluRnbh9XPvJYH6lP/KG4PToAvOq/ibpTex0s6Cd84G56sXHs
         RIRx7NEIupkE3QBjx/qSjFpf204a2mj27PKjE10hHnAo5zgn46/eehHG5GgGoO0ZhjGx
         9bKg==
X-Gm-Message-State: AOAM531cw89GaiHmBkrhqq4W1QJmyAjeSLmyaSGHJwG9Tqk4U8rOsT63
	GO/5rayc+S2DM2kzABxknswEGn1hp0s=
X-Google-Smtp-Source: ABdhPJyk+TYvxrK3SpblcqFCwSOwuMhJpEZTef+/8yupHOI2LLdo2P2qW0cEv2+EnCOEvcnFCtCjYQ==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr36316187wrr.289.1620215118757;
        Wed, 05 May 2021 04:45:18 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] automation: save xen config before building
Date: Wed,  5 May 2021 11:45:16 +0000
Message-Id: <20210505114516.456201-1-wl@xen.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is reported that failed randconfig runs are missing the config file
which makes debugging impossible. Fix this by moving the line that
copies the config file before the build is executed.

Signed-off-by: Wei Liu <wl@xen.org>
---
 automation/scripts/build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/automation/scripts/build b/automation/scripts/build
index eaf70b11d1cb..46b6903d2922 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -16,6 +16,10 @@ else
     make -j$(nproc) -C xen defconfig
 fi
 
+# Save the config file before building because build failure causes the script
+# to exit early -- bash is invoked with -e.
+cp xen/.config xen-config
+
 # arm32 only cross-compiles the hypervisor
 if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
     hypervisor_only="y"
@@ -59,7 +63,6 @@ else
 fi
 
 # Extract artifacts to avoid getting rewritten by customised builds
-cp xen/.config xen-config
 mkdir binaries
 if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
     cp xen/xen binaries/xen
-- 
2.30.2


