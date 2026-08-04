Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FFFC5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 17:43:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382509.1625867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJAf-0004WF-07; Tue, 04 Aug 2026 17:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382509.1625867; Tue, 04 Aug 2026 17:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrJAe-0004VS-Sn; Tue, 04 Aug 2026 17:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1382509;
 Tue, 04 Aug 2026 17:43:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrJAd-0004HD-Nk
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:43:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrJAb-0078XC-I4
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:43:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7224b2-2eae-0a2a0a5409dd-0a2a45059d12-6
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:43:17 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7224b5-4cb1-0a2a45050019-d1558036d52b-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 19:43:17 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so620835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 10:43:17 -0700 (PDT)
Received: from localhost.localdomain ([31.111.172.30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994dfe64e0sm17657735e9.6.2026.08.04.10.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 10:43:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785865397; x=1786470197; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpDC3I+ovYUvjlP9wcYAb5gWHhSg8anilOmH4yhtzyI=;
        b=ZrmFnrPfXw2bdZcmMrNRblnkq3U51V2RwEUqp1Pd0j2tgWQ/fMXQmHxPhKFZKBlJX0
         VsXsyLT2ANXupm25z55oG1wkYwWj1MFCzrc2Vbmj0aDRmBQnx/CMZvVEyzLhV5gMgJaT
         mng25wzn6bhBCtVFu6X25GdXiFjdR7+3reQAza+gO3+TrbwVf4SawPpCyeECzESTVSRi
         BRCcu4KE60z1DyS2QZSDmTPcX+GOi0N7SPuOyVyuN0wGzORib9aWxxQgXTmIIatk7Ekl
         VFf7N+xewO3jh7LIgmvg633zHLHyq5rp0FHl1xfuSJy2qai13T+Fq3y2w58CIUOLss0L
         4sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865397; x=1786470197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpDC3I+ovYUvjlP9wcYAb5gWHhSg8anilOmH4yhtzyI=;
        b=FvJkflRghY9sO7ZdcSVPcryvIX2My429yYdun+Scgn0UZ18dOwk3Jq2sTc+WfKVc2D
         08/q1KYvyq6EKMQaq8RrY2W58Bz00kZgKmyWBVep0wXBABXlud2/pyClx2O0rp50ZsiV
         M/4cq0T1FV2dlxRwrzWpxg5r7IebOl6ejuJGCfV3lJZlHr6V+ckvqVFDsfQ/0D/0zzPJ
         orV1UX2DuE52XFJa5BP2kgSuUbf4WJBkuv/32I62F4x3WIZwryIIsDovShuI28AwaKAr
         ZQJMEpTSifyX3uttjDchYd1SdGxSKnRFbMJgIn3K35u3aKzWvwBjqVO40dXPWoL87f63
         czog==
X-Gm-Message-State: AOJu0Yz6GvkKFEyGmDNnNLvnm1eZfZFDFcE+KDzUwYvNtSFG9lwlnIqb
	eUVcA2uIDJQuqQ+d8PwineSr5YZa4ULnRCG0omRVuPfHq1CoUWBNHZ14QMr8t3D86lg=
X-Gm-Gg: AR+sD12X8GU+UbY2kWybEqu2dMdkxBFtjowquJzGC9vYEaWpDcRYukS2bmc1JkEB2ie
	iwWszCgDC6NlZfddbd8g5MUEURi40gB2NO1GzJNx17+tjUAxDrBvYAwnh4p7n5L9DfaZbV6tzmj
	lu7WbTZ3/6i/ilQnNT7p+R4wsZICAEq/SeMMHzX1Vq1A8JFc+vu3RCAjsKUp3a+rinnxO4EBbFh
	qhHkLoZ1L8K+0Pm7va/9X5s4ooyHlaSBHYGpugB/n0DB2n9r07euTLswRYyWWkZW/i6LcEVhYeo
	jeBkoKY7uvoWibcOSWVTmDu91SEpVR74N84KMleuQkCX7J2dQKoHheZYPFwqMaTTJUE5sHRWAS8
	5wQ6z+RMZHzjAGmXqTroQ1WDoP76LEKY9PWe9LkBq1BSCj9LDTbH16bm0zHl+OlFijoWj5ZtBbZ
	axCjgVu7+minBCVKUHkYhxMpEJY+Nl40azKeQiAP10Gfxuyr++h9bhKB9eK09O0CyOpwwaOxQch
	DvzmdoOz/qzOcDyNR+D3PqGi4Uy8J5+O/scAaquYwwzhsTQQns=
X-Received: by 2002:a05:600c:3586:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-4994e728283mr695025e9.3.1785865396781;
        Tue, 04 Aug 2026 10:43:16 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/2] CI: Simplify directories creation
Date: Tue,  4 Aug 2026 18:42:17 +0100
Message-ID: <20260804174219.835096-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804174219.835096-1-frediano.ziglio@citrix.com>
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785865397-F429B2A1-013AD751/0/0
X-purgate-type: clean
X-purgate-size: 894

Use a single command.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 automation/scripts/qemu-alpine-x86_64.sh | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 242ffca693..60f5cc49fc 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -4,16 +4,7 @@ set -ex -o pipefail
 
 # DomU Busybox
 cd binaries
-mkdir -p initrd
-mkdir -p initrd/bin
-mkdir -p initrd/sbin
-mkdir -p initrd/etc
-mkdir -p initrd/dev
-mkdir -p initrd/proc
-mkdir -p initrd/sys
-mkdir -p initrd/lib
-mkdir -p initrd/var
-mkdir -p initrd/mnt
+mkdir -p initrd/{bin,sbin,etc,dev,proc,sys,lib,var,mnt}
 cp /bin/busybox initrd/bin/busybox
 initrd/bin/busybox --install initrd/bin
 echo "#!/bin/sh
-- 
2.43.0


