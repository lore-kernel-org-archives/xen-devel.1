Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0128DCC6B30
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:57:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449726.1665354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9mD-0006bq-S1; Thu, 15 Oct 2026 00:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449726.1665354; Thu, 15 Oct 2026 00:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9mD-0006bj-PE; Thu, 15 Oct 2026 00:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1449726;
 Thu, 15 Oct 2026 00:56:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9mC-0006bZ-BI
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:56:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9mB-000f30-OX
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:56:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad024ba-2eae-0a2a0a5409dd-0a2a45069a8a-10
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:56:55 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023e6-195a-0a2a45060019-4a68bc049865-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:55 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qlqs092107
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:53 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qluB092106;
 Wed, 14 Oct 2026 17:52:47 -0700 (PDT) (envelope-from ehem)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <3e16e6a2e11afff7bf2f309bdb98ffaf5278cdd6.1792017109.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017109.git.ehem+xen@m5p.com>
References: <cover.1792017109.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Wed, 14 Oct 2026 15:31:49 -0700
Subject: [PATCH 4/5] tools/xl: Rename printf_info()/list_domains_details() to
 dump_by_...()
X-purgate-ID: tlsNG-16d1c6/1792025575-F7ECC77B-634584A7/13/0
X-purgate-type: clean
X-purgate-size: 6085

Date: Thu, 17 Dec 2020 17:42:42 -0800

printf_info()/list_domains_details() had been serving fairly similar
purposes.  Increase their consistency (add file-handle and output_format
arguments to list_domains_details(), reorder arguments) and then rename
to better reflect their functionality.

Both were simply outputting full domain information.  As this is more of
a dump operation, "dump" is a better name.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/xl/xl.h      | 11 ++++++++---
 tools/xl/xl_info.c | 29 +++++++++++++++++------------
 tools/xl/xl_misc.c |  2 +-
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index dcd77d1ec4..7fd33db800 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -308,13 +308,18 @@ typedef enum {
     DOMAIN_RESTART_SUSPENDED,    /* Domain suspended - keep looping */
 } domain_restart_type;
 
+extern void dump_by_config(enum output_format output_format,
+                           FILE *fh,
+                           const libxl_domain_config *d_config,
+                           int domid);
+extern void dump_by_dominfo_list(enum output_format output_format,
+                                 FILE *fh,
+                                 const libxl_dominfo info[],
+                                 int nb_domain);
 extern void printf_info_sexp(int domid, const libxl_domain_config *d_config, FILE *fh);
 extern void apply_global_affinity_masks(libxl_domain_type type,
                                         libxl_bitmap *vcpu_affinity_array,
                                         unsigned int size);
-void printf_info(enum output_format output_format,
-                 int domid,
-                 libxl_domain_config *d_config, FILE *fh);
 
 #define XL_GLOBAL_CONFIG XEN_CONFIG_DIR "/xl.conf"
 #define XL_LOCK_FILE XEN_LOCK_DIR "/xl"
diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 9540384beb..46bba4bb54 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -144,9 +144,10 @@ out:
 }
 #endif
 
-void printf_info(enum output_format output_format,
-                 int domid,
-                 libxl_domain_config *d_config, FILE *fh)
+void dump_by_config(enum output_format output_format,
+                    FILE *fh,
+                    const libxl_domain_config *const d_config,
+                    int domid)
 {
     if (output_format == OUTPUT_FORMAT_SXP)
         return printf_info_sexp(domid, d_config, fh);
@@ -540,7 +541,10 @@ static void list_domains(bool verbose, bool context, bool claim, bool numa,
     libxl_physinfo_dispose(&physinfo);
 }
 
-static void list_domains_details(const libxl_dominfo *info, int nb_domain)
+void dump_by_dominfo_list(enum output_format output_format,
+                          FILE *fh,
+                          const libxl_dominfo info[],
+                          int nb_domain)
 {
     libxl_domain_config d_config;
 
@@ -556,11 +560,11 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
 #endif
 
 #ifdef HAVE_LIBJSONC
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
         jso = json_object_new_array();
     }
 #elif defined(HAVE_LIBYAJL)
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
         hand = libxl_yajl_gen_alloc(NULL);
         if (!hand) {
             fprintf(stderr, "unable to allocate JSON generator\n");
@@ -580,7 +584,7 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
                                                  &d_config, NULL);
         if (rc)
             continue;
-        if (default_output_format == OUTPUT_FORMAT_JSON) {
+        if (output_format == OUTPUT_FORMAT_JSON) {
 #ifdef HAVE_LIBJSONC
             json_object *jso_value;
             rc = printf_info_one_json(&jso_value, info[i].domid, &d_config);
@@ -590,7 +594,7 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
             s = printf_info_one_json(hand, info[i].domid, &d_config);
 #endif
         } else
-            printf_info_sexp(info[i].domid, &d_config, stdout);
+            printf_info_sexp(info[i].domid, &d_config, fh);
         libxl_domain_config_dispose(&d_config);
 #ifdef HAVE_LIBJSONC
         if (rc)
@@ -601,7 +605,7 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
 #endif
     }
 
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
 #ifdef HAVE_LIBJSONC
         buf = json_object_to_json_string_ext(jso, JSON_C_TO_STRING_PRETTY);
         if (!buf)
@@ -616,11 +620,12 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
             goto out;
 #endif
 
-        puts(buf);
+        fputs(buf, fh);
+        fputc('\n', fh);
     }
 
 out:
-    if (default_output_format == OUTPUT_FORMAT_JSON) {
+    if (output_format == OUTPUT_FORMAT_JSON) {
 #ifdef HAVE_LIBJSONC
         json_object_put(jso);
 #elif defined(HAVE_LIBYAJL)
@@ -701,7 +706,7 @@ int main_list(int argc, char **argv)
     }
 
     if (details)
-        list_domains_details(info, nb_domain);
+        dump_by_dominfo_list(default_output_format, stdout, info, nb_domain);
     else
         list_domains(verbose, context, false /* claim */, numa, cpupool,
                      info, nb_domain);
diff --git a/tools/xl/xl_misc.c b/tools/xl/xl_misc.c
index f0167e1603..bcf178762b 100644
--- a/tools/xl/xl_misc.c
+++ b/tools/xl/xl_misc.c
@@ -341,7 +341,7 @@ int main_config_update(int argc, char **argv)
     parse_config_data(filename, config_data, config_len, &d_config);
 
     if (debug || dryrun_only)
-        printf_info(default_output_format, -1, &d_config, stdout);
+        dump_by_config(default_output_format, stdout, &d_config, -1);
 
     if (!dryrun_only) {
         fprintf(stderr, "setting dom%u configuration\n", domid);
-- 
2.47.3


