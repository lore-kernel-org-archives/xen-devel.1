Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1BB606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=FkzWXLC2
Received: from list by lists.xenproject.org with outflank-mailman.1505224.1700092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxKr-00085M-Fs; Fri, 27 Nov 2026 14:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505224.1700092; Fri, 27 Nov 2026 14:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxKr-00084h-BK; Fri, 27 Nov 2026 14:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1505224;
 Fri, 27 Nov 2026 14:54:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7fa7ee0004767@swg.vates.tech>)
 id 1xWxKp-000839-Vp
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:54:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWxKp-00BsDZ-58
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:53:59 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7fa7ee0004767@swg.vates.tech>)
 id 6b09997c-e002-0a2a0a5209dd-0a2a4509a970-28
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:53:59 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7fa7ee0004767@swg.vates.tech>)
 id 6b099986-be1a-0a2a45090019-b9ff1c23b281-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:53:59 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d7fa7ee0004767.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 14:53:55 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4808F823BA;
 Fri, 27 Nov 2026 15:53:54 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=4QK2NOCR5e+Ysf9QZliZ65TPbrikGImy+R7ohKiSZ6w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=FkzWXLC2rRk+0ZimCeZON6QOOcC9fKFpGUPAG5cq/1qU1c0eIqyh3wjioL+HYbSe4TlwuwmH0
 zeAs4x51d5BpiggeP5vs7m/eveiJ3s75T4D3WHmlm+QXFpLzaCwGpInFUZihJTLor48FjeJcK44
 jO3/TtCh0HpvJU4RmfSYZ8zb+TUd39PjkRcznQUsR0gSPQcB2+Ozx4kWWMpWZaN8juhoXjN5nEz
 JZweywZatne6WfVf7hnmxbLDiroBHJlVUaQpTwk3QdcWLg1rYZdRcfKS1fQAzanr4jmit/xJ+ke
 w3iKDirZLQ2Ti4C3ppd0gTLXVdbGrhRRTWnSs5ZzhKOA==
X-Zone-Loop: 765e2b5b49a3c3eed5883edd1fae2f07ddb61b1357e0
x-campaign-type: default
x-transaction-id: 7c42da6e-e9af-4cff-b03c-feb0bb623269
x-swg-uid: 01-df286c26-6170-4d59-82d3-19fae30935b2
X-Mailer: Sweego
Message-ID:
 <1795791235.8631fc262581453bbf619ec5b2062170.1a21d7fa7ee0004767@vates.tech>
x-swg-bid: 1795791235.8631fc262581453bbf619ec5b2062170.1a21d7fa7ee0004767
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
Subject: [PATCH 2/2] tools/ocaml: check domain_create in the bindings test
Date: Fri, 27 Nov 2026 15:53:48 +0100
In-Reply-To: <1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@vates.tech>
References: <1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.20b.d7e95c1e12126d99.1a21d7fa62d.35c837324c4ebf03=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795791234605
X-purgate-ID: tlsNG-bad1c0/1795791239-BE4DB034-6F921E63/0/0
X-purgate-type: clean
X-purgate-size: 7049
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.20b.d7e95c1e12126d99.1a21d7fa62d.35c837324c4ebf03=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The bindings test so far only checks values the C stubs build for OCaml=2E
The opposite direction, stub_xc_domain_create() reading the
domctl_create_config record, accesses its fields by hard coded index, so
a field added to or moved in xenctrl=2Emli without updating the stub
passes the wrong values to Xen without any error=2E

So, create a domain with distinct values, i=2Ee=2E the handle, max_vcpus a=
nd
the arch config, read it back with domain_getinfo() and compare=2E On Arm
the domain gets the GIC version, on x86 it is PVH, or PV without HVM=2E

