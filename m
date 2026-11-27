Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD26606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=gW9oV/g7
Received: from list by lists.xenproject.org with outflank-mailman.1505223.1700086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxKr-00083R-8J; Fri, 27 Nov 2026 14:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505223.1700086; Fri, 27 Nov 2026 14:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxKr-00083K-51; Fri, 27 Nov 2026 14:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1505223;
 Fri, 27 Nov 2026 14:54:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767@swg.vates.tech>)
 id 1xWxKp-000838-V3
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:54:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWxKp-00AOoi-3s
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:53:59 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767@swg.vates.tech>)
 id 6b099954-bab6-0a2a0a5309dd-0a2a450cdfc4-44
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:53:59 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767@swg.vates.tech>)
 id 6b099986-f479-0a2a450c0019-b9ff1c1288ad-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:53:59 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d7fa6080004767.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 14:53:54 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9B49C81C8A;
 Fri, 27 Nov 2026 15:53:53 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=khOH0VB3ZGxT4AGFehcy9Twtn4fUGkLF+393uKM2YrI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gW9oV/g7pLCCWJKxAOUnLMMgyLUO5e7to3GrPF450aCBBiu97ZxHtz0VLu3sHN9RpvW42WNAD
 AZC3oP0m61xfpt60muhSOtDY096E3xt94JXaSCacuybgP7SvDebxhi1moM6xYM15HcWt3jHY4iW
 rvejSHH6N/gwzeozzhjJPU8IoHOq3/cfKuvEkhDt9icedA1pg+gjCvePwInak5irXoKdjPYVJiV
 HzGnQZPCTKeewLx4mAxAtPMPJ79KpikzR+8rYVhQz3gr8SFyZbB9k3lEVmjyg6LgUFkGcxEq6HB
 39s4fnJC9z4KiMxJTc69n+urf7ySbXYufg98SL5D7NxA==
X-Zone-Loop: 6e238b51a18d591ee71137df6eba74ba8878452f2ee0
x-campaign-type: default
x-transaction-id: e93a30b3-2502-4117-879a-8e4ddd525ec6
x-swg-uid: 01-4b065643-fae2-453c-866a-d37992427140
X-Mailer: Sweego
Message-ID:
 <1795791234.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767@vates.tech>
x-swg-bid: 1795791234.8631fc262581453bbf619ec5b2062170.1a21d7fa6080004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 1/2] tools/ocaml: check physinfo and domain_getinfolist in the bindings test
Date: Fri, 27 Nov 2026 15:53:47 +0100
In-Reply-To: <1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@vates.tech>
References: <1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.20a.36adcee1332c5d4d.1a21d7fa3a4.b577f7ae694f9066=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795791233957
X-purgate-ID: tlsNG-d25034/1795791239-022C0A5B-DEC18D78/0/0
X-purgate-type: clean
X-purgate-size: 7253
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.20a.36adcee1332c5d4d.1a21d7fa3a4.b577f7ae694f9066=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Xenctrl C stubs build OCaml values by hand, and nothing checks that
the blocks they allocate match the types declared in xenctrl=2Emli=2E A
mismatch, e=2Eg=2E a record or variant argument with a different number of
fields, isn't caught at build time=2E

So, extend test-ocaml-bindings to also call physinfo() and
domain_getinfolist(), check the tag and size of each returned block
against the declared type, check the flag lists, and read every field=2E

This covers the Arm specific parts too, i=2Ee=2E arm_physinfo_caps and
xen_arm_arch_domainconfig, which were tested on arm64 under QEMU=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/ocaml/tests/bindings/main=2Eml | 126 ++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/tests/bindings/main=2Eml b/tools/ocaml/tests/bind=
ings/main=2Eml
index 785837e270=2E=2E02049d2f79 100644
--- a/tools/ocaml/tests/bindings/main=2Eml
+++ b/tools/ocaml/tests/bindings/main=2Eml
@@ -2,18 +2,142 @@ open Printf
=20
 let xch =3D Xenctrl=2Einterface_open ()
