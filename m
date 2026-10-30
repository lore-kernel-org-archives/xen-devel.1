Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335E606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Nv2sJwg+
Received: from list by lists.xenproject.org with outflank-mailman.1465716.1676200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHy-0000YT-69; Fri, 30 Oct 2026 14:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465716.1676200; Fri, 30 Oct 2026 14:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHy-0000YL-36; Fri, 30 Oct 2026 14:09:02 +0000
Received: by outflank-mailman (input) for mailman id 1465716;
 Fri, 30 Oct 2026 14:09:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d24641a000cae1@swg.vates.tech>)
 id 1xMnHw-0000Wx-Vn
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 14:09:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMnHw-000AjJ-Ca
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:09:00 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d24641a000cae1@swg.vates.tech>)
 id 6ae4a4f7-8faa-0a2a0a5109dd-0a2a4507d978-10
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:09:00 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d24641a000cae1@swg.vates.tech>)
 id 6ae4a4fa-b4ea-0a2a45070019-b9ff1c23b66f-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:58 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18d24641a000cae1.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 14:08:54 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E0DE782EC1;
 Fri, 30 Oct 2026 15:08:53 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=akRbpxa6rSSnB9kOmzAWy65Mp6pHVNxd97FBerNkZVA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Nv2sJwg+RGQitsmZZbcgq78yCyswVX/Y0bnScEUZSV9ULw0yD8e9ZkocAl1tcqLXzh6SUoT+v
 YWWZxyV6132ogqJmq5ASc9vj71/BaOr0zpFXdlp2paK4MCdME86l8CR43TlBD8XiCWFj90U+5rI
 J/+mC6L/rWZq5Xnug5CUYTRBs4Si/wgu4/9bpKAFr2e0uF6schh6NCY8Pvd+iZnUrhNqCECYw40
 lNJp9ofK6q+BtilPn2oahivdGl8hu82f6f6tPURAOwzi7DCEEToPkwywrLXM00D77S//XZt01Sj
 4i8qlsmmUBmiiSmc4eao/HIsN/PORysNDKk1NK6Flwsw==
X-Zone-Loop: 309c804213f67ee15da7d8131c69896683c29de84b98
x-campaign-type: default
x-transaction-id: b05c41c3-0672-411d-80b0-44bb3e884cda
x-swg-uid: 01-e5c6d8da-120c-4b28-b559-2cac11e6c6b0
X-Mailer: Sweego
Message-ID:
 <1793369334.8631fc262581453bbf619ec5b2062170.1a18d24641a000cae1@vates.tech>
x-swg-bid: 1793369334.8631fc262581453bbf619ec5b2062170.1a18d24641a000cae1
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 4/4] tools/ocaml: implement shadow_allocation_{get,set} via the paging mempool
Date: Fri, 30 Oct 2026 15:08:47 +0100
In-Reply-To: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
References: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.336.1d4a8481e7c47b6.1a18d246284.ce8a5cbd54ae1175=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793369334405
X-purgate-ID: tlsNG-ef75cf/1793369338-A4ECEAE4-B3EEAAFD/0/0
X-purgate-type: clean
X-purgate-size: 5603
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.336.1d4a8481e7c47b6.1a18d246284.ce8a5cbd54ae1175=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

To have a more generic interface for sizing a domain's paging pool,
replace XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION by
XEN_DOMCTL_{get,set}_paging_mempool_size=2E These functions works on both
x86 and ARM, and take an exact size in bytes instead of whole MBytes=2E

But the shadow_allocation_{get,set} functions can't be removed yet,
because Xapi still uses them, and is built against the installed Xen's
OCaml bindings, so removing them would break building existing Xapi
releases against newer versions of Xen=2E

Instead, reimplement them on top of paging_mempool_size_{get,set},
keeping their MBytes based interface and rounding the size up in the get
function, and drop their C stubs=2E Once Xapi uses the new functions, the
wrappers can be removed as well=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- New patch
---
 tools/ocaml/libs/xc/xenctrl=2Eml      | 18 +++++++++----
 tools/ocaml/libs/xc/xenctrl=2Emli     |  6 ++---
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 40 -----------------------------
 3 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl=2Eml b/tools/ocaml/libs/xc/xenctr=
l=2Eml
index 55cfc2e9a2=2E=2E1f81bd3c4e 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Eml
+++ b/tools/ocaml/libs/xc/xenctrl=2Eml
@@ -278,16 +278,24 @@ external sched_credit_domain_set: handle -> domid ->=
 sched_control -> unit
 external sched_credit_domain_get: handle -> domid -> sched_control
   =3D "stub_sched_credit_domain_get"
