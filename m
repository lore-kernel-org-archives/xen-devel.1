Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4B5C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366947.1616737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPj-0004E7-Rj; Mon, 20 Jul 2026 16:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366947.1616737; Mon, 20 Jul 2026 16:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPj-0004E0-Of; Mon, 20 Jul 2026 16:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1366947;
 Mon, 20 Jul 2026 16:00:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPi-00041M-2Q
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPh-00GLIp-8E
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e460c-5cb7-0a2a0a5109dd-0a2a450887e0-20
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:17 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4611-f659-0a2a45080019-d155dd33dd9b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:17 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso512791f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:17 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563217; x=1785168017; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0tVfRurSQlJB30p9PK7u+3dBQjjBEmfhYIggxhj1ck=;
        b=Wag4V7CTo/QnxU54XXoEPpWt+ts5zQ5zTQiLCs60UH1jKJIEmfPjSaHDwFP7mCiA0R
         jmP1E12XyOe545bNX7jyFkj6Pp9mHQgdISFSTHNVpVQKRwGJ6kcgvucJh48TOkCRTViX
         yZYECJQ5wh2dA812nqRt/s/VJkMzAsM7M9CAjmz8CS+GftDkKs+UIPFc0paMdgJppth4
         W9hllHNQUVjVIUtGzwZF7DeZfVs58ajI8seGuP4RDdsR0XuoEtbj3V+0x3CfBNyjR+Jm
         ZryLn2d6W6k/rTffvibYYD5wHzC9Zgg0MnV305+oiUVppcHV6+/6xY/tm2NU2mI7nT0y
         5Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563217; x=1785168017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0tVfRurSQlJB30p9PK7u+3dBQjjBEmfhYIggxhj1ck=;
        b=nuJZmetznlN4FDTKABjLoFlLbBS06gnddtwinTRIJ2voMzut2o9WGjrzurlhU7PXd0
         b0mQlGK+D3JhNQTnHe/yFyhhcXRK4wQts1213Uc/sTYWVp5UUDwjFOD2JjXEVVvzjv4a
         +VztzxxLnZmRh+EpUumD9gs51DjiX6e53MIDyHZSXzOln6RpxzxNxmVOxEFYND/2X2pm
         WAfyCRYvqhbtsKxSJiZSUT7BKcMP/dYjZoF5QV8wgFGpTXA61+SmT1Cy9y1Vzg3vPi39
         TYmhXJCJIK2bPXKEG6MLcsXsZP3Se3MCTAt6bWBEUsKnZQhis8ywW9+nx3CFo38JqFvc
         lczw==
X-Gm-Message-State: AOJu0Yx2bJ0Z3QGtgffYAE0s9dkmwP/Jh4NB1KhJLQ8+jDxNROVV9I4+
	SAChLXQP53BY2z8rnAkX9kerzBqSCZM5gwwiLpcB6kwU7/S/ALRwhfopZ+NGdg==
X-Gm-Gg: AR+sD10FIt7FUkqkPHeqffB+30JfGGksOha5ZMdcKXTLvAE8JgDwoS4vN3HdVbXwheN
	Z9FvF+uGa6zgXzRA+OdtmmZCgfSty/9FtRFfF2EWhhD9x1NOaNhpqe/Crr1lOZ7gMfQbrVjuJDE
	RQSuFxHXUhthQyhMviGbetN+edzawrLyLikk1YAFrVXYlFmcor08riRpIG7hlFaqMjo/gDw74pF
	KEijXZ3S77z2oVfYDm/bAza3z9X63cLB3hs90EqAqxUMhkVUmaOJhgK9+KbI8iE4Mh+Bg/0557o
	vQqZBp4UetupoKPF9WoYT5GLWJ/TGN3tnj/Drz6MoBhKdEyv9bZ34JV+nrNEkO8UCVBjOTiO+Zp
	Js87HwnIi3XPNyZk6t/PvzLzYtie5QalkSrSUG2JUK3qx8ogPdXJcmIvhUyhAgB1PvuoiPB/eFR
	Wo/tvwiP8zUFldQLov2GBafI/QR8EvGZ3dQ+HPr59t5IZh4+E=
X-Received: by 2002:a05:6000:18af:b0:47f:539f:9f82 with SMTP id ffacd0b85a97d-47f6232240dmr17669275f8f.39.1784563216343;
        Mon, 20 Jul 2026 09:00:16 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 01/23] xen: introduce CONFIG_HAS_SHARED_INFO for archs without a shared page