=20
+let nr_failures =3D ref 0
+
+let fail fmt =3D
+  ksprintf (fun s -> incr nr_failures; printf "  Fail: %s\n%!" s) fmt
+
+(* Check that [v] is a block with the given tag and number of fields=2E *=
)
+let check_block name v ~tag ~size =3D
+  let r =3D Obj=2Erepr v in
+  if Obj=2Eis_int r then
+    fail "%s: immediate value, expected a block" name
+  else if Obj=2Etag r <> tag || Obj=2Esize r <> size then
+    fail "%s: tag %d, size %d, expected tag %d, size %d"
+      name (Obj=2Etag r) (Obj=2Esize r) tag size
+
+let check_record name v ~size =3D check_block name v ~tag:0 ~size
+
+(* Check that [v] is one of the [nr] constant constructors of a variant=
=2E *)
+let check_enum name v ~nr =3D
+  let r =3D Obj=2Erepr v in
+  let ok =3D Obj=2Eis_int r && (Obj=2Eobj r : int) >=3D 0 && (Obj=2Eobj r=
 : int) < nr in
+  if not ok then
+    fail "%s: not one of the %d constructors" name nr;
+  ok
+
+(* XEN_DOMCTL_CONFIG_GIC_* *)
+let string_of_gic_version =3D function
+  | 1 -> "GICv2"
+  | 2 -> "GICv3"
+  | v -> fail "unknown gic_version %d" v; "unknown"
+
+let string_of_cap_flag =3D function
+  | Xenctrl=2ECAP_HVM -> "hvm"
+  | Xenctrl=2ECAP_PV -> "pv"
+  | Xenctrl=2ECAP_DirectIO -> "directio"
+  | Xenctrl=2ECAP_HAP -> "hap"
+  | Xenctrl=2ECAP_Shadow -> "shadow"
+  | Xenctrl=2ECAP_IOMMU_HAP_PT_SHARE -> "iommu_hap_pt_share"
+  | Xenctrl=2ECAP_Vmtrace -> "vmtrace"
+  | Xenctrl=2ECAP_Vpmu -> "vpmu"
+  | Xenctrl=2ECAP_Gnttab_v1 -> "gnttab-v1"
+  | Xenctrl=2ECAP_Gnttab_v2 -> "gnttab-v2"
+
 let test_xenversion () =3D
   let ver =3D Xenctrl=2Eversion xch in
+  check_record "version" ver ~size:3;
   printf "Xen version: %d=2E%d%s\n" ver=2Emajor ver=2Eminor ver=2Eextra
=20
+let test_physinfo () =3D
+  printf "Test physinfo\n";
+
+  let p =3D Xenctrl=2Ephysinfo xch in
+  check_record "physinfo" p ~size:11;
+  printf "  threads_per_core %d, cores_per_socket %d, nr_cpus %d\n"
+    p=2EXenctrl=2Ethreads_per_core p=2EXenctrl=2Ecores_per_socket p=2EXen=
ctrl=2Enr_cpus;
+  printf "  max_node_id %d, cpu_khz %d, max_nr_cpus %d\n"
+    p=2EXenctrl=2Emax_node_id p=2EXenctrl=2Ecpu_khz p=2EXenctrl=2Emax_nr_=
cpus;
+  printf "  total_pages %nd, free_pages %nd, scrub_pages %nd\n"
+    p=2EXenctrl=2Etotal_pages p=2EXenctrl=2Efree_pages p=2EXenctrl=2Escru=
b_pages;
+
+  (* Only match on the flags once they are known to be valid constructors=
=2E *)
+  if List=2Efor_all (fun f -> check_enum "physinfo cap flag" f ~nr:10)
+      p=2EXenctrl=2Ecapabilities then
+    printf "  capabilities: %s\n"
+      (String=2Econcat " " (List=2Emap string_of_cap_flag p=2EXenctrl=2Ec=
apabilities));
+
+  match p=2EXenctrl=2Earch_capabilities with
+  | Xenctrl=2EARM caps as a ->
+    check_block "arch_capabilities" a ~tag:0 ~size:1;
+    check_record "arm_physinfo_caps" caps ~size:1;
+    printf "  ARM: sve_vl %d\n" caps=2EXenctrl=2Esve_vl
+  | Xenctrl=2EX86 flags as a ->
+    check_block "arch_capabilities" a ~tag:1 ~size:1;
+    printf "  x86: %d arch capability flags\n" (List=2Elength flags)
+
+let test_domain_getinfolist () =3D
+  printf "Test domain_getinfolist\n";
+
+  let doms =3D Xenctrl=2Edomain_getinfolist xch 0 in
+  if doms =3D [] then fail "no domains, expected at least d0";
+
+  let check_dom (d : Xenctrl=2Edomaininfo) =3D
+    let name =3D sprintf "d%d" d=2EXenctrl=2Edomid in
+
+    check_record name d ~size:17;
+    if Array=2Elength d=2EXenctrl=2Ehandle <> 16 then
+      fail "%s: handle has %d bytes, expected 16"
+        name (Array=2Elength d=2EXenctrl=2Ehandle);
+
+    printf "  %s: dying %b, shutdown %b (code %d), paused %b, blocked %b,=
 running %b, hvm %b\n"
