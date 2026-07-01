Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE92C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 11:16:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349775.1607437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvc-0001eE-7N; Wed, 01 Jul 2026 11:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349775.1607437; Wed, 01 Jul 2026 11:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvc-0001e6-4W; Wed, 01 Jul 2026 11:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1349775;
 Wed, 01 Jul 2026 11:16:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wesva-0001bA-Pd
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:16:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wesva-003663-65
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:16:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f709-2eae-0a2a0a5409dd-0a2a4506d3e8-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:26 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f709-08de-0a2a45060019-c387df83d738-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:25 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A685F75C3A;
 Wed,  1 Jul 2026 11:16:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83C02779AA;
 Wed,  1 Jul 2026 11:16:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id PYjUHgn3RGoEAgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 01 Jul 2026 11:16:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t/WHu9BiecxDO+oBqpdeXwPpVi0SCaRQ5V3xF2p+VU=;
	b=hs6TvoaspCKSX7Q68ECL2s4YoFqNJJpwoirSRZaZJ8PDAIRTZ3cBdhlPSb2ONon782l5V7
	wWPvKg1xpVYJR1aVKk3RmIVM9HYL3sk/eNhDR/UNJJB9QM2wo0badB11Xt8OU1xI7CiECa
	0git7o0hLtQykU2ffHn+9qTPgBhsJ3o=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=hs6Tvoas
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2t/WHu9BiecxDO+oBqpdeXwPpVi0SCaRQ5V3xF2p+VU=;
	b=hs6TvoaspCKSX7Q68ECL2s4YoFqNJJpwoirSRZaZJ8PDAIRTZ3cBdhlPSb2ONon782l5V7
	wWPvKg1xpVYJR1aVKk3RmIVM9HYL3sk/eNhDR/UNJJB9QM2wo0badB11Xt8OU1xI7CiECa
	0git7o0hLtQykU2ffHn+9qTPgBhsJ3o=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/3] tools/libxenctrl: rename parameters of xc_vcpu_setaffinity()
Date: Wed,  1 Jul 2026 13:16:06 +0200
Message-ID: <20260701111606.4063972-4-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701111606.4063972-1-jgross@suse.com>
References: <20260701111606.4063972-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A685F75C3A
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-16d1c6/1782904585-C5B3A68D-500FB331/0/0
X-purgate-type: clean
X-purgate-size: 5707