domain_create() only sets the vCPU limit, the vCPUs are created by
XEN_DOMCTL_max_vcpus with the same number, so check max_vcpu_id before
and after domain_max_vcpus()=2E XEN_DOMCTL_getdomaininfo reports neither
nr_spis nor misc_flags, so those can't be compared=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/ocaml/tests/bindings/main=2Eml | 104 +++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/tools/ocaml/tests/bindings/main=2Eml b/tools/ocaml/tests/bind=
ings/main=2Eml
index 02049d2f79=2E=2E71fc9920f6 100644
--- a/tools/ocaml/tests/bindings/main=2Eml
+++ b/tools/ocaml/tests/bindings/main=2Eml
@@ -119,6 +119,109 @@ let test_domain_getinfolist () =3D
=20
   List=2Eiter check_dom doms
=20
+(* Create a domain, read it back and check that the values made the round
+   trip through the stubs and Xen=2E *)
+let test_domain_create () =3D
+  printf "Test domain_create\n";
+
+  let p =3D Xenctrl=2Ephysinfo xch in
+  let has cap =3D List=2Emem cap p=2EXenctrl=2Ecapabilities in
+
+  (* ARM: HVM and HAP are mandatory, and d0's vGIC is the host's GIC=2E
+     x86: a PVH guest (HAP if available, else shadow), or PV without HVM=
=2E *)
+  (* The annotation picks arch_domainconfig's ARM/X86, not the ones of th=
e
+     later arch_physinfo_cap_flags=2E *)
+  let flags, (arch : Xenctrl=2Earch_domainconfig) =3D
+    match (Xenctrl=2Edomain_getinfo xch 0)=2EXenctrl=2Earch_config with
+    | Xenctrl=2EARM d0 ->
+      [ Xenctrl=2ECDF_HVM; Xenctrl=2ECDF_HAP ],
+      Xenctrl=2EARM { Xenctrl=2Egic_version =3D d0=2EXenctrl=2Egic_versio=
n; nr_spis =3D 0 }
+    | Xenctrl=2EX86 _ when has Xenctrl=2ECAP_HVM
+                         && (has Xenctrl=2ECAP_HAP || has Xenctrl=2ECAP_S=
hadow) ->
+      Xenctrl=2ECDF_HVM :: (if has Xenctrl=2ECAP_HAP then [ Xenctrl=2ECDF=
_HAP ] else []),
+      Xenctrl=2EX86 { Xenctrl=2Eemulation_flags =3D [ Xenctrl=2EX86_EMU_L=
APIC ];
+                    misc_flags =3D [] }
+    | Xenctrl=2EX86 _ ->
+      [],
+      Xenctrl=2EX86 { Xenctrl=2Eemulation_flags =3D []; misc_flags =3D []=
 }
