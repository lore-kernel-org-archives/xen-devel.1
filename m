Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0B7C982D9
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 10:41:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425118.1649265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7W25-00007t-BA; Fri, 18 Sep 2026 10:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425118.1649265; Fri, 18 Sep 2026 10:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7W25-00007k-7f; Fri, 18 Sep 2026 10:41:29 +0000
Received: by outflank-mailman (input) for mailman id 1425118;
 Fri, 18 Sep 2026 10:41:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x7W24-000065-0g
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 10:41:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7W22-00AyQX-QB
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 12:41:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aad1556-8faa-0a2a0a5109dd-0a2a4505c584-2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 12:41:26 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aad1556-4cb1-0a2a45050019-4a7de18dd180-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 12:41:26 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so3677985e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 03:41:26 -0700 (PDT)
Received: from notebook.. ([88.230.43.170]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd24034esm177231125e9.15.2026.09.18.03.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 03:41:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789728086; x=1790332886; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOJ74v/vCGAVFOz41fLecfvlvMNA2bb5S4xdvE9EXk0=;
        b=nhDH0tjMDlpJf7ak8mKMT3L3LdFgH6f+6NOTUZW4fO7k2ojX50EK+txdRxo0jcKoaX
         7LxqjqdEQlWNG4ySyK9KvJQzccEahlnZIatjVTDfpxexiiqXlDeQhGBP6A4+laKVBem4
         kTmfnvhnZxbE6J52XAq3eSBLrWD7mdsu/RVjMbfB+HzXXtkiuilQcGJceShPp1W/HA9h
         LKdhktAgk8Kb74gOWFREKikqNtgIeu/Hu/J5sHEd20/9M2YIPcPa1JVBFLVUUC4cGmSk
         +aP8Ju3WqsUXP1Po2j9D+RaF7an8QFYSx2TlQdnpkEybXgzeL6hQIM0cBfhv+J6kMBkv
         d/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728086; x=1790332886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOJ74v/vCGAVFOz41fLecfvlvMNA2bb5S4xdvE9EXk0=;
        b=E/XmwfT+JpQlN7fflgQksHDmCV4P6jp8KmM9BbWwfBaUMrhTwNiuSgf0iaIMw5WTE0
         rTD7cFOlFpqSoeu8LMY0EoYC5rCUBNCMeMJU1c/ukjNs+gzu7bDFmJ0MXNMcX77Y8uKz
         3rQWqBy3Ef2YkigMXfnaoCgOUmRK37SF8Nx4GcXOFtMRdozgbv6bfiugjJvx6AtjArBi
         ByZq2QKNvBdNFguFC8dlQLHPRDKD56vLIexbF4PSqbKIoSM/6C2jALJOYBANtEDnSo0E
         peFNOD7Hz0H8c+qi2xr7IKzXd66T2D/EZJYDJtL+WWdvK4jvtoqrAYsxbVe6MT+CRUek
         TSOQ==
X-Gm-Message-State: AFuF++kuk1Dk0PJCVLc0qinF2cPWkqG9NE0ZYVfBPlsxqOcc0Uz8wsv3
	QEnpMDMmjw/CjExiBvcUPoTvF29ML9dX1fyDR1yJyCxZ2oxQUlIhc2fMXyzgfA==
X-Gm-Gg: AYBFou2WrCrikze8V891P5mhNS6ql7m74bHNkyobXH7+zrrDiv45GhAD2ZQ6WX+KcXw
	2F9jSBIY6mJcbT54jAIgYbqW/yJ7RaM88eHI+nHMejqeEdYI8ZtncIIB8HrnRtBXdcrVQHnqM35
	23mO10UdAu+XWgBfIKk4798m/7aCkK/RAUWmDcGpjjedW9HHl3eekSGc3yY9ZnuDjA0NjR5I+8J
	SC5X8ehB7xvDIAxS/LcAXHOkBUli7rgdS59yp395lR1EJotoX+hJiouFV/6PEdCwqvHvdAVp223
	ctK3ClgcxizA7oVrxMmKoXDe3hzenDPzKqrDhsdVYvbMRdpn996G0eyMVjpDFXG9nEex2FApO/D
	Sd15DqBiBBvL9VW/rM/hWpNHBaGiEz5S4dU2Hhz1LTJWGSUJ0HkRcr4DWawaKgK6MEdiZdPuJO1
	RDR0fhoGXk2Rvlw45bpwZ9Veu582MUlImxUQgJbQx4A0lNE7ZFBWQBHnHDIwf6O2GNa9SBusTg
X-Received: by 2002:a05:600c:4e14:b0:49f:bd3c:bc19 with SMTP id 5b1f17b1804b1-49fc572eff5mr25642445e9.20.1789728086014;
        Fri, 18 Sep 2026 03:41:26 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	anthony.perard@vates.tech,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v2.1 5/5] tools: expose admission control toggle via xl sched-rtds
Date: Fri, 18 Sep 2026 13:41:06 +0300
Message-Id: <20260918104106.53530-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918080935.35498-6-frn1furkan10@gmail.com>
References: <20260918080935.35498-6-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789728086-73ABF2A1-EA48E5A1/0/0
X-purgate-type: clean
X-purgate-size: 16574

Wire the per-cpupool admission-control switch through libxl
to xl sched-rtds, and document it.

Add -s/--schedparam to list or set pool-wide RTDS scheduler
parameters, and -a/--admission to enable or disable admission
control for a cpupool ("-c pool -s -a 0/1").

Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
v2.1:
 - Add LIBXL_HAVE_SCHED_RTDS_PARAMS macro.
 - Fully initialize scparam via compound literal instead of
   get-then-modify.
---
 docs/man/xl.1.pod.in                 |  20 ++++++
 tools/golang/xenlight/helpers.gen.go |  23 ++++++
 tools/golang/xenlight/types.gen.go   |   4 ++
 tools/include/libxl.h                |  12 ++++
 tools/include/xenctrl.h              |   6 ++
 tools/libs/ctrl/xc_rt.c              |  40 +++++++++++
 tools/libs/light/libxl_sched.c       |  46 ++++++++++++
 tools/libs/light/libxl_types.idl     |   5 ++
 tools/xl/xl_cmdtable.c               |   8 ++-
 tools/xl/xl_sched.c                  | 100 +++++++++++++++++++++++++--
 10 files changed, 259 insertions(+), 5 deletions(-)

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
index 7c098edab6..617ce973b2 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -229,6 +229,14 @@
  */
 #define LIBXL_HAVE_SCHED_RTDS 1
 
+/*
+ * LIBXL_HAVE_SCHED_RTDS_PARAMS indicates that libxl has the
+ * libxl_sched_rtds_params type, along with library functions
+ * libxl_sched_rtds_params_get/set to get and set pool-wide RTDS
+ * scheduler parameters for a given cpupool.
+ */
+#define LIBXL_HAVE_SCHED_RTDS_PARAMS 1
+
 /*
  * LIBXL_HAVE_SCHED_NULL indicates that the 'null' static scheduler
  * is available.
@@ -2797,6 +2805,10 @@ int libxl_sched_credit2_params_get(libxl_ctx *ctx, uint32_t poolid,
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
index 73cd7040cd..4477f71e67 100644
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
@@ -831,6 +883,46 @@ int main_sched_rtds(int argc, char **argv)
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
+            scparam = (libxl_sched_rtds_params){
+                .admission_control_enabled = admission_control,
+            };
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


