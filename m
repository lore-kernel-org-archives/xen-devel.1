Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649FCC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 04:58:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399572.1635603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5ih-0005fi-Pq; Wed, 26 Aug 2026 04:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399572.1635603; Wed, 26 Aug 2026 04:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz5ih-0005fY-Kt; Wed, 26 Aug 2026 04:58:39 +0000
Received: by outflank-mailman (input) for mailman id 1399572;
 Wed, 26 Aug 2026 04:58:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wz5ig-0005dV-16
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 04:58:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz5if-00758C-EF
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 06:58:37 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e725f-e002-0a2a0a5209dd-0a2a450bdaf6-24
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:37 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a8e727d-b7e8-0a2a450b0019-d155da2ff019-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:58:37 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c250a2bc3b3so58361166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 21:58:37 -0700 (PDT)
Received: from notebook.. ([88.230.44.160]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9b43a0sm278781666b.52.2026.08.25.21.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 21:58:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787720317; x=1788325117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHRsXuEnf7BCXLP3eamT1pJU7X7xpT0JlychFCHzOuM=;
        b=iVPKiUlRX8AAxHG1yp5yA9fUy0Zkw02z6k7Xx6Tf38C3C3DqB+/c/zIp4HkAqSKZC5
         pLVV7Fnwujmaui/HZ1fNZzGLyox6O1Pj3DcNRSE3ylqBOPGODAwZbiFvDJS+OOelPHUS
         h7i3JMa2Zz4Zy8o0Z3WsI4BneZB3trsLQCfVNrTMiv6WsA4HS2eN6+84AJuNxOw94WtM
         yLzNUwd7uQLEbfNIEQA58fBh9ZaOnIUye6WCpxtIjImkB6EJw+F3AeE42xW3eVWg8MH3
         CKPW7a3SuIAYFBFHXwr0Vs/27J2i4uAbURSMuSHugW/5Zb1aqRqxvKqGMSPrrYmcAXxK
         azWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787720317; x=1788325117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHRsXuEnf7BCXLP3eamT1pJU7X7xpT0JlychFCHzOuM=;
        b=MvFQ1EiIL7eAEKaIfiSqJ5rd/GjOFeDW+cZ5+rSiAgd8JFJ8UDWgkcPy2P3bNrbItT
         UlDDuPtNzJY6LMhy53qcSxOIlr1iQTJgTug9O8S5PTbKR7WMzx9Kjx0btY+iDDSzQ2GW
         iGeTfiUJR5/qg8Hrt9och1s9AovnM0W8FkzXZS2jUpZk0PhIZV6W+WCZqKjE/16DlmJk
         +AmH6aaE+R5WDfkG1BFxLumkic3r+tAHx9A2qZPdfUcrn8O6B7wgia5mQSzFS0Wi8X1x
         c8qJ/xQDtqkBAfGUh6nP8du4KE+ncAHpMFjYJGwFvETLWUk2fU1WDK3Ej4OngEH14eYb
         q1xw==
X-Gm-Message-State: AFuF++lLlqPih7HAx6iIRWE6JQNRw2CHry3y2cjqjTjL0UFmlg+uCLEi
	nO4C5in7KFAEgHw33GIqHeH11NdqfxbGEu+bMKkLoezSO1wyWrhYScgh8eXzGg==
X-Gm-Gg: AR+sD10ufEkf79cFAnJmafVVlwHGSJKtwwoZ7kVJdxJwSMBXYLzn1GXPqDOQ0UCsWyh
	QxktJMzcGxo3uUEtam/wvn6k+RoW71rWQ1N0in4MA5Sk8B/79r8An7tIMaNfEU1QSqPkYxrGrq4
	cbn5l30JGVi7LPpubZAmUb563Huo+YmZFIB//mZw9jNeu5iPQEezA1LGfRa5iTPVO2Luu+f/XZ1
	3xftOjAgQcu7DuCcHus+PiHmmnjftNnQ3XGEksKgXgGJw4WVZ2CZzwP1jVjxOxB+JoVXCTKAqPr
	5DofZFurzvVvZLbt3lQk+3SkEyOeXwX4fXN9bu74UVlaFDt6PQT8pBb54ASuWpZPAO8JBPM0SDv
	F2tx4mvZTUaYxKf7TSn5/AqAFwEnCatAt/9Q9ydrddklVvufMyS5YTMk8jZut8d/me4j2uk5ggp
	y4s+swAptOyxG85OnLR7WjLFs1iH/7j3ibIXuRW67v0E82Ii6UKQnHF3/nyEPJ
X-Received: by 2002:a17:906:ba83:b0:c25:544:3aec with SMTP id a640c23a62f3a-c250baf9b5amr516177966b.5.1787720316767;
        Tue, 25 Aug 2026 21:58:36 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	dfaggioli@suse.com,
	anthony.perard@vates.tech,
	julien@xen.org,
	sstabellini@kernel.org,
	gwd@xenproject.org,
	enr0n@ubuntu.com,
	michal.orzel@amd.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 5/5] tools: expose admission control toggle via xl sched-rtds
