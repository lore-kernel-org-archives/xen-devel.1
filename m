Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E461606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 14:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=jmeyNGCy
Received: from list by lists.xenproject.org with outflank-mailman.1465714.1676182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHu-0008WR-K1; Fri, 30 Oct 2026 14:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465714.1676182; Fri, 30 Oct 2026 14:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnHu-0008WI-HE; Fri, 30 Oct 2026 14:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1465714;
 Fri, 30 Oct 2026 14:08:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d245f17000cae1@swg.vates.tech>)
 id 1xMnHs-0008Jf-DK
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 14:08:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMnHr-000Afr-Q9
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:08:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d245f17000cae1@swg.vates.tech>)
 id 6ae4a4f3-8faa-0a2a0a5109dd-0a2a450c83b6-14
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:55 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d245f17000cae1@swg.vates.tech>)
 id 6ae4a4f6-f479-0a2a450c0019-b9ff1c1298d7-4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:08:55 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18d245f17000cae1.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 14:08:53 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 96EEF82EC1;
 Fri, 30 Oct 2026 15:08:52 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=k92DauRa8Aq7sk1kAZZmTjvyGWcyOii8gIYs1IrbVOQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jmeyNGCyNfpQSxIg64Bz4VRiU1Nlu/nxJirkrq/vXcTzsKHqLNtbe77f39TN6qiViUJgFrY94
 /RDxJDSYydMdZAq+UnZIJnRho+FXt/5U9rELKmoAkaIrksGKK+IzpDkQQuaJFLqDTzCKMmBMhAG
 b67QxAnp11IZYzTEGvjJG0Wg5lvfVMKFqrf9VtFkeFK2+7Y7PiWBMr6UqrwZaEHmhFNgiumlWzo
 JFOLiNnaPSvoeunHAELx8+AsDuWWtpDe/KBT1y8KhOeqhJd0YaGIIFz5896JAC/yZPjE0eAjfUv
 Ph9gdB4ZOwc8EUv+PKmYfhxzt6JElEvOn8buTQuR8lKQ==
X-Zone-Loop: 832c1f6d32c9db4b28ee4aa0e7a238a43bacfbc0fac7
x-campaign-type: default
x-transaction-id: a06ed042-90e2-44be-9d0b-03f5893b6457
x-swg-uid: 01-a15a7726-933b-49ab-8ac6-a7d521099dbf
X-Mailer: Sweego
Message-ID:
 <1793369333.8631fc262581453bbf619ec5b2062170.1a18d245f17000cae1@vates.tech>
x-swg-bid: 1793369333.8631fc262581453bbf619ec5b2062170.1a18d245f17000cae1
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
Subject: [PATCH 2/4] tools/ocaml: add bindings for the paging mempool size
Date: Fri, 30 Oct 2026 15:08:45 +0100
In-Reply-To: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
References: <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.334.6bba1527ddbe6e60.1a18d245d6a.bf2e308db7509232=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793369333098
X-purgate-ID: tlsNG-d25034/1793369335-030D9A5B-68128364/0/0
X-purgate-type: clean
X-purgate-size: 4422
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.334.6bba1527ddbe6e60.1a18d245d6a.bf2e308db7509232=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The OCaml bindings only expose the shadow_allocation_{get,set}
functions, which use XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION=2E These
are x86-only, on ARM they fail with -ENOSYS=2E So, an OCaml toolstack has
no way to size the P2M pool of an ARM domain, which libxl does via
XEN_DOMCTL_set_paging_mempool_size=2E

So, add a pair of functions paging_mempool_size_{get,set}, which just
wrap xc_{get,set}_paging_mempool_size()=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
 - Convert domid before blocking section
 - Check domid for truncation
