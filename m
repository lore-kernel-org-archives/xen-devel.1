Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF6F10F9964
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2026 17:24:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276425.1561905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWdA-0005hj-DW; Wed, 08 Apr 2026 17:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276425.1561905; Wed, 08 Apr 2026 17:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWdA-0005hc-9j; Wed, 08 Apr 2026 17:23:56 +0000
Received: by outflank-mailman (input) for mailman id 1276425;
 Wed, 08 Apr 2026 17:23:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d68f28.v1-c0022b9fc07d4103bf9af3bb4037bf57@bounce.vates.tech>)
 id 1wAWd8-0005gI-Mc
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:23:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAWd8-005z9Y-1O
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 19:23:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d68f28.v1-c0022b9fc07d4103bf9af3bb4037bf57@bounce.vates.tech>)
 id 69d68f15-e002-0a2a0a5209dd-0a2a4507ddfe-26
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:23:54 +0200
Received: from [198.2.178.25] (helo=mail178-25.suw51.mandrillapp.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d68f28.v1-c0022b9fc07d4103bf9af3bb4037bf57@bounce.vates.tech>)
 id 69d68f28-ba2d-0a2a45070019-c602b219cc9a-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:23:53 +0200
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-25.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4frVKN4P3rz4f3wgP
 for <xen-devel@lists.xenproject.org>; Wed,  8 Apr 2026 17:23:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c0022b9fc07d4103bf9af3bb4037bf57; Wed, 08 Apr 2026 17:23:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="thierry.escande@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775669032; x=1775939032;
	bh=7/8Qd+P7SPVDgY0eBLO5nKimQuCthoxn0Jd92VJL7wU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jZazIJ0jtqK0cqYE93+/V8XeLf8Yjrc5neEFcG92fAIu8nH8ixZBnxhOpquNEYBx4
	 TQuEwPv9OIRSe2KRYM1bshjh9bkhVymd9MimGM2Nb8CgzHKCy0Q30hJ9TwP0qAqPPS
	 5tmEvbcIGjYzB5nOrss/SBrI/m9MY1Hhi092Tdl+Xrx0SpnkuylvvwdBK8aYCG/UHb
	 BZYdrwXLHhBd3nozJ+kKVV4oZse2vIovxbdlhbFaE4Bayk8rLmO/1ufffG+qt9qFQb
	 qZo+1/KGWp3124sgN76Ja+aftxu5hJIc045swJs/c/4otr5aOMjNk0pQanLhOMPV+w
	 qP3JlWNKH0Awg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775669032; x=1775929532; i=thierry.escande@vates.tech;
	bh=7/8Qd+P7SPVDgY0eBLO5nKimQuCthoxn0Jd92VJL7wU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E3itFUbe/nZOklJZtVcEesSu0M7DPkwzIAzJmgtTf2Nd3p9lMXWJSGOtPLZ9sWAqk
	 b4ZUumkX/jypTAv1JETOqF6U7q3o6ZAqLxBQkItJfmjbaG0WbMLZ/9fukQm85voWGW
	 ub6r6dAstkniBpjxcstjr1kezyCwBhilaBf55RsjFF9N11EVHsDf0DN/wk9zwc5WNr
	 /P6lW0N2SsAo6tnkaKkXYUy3EkLKVEXEq3YG3rD6YulGlB7gaE4N53PpzEhv9F1Wbt
	 uH/7CyuMVWoMpL2yj1uIk0PdsZoRJF5XOed7+MkwdAMu+vqS76MAYGXrTWTnlniTB+
	 pacSjYaac9v3w==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=202/3]=20libxl:=20Allow=20PCI=20device=20passthrough=20using=20-device=20Qemu=20command=20line?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775669030410
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260408172320.539750-3-thierry.escande@vates.tech>
In-Reply-To: <20260408172320.539750-1-thierry.escande@vates.tech>
References: <20260408172320.539750-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c0022b9fc07d4103bf9af3bb4037bf57?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260408:md
Date: Wed, 08 Apr 2026 17:23:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775669034-83D4741E-F54737BC/0/0
X-purgate-type: clean
X-purgate-size: 7318

This change makes use of the new option 'hotplug' for host PCI devices
passthrough'd to the guest. If hotplug=0 is used in the pci device
configuration table, the device will be attached to the guest using the
Qemu command line as '-device xen-pci-passthrough,hostaddr=...'

The host device configuration is passed to the -device option as a json
array, just like it's done for hotplug using QMP. The json array is
created by a new internal function libxl__device_pci_get_qmp_json() that
is also used by pci_add_qmp_device_add().

Then, instead of sending the 'device_add' command, the device_add
callback is called to perform the 'query-pci' check to make sure the
passthrough'd device is present.

In the same way at shutdown, the device is not removed using QMP and
only the pci_remove_done() function is called.

As with QMP, the use of the 'hotplug=0' option honors the 'seize' option
by adding the PCI device to the assignable list if needed.