+  in
+
+  (* Xen copies the handle verbatim, so use distinct bytes=2E *)
+  let handle =3D "00112233-4455-6677-8899-aabbccddeeff" in
+  let handle_bytes =3D Array=2Einit 16 (fun i -> i * 0x11) in
+  let max_vcpus =3D 2 in
+
+  let config =3D {
+    Xenctrl=2Essidref =3D 0l;
+    handle;
+    flags;
+    iommu_opts =3D [];
+    max_vcpus;
+    max_evtchn_port =3D -1;
+    max_grant_frames =3D -1;     (* < 0: Xen's default *)
+    max_maptrack_frames =3D -1;
+    max_grant_version =3D if has Xenctrl=2ECAP_Gnttab_v2 then 2 else 1;
+    altp2m_opts =3D 0l;
+    altp2m_count =3D 0l;
+    vmtrace_buf_kb =3D 0l;
+    cpupool_id =3D 0l;
+    arch;
+  } in
+
+  let domid =3D Xenctrl=2Edomain_create xch config in
+  printf "  Created d%d\n" domid;
+
+  Fun=2Eprotect ~finally:(fun () -> Xenctrl=2Edomain_destroy xch domid) @=
@ fun () ->
+  let name =3D sprintf "d%d" domid in
+
+  (* domain_create only sets the limit, the vCPUs are created by
+     XEN_DOMCTL_max_vcpus, which must pass the same number=2E Until then
+     there is no vCPU, reported as XEN_INVALID_MAX_VCPU_ID=2E *)
+  let di =3D Xenctrl=2Edomain_getinfo xch domid in
+  if di=2EXenctrl=2Emax_vcpu_id >=3D 0 && di=2EXenctrl=2Emax_vcpu_id < ma=
x_vcpus then
+    fail "%s: max_vcpu_id %d before creating the vCPUs" name di=2EXenctrl=
=2Emax_vcpu_id;
+  Xenctrl=2Edomain_max_vcpus xch domid max_vcpus;
+
+  let di =3D Xenctrl=2Edomain_getinfo xch domid in
+  check_record name di ~size:17;
+
+  if di=2EXenctrl=2Edomid <> domid then
+    fail "%s: domid %d" name di=2EXenctrl=2Edomid;
+  if di=2EXenctrl=2Ehandle <> handle_bytes then
+    fail "%s: handle %s, expected %s" name
+      (String=2Econcat ":" (Array=2Eto_list (Array=2Emap (sprintf "%02x")=
 di=2EXenctrl=2Ehandle)))
+      handle;
+  if di=2EXenctrl=2Essidref <> 0l then
+    fail "%s: ssidref %ld, expected 0" name di=2EXenctrl=2Essidref;
+  if di=2EXenctrl=2Emax_vcpu_id <> max_vcpus - 1 then
+    fail "%s: max_vcpu_id %d, expected %d" name di=2EXenctrl=2Emax_vcpu_i=
d (max_vcpus - 1);
+  if di=2EXenctrl=2Enr_online_vcpus <> 0 then
+    fail "%s: %d vCPUs online, expected 0" name di=2EXenctrl=2Enr_online_=
vcpus;
+  if di=2EXenctrl=2Ehvm_guest <> List=2Emem Xenctrl=2ECDF_HVM flags then
+    fail "%s: hvm_guest %b" name di=2EXenctrl=2Ehvm_guest;
+  if not di=2EXenctrl=2Epaused then
+    fail "%s: not paused after creation" name;
+
+  (* XEN_DOMCTL_getdomaininfo reports neither nr_spis nor misc_flags=2E *=
)
+  match di=2EXenctrl=2Earch_config, arch with
+  | (Xenctrl=2EARM got as a), Xenctrl=2EARM want ->
+    check_block (name ^ " arch_config") a ~tag:0 ~size:1;
+    check_record (name ^ " xen_arm_arch_domainconfig") got ~size:2;
+    printf "  %s: ARM %s\n" name (string_of_gic_version got=2EXenctrl=2Eg=
ic_version);
+    if got=2EXenctrl=2Egic_version <> want=2EXenctrl=2Egic_version then
+      fail "%s: gic_version %d, expected %d" name
+        got=2EXenctrl=2Egic_version want=2EXenctrl=2Egic_version
+  | (Xenctrl=2EX86 got as a), Xenctrl=2EX86 want ->
+    check_block (name ^ " arch_config") a ~tag:1 ~size:1;
+    check_record (name ^ " xen_x86_arch_domainconfig") got ~size:2;
+    printf "  %s: x86, %d emulation flags\n" name
+      (List=2Elength got=2EXenctrl=2Eemulation_flags);
+    if List=2Esort compare got=2EXenctrl=2Eemulation_flags
+       <> List=2Esort compare want=2EXenctrl=2Eemulation_flags then
+      fail "%s: emulation_flags differ from the requested ones" name
+  | _ ->
+    fail "%s: arch_config of a different architecture" name
+
 let run name f =3D
   try f () with
   | Xenctrl=2EError e -> fail "%s: Xenctrl=2EError %s" name e
@@ -130,6 +233,7 @@ let () =3D
   run "version" test_xenversion;
   run "physinfo" test_physinfo;
   run "domain_getinfolist" test_domain_getinfolist;
+  run "domain_create" test_domain_create;
=20
   printf "Starting GC=2Ecompact()\n%!";
   Gc=2Ecompact ();
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.20b.d7e95c1e12126d99.1a21d7fa62d.35c837324c4ebf03=---