---
 tools/ocaml/libs/xc/xenctrl=2Eml      |  5 ++++
 tools/ocaml/libs/xc/xenctrl=2Emli     |  4 +++
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 41 +++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/tools/ocaml/libs/xc/xenctrl=2Eml b/tools/ocaml/libs/xc/xenctr=
l=2Eml
index 37e41879bb=2E=2E55cfc2e9a2 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Eml
+++ b/tools/ocaml/libs/xc/xenctrl=2Eml
@@ -283,6 +283,11 @@ external shadow_allocation_set: handle -> domid -> in=
t -> unit
 external shadow_allocation_get: handle -> domid -> int
   =3D "stub_shadow_allocation_get"
=20
+external paging_mempool_size_set: handle -> domid -> int64 -> unit
+  =3D "stub_xc_set_paging_mempool_size"
+external paging_mempool_size_get: handle -> domid -> int64
+  =3D "stub_xc_get_paging_mempool_size"
+
 external evtchn_alloc_unbound: handle -> domid -> domid -> int
   =3D "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset: handle -> domid -> unit =3D "stub_xc_evtchn_reset"
diff --git a/tools/ocaml/libs/xc/xenctrl=2Emli b/tools/ocaml/libs/xc/xenct=
rl=2Emli
index 7a0dd7d8ba=2E=2E0d5cc94198 100644
--- a/tools/ocaml/libs/xc/xenctrl=2Emli
+++ b/tools/ocaml/libs/xc/xenctrl=2Emli
@@ -210,6 +210,10 @@ external shadow_allocation_set : handle -> domid -> i=
nt -> unit
   =3D "stub_shadow_allocation_set"
 external shadow_allocation_get : handle -> domid -> int
   =3D "stub_shadow_allocation_get"
+external paging_mempool_size_set : handle -> domid -> int64 -> unit
+  =3D "stub_xc_set_paging_mempool_size"
+external paging_mempool_size_get : handle -> domid -> int64
+  =3D "stub_xc_get_paging_mempool_size"
 external evtchn_alloc_unbound : handle -> domid -> domid -> int
   =3D "stub_xc_evtchn_alloc_unbound"
 external evtchn_reset : handle -> domid -> unit =3D "stub_xc_evtchn_reset=
"
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/xc/x=
enctrl_stubs=2Ec
index e0c435e346=2E=2E307bfa031d 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -1259,6 +1259,47 @@ CAMLprim value stub_shadow_allocation_set(value xch=
_val, value domid,
 	CAMLreturn(Val_unit);
 }
=20
+CAMLprim value stub_xc_get_paging_mempool_size(value xch_val, value domid=
)
+{
+	CAMLparam2(xch_val, domid);
+	xc_interface *xch =3D xch_of_val(xch_val);
+	uint32_t c_domid =3D Long_val(domid);
+	uint64_t c_size;
+	int ret;
+
+	if (c_domid !=3D Long_val(domid))
+		caml_invalid_argument("domid");
+
+	caml_enter_blocking_section();
+	ret =3D xc_get_paging_mempool_size(xch, c_domid, &c_size);
+	caml_leave_blocking_section();
+	if (ret !=3D 0)
+		failwith_xc(xch);
+
+	CAMLreturn(caml_copy_int64(c_size));
+}
+
+CAMLprim value stub_xc_set_paging_mempool_size(value xch_val, value domid=
,
+					       value size)
+{
+	CAMLparam3(xch_val, domid, size);
+	xc_interface *xch =3D xch_of_val(xch_val);
+	uint32_t c_domid =3D Long_val(domid);
+	uint64_t c_size =3D Int64_val(size);
+	int ret;
+
+	if (c_domid !=3D Long_val(domid))
+		caml_invalid_argument("domid");
+
+	caml_enter_blocking_section();
+	ret =3D xc_set_paging_mempool_size(xch, c_domid, c_size);
+	caml_leave_blocking_section();
+	if (ret !=3D 0)
+		failwith_xc(xch);
+
+	CAMLreturn(Val_unit);
+}
+
 CAMLprim value stub_xc_domain_ioport_permission(value xch_val, value domi=
d,
 					       value start_port, value nr_ports,
 					       value allow)
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.334.6bba1527ddbe6e60.1a18d245d6a.bf2e308db7509232=---