+      name d=2EXenctrl=2Edying d=2EXenctrl=2Eshutdown d=2EXenctrl=2Eshutd=
own_code
+      d=2EXenctrl=2Epaused d=2EXenctrl=2Eblocked d=2EXenctrl=2Erunning d=
=2EXenctrl=2Ehvm_guest;
+    printf "  %s: pages %nd/%nd, shared_info_frame %Ld, cpu_time %Ld\n"
+      name d=2EXenctrl=2Etotal_memory_pages d=2EXenctrl=2Emax_memory_page=
s
+      d=2EXenctrl=2Eshared_info_frame d=2EXenctrl=2Ecpu_time;
+    printf "  %s: vcpus %d (max id %d), ssidref %ld\n"
+      name d=2EXenctrl=2Enr_online_vcpus d=2EXenctrl=2Emax_vcpu_id d=2EXe=
nctrl=2Essidref;
+
+    match d=2EXenctrl=2Earch_config with
+    | Xenctrl=2EARM arm as a ->
+      check_block (name ^ " arch_config") a ~tag:0 ~size:1;
+      check_record (name ^ " xen_arm_arch_domainconfig") arm ~size:2;
+      printf "  %s: ARM %s, nr_spis %d\n" name
+        (string_of_gic_version arm=2EXenctrl=2Egic_version) arm=2EXenctrl=
=2Enr_spis
+    | Xenctrl=2EX86 x86 as a ->
+      check_block (name ^ " arch_config") a ~tag:1 ~size:1;
+      check_record (name ^ " xen_x86_arch_domainconfig") x86 ~size:2;
+      List=2Eiter (fun f -> ignore (check_enum (name ^ " emulation flag")=
 f ~nr:11))
+        x86=2EXenctrl=2Eemulation_flags;
+      List=2Eiter (fun f -> ignore (check_enum (name ^ " misc flag") f ~n=
r:1))
+        x86=2EXenctrl=2Emisc_flags;
+      printf "  %s: x86, %d emulation flags, %d misc flags\n" name
+        (List=2Elength x86=2EXenctrl=2Eemulation_flags)
+        (List=2Elength x86=2EXenctrl=2Emisc_flags)
+  in
+
+  List=2Eiter check_dom doms
+
+let run name f =3D
+  try f () with
+  | Xenctrl=2EError e -> fail "%s: Xenctrl=2EError %s" name e
+
=20
 let () =3D
   printf "Test Ocaml Bindings\n%!";
=20
-  test_xenversion ();
+  run "version" test_xenversion;
+  run "physinfo" test_physinfo;
+  run "domain_getinfolist" test_domain_getinfolist;
=20
   printf "Starting GC=2Ecompact()\n%!";
   Gc=2Ecompact ();
   printf "GC done\n";
=20
+  if !nr_failures > 0 then begin
+    printf "%d failures\n" !nr_failures;
+    exit 1
+  end;
+
   ()
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.20a.36adcee1332c5d4d.1a21d7fa3a4.b577f7ae694f9066=---

