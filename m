Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64947CC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 00:52:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449603.1665292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9i3-0001W9-0o; Thu, 15 Oct 2026 00:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449603.1665292; Thu, 15 Oct 2026 00:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH9i2-0001Vz-Ra; Thu, 15 Oct 2026 00:52:38 +0000
Received: by outflank-mailman (input) for mailman id 1449603;
 Thu, 15 Oct 2026 00:52:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xH9i0-0001Np-Uv
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 00:52:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH9i0-000UBc-C2
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 02:52:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad0237f-2eae-0a2a0a5409dd-0a2a45019930-48
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:36 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad023d2-5984-0a2a45010019-4a68bc04381d-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:52:36 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69F0qR49092077
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 14 Oct 2026 20:52:33 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69F0qRkH092076;
 Wed, 14 Oct 2026 17:52:27 -0700 (PDT) (envelope-from ehem)
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
Message-ID: <52487ef2d0f13d5d1e92d6fcfd8ec0f057bd1e90.1792017109.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792017109.git.ehem+xen@m5p.com>
References: <cover.1792017109.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Date: Wed, 14 Oct 2026 15:31:49 -0700
Subject: [PATCH 1/5] tools/libxl: Mark pointer args of many functions constant
X-purgate-ID: tlsNG-d62444/1792025556-C5540757-8CA1C62D/0/0
X-purgate-type: clean
X-purgate-size: 18820

Date: Fri, 18 Dec 2020 13:37:44 -0800

Anything *_is_empty(), *_is_default(), or *_gen_json() is going to be
examining the pointed to thing, not modifying it.  This potentially
results in higher-performance output.  This also allows spreading
constants further, allowing more checking and security.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/include/libxl_json.h        | 38 ++++++++++++++++---------------
 tools/libs/light/gentypes.py      | 12 +++++-----
 tools/libs/light/libxl_cpuid.c    |  7 +++---
 tools/libs/light/libxl_internal.c |  4 ++--
 tools/libs/light/libxl_internal.h | 18 +++++++--------
 tools/libs/light/libxl_json.c     | 33 ++++++++++++++-------------
 tools/libs/light/libxl_nocpuid.c  |  4 ++--
 7 files changed, 60 insertions(+), 56 deletions(-)

diff --git a/tools/include/libxl_json.h b/tools/include/libxl_json.h
index c130e88a5e..3b03fdc04a 100644
--- a/tools/include/libxl_json.h
+++ b/tools/include/libxl_json.h
@@ -33,29 +33,31 @@
 #define _hidden
 #endif
 _hidden int libxl__uint64_gen_jso(json_object **jso_r, uint64_t val);
-_hidden int libxl_defbool_gen_jso(json_object **jso_r, libxl_defbool *p);
-_hidden int libxl_uuid_gen_jso(json_object **jso_r, libxl_uuid *p);
-_hidden int libxl_mac_gen_jso(json_object **jso_r, libxl_mac *p);
-_hidden int libxl_bitmap_gen_jso(json_object **jso_r, libxl_bitmap *p);
-_hidden int libxl_cpuid_policy_list_gen_jso(json_object **jso_r,libxl_cpuid_policy_list *p);
-_hidden int libxl_string_list_gen_jso(json_object **jso_r,libxl_string_list *p);
-_hidden int libxl_key_value_list_gen_jso(json_object **jso_r, libxl_key_value_list *p);
-_hidden int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p);
-_hidden int libxl_ms_vm_genid_gen_jso(json_object **jso_r, libxl_ms_vm_genid *p);
+_hidden int libxl_defbool_gen_jso(json_object **jso_r, const libxl_defbool *p);
+_hidden int libxl_uuid_gen_jso(json_object **jso_r, const libxl_uuid *p);
+_hidden int libxl_mac_gen_jso(json_object **jso_r, const libxl_mac *p);
+_hidden int libxl_bitmap_gen_jso(json_object **jso_r, const libxl_bitmap *p);
+_hidden int libxl_cpuid_policy_list_gen_jso(json_object **jso_r, const libxl_cpuid_policy_list *p);
+_hidden int libxl_string_list_gen_jso(json_object **jso_r, const libxl_string_list *p);
+_hidden int libxl_key_value_list_gen_jso(json_object **jso_r, const libxl_key_value_list *p);
+_hidden int libxl_hwcap_gen_jso(json_object **jso_r, const libxl_hwcap *p);
+_hidden int libxl_ms_vm_genid_gen_jso(json_object **jso_r, const libxl_ms_vm_genid *p);
 #endif
 #if defined(HAVE_LIBYAJL)
 yajl_gen_status libxl__uint64_gen_json(yajl_gen hand, uint64_t val);
-yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, libxl_defbool *p);
-yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, libxl_uuid *p);
-yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *p);
-yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, libxl_bitmap *p);
+yajl_gen_status libxl_defbool_gen_json(yajl_gen hand, const libxl_defbool *p);
+yajl_gen_status libxl_uuid_gen_json(yajl_gen hand, const libxl_uuid *p);
+yajl_gen_status libxl_mac_gen_json(yajl_gen hand, const libxl_mac *p);
+yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand, const libxl_bitmap *p);
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                                 libxl_cpuid_policy_list *p);
-yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *p);
+                                                 const libxl_cpuid_policy_list *p);
+yajl_gen_status libxl_string_list_gen_json(yajl_gen hand,
+                                           const libxl_string_list *p);
 yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
-                                              libxl_key_value_list *p);
-yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, libxl_hwcap *p);
-yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p);
+                                              const libxl_key_value_list *p);
+yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand, const libxl_hwcap *p);
+yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
+                                           const libxl_ms_vm_genid *p);
 #endif
 
 #include <_libxl_types_json.h>
diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
index 47bca4bc57..7defc47554 100644
--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -763,7 +763,7 @@ if __name__ == '__main__':
                                                ty.make_arg("p"),
                                                ku.keyvar.type.make_arg(ku.keyvar.name)))
         if ty.json_gen_fn is not None:
-            f.write("%schar *%s_to_json(libxl_ctx *ctx, %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p")))
+            f.write("%schar *%s_to_json(libxl_ctx *ctx, const %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p")))
         if ty.json_parse_fn is not None:
             f.write("%sint %s_from_json(libxl_ctx *ctx, %s, const char *s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
         if isinstance(ty, idl.Enumeration):
@@ -795,9 +795,9 @@ if __name__ == '__main__':
     for ty in [ty for ty in types if ty.json_gen_fn is not None]:
         if opt_libjsonc:
             # Always hide JSON generators base on json-c
-            f.write("%sint %s_gen_jso(json_object **jso_r, %s);\n" % ("_hidden ", ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+            f.write("%sint %s_gen_jso(json_object **jso_r, const %s);\n" % ("_hidden ", ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
         else:
-            f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+            f.write("%syajl_gen_status %s_gen_json(yajl_gen hand, const %s);\n" % (ty.hidden(), ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
 
     f.write("\n")
     f.write("""#endif /* %s */\n""" % header_json_define)
@@ -902,19 +902,19 @@ if __name__ == '__main__':
 
     for ty in [t for t in types if t.json_gen_fn is not None]:
         if opt_libjsonc:
-            f.write("int %s_gen_jso(json_object **jso_r, %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+            f.write("int %s_gen_jso(json_object **jso_r, const %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
             f.write("{\n")
             f.write(libxl_C_type_gen_jso(ty, "p"))
             f.write("}\n")
             f.write("\n")
         else:
-            f.write("yajl_gen_status %s_gen_json(yajl_gen hand, %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
+            f.write("yajl_gen_status %s_gen_json(yajl_gen hand, const %s)\n" % (ty.typename, ty.make_arg("p", passby=idl.PASS_BY_REFERENCE)))
             f.write("{\n")
             f.write(libxl_C_type_gen_json(ty, "p"))
             f.write("}\n")
             f.write("\n")
 
-        f.write("char *%s_to_json(libxl_ctx *ctx, %s)\n" % (ty.typename, ty.make_arg("p")))
+        f.write("char *%s_to_json(libxl_ctx *ctx, const %s)\n" % (ty.typename, ty.make_arg("p")))
         f.write("{\n")
         if opt_libjsonc:
             f.write(libxl_C_type_to_json(ty, "p", fn_ptr_type="libxl__gen_json_callback", fn_suffix="_gen_jso"))
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 14f08df33a..40a188bfb1 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -16,7 +16,7 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
-int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
+int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl)
 {
     return !*pl || (!libxl_cpuid_policy_list_length(pl) && !(*pl)->msr);
 }
@@ -549,7 +549,7 @@ static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
  */
 
 #ifdef HAVE_LIBJSONC
-int libxl_cpuid_policy_list_gen_jso(json_object **jso_r, libxl_cpuid_policy_list *pl)
+int libxl_cpuid_policy_list_gen_jso(json_object **jso_r, const libxl_cpuid_policy_list *pl)
 {
     libxl_cpuid_policy_list policy = *pl;
     struct xc_xend_cpuid *cpuid;
@@ -667,7 +667,7 @@ out:
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pl)
+                                const libxl_cpuid_policy_list *pl)
 {
     libxl_cpuid_policy_list policy = *pl;
     struct xc_xend_cpuid *cpuid;
diff --git a/tools/libs/light/libxl_internal.c b/tools/libs/light/libxl_internal.c
index d70cfed7d8..cd99d249bf 100644
--- a/tools/libs/light/libxl_internal.c
+++ b/tools/libs/light/libxl_internal.c
@@ -333,7 +333,7 @@ _hidden int libxl__parse_mac(const char *s, libxl_mac mac)
     return 0;
 }
 
-_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b)
+_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b)
 {
     int i;
 
@@ -345,7 +345,7 @@ _hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b)
     return 0;
 }
 
-_hidden int libxl__mac_is_default(libxl_mac *mac)
+_hidden int libxl__mac_is_default(const libxl_mac *mac)
 {
     return (!(*mac)[0] && !(*mac)[1] && !(*mac)[2] &&
             !(*mac)[3] && !(*mac)[4] && !(*mac)[5]);
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..a070112836 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2021,9 +2021,9 @@ struct libxl__xen_console_reader {
 /* parse the string @s as a sequence of 6 colon separated bytes in to @mac */
 _hidden int libxl__parse_mac(const char *s, libxl_mac mac);
 /* compare mac address @a and @b. 0 if the same, -ve if a<b and +ve if a>b */
-_hidden int libxl__compare_macs(libxl_mac *a, libxl_mac *b);
+_hidden int libxl__compare_macs(const libxl_mac *a, const libxl_mac *b);
 /* return true if mac address is all zero (the default value) */
-_hidden int libxl__mac_is_default(libxl_mac *mac);
+_hidden int libxl__mac_is_default(const libxl_mac *mac);
 /* init a recursive mutex */
 _hidden int libxl__init_recursive_mutex(libxl_ctx *ctx, pthread_mutex_t *lock);
 
@@ -4543,7 +4543,7 @@ _hidden int libxl__ms_vm_genid_set(libxl__gc *gc, uint32_t domid,
 #define LIBXL__DEFBOOL_STR_DEFAULT "<default>"
 #define LIBXL__DEFBOOL_STR_FALSE   "False"
 #define LIBXL__DEFBOOL_STR_TRUE    "True"
-static inline int libxl__defbool_is_default(libxl_defbool *db)
+static inline int libxl__defbool_is_default(const libxl_defbool *db)
 {
     return !db->val;
 }
@@ -4638,22 +4638,22 @@ int libxl__random_bytes(libxl__gc *gc, uint8_t *buf, size_t len);
 #include "_libxl_types_internal_private.h"
 
 /* This always return false, there's no "default value" for hw cap */
-static inline int libxl__hwcap_is_default(libxl_hwcap *hwcap)
+static inline int libxl__hwcap_is_default(const libxl_hwcap *hwcap)
 {
     return 0;
 }
 
-static inline int libxl__string_list_is_empty(libxl_string_list *psl)
+static inline int libxl__string_list_is_empty(const libxl_string_list *psl)
 {
     return !libxl_string_list_length(psl);
 }
 
-static inline int libxl__key_value_list_is_empty(libxl_key_value_list *pkvl)
+static inline int libxl__key_value_list_is_empty(const libxl_key_value_list *pkvl)
 {
     return !libxl_key_value_list_length(pkvl);
 }
 
-int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl);
+int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl);
 
 /* Portability note: a proper flock(2) implementation is required */
 typedef struct {
@@ -4787,12 +4787,12 @@ void* libxl__device_list(libxl__gc *gc, const libxl__device_type *dt,
 void libxl__device_list_free(const libxl__device_type *dt,
                              void *list, int num);
 
-static inline bool libxl__timer_mode_is_default(libxl_timer_mode *tm)
+static inline bool libxl__timer_mode_is_default(const libxl_timer_mode *tm)
 {
     return *tm == LIBXL_TIMER_MODE_DEFAULT;
 }
 
-static inline bool libxl__string_is_default(char **s)
+static inline bool libxl__string_is_default(char *const *s)
 {
     return *s == NULL;
 }
diff --git a/tools/libs/light/libxl_json.c b/tools/libs/light/libxl_json.c
index 68f36901c2..38c27a9f4b 100644
--- a/tools/libs/light/libxl_json.c
+++ b/tools/libs/light/libxl_json.c
@@ -139,7 +139,7 @@ yajl_gen_status libxl__yajl_gen_enum(yajl_gen hand, const char *str)
  * YAJL generators for builtin libxl types.
  */
 #ifdef HAVE_LIBJSONC
-int libxl_defbool_gen_jso(json_object **jso_r, libxl_defbool *db)
+int libxl_defbool_gen_jso(json_object **jso_r, const libxl_defbool *db)
 {
     *jso_r = json_object_new_string(libxl_defbool_to_string(*db));
     if (!*jso_r)
@@ -150,7 +150,7 @@ int libxl_defbool_gen_jso(json_object **jso_r, libxl_defbool *db)
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_defbool_gen_json(yajl_gen hand,
-                                       libxl_defbool *db)
+                                       const libxl_defbool *db)
 {
     return libxl__yajl_gen_asciiz(hand, libxl_defbool_to_string(*db));
 }
@@ -203,7 +203,7 @@ int libxl__bool_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_uuid_gen_jso(json_object **jso_r, libxl_uuid *uuid)
+int libxl_uuid_gen_jso(json_object **jso_r, const libxl_uuid *uuid)
 {
     char buf[LIBXL_UUID_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_UUID_FMT, LIBXL_UUID_BYTES((*uuid)));
@@ -216,7 +216,7 @@ int libxl_uuid_gen_jso(json_object **jso_r, libxl_uuid *uuid)
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_uuid_gen_json(yajl_gen hand,
-                                    libxl_uuid *uuid)
+                                    const libxl_uuid *uuid)
 {
     char buf[LIBXL_UUID_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_UUID_FMT, LIBXL_UUID_BYTES((*uuid)));
@@ -234,7 +234,7 @@ int libxl__uuid_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_bitmap_gen_jso(json_object **jso_r, libxl_bitmap *bitmap)
+int libxl_bitmap_gen_jso(json_object **jso_r, const libxl_bitmap *bitmap)
 {
     json_object *jso;
     int i;
@@ -267,7 +267,7 @@ out:
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_bitmap_gen_json(yajl_gen hand,
-                                      libxl_bitmap *bitmap)
+                                      const libxl_bitmap *bitmap)
 {
     yajl_gen_status s;
     int i;
@@ -322,7 +322,7 @@ int libxl__bitmap_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_key_value_list_gen_jso(json_object **jso_r, libxl_key_value_list *pkvl)
+int libxl_key_value_list_gen_jso(json_object **jso_r, const libxl_key_value_list *pkvl)
 {
     libxl_key_value_list kvl = *pkvl;
     json_object *jso;
@@ -358,7 +358,7 @@ out:
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_key_value_list_gen_json(yajl_gen hand,
-                                              libxl_key_value_list *pkvl)
+                                              const libxl_key_value_list *pkvl)
 {
     libxl_key_value_list kvl = *pkvl;
     yajl_gen_status s;
@@ -421,7 +421,7 @@ int libxl__key_value_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_string_list_gen_jso(json_object **jso_r, libxl_string_list *pl)
+int libxl_string_list_gen_jso(json_object **jso_r, const libxl_string_list *pl)
 {
     libxl_string_list l = *pl;
     json_object *jso;
@@ -453,7 +453,7 @@ out:
 #endif
 
 #ifdef HAVE_LIBYAJL
-yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, libxl_string_list *pl)
+yajl_gen_status libxl_string_list_gen_json(yajl_gen hand, const libxl_string_list *pl)
 {
     libxl_string_list l = *pl;
     yajl_gen_status s;
@@ -508,7 +508,7 @@ int libxl__string_list_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_mac_gen_jso(json_object **jso_r, libxl_mac *mac)
+int libxl_mac_gen_jso(json_object **jso_r, const libxl_mac *mac)
 {
     char buf[LIBXL_MAC_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_MAC_FMT, LIBXL_MAC_BYTES((*mac)));
@@ -520,7 +520,7 @@ int libxl_mac_gen_jso(json_object **jso_r, libxl_mac *mac)
 #endif
 
 #ifdef HAVE_LIBYAJL
-yajl_gen_status libxl_mac_gen_json(yajl_gen hand, libxl_mac *mac)
+yajl_gen_status libxl_mac_gen_json(yajl_gen hand, const libxl_mac *mac)
 {
     char buf[LIBXL_MAC_FMTLEN+1];
     snprintf(buf, sizeof(buf), LIBXL_MAC_FMT, LIBXL_MAC_BYTES((*mac)));
@@ -538,7 +538,7 @@ int libxl__mac_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_hwcap_gen_jso(json_object **jso_r, libxl_hwcap *p)
+int libxl_hwcap_gen_jso(json_object **jso_r, const libxl_hwcap *p)
 {
     json_object *jso;
     int i;
@@ -568,7 +568,7 @@ out:
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_hwcap_gen_json(yajl_gen hand,
-                                     libxl_hwcap *p)
+                                     const libxl_hwcap *p)
 {
     yajl_gen_status s;
     int i;
@@ -608,7 +608,7 @@ int libxl__hwcap_parse_json(libxl__gc *gc, const libxl__json_object *o,
 }
 
 #ifdef HAVE_LIBJSONC
-int libxl_ms_vm_genid_gen_jso(json_object **jso_r, libxl_ms_vm_genid *p)
+int libxl_ms_vm_genid_gen_jso(json_object **jso_r, const libxl_ms_vm_genid *p)
 {
     json_object *jso;
     int i;
@@ -638,7 +638,8 @@ out:
 #endif
 
 #ifdef HAVE_LIBYAJL
-yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand, libxl_ms_vm_genid *p)
+yajl_gen_status libxl_ms_vm_genid_gen_json(yajl_gen hand,
+                                           const libxl_ms_vm_genid *p)
 {
     yajl_gen_status s;
     int i;
diff --git a/tools/libs/light/libxl_nocpuid.c b/tools/libs/light/libxl_nocpuid.c
index ce334633b3..35c465b329 100644
--- a/tools/libs/light/libxl_nocpuid.c
+++ b/tools/libs/light/libxl_nocpuid.c
@@ -14,7 +14,7 @@
 
 #include "libxl_internal.h"
 
-int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
+int libxl__cpuid_policy_is_empty(const libxl_cpuid_policy_list *pl)
 {
     return 1;
 }
@@ -50,7 +50,7 @@ int libxl_cpuid_policy_list_gen_jso(json_object **jso_r, libxl_cpuid_policy_list
 
 #ifdef HAVE_LIBYAJL
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pcpuid)
+                                const libxl_cpuid_policy_list *pcpuid)
 {
     return 0;
 }
-- 
2.47.3


