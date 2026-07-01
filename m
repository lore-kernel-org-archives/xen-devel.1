Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B350C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 11:16:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349772.1607429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvX-0001KB-3E; Wed, 01 Jul 2026 11:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349772.1607429; Wed, 01 Jul 2026 11:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wesvW-0001Jx-U2; Wed, 01 Jul 2026 11:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1349772;
 Wed, 01 Jul 2026 11:16:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wesvV-0001IA-9O
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:16:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wesvU-008Ib4-MO
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:16:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f6ff-bab6-0a2a0a5309dd-0a2a45038504-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:20 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a44f704-ec1a-0a2a45030019-c387df82da78-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 13:16:20 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3062C73A63;
 Wed,  1 Jul 2026 11:16:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9B40779AA;
 Wed,  1 Jul 2026 11:16:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8F7cMwP3RGrhAQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 01 Jul 2026 11:16:19 +0000
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
	t=1782904580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHLTBeGgYNLdb9o5EF92sUCLA1iLOlkHRzk4jz8IGiQ=;
	b=WxgOEtUNI3sdwzFIUTtXShDsriBbBzUldTOXEQxT0sH5yfsbtNS151iYxQJw4wyTY5fSQW
	5nqcg5yOupZe9vzqagQDrVOmRMU66WA1FVqoxEcdfGj5MYsadumODIwmR2FnxPWpkamYY1
	bQbJW+2PFdIZgeg1XMS4ah3gNsOse8M=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=WxgOEtUN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782904580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHLTBeGgYNLdb9o5EF92sUCLA1iLOlkHRzk4jz8IGiQ=;
	b=WxgOEtUNI3sdwzFIUTtXShDsriBbBzUldTOXEQxT0sH5yfsbtNS151iYxQJw4wyTY5fSQW
	5nqcg5yOupZe9vzqagQDrVOmRMU66WA1FVqoxEcdfGj5MYsadumODIwmR2FnxPWpkamYY1
	bQbJW+2PFdIZgeg1XMS4ah3gNsOse8M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/3] xen: don't let XEN_DOMCTL_setvcpuaffinity return the new affinities
Date: Wed,  1 Jul 2026 13:16:05 +0200
Message-ID: <20260701111606.4063972-3-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701111606.4063972-1-jgross@suse.com>
References: <20260701111606.4063972-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 3062C73A63
X-purgate-ID: tlsNG-33051d/1782904580-BDFBB5D1-DAD606B7/0/0
X-purgate-type: clean
X-purgate-size: 5760

There is no in-tree user of XEN_DOMCTL_setvcpuaffinity left relying on
the returned effective affinity settings.

Drop returning the new affinities, as any error occurring for that
will be reported to the user, while the affinities won't be changed
back to what they were. This would result in the caller believing
that the affinity was not modified, while it might have been.

Fix a comment typo while modifying vcpu_affinity_domctl().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c     | 40 +++++++++----------------------------
 xen/include/public/domctl.h |  9 ++-------
 2 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 3609721426..1611e60020 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1708,7 +1708,7 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
 {
     struct vcpu *v;
     const struct sched_unit *unit;
-    int ret = 0, hret = 0;
+    int ret = 0;
 
     if ( vcpuaff->vcpu >= d->max_vcpus )
         return -EINVAL;
@@ -1724,12 +1724,11 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
     if ( cmd == XEN_DOMCTL_setvcpuaffinity )
     {
         cpumask_var_t new_affinity, old_affinity;
-        cpumask_t *online = cpupool_domain_master_cpumask(v->domain);
 
         /*
          * We want to be able to restore hard affinity if we are trying
          * setting both and changing soft affinity (which happens later,
-         * when hard affinity has been succesfully chaged already) fails.
+         * when hard affinity has been successfully changed already) fails.
          */
         if ( !alloc_cpumask_var(&old_affinity) )
             return -ENOMEM;
@@ -1746,25 +1745,14 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_FORCE )
             vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
 
-        /*
-         * We both set a new affinity and report back to the caller what
-         * the scheduler will be effectively using.
-         */
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_HARD )
         {
-            hret = xenctl_bitmap_to_bitmap(cpumask_bits(new_affinity),
+            ret = xenctl_bitmap_to_bitmap(cpumask_bits(new_affinity),
                                            &vcpuaff->cpumap_hard, nr_cpu_ids);
-            if ( !hret )
-                hret = vcpu_set_hard_affinity(v, new_affinity);
-            if ( hret )
+            if ( !ret )
+                ret = vcpu_set_hard_affinity(v, new_affinity);
+            if ( ret )
                 goto setvcpuaffinity_out;
-
-            /*
-             * For hard affinity, what we return is the intersection of
-             * cpupool's online mask and the new hard affinity.
-             */
-            cpumask_and(new_affinity, online, unit->cpu_hard_affinity);
-            hret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard, new_affinity);
         }
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
         {
@@ -1782,17 +1770,7 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
                  */
                 if ( vcpuaff->flags & XEN_VCPUAFFINITY_HARD )
                     vcpu_set_hard_affinity(v, old_affinity);
-                goto setvcpuaffinity_out;
             }
-
-            /*
-             * For soft affinity, we return the intersection between the
-             * new soft affinity, the cpupool's online map and the (new)
-             * hard affinity.
-             */
-            cpumask_and(new_affinity, new_affinity, online);
-            cpumask_and(new_affinity, new_affinity, unit->cpu_hard_affinity);
-            ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft, new_affinity);
         }
 
  setvcpuaffinity_out:
@@ -1802,14 +1780,14 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
     else
     {
         if ( vcpuaff->flags & XEN_VCPUAFFINITY_HARD )
-            hret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard,
+            ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_hard,
                                             unit->cpu_hard_affinity);
-        if ( vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
+        if ( !ret && vcpuaff->flags & XEN_VCPUAFFINITY_SOFT )
             ret = cpumask_to_xenctl_bitmap(&vcpuaff->cpumap_soft,
                                            unit->cpu_soft_affinity);
     }
 
-    return hret ?: ret;
+    return ret;
 }
 
 bool alloc_affinity_masks(struct affinity_masks *affinity)
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index cdf350a290..906d2c59d0 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -357,13 +357,8 @@ struct xen_domctl_vcpuaffinity {
     /*
      * IN/OUT variables.
      *
-     * Both are IN/OUT for XEN_DOMCTL_setvcpuaffinity, in which case they
-     * contain effective hard or/and soft affinity. That is, upon successful
-     * return, cpumap_soft, contains the intersection of the soft affinity,
-     * hard affinity and the cpupool's online CPUs for the domain (if
-     * XEN_VCPUAFFINITY_SOFT was set in flags). cpumap_hard contains the
-     * intersection between hard affinity and the cpupool's online CPUs (if
-     * XEN_VCPUAFFINITY_HARD was set in flags).
+     * Both are IN-only for XEN_DOMCTL_setvcpuaffinity, in which case they
+     * contain effective hard or/and soft affinity.
      *
      * Both are OUT-only for XEN_DOMCTL_getvcpuaffinity, in which case they
      * contain the plain hard and/or soft affinity masks that were set during
-- 
2.54.0