Date: Mon, 20 Jul 2026 17:59:42 +0200
Message-ID: <01df5be27b502a19dd51ded7577af68cee234c58.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784563217-CFED287B-D0C5046F/10/73395122804
X-purgate-type: spam
X-purgate-size: 17604

On architectures that run guests in dom0less mode without the PV ABI
(currently RISC-V), no shared_info page is allocated and d->shared_info
remains NULL throughout the domain lifetime.  Several places in common
code access d->shared_info through the shared_info() macro or directly,
causing UBSAN null-pointer errors on such architectures.

Rather than adding runtime NULL guards that are logically unreachable
on x86 and Arm (where shared_info is always allocated), introduce a new
Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.

On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
of shared_info_absent, an extern pointer that is declared but
intentionally never defined.  Any use of shared_info() that is not
dead-code-eliminated will therefore cause a link-time failure, making
missed guards impossible to overlook.

The 2L event-channel ops call shared_info() and must not be compiled on
architectures without a shared_info page, so event_2l.o is gated on
CONFIG_HAS_SHARED_INFO.  On such architectures evtchn_init() installs the
FIFO ops as a placeholder instead, so that a later guest opt-in to the
FIFO ABI via EVTCHNOP_init_control has no special-casing to do; if FIFO
support itself is also unavailable (!CONFIG_EVTCHN_FIFO), a dedicated
no-op evtchn_port_ops_none table is installed instead, so that
d->evtchn_port_ops is never NULL.  evtchn_fifo_word_from_port() is
guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
before evtchn_fifo_init_control() is called by the guest.

With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
dummy_vcpu_info, so writes through vcpu_info() could leak data between
vCPUs. Reviewing the write paths in common code: the write in
map_guest_area() stores the constant ~0 so nothing serious would happen
if it were leaked; the event_2l.c paths are not compiled on
!HAS_SHARED_INFO, as event_2l.o is gated on CONFIG_HAS_SHARED_INFO; the
write in vcpu_info_populate() targets the new mapping buffer, not
dummy_vcpu_info.

Outside common code, the remaining writes are x86 PV-specific, for which
CONFIG_HAS_SHARED_INFO=y. No code changes are needed.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v6:
 - s/INVALID_GFN_RAW/gfn_x(INVALID_GFN) as INVALID_GFN_RAW was dropped.
 - event_channel.c: make evtchn_none_init() static, moving the
   evtchn_port_ops_none table and its definition above evtchn_reset(),
   their first caller; move the leftover prototype into the #else arm
   of the same #ifndef guard instead of leaving it as a free-standing
   non-static declaration.
 - event_channel.c: evtchn_reset() now follows the same
   IS_ENABLED(CONFIG_HAS_SHARED_INFO) / IS_ENABLED(CONFIG_EVTCHN_FIFO) /
   else cascade already used by evtchn_init(), rather than assuming the
   FIFO ABI is unconditionally available whenever d->evtchn_fifo was set.
 - event_channel.c: narrow the evtchn_port_ops_none / evtchn_none_init
   guard from !CONFIG_HAS_SHARED_INFO to
   !CONFIG_HAS_SHARED_INFO && !CONFIG_EVTCHN_FIFO, so the placeholder
   cf_check functions are only built for the one combination that
   actually needs them.
 - event_channel.c: fix the evtchn_port_ops_none comment, which claimed
   the ops were never reachable in practice; they are reached whenever
   an event is delivered to (or queried on) a
   !HAS_SHARED_INFO && !EVTCHN_FIFO domain, they just have no ABI to
   record it in and discard it.
 - event_channel.h / event_fifo.c: drop the static inline
   evtchn_fifo_init_ops() stub for !CONFIG_EVTCHN_FIFO; a plain
   declaration outside the #ifdef/#else is enough, matching the
   treatment already given to evtchn_2l_init() and evtchn_none_init().
   Update the "only call site" comment in event_fifo.c to mention both
   evtchn_init() and evtchn_reset().
