Return-Path: <SRS0=RRgd=7K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF375C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 21:29:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D4F420721
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 21:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D4F420721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ5g-0000SL-Pk; Thu, 28 May 2020 21:29:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LyZP=7K=gmail.com=raistlin.df@srs-us1.protection.inumbo.net>)
 id 1jeQ5f-0000SE-BZ
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:29:27 +0000
X-Inumbo-ID: 4e3be89e-a12a-11ea-8993-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e3be89e-a12a-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 21:29:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x6so839989wrm.13
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2020 14:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=JBpkxXxyifxfXBjwP1Ac2WLMkdMOyk1zAam+z/GHBmg=;
 b=ISUONMeK9D/WCUOtqVufpoY5qKXiYNIIA8PSggey/W7A7gYNcpu1ghO6f33Dg1Wi6n
 3hJ2bX/loxqIb1Cxx0OYr6MV2iG2vRdS6551jflbwQKSpRuKKxiRYhcMDPHcvDZgl+qE
 xmgf00kfEEcx+l+1MyJZq2v8OHbASRdAdAKP0uIZIpSxJ1zFHDF6L9h0D19phBeTF175
 krje1XT/YlJuv6yg0Eaf4QPBg1MHDV6/XR6CTIRCsNv4ieUaY/pzXxH0FArYFMJL3Aib
 IgHw36Hul68uv780YmydvZw7LboqPhZF3NVSrH0Wt1q+zMWlDtTpmjgSOirAfGAgmUDR
 WyGQ==
X-Gm-Message-State: AOAM531T1Uh5gENu4d26PMQFIkTXkU0SYenQ/WG/DqKbDwSH0kbdUqfw
 kA9Cc+SDv3VGi3Vml4L5k6sKVytE
X-Google-Smtp-Source: ABdhPJxZDMoEaDChbbXxfLrdkKE5tLhILEdSe7ifgSNEpvEpXkayrtHxOHruayVsuicYAMU2jV2edQ==
X-Received: by 2002:a5d:68c2:: with SMTP id p2mr5351046wrw.253.1590701365691; 
 Thu, 28 May 2020 14:29:25 -0700 (PDT)
Received: from [192.168.0.36] (87.78.186.89.cust.ip.kpnqwest.it.
 [89.186.78.87])
 by smtp.gmail.com with ESMTPSA id d2sm6729892wrs.95.2020.05.28.14.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 14:29:25 -0700 (PDT)
Subject: [PATCH v2 1/7] xen: credit2: factor cpu to runqueue matching in a
 function
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 28 May 2020 23:29:24 +0200
Message-ID: <159070136424.12060.2223986236933194278.stgit@Palanthas>
In-Reply-To: <159070133878.12060.13318432301910522647.stgit@Palanthas>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Just move the big if() condition in an inline function.

No functional change intended.

Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/credit2.c |   28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 34f05c3e2a..697c9f917d 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -838,6 +838,20 @@ static inline bool same_core(unsigned int cpua, unsigned int cpub)
            cpu_to_core(cpua) == cpu_to_core(cpub);
 }
 
+static inline bool
+cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
+{
+    unsigned int peer_cpu = rqd->pick_bias;
+
+    BUG_ON(cpu_to_socket(peer_cpu) == XEN_INVALID_SOCKET_ID);
+
+    /* OPT_RUNQUEUE_CPU will never find an existing runqueue. */
+    return opt_runqueue == OPT_RUNQUEUE_ALL ||
+           (opt_runqueue == OPT_RUNQUEUE_CORE && same_core(peer_cpu, cpu)) ||
+           (opt_runqueue == OPT_RUNQUEUE_SOCKET && same_socket(peer_cpu, cpu)) ||
+           (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu));
+}
+
 static struct csched2_runqueue_data *
 cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
 {
@@ -855,21 +869,11 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
     rqd_ins = &prv->rql;
     list_for_each_entry ( rqd, &prv->rql, rql )
     {
-        unsigned int peer_cpu;
-
         /* Remember first unused queue index. */
         if ( !rqi_unused && rqd->id > rqi )
             rqi_unused = true;
 
-        peer_cpu = rqd->pick_bias;
-        BUG_ON(cpu_to_socket(cpu) == XEN_INVALID_SOCKET_ID ||
-               cpu_to_socket(peer_cpu) == XEN_INVALID_SOCKET_ID);
-
-        /* OPT_RUNQUEUE_CPU will never find an existing runqueue. */
-        if ( opt_runqueue == OPT_RUNQUEUE_ALL ||
-             (opt_runqueue == OPT_RUNQUEUE_CORE && same_core(peer_cpu, cpu)) ||
-             (opt_runqueue == OPT_RUNQUEUE_SOCKET && same_socket(peer_cpu, cpu)) ||
-             (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu)) )
+        if ( cpu_runqueue_match(rqd, cpu) )
         {
             rqd_valid = true;
             break;
@@ -3744,6 +3748,8 @@ csched2_alloc_pdata(const struct scheduler *ops, int cpu)
     struct csched2_pcpu *spc;
     struct csched2_runqueue_data *rqd;
 
+    BUG_ON(cpu_to_socket(cpu) == XEN_INVALID_SOCKET_ID);
+
     spc = xzalloc(struct csched2_pcpu);
     if ( spc == NULL )
         return ERR_PTR(-ENOMEM);