=20
-external shadow_allocation_set: handle -> domid -> int -> unit
-  =3D "stub_shadow_allocation_set"
-external shadow_allocation_get: handle -> domid -> int
-  =3D "stub_shadow_allocation_get"
-
 external paging_mempool_size_set: handle -> domid -> int64 -> unit
   =3D "stub_xc_set_paging_mempool_size"
 external paging_mempool_size_get: handle -> domid -> int64
   =3D "stub_xc_get_paging_mempool_size"
=20
+(* Compatibility wrappers for the old MiB based shadow_allocation_{get,se=
t}
+   bindings, which used XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION=2E *)
+let shadow_allocation_set handle domid mb =3D
+  let size =3D Int64=2Eshift_left (Int64=2Eof_int mb) 20 in
+  if mb < 0 || Int64=2Eshift_right size 20 <> Int64=2Eof_int mb then
+    invalid_arg "shadow_allocation_set";
+  paging_mempool_size_set handle domid size
+
+(* Round up to whole MiB, like XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION did=2E=
 *)
+let shadow_allocation_get handle domid =3D
+  let size =3D paging_mempool_size_get handle domid in
+  Int64=2Eto_int (Int64=2Eshift_right_logical (Int64=2Eadd size 0xfffffL)=
 20)
+
 external evtchn_alloc_unbound: handle -> domid -> domid -> int
   =3D "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset: handle -> domid -> unit =3D "stub_xc_evtchn_reset"
diff --git a/tools/ocaml/libs/xc/xenctrl=2Emli b/tools/ocaml/libs/xc/xenct=
rl=2Emli
index 0d5cc94198=2E=2E1083255f6d 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Emli
+++ b/tools/ocaml/libs/xc/xenctrl=2Emli
@@ -206,10 +206,8 @@ external sched_credit_domain_set : handle -> domid ->=
 sched_control -> unit
   =3D "stub_sched_credit_domain_set"
 external sched_credit_domain_get : handle -> domid -> sched_control
   =3D "stub_sched_credit_domain_get"
-external shadow_allocation_set : handle -> domid -> int -> unit
-  =3D "stub_shadow_allocation_set"
-external shadow_allocation_get : handle -> domid -> int
-  =3D "stub_shadow_allocation_get"
+val shadow_allocation_set : handle -> domid -> int -> unit
+val shadow_allocation_get : handle -> domid -> int
 external paging_mempool_size_set : handle -> domid -> int64 -> unit
   =3D "stub_xc_set_paging_mempool_size"
 external paging_mempool_size_get : handle -> domid -> int64
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index 307bfa031d=2E=2E42402ef6e8 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -1219,46 +1219,6 @@ CAMLprim value stub_sched_credit_domain_set(value x=
ch_val, value domid,
 	CAMLreturn(Val_unit);
 }
=20
-CAMLprim value stub_shadow_allocation_get(value xch_val, value domid)
-{
-	CAMLparam2(xch_val, domid);
-	CAMLlocal1(mb);
-	xc_interface *xch =3D xch_of_val(xch_val);
-	unsigned int c_mb;
-	int ret;
-
-	caml_enter_blocking_section();
-	ret =3D xc_shadow_control(xch, Int_val(domid),
-				XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
-				&c_mb, 0);
-	caml_leave_blocking_section();
-	if (ret !=3D 0)
-		failwith_xc(xch);
-
-	mb =3D Val_int(c_mb);
-	CAMLreturn(mb);
-}
-
-CAMLprim value stub_shadow_allocation_set(value xch_val, value domid,
-					  value mb)
-{
-	CAMLparam3(xch_val, domid, mb);
-	xc_interface *xch =3D xch_of_val(xch_val);
-	unsigned int c_mb;
-	int ret;
-
-	c_mb =3D Int_val(mb);
-	caml_enter_blocking_section();
-	ret =3D xc_shadow_control(xch, Int_val(domid),
-				XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-				&c_mb, 0);
-	caml_leave_blocking_section();
-	if (ret !=3D 0)
-		failwith_xc(xch);
-
-	CAMLreturn(Val_unit);
-}
-
 CAMLprim value stub_xc_get_paging_mempool_size(value xch_val, value domid=
)
 {
 	CAMLparam2(xch_val, domid);
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.336.1d4a8481e7c47b6.1a18d246284.ce8a5cbd54ae1175=---