Example use:
 pci = [ "00:03.0,seize=1,hotplug=0" ]

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/include/libxl.h             |  1 +
 tools/libs/light/libxl_dm.c       | 31 +++++++++++++++++++++++
 tools/libs/light/libxl_internal.h |  2 ++
 tools/libs/light/libxl_pci.c      | 41 +++++++++++++++++++++++--------
 4 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7c098edab6..66fb07ad67 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -2666,6 +2666,7 @@ int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int r
 int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
 void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
+bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci);
 
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str);
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..96bb620f87 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1169,6 +1169,37 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                     }
                 }
             }
+
+            if (guest_config->num_pcidevs) {
+                libxl_device_pci *pci;
+                libxl__json_object *qmp_json;
+                const char *json_str;
+#ifndef HAVE_LIBJSONC
+#   error Missing JSON library
+#endif
+                json_object *jso = NULL;
+
+                for (i = 0; i < guest_config->num_pcidevs; i++) {
+                    libxl_ctx *ctx = libxl__gc_owner(gc);
+                    pci = &guest_config->pcidevs[i];
+
+                    if (pci->hotplug)
+                        continue;
+
+                    if (!libxl_pci_assignable(ctx, pci) && pci->seize) {
+                        rc = libxl_device_pci_assignable_add(ctx, pci, 1);
+                        if (rc)
+                            return rc;
+                    }
+                    qmp_json = libxl__device_pci_get_qmp_json(gc, pci);
+                    rc = libxl__json_object_to_json_object(gc, &jso, qmp_json);
+                    if (rc)
+                        return rc;
+                    json_str = json_object_to_json_string_ext(jso,
+                                                              JSON_C_TO_STRING_PLAIN);
+                    flexarray_vappend(dm_args, "-device", json_str, NULL);
+                }
+            }
         }
 
         if (libxl_defbool_val(b_info->u.hvm.nographic) && (!sdl && !vnc)) {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..06b5a14409 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1729,6 +1729,8 @@ _hidden int libxl__device_pci_setdefault(libxl__gc *gc, uint32_t domid,
                                          libxl_device_pci *pci, bool hotplug);
 _hidden bool libxl__is_igd_vga_passthru(libxl__gc *gc,
                                         const libxl_domain_config *d_config);
+_hidden libxl__json_object *libxl__device_pci_get_qmp_json(libxl__gc *gc,
+                                                         libxl_device_pci *pci);
 
 /* from libxl_dtdev */
 
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 49d272d0de..3ef2c43412 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1098,16 +1098,10 @@ out:
     pci_add_dm_done(egc, pas, rc); /* must be last */
 }
 
-static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
+libxl__json_object *libxl__device_pci_get_qmp_json(libxl__gc *gc,
+                                                   libxl_device_pci *pci)
 {
-    STATE_AO_GC(pas->aodev->ao);
     libxl__json_object *args = NULL;
-    int rc;
-
-    /* Convenience aliases */
-    libxl_domid domid = pas->domid;
-    libxl_device_pci *pci = &pas->pci;
-    libxl__ev_qmp *const qmp = &pas->qmp;
 
     libxl__qmp_param_add_string(gc, &args, "driver",
                                 "xen-pci-passthrough");
@@ -1134,11 +1128,30 @@ static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
     if (pci->permissive)
         libxl__qmp_param_add_bool(gc, &args, "permissive", true);
 
+    return args;
+}
+
+static void pci_add_qmp_device_add(libxl__egc *egc, pci_add_state *pas)
+{
+    STATE_AO_GC(pas->aodev->ao);
+    libxl__json_object *args = NULL;
+    int rc = 0;
+
+    /* Convenience aliases */
+    libxl_domid domid = pas->domid;
+    libxl_device_pci *pci = &pas->pci;
+    libxl__ev_qmp *const qmp = &pas->qmp;
+
+    args = libxl__device_pci_get_qmp_json(gc, pci);
+
     qmp->ao = pas->aodev->ao;
     qmp->domid = domid;
     qmp->payload_fd = -1;
     qmp->callback = pci_add_qmp_device_add_cb;
-    rc = libxl__ev_qmp_send(egc, qmp, "device_add", args);
+    if (pci->hotplug)
+        rc = libxl__ev_qmp_send(egc, qmp, "device_add", args);
+    else
+        pci_add_qmp_device_add_cb(egc, qmp, NULL, 0);
     if (rc) goto out;
     return;
 
@@ -1509,7 +1522,7 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
-static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
+bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
 {
     libxl_device_pci *pcis;
     int num;
@@ -1820,6 +1833,14 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
     libxl_domain_type type = libxl__domain_type(gc, domid);
     libxl_device_pci *pci = &prs->pci;
     int rc, num;
+
+    /* Passthrough'd device has been passed to Qemu command line so there is
+     * no need to remove it via QMP */
+    if (!pci->hotplug) {
+        pci_remove_done(egc, prs, 0);
+        return;
+    }
+
     pcis = libxl_device_pci_list(ctx, domid, &num);
     if (!pcis) {
         rc = ERROR_FAIL;
-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


