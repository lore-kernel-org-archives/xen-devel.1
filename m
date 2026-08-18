Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533EFC5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:33:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393455.1632280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDOS-0001Cr-M8; Tue, 18 Aug 2026 06:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393455.1632280; Tue, 18 Aug 2026 06:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDOS-0001Ci-I6; Tue, 18 Aug 2026 06:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1393455;
 Tue, 18 Aug 2026 06:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwDOR-0001Bf-Pp
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDOR-005gEc-2r
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:33:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a83fcc9-2eae-0a2a0a5409dd-0a2a450bebb6-32
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:33:51 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a83fcce-b7e8-0a2a450b0019-d155dd32b908-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:33:51 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f84023916so4024716f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:33:51 -0700 (PDT)
Received: from notebook.. ([88.230.46.229]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996188217sm490215315e9.13.2026.08.17.23.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 23:33:50 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034830; x=1787639630; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WoJZAAWBUAZrL1iWvSjl3oV3lSy2PEyJsi9Rwklp8Qc=;
        b=oVjjYwB0MJ4FSRTqIf5CIWzsm5ldYx3FiM6MHXThOaxGR/dQN+H9yUZrXZnHnd+qQI
         ce4AfrwGbb/LVDqVrwkk9A4VGnsRb+QH2zL4b4nKPr3ubpMbPP9hMNEpoWNS2IG1MsE8
         1l7mTzUExR/Vzp7JdJiXV1bHKDxunjiIaBzUejk/zGzOLQvBH8cFcrUjNBCosCBlHIw8
         DFiatUN05tbb4dFNLjDFz/mXxENAKY+C3DsWQDWRx1YmVTyeH6uqCf3X2Op0j2kKVVBR
         A/yHQHPw+jONK4tqvIZgwqqOpDXUCr6OOK8EuZJGkJasRJ73T7o/v21pptvaPw3dHlwa
         mbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034830; x=1787639630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WoJZAAWBUAZrL1iWvSjl3oV3lSy2PEyJsi9Rwklp8Qc=;
        b=I/sVInWJ1dXJNxwYe7Mjg9RpSdpu/MijPcBQDzWVS+wnowF3KwPp+5MqFDfMK4zL1v
         MriIyUGO/o5Z6uFo/5nPhwEoJuvf1seOq4u0hSv8XxtKlgqhOfEKEvCCKkM+oN/iZnbw
         u7j+pUcJpZ2vbj1NJjF+R3uy8Gh9vl/gedYBkHMf3ay6yeRyBpcn3IOKJCPDbQqn6eqy
         GixV/7r/iugFTh9HjZVdsAMj6Fa382pf0pM8Hni8rAZ5Rz4amp/Qtk8LOtG+tn5qUCrp
         EcS91TPXh/CyanVJ6y6tnliswt0aF62vegtYVcZDFQpVdSd0IXOcbJaOjSi+/TwEd4G7
         zv6w==
X-Gm-Message-State: AOJu0YyQ/ygkZJzBHODv3MfvH3DKm5ZAvCN59HBO8Sz3DZV0x1x1RcQN
	CILibewmFxF2V1u2v5wgl0STINhIHqdd4Pt1b8sCdc2CokwbWwhh+K0G2xKWvw==
X-Gm-Gg: AR+sD11cdzCkLbSwzALlDOz0sM0Zlql8m0bEa6lVbgcoZX4NxEV230wpstX8VkrPbI3
	XLV7cyrceL4aDUV4mpvoSY19Qqt6Uo1jzklFD7vSE53H7XxAjz8Kif4KMQJRyihE60xHTM2hN6l
	SRcxSeiHXn1n3/p4QXCYOCT1XlkLXekN+QNGfnNvfzdukgGLVi0Wpp4YSZR9kRNScokLre6ev8F
	3kEae126BGTe/YvYa8B+qblKMMBGFACM9schdt6NStZZarh1yIuTOvKSBe3Wlha/4LAcvSJHcXQ
	esKqEm8TdUoWJoZkRrheDkmxaXpBJsnrs3hAuifmRLcr2w6TCTDPlzeXby59HO1CFcytyn4wg1b
	08QTL7SrL5fSASUS2EUghF0rmSPDbNhHgOcCFy/O4VbHkW7Eg2yli+YImVPNubnZQihSoJYJcPn
	SvW6pTm3JIubgCPCYij/n3uWwOpwjkBLUs7bzvqpjSYZpASQ6h5vfIURnMvX7E
X-Received: by 2002:a05:600c:4745:b0:499:9eb7:4558 with SMTP id 5b1f17b1804b1-4999fb6d4e4mr87879565e9.10.1787034830534;
        Mon, 17 Aug 2026 23:33:50 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 2/2] xen/sched: core: kill unarmed timers on sched_init_vcpu() failure
Date: Tue, 18 Aug 2026 09:32:59 +0300
Message-Id: <20260818063259.18733-3-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818063259.18733-1-frn1furkan10@gmail.com>
References: <20260818063259.18733-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787034831-1B4D39EA-C63C98B3/0/0
X-purgate-type: clean
X-purgate-size: 1865

sched_init_vcpu() calls init_timer() for a vcpu's periodic_timer,
singleshot_timer and poll_timer before it can fail -- these
become live, linked into their target pCPU's per-cpu timer list
regardless of what happens next. If the sched_alloc_udata() call
further down then fails, the function frees the sched_unit via
sched_free_unit() and returns 1, but never unlinks these three
timers.

The caller, vcpu_create(), does worse: on sched_init_vcpu()
returning nonzero it jumps to fail_wq, skipping fail_sched and
thus sched_destroy_vcpu() -- the only function on this path that
calls kill_timer() on them. vcpu_destroy() then frees the vcpu,
and the three timers embedded in it, while they are still linked
into that shared list.

This silently corrupts that list. It only shows up later, when
something else touches a neighboring timer: sched_move_domain()
crashed with "Assertion 'entry->prev->next == entry' failed" on a
completely unrelated, valid vcpus's timer.

Kill all three timers in sched_init_vcpu()'s own failure branch,
so it doesn't depend on the caller reaching sched_destroy_vcpu()
to undo what it set up itself.

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 xen/common/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d542c76543..f3ae9998ef 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -589,6 +589,9 @@ int sched_init_vcpu(struct vcpu *v)
     unit->priv = sched_alloc_udata(dom_scheduler(d), unit, d->sched_priv);
     if ( unit->priv == NULL )
     {
+        kill_timer(&v->periodic_timer);
+        kill_timer(&v->singleshot_timer);
+        kill_timer(&v->poll_timer);
         sched_free_unit(unit, v);
         rcu_read_unlock(&sched_res_rculock);
         return 1;
-- 
2.34.1