Date: Wed, 26 Aug 2026 07:57:20 +0300
Message-Id: <20260826045720.5779-6-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826045720.5779-1-frn1furkan10@gmail.com>
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787720317-1B6D29EA-8C33FBC3/0/0
X-purgate-type: clean
X-purgate-size: 16058

Wire the per-cpupool admission-control switch through libxl
to xl sched-rtds, and document it.

Add -s/--schedparam to list or set pool-wide RTDS scheduler
parameters, and -a/--admission to enable or disable admission
control for a cpupool ("-c pool -s -a 0/1").

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
 docs/man/xl.1.pod.in                 |  20 ++++++
 tools/golang/xenlight/helpers.gen.go |  23 ++++++
 tools/golang/xenlight/types.gen.go   |   4 ++
 tools/include/libxl.h                |   4 ++
 tools/include/xenctrl.h              |   6 ++
 tools/libs/ctrl/xc_rt.c              |  40 +++++++++++
 tools/libs/light/libxl_sched.c       |  46 ++++++++++++
 tools/libs/light/libxl_types.idl     |   5 ++
 tools/xl/xl_cmdtable.c               |   8 ++-
 tools/xl/xl_sched.c                  | 103 +++++++++++++++++++++++++--
 10 files changed, 254 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 88ccf7ad82..51405f4e33 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -1230,6 +1230,16 @@ the unreserved system resource.
 
 Restrict output to domains in the specified cpupool.
 
+=item B<-s>, B<--schedparam>
+
+Specify to list or set pool-wide scheduler parameters.
+
+=item B<-a ADMISSION_CONTROL>, B<--admission=ADMISSION_CONTROL>
+
+Binary flag to enable or disable admission control for the cpupool.
+When enabled (the default), a reservation is rejected if admitting
+it would exceed the cpupool's utilization capacity.
+
 =back
 
 B<EXAMPLE>
@@ -1293,6 +1303,16 @@ e.g., "xl sched-rtds -d vm1 -v 0 -p 100 -b 50 -e 1 -v 3 -p 300 -b 150 -e 0".
 To change the parameters of all the VCPUs of a domain, use B<-v all>,
 e.g., "xl sched-rtds -d vm1 -v all -p 500 -b 250 -e 1".
 
+4) Use B<-c CPUPOOL -s> to see whether admission control is enabled
+for a cpupool, and B<-c CPUPOOL -s -a> to change it:
+
+    xl sched-rtds -c pool-rt -s
+    Cpupool pool-rt: sched=RTDS admission-control=enabled
+
+    xl sched-rtds -c pool-rt -s -a 0
+    xl sched-rtds -c pool-rt -s
+    Cpupool pool-rt: sched=RTDS admission-control=disabled
+
 =back
 
 =back
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b0c09da910..18ab0731ef 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -4192,6 +4192,29 @@ func (x *SchedCredit2Params) toC(xc *C.libxl_sched_credit2_params) (err error){x
  return nil
  }
 
