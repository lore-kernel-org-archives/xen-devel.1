Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9825260A4AE1
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=d/c7jITp
Received: from list by lists.xenproject.org with outflank-mailman.1458277.1670666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtlv-0006ib-7B; Thu, 22 Oct 2026 14:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458277.1670666; Thu, 22 Oct 2026 14:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtlv-0006iS-1t; Thu, 22 Oct 2026 14:27:59 +0000
Received: by outflank-mailman (input) for mailman id 1458277;
 Thu, 22 Oct 2026 14:27:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f@swg.vates.tech>)
 id 1xJtlt-0006J0-CT
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:27:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJtls-007HrS-PK
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 16:27:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f@swg.vates.tech>)
 id 6ada1d68-bab6-0a2a0a5309dd-0a2a450b8136-16
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:27:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f@swg.vates.tech>)
 id 6ada1d6c-b7e8-0a2a450b0019-b9ff1c228743-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:27:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a16402de81000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 14:27:52 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 52DCB81F99;
 Thu, 22 Oct 2026 16:27:51 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=YZYoHWUJy0DmQNfTi4M3QNymJsXvmbW4+PPryWlCJhY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=d/c7jITpuHY3WqcmhNgB+73wBD/qGeLpoJCgbnFfwHuXb/HbqUGHPUpV5MuKOc9jjhVKyuygy
 CWW+DQnMgxVYsY3VacTWRp9ACHRPINlCCzrGUMgW08LqizFSg0gipQJnsdQ9KTMZdl0UgAB2bzm
 ewytCEvshMzn+qQTkLylBButPgGbi85GoiU9gvtghbDsbgvWVGVnH0k0Ovb7eM50ZQ7pkhrvrGM
 6ki/1f96P5isCLX8F6vjWq86jQqJvMkrjqUTiu3LP7jgCAfm+428JCnQg/o1nllRK/IBlvVHR4x
 XBbhFTrm+QkUmp76l2pZhRjkY9RNQbPNpuQmLnljOB4Q==
X-Zone-Loop: 1b49339cbac41f34b7e91bf6d80fb1c772c20c8a0182
x-campaign-type: default
x-transaction-id: bd9cb396-7a0f-4ff2-ac40-231740af7025
x-swg-uid: 01-2734b988-cf39-4b75-852a-b1deca5ca440
X-Mailer: Sweego
Message-ID:
 <1792679272.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f@vates.tech>
x-swg-bid: 1792679272.8631fc262581453bbf619ec5b2062170.1a16402de81000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 2/2] tools/ocaml: add bindings for the paging mempool size
Date: Thu, 22 Oct 2026 16:27:44 +0200
In-Reply-To: <20261022142744.338622-1-julian.vetter@vates.tech>
References: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
 <20261022142744.338622-1-julian.vetter@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.136.be787071d18a1000.1a16402dced.52be1c3e56b91a2e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792679271661
X-purgate-ID: tlsNG-42698a/1792679276-18CCF9EA-DF87DCF4/0/0
X-purgate-type: clean
X-purgate-size: 4110
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.136.be787071d18a1000.1a16402dced.52be1c3e56b91a2e=-
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
 tools/ocaml/libs/xc/xenctrl=2Eml      |  5 +++++
 tools/ocaml/libs/xc/xenctrl=2Emli     |  4 ++++
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 33 +++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

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
index e0c435e346=2E=2Eef3d16beaa 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
+++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
@@ -1259,6 +1259,39 @@ CAMLprim value stub_shadow_allocation_set(value xch=
_val, value domid,
 	CAMLreturn(Val_unit);
 }
=20
+CAMLprim value stub_xc_get_paging_mempool_size(value xch_val, value domid=
)
+{
+	CAMLparam2(xch_val, domid);
+	xc_interface *xch =3D xch_of_val(xch_val);
+	uint64_t c_size;
+	int ret;
+
+	caml_enter_blocking_section();
+	ret =3D xc_get_paging_mempool_size(xch, Int_val(domid), &c_size);
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
+	uint64_t c_size =3D Int64_val(size);
+	int ret;
+
+	caml_enter_blocking_section();
+	ret =3D xc_set_paging_mempool_size(xch, Int_val(domid), c_size);
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
---=Part.136.be787071d18a1000.1a16402dced.52be1c3e56b91a2e=---

