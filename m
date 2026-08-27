Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A16C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400924.1636585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvJ-0007F5-4u; Thu, 27 Aug 2026 15:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400924.1636585; Thu, 27 Aug 2026 15:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvI-0007Et-Um; Thu, 27 Aug 2026 15:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1400924;
 Thu, 27 Aug 2026 15:21:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvG-0006xr-Vh
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvG-003Nrj-CA
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905600-8faa-0a2a0a5109dd-0a2a4508e25c-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:46 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90560a-f659-0a2a45080019-d155802aa96d-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:46 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so7056565e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:46 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787844106; x=1788448906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NLphW7/uU1TryTD93UTmTbn1sjPPFV/Ulb6E16emTQ=;
        b=UQ928S63TwKFk8ztokSK7Jg89p+UkM/o+xpwihnpjdo8KtI7v8e05VZ0b6E0Oj/Ppb
         FbemLQS8MK3ub9mAcWeq9xlDHQKHG2OJhWL65FcewyeGgoUXo5uK0kkL2Ddmpq+/Cym1
         ZOmvdQT4BM0Ll+yqN4tbePXv/y9BuRrMCtCa0oslmGJ/KQac54Okc9cUYqYBJHZ6S9TF
         UYn48wKv+y9uGiORlYyHmsspJ/WirV2/AN19F8GSYvTcDxq4Lrn53yaZ3b8OvJslglG7
         edW0V20pawXwrhSXLB+GVI2Dx3/GhjRbVZTwamgFkBhcN3WWJSaDRcPmTThYpZJ0IZFp
         pCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844106; x=1788448906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9NLphW7/uU1TryTD93UTmTbn1sjPPFV/Ulb6E16emTQ=;
        b=gP5zR/4WUFOEQRqfubLXWhHvPnbjxehmiaPslgYiPxKa0bFsMQ3wF00Xks7lVyRMUF
         CpXMItc02XAl+l9KsGbq2wvFh1K9Uhol4SqjHFbs7U6vfwqdHfBoJJVzpGwQBsn340rQ
         4Ng/n/hy0daLng5eZFBaNziwI5+iigWnGU7qxN4gwleIw/CKnOG1ejtp+vobu7zG4Sii
         8T8PdovXg5/901K1bNFjgF5Dy8tZ2ejlwRVmTomqv+IdOwk6YnKGbi5VPWNSpOg4e48H
         0M7PZ8goco9DqNtHgB3Sk2Y+7aoDUUnDyQCuAwscgnqKZ3UIw6VU8vn9eErSW3Gvis1p
         +gBg==
X-Gm-Message-State: AFuF++mn/qQbmOGFNxBVcjJ+3TawZSQLDtktUxUEQmqIsg4A1tpHw/mT
	3tu3YVIf1IMfLyzraU9QakoEdJtFgJXURjuLLA4Vxu1XkSCR6vgySgp80Q2VXw==
X-Gm-Gg: AR+sD10smfo4LENKIsmu7eJYTGnEjXa2AsE+/ldRPYZSyUkAalnmls9PXqTbKtLMUGP
	j6Qje/+1809ycIN4gs+To1oC8v6SKEHb10uHYQ3/9pjSQgBa2wjQZQa+T/JuEHE18WwyP46IJWl
	OqlJa4+MPO7PnfRru/BEZGJWudCDCvBDHfNztngc/ACnLUOUwFC14funrEV9xjQxwbcWaLvXkHQ
	yamX5EGLYerbf+jA/ryLVqT0F4mGzZQTyc8rIiuhwepihUwfufJN0rvSOAUyuMKCrnIwvSIuyau
	bY8ROsRDU44fw+jW468ix02qyJjWvTrDIstt1C2/AdTssNXmbIgfN139YkgLIoXqQlGUkqhvAjy
	7eWGNnsTLHH8zUhYbyPlonbTDkXzFEfOfHO1VGXOdwXcoK/e1/4EkR/WLMif1JHFclTVyykFuwl
	0uIlmxDbIGZGtRA0WUOgbC5TNU6qfZmTru4kpN4b2coOoLe/BQcIEw1Gkoe9MmkPaP8xf207nlM
	q3Q0SABcoR21fUtO2nDVMGmTadsnvsi
X-Received: by 2002:a05:600c:1c06:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49b8f5e52b1mr55532835e9.3.1787844105703;
        Thu, 27 Aug 2026 08:21:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 05/39] xen/riscv: request a G-stage flush on vmenter when VMIDs are disabled
Date: Thu, 27 Aug 2026 17:20:49 +0200
Message-ID: <4274740481062ef92a76debd9c3f1e8371858735.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787844106-DF6D687B-ADA8C687/10/73395122804
X-purgate-type: spam
X-purgate-size: 2277

vmid_handle_vmenter() reports that no flush is needed when VMIDs are
unavailable (vmid=off, or hardware with no more than one VMID bit). Every
domain then runs under VMID 0 with nothing flushed in between, so as soon
as a hart runs more than one domain, a domain entered there can use the
G-stage translations left behind by the domain which ran before it.

Adjust the comment in p2m_handle_vmenter() accordingly: skipping the
VS-stage flush no longer relies on an old VMID not being reused, which
doesn't hold when there are no VMIDs to begin with.

While at it, spell the other early return as a bool literal.

Fixes: bff3b9ea4696 ("xen/riscv: introduce VMID allocation and manegement")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/p2m.c  | 4 +++-
 xen/arch/riscv/vmid.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 1cea86512c8c..de25607247a6 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1584,7 +1584,9 @@ void p2m_handle_vmenter(void)
     /*
      * There is also no need to flush the VS-stage TLB: even if speculation
      * occurs (VSATP + old HGATP were used), it will use the old VMID, which
-     * won't be reused until need_flush is set to true.
+     * won't be reused until need_flush is set to true. When VMIDs aren't
+     * available there is no old VMID to rely on, but then need_flush is set
+     * on every entry, so the flush above covers that case.
      */
 }
 
diff --git a/xen/arch/riscv/vmid.c b/xen/arch/riscv/vmid.c
index 11c7e9d6d6c8..93714b359534 100644
--- a/xen/arch/riscv/vmid.c
+++ b/xen/arch/riscv/vmid.c
@@ -141,7 +141,7 @@ bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
 
     /* Test if VCPU has valid VMID. */
     if ( read_atomic(&vmid->generation) == data->generation )
-        return 0;
+        return false;
 
     /* If there are no free VMIDs, need to go to a new generation. */
     if ( unlikely(data->next_vmid > data->max_vmid) )
@@ -164,7 +164,7 @@ bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
 
  disabled:
     vmid->vmid = 0;
-    return 0;
+    return true;
 }
 
 /*
-- 
2.55.0