---
Changes in v5:
 - drop the static inline evtchn_2l_init() stub for !HAS_SHARED_INFO;
   a plain declaration is enough since the only call sites are guarded by
   IS_ENABLED(CONFIG_HAS_SHARED_INFO) and the dead call is eliminated
   before linking.
 - fix a NULL d->evtchn_port_ops dereference when CONFIG_HAS_SHARED_INFO=n
   and CONFIG_EVTCHN_FIFO=n: evtchn_init() was unconditionally calling
   evtchn_fifo_init_ops(), whose !EVTCHN_FIFO stub leaves d->evtchn_port_ops
   unset.  Gate the FIFO branch on IS_ENABLED(CONFIG_EVTCHN_FIFO) and add
   a dedicated evtchn_port_ops_none table for the remaining case. Stubs
   are shared where signatures permit: evtchn_none_noop covers both
   clear_pending and unmask; evtchn_none_false covers both is_pending and
   is_masked. evtchn_none_init() is called only from event_channel.c, so its
   declaration is kept there rather than in event_channel.h.
 - gate evtchn_fifo_init_ops() on !CONFIG_HAS_SHARED_INFO;
   its only call site is in the IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branch
   of evtchn_init(), which is never reached on HAS_SHARED_INFO=y builds.
---
Changes in v4:
 - event_channel.c: drop the redundant evtchn_fifo_init_ops() in the
   else branch of evtchn_reset(); evtchn_fifo_destroy() does not undo the
   ops installed by evtchn_init(), so only the switch back to 2-level ABI
   needs an explicit call.
 - shared.h: simplify the !HAS_SHARED_INFO shared_info() definition to use
   an undefined "extern struct shared_info *shared_info_absent" instead of
   shared_info_absent() with a typeof cast.
 - Extend the commit description to note that vcpu_info()/__vcpu_info()
   uses were also audited: on !HAS_SHARED_INFO vcpu_info_area.map points at
   dummy_vcpu_info, reads are harmless, and writes in common code do not
   open a cross-domain info-leak side channel, so no code changes are
   needed on that path.
---
Changes in v3:
 - Introduce CONFIG_HAS_SHARED_INFO Kconfig symbol selected by x86
   and Arm; RISC-V does not select it.
 - Gate shared_info() macro on CONFIG_HAS_SHARED_INFO; on
   !HAS_SHARED_INFO it calls shared_info_absent() (declared, never
   defined) so any unguarded use produces a link-time error.
 - Replace runtime if (!d->shared_info) guards with IS_ENABLED() at
   call sites so both branches type-check and dead code is eliminated.
 - Guard shared_info_frame assignment in domctl.c.
 - Gate event_2l.o on CONFIG_HAS_SHARED_INFO; use FIFO ops as
   placeholder on !HAS_SHARED_INFO archs instead of dedicated stub
   ops; guard evtchn_fifo_word_from_port() against uninitialised
   d->evtchn_fifo.
 - Add static inline stubs for evtchn_2l_init() (!HAS_SHARED_INFO)
   and evtchn_fifo_init_ops() (!EVTCHN_FIFO) so call sites can use
   IS_ENABLED() without #ifdef.
 - Drop inaccurate changelog entry about "only FIFO ABI" migration.
 - Update the commit message.
 - Drop R-by: Baptiste ... as some extra checks are added.
---
Changes in v2:
 - Update commit message + subject.
 - Drop Fixes tag.
---
 xen/arch/arm/Kconfig       |  1 +
 xen/arch/x86/Kconfig       |  1 +
 xen/common/Kconfig         |  3 +++
 xen/common/Makefile        |  2 +-
 xen/common/domain.c        |  6 ++---
 xen/common/domctl.c        | 11 +++++---
 xen/common/event_channel.c | 53 +++++++++++++++++++++++++++++++++++---
 xen/common/event_channel.h |  6 +++++
 xen/common/event_fifo.c    | 19 +++++++++++++-
 xen/common/time.c          |  2 ++
 xen/include/xen/shared.h   |  8 +++++-
 xen/include/xen/time.h     |  4 +++
 12 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 843a43897e7b..d748404e82da 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -20,6 +20,7 @@ config ARM
 	select HAS_DEVICE_TREE_DISCOVERY
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
+	select HAS_SHARED_INFO
 	select HAS_STACK_PROTECTOR
 	select HAS_STATIC_MEMORY
 	select HAS_UBSAN
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2ce4747f6ea7..49697b795259 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86
 	select HAS_PCI_MSI
 	select HAS_PIRQ
 	select HAS_SCHED_GRANULARITY