The cpumaps passed to xc_vcpu_setaffinity() are input-only now, so
drop the "_inout" suffix from their names and make them const.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h     | 26 ++++++--------------------
 tools/libs/ctrl/xc_domain.c | 26 ++++++++++++--------------
 2 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c89..96fb0cc81f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -590,37 +590,23 @@ int xc_domain_node_getaffinity(xc_interface *xch,
  * There are two kinds of affinity. Soft affinity is on what CPUs a vcpu
  * prefers to run. Hard affinity is on what CPUs a vcpu is allowed to run.
  * If flags contains XEN_VCPUAFFINITY_SOFT, the soft affinity it is set to
- * what cpumap_soft_inout contains. If flags contains XEN_VCPUAFFINITY_HARD,
- * the hard affinity is set to what cpumap_hard_inout contains. Both flags
+ * what cpumap_soft contains. If flags contains XEN_VCPUAFFINITY_HARD,
+ * the hard affinity is set to what cpumap_hard contains. Both flags
  * can be set at the same time, in which case both soft and hard affinity are
  * set to what the respective parameter contains.
  *
- * The function also returns the effective hard or/and soft affinity, still
- * via the cpumap_soft_inout and cpumap_hard_inout parameters. Effective
- * affinity is, in case of soft affinity, the intersection of soft affinity,
- * hard affinity and the cpupool's online CPUs for the domain, and is returned
- * in cpumap_soft_inout, if XEN_VCPUAFFINITY_SOFT is set in flags. In case of
- * hard affinity, it is the intersection between hard affinity and the
- * cpupool's online CPUs, and is returned in cpumap_hard_inout, if
- * XEN_VCPUAFFINITY_HARD is set in flags. If both flags are set, both soft
- * and hard affinity are returned in the respective parameter.
- *
- * We do report it back as effective affinity is what the Xen scheduler will
- * actually use, and we thus allow checking whether or not that matches with,
- * or at least is good enough for, the caller's purposes.
- *
  * @param xch a handle to an open hypervisor interface.
  * @param domid the id of the domain to which the vcpu belongs
  * @param vcpu the vcpu id wihin the domain
- * @param cpumap_hard_inout specifies(/returns) the (effective) hard affinity
- * @param cpumap_soft_inout specifies(/returns) the (effective) soft affinity
+ * @param cpumap_hard specifies the hard affinity
+ * @param cpumap_soft specifies the soft affinity
  * @param flags what we want to set
  */
 int xc_vcpu_setaffinity(xc_interface *xch,
                         uint32_t domid,
                         int vcpu,
-                        xc_cpumap_t cpumap_hard_inout,
-                        xc_cpumap_t cpumap_soft_inout,
+                        const xc_cpumap_t cpumap_hard,
+                        const xc_cpumap_t cpumap_soft,
                         uint32_t flags);
 
 /**
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c88..3ee0e43ea5 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -199,15 +199,13 @@ int xc_domain_node_getaffinity(xc_interface *xch,
 int xc_vcpu_setaffinity(xc_interface *xch,
                         uint32_t domid,
                         int vcpu,
-                        xc_cpumap_t cpumap_hard_inout,
-                        xc_cpumap_t cpumap_soft_inout,
+                        const xc_cpumap_t cpumap_hard,
+                        const xc_cpumap_t cpumap_soft,
                         uint32_t flags)
 {
     struct xen_domctl domctl = {};
-    DECLARE_HYPERCALL_BOUNCE(cpumap_hard_inout, 0,
-                             XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    DECLARE_HYPERCALL_BOUNCE(cpumap_soft_inout, 0,
-                             XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    DECLARE_HYPERCALL_BOUNCE(cpumap_hard, 0, XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    DECLARE_HYPERCALL_BOUNCE(cpumap_soft, 0, XC_HYPERCALL_BUFFER_BOUNCE_IN);
     int ret = -1;
     int cpusize;
 
@@ -218,11 +216,11 @@ int xc_vcpu_setaffinity(xc_interface *xch,
         return -1;
     }
 
-    HYPERCALL_BOUNCE_SET_SIZE(cpumap_hard_inout, cpusize);
-    HYPERCALL_BOUNCE_SET_SIZE(cpumap_soft_inout, cpusize);
+    HYPERCALL_BOUNCE_SET_SIZE(cpumap_hard, cpusize);
+    HYPERCALL_BOUNCE_SET_SIZE(cpumap_soft, cpusize);
 
-    if ( xc_hypercall_bounce_pre(xch, cpumap_hard_inout) ||
-         xc_hypercall_bounce_pre(xch, cpumap_soft_inout) )
+    if ( xc_hypercall_bounce_pre(xch, cpumap_hard) ||
+         xc_hypercall_bounce_pre(xch, cpumap_soft) )
     {
         PERROR("Could not allocate hcall buffers for DOMCTL_setvcpuaffinity");
         goto out;
@@ -234,17 +232,17 @@ int xc_vcpu_setaffinity(xc_interface *xch,
     domctl.u.vcpuaffinity.flags = flags;
 
     set_xen_guest_handle(domctl.u.vcpuaffinity.cpumap_hard.bitmap,
-                         cpumap_hard_inout);
+                         cpumap_hard);
     domctl.u.vcpuaffinity.cpumap_hard.nr_bits = cpusize * 8;
     set_xen_guest_handle(domctl.u.vcpuaffinity.cpumap_soft.bitmap,
-                         cpumap_soft_inout);
+                         cpumap_soft);
     domctl.u.vcpuaffinity.cpumap_soft.nr_bits = cpusize * 8;
 
     ret = do_domctl(xch, &domctl);
 
  out:
-    xc_hypercall_bounce_post(xch, cpumap_hard_inout);
-    xc_hypercall_bounce_post(xch, cpumap_soft_inout);
+    xc_hypercall_bounce_post(xch, cpumap_hard);
+    xc_hypercall_bounce_post(xch, cpumap_soft);
 
     return ret;
 }
-- 
2.54.0