+// NewSchedRtdsParams returns an instance of SchedRtdsParams initialized with defaults.
+func NewSchedRtdsParams() (*SchedRtdsParams, error) {
+var (
+x SchedRtdsParams
+xc C.libxl_sched_rtds_params)
+
+C.libxl_sched_rtds_params_init(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *SchedRtdsParams) fromC(xc *C.libxl_sched_rtds_params) error {
+ x.AdmissionControlEnabled = bool(xc.admission_control_enabled)
+
+ return nil}
+
+func (x *SchedRtdsParams) toC(xc *C.libxl_sched_rtds_params) (err error){xc.admission_control_enabled = C.bool(x.AdmissionControlEnabled)
+
+ return nil
+ }
+
 // NewDomainRemusInfo returns an instance of DomainRemusInfo initialized with defaults.
 func NewDomainRemusInfo() (*DomainRemusInfo, error) {
 var (
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e0fd78ec03..897100d9b6 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -1231,6 +1231,10 @@ type SchedCredit2Params struct {
 RatelimitUs int
 }
 
+type SchedRtdsParams struct {
+AdmissionControlEnabled bool
+}
+
 type DomainRemusInfo struct {
 Interval int
 AllowUnsafe Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7c098edab6..ff993c38b7 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2797,6 +2797,10 @@ int libxl_sched_credit2_params_get(libxl_ctx *ctx, uint32_t poolid,
                                    libxl_sched_credit2_params *scinfo);
 int libxl_sched_credit2_params_set(libxl_ctx *ctx, uint32_t poolid,
                                    libxl_sched_credit2_params *scinfo);
+int libxl_sched_rtds_params_get(libxl_ctx *ctx, uint32_t poolid,
+                                libxl_sched_rtds_params *scinfo);
+int libxl_sched_rtds_params_set(libxl_ctx *ctx, uint32_t poolid,
+                                libxl_sched_rtds_params *scinfo);
 
 /* Scheduler Per-domain parameters */
 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9f00d4a19d..6f4ea7ca62 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -897,6 +897,12 @@ int xc_sched_rtds_vcpu_get(xc_interface *xch,
                            uint32_t domid,
                            struct xen_domctl_schedparam_vcpu *vcpus,
                            uint32_t num_vcpus);
+int xc_sched_rtds_params_set(xc_interface *xch,
+                             uint32_t cpupool_id,
+                             struct xen_sysctl_rtds_schedule *schedule);
+int xc_sched_rtds_params_get(xc_interface *xch,
+                             uint32_t cpupool_id,
+                             struct xen_sysctl_rtds_schedule *schedule);
 
 int
 xc_sched_arinc653_schedule_set(
diff --git a/tools/libs/ctrl/xc_rt.c b/tools/libs/ctrl/xc_rt.c
index 3cb3fbb923..fb3f567d4f 100644
--- a/tools/libs/ctrl/xc_rt.c
+++ b/tools/libs/ctrl/xc_rt.c
@@ -130,3 +130,43 @@ int xc_sched_rtds_vcpu_get(xc_interface *xch,
 
     return rc;
 }
+
+int xc_sched_rtds_params_set(xc_interface *xch,
+                             uint32_t cpupool_id,
+                             struct xen_sysctl_rtds_schedule *schedule)
+{
+    struct xen_sysctl sysctl = {};
+
+    sysctl.cmd = XEN_SYSCTL_scheduler_op;
+    sysctl.u.scheduler_op.cpupool_id = cpupool_id;
+    sysctl.u.scheduler_op.sched_id = XEN_SCHEDULER_RTDS;
+    sysctl.u.scheduler_op.cmd = XEN_SYSCTL_SCHEDOP_putinfo;
+
+    sysctl.u.scheduler_op.u.sched_rtds = *schedule;
+
+    if ( do_sysctl(xch, &sysctl) )
+        return -1;
+
+    *schedule = sysctl.u.scheduler_op.u.sched_rtds;
+
+    return 0;
+}
+
+int xc_sched_rtds_params_get(xc_interface *xch,
+                             uint32_t cpupool_id,
+                             struct xen_sysctl_rtds_schedule *schedule)
+{
+    struct xen_sysctl sysctl = {};
+
+    sysctl.cmd = XEN_SYSCTL_scheduler_op;
+    sysctl.u.scheduler_op.cpupool_id = cpupool_id;
+    sysctl.u.scheduler_op.sched_id = XEN_SCHEDULER_RTDS;
+    sysctl.u.scheduler_op.cmd = XEN_SYSCTL_SCHEDOP_getinfo;
+
+    if ( do_sysctl(xch, &sysctl) )
+        return -1;
+
+    *schedule = sysctl.u.scheduler_op.u.sched_rtds;
+
+    return 0;
+}
diff --git a/tools/libs/light/libxl_sched.c b/tools/libs/light/libxl_sched.c
index 2d6635dae7..ae4379cf09 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -397,6 +397,52 @@ int libxl_sched_credit2_params_set(libxl_ctx *ctx, uint32_t poolid,
     return rc;
 }
 
+int libxl_sched_rtds_params_get(libxl_ctx *ctx, uint32_t poolid,
+                                libxl_sched_rtds_params *scinfo)
+{
+    struct xen_sysctl_rtds_schedule sparam;
+    int r, rc;
+    GC_INIT(ctx);
+
+    r = xc_sched_rtds_params_get(ctx->xch, poolid, &sparam);
+    if (r < 0) {
+        LOGE(ERROR, "getting RTDS scheduler parameters");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    scinfo->admission_control_enabled = sparam.admission_control_enabled;
+
+    rc = 0;
+out:
+    GC_FREE;
+    return rc;
+}
+
+int libxl_sched_rtds_params_set(libxl_ctx *ctx, uint32_t poolid,
+                                libxl_sched_rtds_params *scinfo)
+{
+    struct xen_sysctl_rtds_schedule sparam;
+    int r, rc;
+    GC_INIT(ctx);
+
+    sparam.admission_control_enabled = scinfo->admission_control_enabled;
+
+    r = xc_sched_rtds_params_set(ctx->xch, poolid, &sparam);
+    if (r < 0) {
+        LOGE(ERROR, "Setting RTDS scheduler parameters");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    scinfo->admission_control_enabled = sparam.admission_control_enabled;
+
+    rc = 0;
+out:
+    GC_FREE;
+    return rc;
+}
+
 static int sched_credit2_domain_get(libxl__gc *gc, uint32_t domid,
                                     libxl_domain_sched_params *scinfo)
 {
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a7893460f0..d3121ea277 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1286,6 +1286,11 @@ libxl_sched_credit2_params = Struct("sched_credit2_params", [
     ("ratelimit_us", integer),
     ], dispose_fn=None)
 
+libxl_sched_rtds_params = Struct("sched_rtds_params", [
+    ("admission_control_enabled", bool),
+    ], dispose_fn=None)
+
+
 libxl_domain_remus_info = Struct("domain_remus_info",[
     ("interval",             integer),
     ("allow_unsafe",         libxl_defbool),
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 502244f683..e48d5c5edc 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -295,13 +295,19 @@ const struct cmd_spec cmd_table[] = {
     { "sched-rtds",
       &main_sched_rtds, 0, 1,
       "Get/set rtds scheduler parameters",
-      "[-d <Domain> [-v[=VCPUID/all]] [-p[=PERIOD]] [-b[=BUDGET]] [-e[=Extratime]]]",
+      "[-d <Domain> [-v[=VCPUID/all]] [-p[=PERIOD]] [-b[=BUDGET]] [-e[=Extratime]]]\n"
+      "                [-c <Cpupool> -s [-a[=ADMISSION_CONTROL]]]",
       "-d DOMAIN, --domain=DOMAIN     Domain to modify\n"
       "-v VCPUID/all, --vcpuid=VCPUID/all    VCPU to modify or output;\n"
       "               Using '-v all' to modify/output all vcpus\n"
       "-p PERIOD, --period=PERIOD     Period (us)\n"
       "-b BUDGET, --budget=BUDGET     Budget (us)\n"
       "-e Extratime, --extratime=Extratime Extratime (1=yes, 0=no)\n"
+      "-c CPUPOOL, --cpupool=CPUPOOL  Restrict output to domains in CPUPOOL\n"
+      "-s, --schedparam               List or set pool-wide scheduler parameters\n"
+      "-a ADMISSION_CONTROL, --admission=ADMISSION_CONTROL\n"
+      "               Enable or disable admission control for the cpupool\n"
+      "               (1=enabled, 0=disabled); requires -s\n"
     },
     { "domid",
       &main_domid, 0, 0,
diff --git a/tools/xl/xl_sched.c b/tools/xl/xl_sched.c
index 73cd7040cd..7257d1854b 100644
--- a/tools/xl/xl_sched.c
+++ b/tools/xl/xl_sched.c
@@ -246,6 +246,28 @@ static int sched_credit2_pool_output(uint32_t poolid)
     return 0;
 }
 
+static int sched_rtds_params_set(int poolid,
+                                 libxl_sched_rtds_params *scinfo)
+{
+    if (libxl_sched_rtds_params_set(ctx, poolid, scinfo)) {
+        fprintf(stderr, "libxl_sched_rtds_params_set failed.\n");
+        return 1;
+    }
+
+    return 0;
+}
+
+static int sched_rtds_params_get(int poolid,
+                                 libxl_sched_rtds_params *scinfo)
+{
+    if (libxl_sched_rtds_params_get(ctx, poolid, scinfo)) {
+        fprintf(stderr, "libxl_sched_rtds_params_get failed.\n");
+        return 1;
+    }
+
+    return 0;
+}
+
 static int sched_rtds_domain_output(
     int domid)
 {
@@ -339,10 +361,15 @@ static int sched_rtds_vcpu_output_all(int domid,
 
 static int sched_rtds_pool_output(uint32_t poolid)
 {
-    char *poolname;
+    libxl_sched_rtds_params scparam;
+    char *poolname = libxl_cpupoolid_to_name(ctx, poolid);
 
-    poolname = libxl_cpupoolid_to_name(ctx, poolid);
-    printf("Cpupool %s: sched=RTDS\n", poolname);
+    if (sched_rtds_params_get(poolid, &scparam))
+        printf("Cpupool %s: [sched params unavailable]\n", poolname);
+    else
+        printf("Cpupool %s: sched=RTDS admission-control=%s\n",
+                poolname,
+                scparam.admission_control_enabled ? "enabled" : "disabled");
 
     free(poolname);
     return 0;
@@ -715,6 +742,8 @@ int main_sched_credit2(int argc, char **argv)
  * -d [domid] -v [vcpuid 1] [params] -v [vcpuid 2] [params] ...  :
  * Set per-VCPU params for domain
  * -d [domid] -v all [params]  : Set all per-VCPU params for domain
+ * -c [cpupool] -s  : List pool-wide scheduling parameters for cpupool
+ * -c [cpupool] -s -a [0|1]  : Set admission control for cpupool
  */
 int main_sched_rtds(int argc, char **argv)
 {
@@ -736,7 +765,10 @@ int main_sched_rtds(int argc, char **argv)
     bool opt_b = false;
     bool opt_e = false;
     bool opt_v = false;
+    bool opt_s = false;
+    bool opt_a = false;
     bool opt_all = false; /* output per-dom parameters */
+    bool admission_control = false;
     int opt, i, rc, r;
     static struct option opts[] = {
         {"domain", 1, 0, 'd'},
@@ -745,10 +777,12 @@ int main_sched_rtds(int argc, char **argv)
         {"extratime", 1, 0, 'e'},
         {"vcpuid",1, 0, 'v'},
         {"cpupool", 1, 0, 'c'},
+        {"schedparam", 0, 0, 's'},
+        {"admission", 1, 0, 'a'},
         COMMON_LONG_OPTS
     };
 
-    SWITCH_FOREACH_OPT(opt, "d:p:b:e:v:c", opts, "sched-rtds", 0) {
+    SWITCH_FOREACH_OPT(opt, "d:p:b:e:v:c:a:s", opts, "sched-rtds", 0) {
     case 'd':
         dom = optarg;
         break;
@@ -801,6 +835,19 @@ int main_sched_rtds(int argc, char **argv)
     case 'c':
         cpupool = optarg;
         break;
+    case 's':
+        opt_s = true;
+        break;
+    case 'a':
+        if (strcmp(optarg, "0") && strcmp(optarg, "1"))
+        {
+            fprintf(stderr, "Invalid admission_control value.\n");
+            r = EXIT_FAILURE;
+            goto out;
+        }
+        admission_control = strtol(optarg, NULL, 10);
+        opt_a = true;
+        break;
     }
 
     if (cpupool && (dom || opt_p || opt_b || opt_e || opt_v || opt_all)) {
@@ -809,6 +856,11 @@ int main_sched_rtds(int argc, char **argv)
         r = EXIT_FAILURE;
         goto out;
     }
+    if (opt_s && (dom || opt_p || opt_b || opt_e || opt_v || opt_all)) {
+        fprintf(stderr, "-s cannot be combined with domain/VCPU options.\n");
+        r = EXIT_FAILURE;
+        goto out;
+    }
     if (!dom && (opt_p || opt_b || opt_e || opt_v)) {
         fprintf(stderr, "Missing parameters.\n");
         r = EXIT_FAILURE;
@@ -831,6 +883,49 @@ int main_sched_rtds(int argc, char **argv)
         r = EXIT_FAILURE;
         goto out;
     }
+    if (opt_a && !opt_s) {
+        fprintf(stderr, "-a/--admission requires -s/--schedparam.\n");
+        r = EXIT_FAILURE;
+        goto out;
+    }
+
+    if (opt_s)
+    {
+        libxl_sched_rtds_params scparam;
+        uint32_t poolid = 0;
+
+        if (cpupool) {
+            if (libxl_cpupool_qualifier_to_cpupoolid(ctx, cpupool,
+                                                      &poolid, NULL) ||
+                !libxl_cpupoolid_is_valid(ctx, poolid)) {
+                fprintf(stderr, "Unknown cpupool \'%s\'\n", cpupool);
+                r = EXIT_FAILURE;
+                goto out;
+            }
+        }
+
+        if (!opt_a) { /* output pool-wide scheduling parameters */
+            if (sched_rtds_pool_output(poolid)) {
+                r = EXIT_FAILURE;
+                goto out;
+            }
+        } else { /* set pool-wide scheduling parameters */
+            if (sched_rtds_params_get(poolid, &scparam)) {
+                r = EXIT_FAILURE;
+                goto out;
+            }
+
+            scparam.admission_control_enabled = admission_control;
+
+            if (sched_rtds_params_set(poolid, &scparam)) {
+                r = EXIT_FAILURE;
+                goto out;
+            }
+        }
+
+        r = EXIT_SUCCESS;
+        goto out;
+    }
 
     if ((!dom) && opt_all) {
         /* get all domain's per-vcpu rtds scheduler parameters */
-- 
2.34.1