+	select HAS_SHARED_INFO
 	imply HAS_SOFT_RESET
 	select HAS_UBSAN
 	select HAS_VMAP
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba8469..5b289e444fa5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -158,6 +158,9 @@ config HAS_PMAP
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_SHARED_INFO
+	bool
+
 config HAS_STATIC_MEMORY
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e256147f..f69d47d18934 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domid.o
-obj-y += event_2l.o
+obj-$(CONFIG_HAS_SHARED_INFO) += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 53ac1d6c4034..af5b596f3893 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -316,9 +316,9 @@ void vcpu_info_reset(struct vcpu *v)
     struct domain *d = v->domain;
 
     v->vcpu_info_area.map =
-        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
-         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-         : &dummy_vcpu_info);
+        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
+        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+        : &dummy_vcpu_info;
 }
 
 static struct domain *alloc_domain_struct(void)
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index e30b38a337ac..0085b1777b40 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -102,9 +102,14 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 #ifdef CONFIG_MEM_PAGING
     info->paged_pages       = atomic_read(&d->paged_pages);
 #endif
-    info->shared_info_frame =
-        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
-    BUG_ON(SHARED_M2P(info->shared_info_frame));
+    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+    {
+        info->shared_info_frame =
+            gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
+        BUG_ON(SHARED_M2P(info->shared_info_frame));
+    }
+    else
+        info->shared_info_frame = gfn_x(INVALID_GFN);
 
     info->cpupool = cpupool_get_id(d);
 
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a3d18bc464e8..52dec4bb8931 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -40,6 +40,41 @@
 
 #define consumer_is_xen(e) (!!(e)->xen_consumer)
 
+#if !defined(CONFIG_HAS_SHARED_INFO) && !defined(CONFIG_EVTCHN_FIFO)
+/*
+ * Placeholder ops for domains with neither a shared_info page nor a FIFO
+ * control block (CONFIG_HAS_SHARED_INFO=n and CONFIG_EVTCHN_FIFO=n). Such
+ * a domain has no ABI to record event state in, so these are reachable
+ * whenever an event is delivered to (or queried on) one of its ports; they
+ * just discard/no-op it.  They exist to keep d->evtchn_port_ops non-NULL.
+ */
+static void cf_check evtchn_none_set_pending(
+    struct vcpu *v, struct evtchn *evtchn) {}
+static void cf_check evtchn_none_noop(
+    struct domain *d, struct evtchn *evtchn) {}
+static bool cf_check evtchn_none_false(
+    const struct domain *d, const struct evtchn *evtchn) { return false; }
+static void cf_check evtchn_none_print_state(
+    struct domain *d, const struct evtchn *evtchn) {}
+
+static const struct evtchn_port_ops evtchn_port_ops_none = {
+    .set_pending   = evtchn_none_set_pending,
+    .clear_pending = evtchn_none_noop,
+    .unmask        = evtchn_none_noop,
+    .is_pending    = evtchn_none_false,
+    .is_masked     = evtchn_none_false,
+    .print_state   = evtchn_none_print_state,
+};
+
+static void evtchn_none_init(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_none;
+}
+#else
+/* Declaration only; the calls below are DCE'd unless both configs are off. */
+void evtchn_none_init(struct domain *d);
+#endif /* !CONFIG_HAS_SHARED_INFO && !CONFIG_EVTCHN_FIFO */
+
 /*
  * Lock an event channel exclusively. This is allowed only when the channel is
  * free or unbound either when taking or when releasing the lock, as any
@@ -1323,9 +1358,15 @@ int evtchn_reset(struct domain *d, bool resuming)
         rc = -EAGAIN;
     else if ( d->evtchn_fifo )
     {
-        /* Switching back to 2-level ABI. */
         evtchn_fifo_destroy(d);
-        evtchn_2l_init(d);
+
+        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+            /* Switching back to 2-level ABI. */
+            evtchn_2l_init(d);
+        else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
+            evtchn_fifo_init_ops(d);
+        else
+            evtchn_none_init(d);
     }
 
     write_unlock(&d->event_lock);
@@ -1624,7 +1665,13 @@ void evtchn_check_pollers(struct domain *d, unsigned int port)
 
 int evtchn_init(struct domain *d, unsigned int max_port)
 {
-    evtchn_2l_init(d);
+    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
+        evtchn_2l_init(d);
+    else if ( IS_ENABLED(CONFIG_EVTCHN_FIFO) )
+        evtchn_fifo_init_ops(d);
+    else
+        evtchn_none_init(d);
+
     d->max_evtchn_port = min_t(unsigned int, max_port, INT_MAX);
 
     d->evtchn = alloc_evtchn_bucket(d, 0);
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index dc94a43cc2dd..c8ee09807008 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -70,6 +70,12 @@ static inline void evtchn_fifo_destroy(struct domain *d)
 }
 #endif /* CONFIG_EVTCHN_FIFO */
 
