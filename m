Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E492DCD5BD1
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2026 11:39:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1321112.1588101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSZ57-0006v7-3k; Thu, 28 May 2026 11:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321112.1588101; Thu, 28 May 2026 11:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSZ57-0006v0-0h; Thu, 28 May 2026 11:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1321112;
 Thu, 28 May 2026 11:39:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wSZ55-0006uu-QQ
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 11:39:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSZ55-00Eazr-7G
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 13:39:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a182966-e002-0a2a0a5209dd-0a2a4503a0e4-4
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 13:39:19 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a182966-672d-0a2a45030019-d1558031c01f-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 13:39:19 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so56512925e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 04:39:19 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908ecb5238sm15492585e9.24.2026.05.28.04.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 04:39:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1779968358; x=1780573158; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knVAHvyZLHgXTTJ1J4WSrgxLzh5jXut+OY2lmt1FkjE=;
        b=KQQTO9xTkj4aF9xFrtwsZbjQxvQIpqJcUNHynBHyes1bELRyahMle9P5KI/qODAr4f
         y50sh2Em07r5NjaggcFGwdu8HfIhwSUmzx91TPWsN5xiiIXIkVmnbwEEQCQlqnfduobz
         IEI6978VZ0Fsi1giUB42Lqn5We8VDV1He2GnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968358; x=1780573158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knVAHvyZLHgXTTJ1J4WSrgxLzh5jXut+OY2lmt1FkjE=;
        b=ZA2B8ddRTXoMZsinPIr2LNARgrg1fGagnfwf6GqJIDV3nPoY4aigavj9veKmUyl6Mg
         sa9pxml+CevTko7UWA5IaWLGxS0yIPLMV/h8DSPhBkdJcZfuHfE92EmulyeYpr96q36j
         6p2TZLaXhihCw+PyXCAR2u+wq3XMWCUglUmb2JZ+osSMWfudDF8M9MwxADcqADD+IYmM
         ouxhwVySg5o3VSW2yjGbUn4DvIHCmlOud3lRNM/VhYGJ+fqMH52OMKxHEct3oAZZdVlU
         LOwedJx7F9j5vMngOpjyru00TLGCs+3Sln87DuC8udCaLWmBa33X6FT1WKWnBIQaMSy5
         +gsQ==
X-Gm-Message-State: AOJu0YzE6sP2/82e/LCipBe/vG8PzjfqYQE33xudTjO8Y988/JUC7eD3
	O2F3tlh2x3wWydoPsZB/OstJpYumfCnMRDAUYBK9uIsW6SyclX50kAfqhvOuY9aWIe1pixr1sF4
	u5nR9
X-Gm-Gg: Acq92OFg4B5t2uRADAmvhLxckVGzZX6OPXoJgMwyKrL2NeSfhz7AP9N9AGupTYNJelV
	6b/5VHRBe34Y+AjI+1wQLNGQZOSoE/+TSM3hWopMmv6wReqys2cVniCClkITXydkcA1J1IQlOUY
	gX6Y3qHGjN3MDdZUmqDOS4Sw8cgN9rHy1/ViPuFZ2eqmyN9dEShwy2nJXPp6HGztfp95JK6BLnY
	FB1lCiDIyJKJRcEPWfqPVPd1m4xVeMSPBtgz4jGBgyzElaU7SiA5E9AfnGKx0ZkQa0ycy9F7D+s
	rUkvXfQu2wAG5/DbZ8Vg7h66VMtGa8TNkMo5T9mkf/29pK8RQyrdaPgChOmbHVt/QtoF/BSRurJ
	pgxlZU9cF+CroTUJKHm2MHU9MWKsReIGlE/dGHQRjGNPFACqMop7wttjdz6xL1jF1aI4yfoVYiB
	8ibQwks3sDFx/nqyQ7rP9kMRMyKfTmsbTIbgoKjgXuWuI/vyq1wh8Zu1rwMhM46xop+StjKZJGs
	pxECjuTQSDE6+A=
