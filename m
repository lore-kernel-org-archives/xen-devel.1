Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986EC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 20:58:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409150.1641298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2az3-0006Q3-8o; Fri, 04 Sep 2026 20:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409150.1641298; Fri, 04 Sep 2026 20:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2az3-0006Pw-5l; Fri, 04 Sep 2026 20:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1409150;
 Fri, 04 Sep 2026 20:57:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vsementsov@yandex-team.ru>) id 1x2az1-0006Pp-Cg
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 20:57:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2ayz-002Wei-Vk
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 22:57:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a9b30cf-2eae-0a2a0a5409dd-0a2a450bea8a-2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 22:57:57 +0200
Received: from [178.154.239.136] (helo=forwardcorp1b.mail.yandex.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a9b30d4-b7e8-0a2a450b0019-b29aef88c08e-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 22:57:56 +0200
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c11:43a8:0:640:574d:0])
 by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id 08FC880A61;
 Fri, 04 Sep 2026 23:57:56 +0300 (MSK)
Received: from i115954770.yandex-team.ru (unknown [2a02:6bf:8080:4d::1:17])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA
 id rvQjs41YPqM0-UooXil1Y; Fri, 04 Sep 2026 23:57:55 +0300
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=default header.d=yandex-team.ru header.i="@yandex-team.ru" header.h="Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From"
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1788555475;
	bh=Dlc3dK5WOaqmo7z+t9buAmX2gat8HcjIw965WO9A260=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=aFCJE6IQeVsZRJl6yv7vJPVyaDOeihMcE1i2xYJwRBLOy+OAqg25ttfEbdwewBfIl
	 GFcGpErcsRrKygFyU1ZvDJfl76GdFJBqnwlEodNaMHoTtAOQGP8UYOH++P+1PVc6ZV
	 vGgqWrgWzf0I5/gPfyq9LRJZN/4JewRXr29PMplM=
Authentication-Results: mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	vsementsov@yandex-team.ru,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 4/6] runstate: simplify qemu_shutdown_requested_get()
Date: Fri,  4 Sep 2026 23:57:47 +0300
Message-ID: <20260904205749.510493-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904205749.510493-1-vsementsov@yandex-team.ru>
References: <20260904205749.510493-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1788555477-18AC89EA-99E2A508/0/0
X-purgate-type: clean
X-purgate-size: 1992

The only caller needs to know whether a shutdown request is pending,
not its reason. Return bool and rename the function to
qemu_shutdown_requested().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/xen/xen-hvm-common.c   | 2 +-
 include/system/runstate.h | 2 +-
 system/runstate.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 62d88804c43..4d01a12062d 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -610,7 +610,7 @@ static void cpu_handle_ioreq(void *opaque)
         if (runstate_is_running()) {
             ShutdownCause request;
 
-            if (qemu_shutdown_requested_get()) {
+            if (qemu_shutdown_requested()) {
                 destroy_hvm_domain(false);
             }
             request = qemu_reset_requested_get();
diff --git a/include/system/runstate.h b/include/system/runstate.h
index 929379adae4..3ed35921bb7 100644
--- a/include/system/runstate.h
+++ b/include/system/runstate.h
@@ -146,7 +146,7 @@ void qemu_system_debug_request(void);
 void qemu_system_vmstop_request(RunState reason);
 void qemu_system_vmstop_request_prepare(void);
 bool qemu_vmstop_requested(RunState *r);
-ShutdownCause qemu_shutdown_requested_get(void);
+bool qemu_shutdown_requested(void);
 bool qemu_force_shutdown_requested(void);
 ShutdownCause qemu_reset_requested_get(void);
 void qemu_system_killed(int signal, pid_t pid);
diff --git a/system/runstate.c b/system/runstate.c
index 01f936649b4..2b28e2a30e2 100644
--- a/system/runstate.c
+++ b/system/runstate.c
@@ -582,7 +582,7 @@ static NotifierList shutdown_notifiers =
     NOTIFIER_LIST_INITIALIZER(shutdown_notifiers);
 static uint32_t wakeup_reason_mask = ~(1 << QEMU_WAKEUP_REASON_NONE);
 
-ShutdownCause qemu_shutdown_requested_get(void)
+bool qemu_shutdown_requested(void)
 {
     return shutdown_requested;
 }
-- 
2.43.0