+/*
+ * Declaration only when !CONFIG_EVTCHN_FIFO; the (dead) calls in
+ * evtchn_init() and evtchn_reset() are DCE'd in that case.
+ */
+void evtchn_fifo_init_ops(struct domain *d);
+
 #endif /* EVENT_CHANNEL_H */
 
 /*
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 37cba9bc4564..b0acbc68d9ff 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -62,6 +62,9 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
      */
     smp_rmb();
 
+    if ( unlikely(!d->evtchn_fifo) )
+        return NULL;
+
     if ( unlikely(port >= d->evtchn_fifo->num_evtchns) )
         return NULL;
 
@@ -420,6 +423,19 @@ static const struct evtchn_port_ops evtchn_port_ops_fifo =
     .print_state   = evtchn_fifo_print_state,
 };
 
+/*
+ * evtchn_fifo_init_ops()'s only call sites are in the
+ * IS_ENABLED(CONFIG_EVTCHN_FIFO) dead branches of evtchn_init() and
+ * evtchn_reset(), which are never reached on HAS_SHARED_INFO=y builds
+ * because of DCE.
+ */
+#ifndef CONFIG_HAS_SHARED_INFO
+void evtchn_fifo_init_ops(struct domain *d)
+{
+    d->evtchn_port_ops = &evtchn_port_ops_fifo;
+}
+#endif
+
 static int map_guest_page(struct domain *d, uint64_t gfn, void **virt)
 {
     struct page_info *p;
@@ -562,7 +578,8 @@ static void setup_ports(struct domain *d, unsigned int prev_evtchns)
 
         evtchn = evtchn_from_port(d, port);
 
-        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
+        if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) &&
+             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
             evtchn->pending = true;
 
         evtchn_fifo_set_priority(d, evtchn, EVTCHN_FIFO_PRIORITY_DEFAULT);
diff --git a/xen/common/time.c b/xen/common/time.c
index 04a65f00b35c..cdfdc53b6a17 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -89,6 +89,7 @@ struct tm gmtime(unsigned long t)
     return tbuf;
 }
 
+#ifdef CONFIG_HAS_SHARED_INFO
 void update_domain_wallclock_time(struct domain *d)
 {
     uint32_t *wc_version;
@@ -117,6 +118,7 @@ void update_domain_wallclock_time(struct domain *d)
 
     spin_unlock(&wc_lock);
 }
+#endif /* CONFIG_HAS_SHARED_INFO */
 
 /* Set clock to <secs,usecs> after 00:00:00 UTC, 1 January, 1970. */
 void do_settime(u64 secs, unsigned int nsecs, u64 system_time_base)
diff --git a/xen/include/xen/shared.h b/xen/include/xen/shared.h
index 5b71342cab32..f20a46801181 100644
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -43,7 +43,13 @@ typedef struct vcpu_info vcpu_info_t;
 
 extern vcpu_info_t dummy_vcpu_info;
 
-#define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
+#ifdef CONFIG_HAS_SHARED_INFO
+#define shared_info(d, field) __shared_info(d, (d)->shared_info, field)
+#else
+extern struct shared_info *shared_info_absent;
+#define shared_info(d, field) (((void)(d), shared_info_absent)->field)
+#endif /* CONFIG_HAS_SHARED_INFO */
+
 #define vcpu_info(v, field)        \
         __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index e9c0822e6f31..2f872f580ffc 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -66,7 +66,11 @@ struct tm wallclock_time(uint64_t *ns);
 #define version_update_begin(v) (((v) + 1) | 1)
 #define version_update_end(v)   ((v) + 1)
 extern void update_vcpu_system_time(struct vcpu *v);
+#ifdef CONFIG_HAS_SHARED_INFO
 extern void update_domain_wallclock_time(struct domain *d);
+#else
+static inline void update_domain_wallclock_time(struct domain *d) {}
+#endif
 
 extern void do_settime(
     u64 secs, unsigned int nsecs, u64 system_time_base);
-- 
2.54.0