X-Received: by 2002:a05:600c:3592:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49044ebc292mr508199745e9.28.1779968358370;
        Thu, 28 May 2026 04:39:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Pau Ruiz Safont <pau.safont@vates.tech>,
	Colin James <colin.barr@vates.tech>
Subject: [PATCH v2] Fix fallout from DOMID_ANY ABI breakage
Date: Thu, 28 May 2026 12:39:15 +0100
Message-Id: <20260528113915.2355130-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779968359-3794D938-5A11A0AE/10/73395122804
X-purgate-type: spam
X-purgate-size: 4397

Commit 23e2479ff9de ("xen/domain: introduce DOMID_ANY") broke at least:

 * xenstored domains
 * The Python bindings
 * The Ocaml bindings (i.e XAPI, and therefore XenServer/XCP-ng)

by causing Xen to reject 0 (the wildcard sentinel since the start of Xen) and
DOMID_INVALID (since 4.21) without adjusting the callers of xc_domain_create().

Under other circumstances I'd revert, but xenstored has gained a dependent use
of DOMID_ANY.

Fix up the remaining in-tree callers of xc_domain_create(), which covers
init-xenstore-domain and the python bindings.

The Ocaml C bindings, like libxc itself, expose this ABI detail to their
caller, but in this case the caller is still internal to the bindings as a
whole.  Adjust the default value in the internal transformation, adding
domid_any for legibility.

Leave a very clear message in CHANGELOG.md that all external callers need
altering.

Fixes: 23e2479ff9de ("xen/domain: introduce DOMID_ANY")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>
CC: Denis Mukhin <dmukhin@ford.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Pau Ruiz Safont <pau.safont@vates.tech>
CC: Colin James <colin.barr@vates.tech>

v2:
 * Include XEN_DOMCTL_createdomain in CHANGELOG message too
 * Fix the Ocaml stubs too.

There are now 0 Ocaml maintainers.  Pau and Colin reviewed my suggestion on
the Xapi Matrix channel.
---
 CHANGELOG.md                         | 4 ++++
 tools/helpers/init-xenstore-domain.c | 2 +-
 tools/ocaml/libs/xc/xenctrl.ml       | 4 +++-
 tools/python/xen/lowlevel/xc/xc.c    | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 25f5a192ed48..1db3efc4864c 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - Users of XEN_DOMCTL_createdomain/xc_domain_create() must now pass DOMID_ANY
+   to obtain an automatically allocated domid.  The prior sentinel values (0
+   since the start of Xen, and DOMID_INVALID since Xen 4.21) now no longer
+   represent a wildcard input.
  - On x86:
    - Enable pf-fixup option by default for PVH dom0.
 
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 01ca667d25d1..2be5831a578d 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -21,7 +21,7 @@
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
 
-static uint32_t domid = ~0;
+static uint32_t domid = DOMID_ANY;
 static char *kernel;
 static char *ramdisk;
 static char *flask;
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 97108b9d861a..147afa62c293 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -208,7 +208,9 @@ let with_intf f =
 external domain_create_stub: handle -> domid -> domctl_create_config -> domid
   = "stub_xc_domain_create"
 
-let domain_create handle ?(domid=0) config =
+let domid_any = 0x7ff5 (* DOMID_ANY from public/xen.h *)
+
+let domain_create handle ?(domid=domid_any) config =
   domain_create_stub handle domid config
 
 external domain_sethandle: handle -> domid -> string -> unit
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 9feb12ae2b16..a94f01d40b58 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -118,7 +118,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
                                     PyObject *args,
                                     PyObject *kwds)
 {
-    uint32_t dom = 0, target = 0, max_grant_version = 2;
+    uint32_t dom = DOMID_ANY, target = 0, max_grant_version = 2;
     int      ret;
     size_t   i;
     PyObject *pyhandle = NULL;

base-commit: e63ba93511b33c0d3bb8cc5870f946f41e1d2655
-- 
2.39.5


