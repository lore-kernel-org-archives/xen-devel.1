Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E0606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=oYZG1awk
Received: from list by lists.xenproject.org with outflank-mailman.1465704.1676165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnEj-0007j2-0S; Fri, 30 Oct 2026 14:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465704.1676165; Fri, 30 Oct 2026 14:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMnEi-0007iv-Se; Fri, 30 Oct 2026 14:05:40 +0000
Received: by outflank-mailman (input) for mailman id 1465704;
 Fri, 30 Oct 2026 14:05:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@swg.vates.tech>)
 id 1xMnEh-0007ip-0w
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 14:05:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMnEg-00H4pc-5L
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:05:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@swg.vates.tech>)
 id 6ae4a426-8faa-0a2a0a5109dd-0a2a4505a880-32
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:05:37 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@swg.vates.tech>)
 id 6ae4a431-4cb1-0a2a45050019-b9ff1c12a557-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 15:05:37 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18d215a7f000cae1.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 14:05:35 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8D58781C1D;
 Fri, 30 Oct 2026 15:05:34 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=GWma1Wk/ghGMXX+amd5jAGFDfmKuuifSKybk+JNsvu0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=oYZG1awkk8eIeDVy6nZ/+K9Eq27wYyntRVgY51Tp4va+DG4ge6FAWNqbRo1RhChM0haQZON9g
 CqG92r9EqlUETpD1JUys0sahQDZGAOYSAQ4As/gUEoUGjm4WghtOsvGTK1Z09K/k7O6572h2eB2
 ZnR7SNrSBUj07R8NpBJ8xUWv45qpatu5ujZUNbEj+rXYLKsPvKJHmQhPuLVaf8FtPqJ3+fYIBdw
 Z98zwYGZSKo9dUienczH2IaMN6Eg0QwejqCCCTuShzlOlOuMFEisGkR1hGRvyskLxfSBSdEAyIZ
 chFsACb5qXZu0i7WWHvgGylQo4y/zNQTfW/dgykjt9OA==
X-Zone-Loop: ba1b6aadd156caf1609cc4f82934c649c369ef989c1f
x-campaign-type: default
x-transaction-id: faa22d6d-73e1-48dc-aca9-ba9a60eddfa8
x-swg-uid: 01-bf323b27-c6f3-4d49-a8c6-fc21271586a6
X-Mailer: Sweego
Message-ID:
 <1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1@vates.tech>
x-swg-bid: 1793369135.8631fc262581453bbf619ec5b2062170.1a18d215a7f000cae1
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
Subject: [PATCH v2 0/4] tools/ocaml: bindings needed to build ARM domains
Date: Fri, 30 Oct 2026 15:05:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.330.7ff4f4efefd786fa.1a18d2157da.bbbdb346bb00492b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793369135066
X-purgate-ID: tlsNG-c201ff/1793369137-F68B62A1-7DDCF80B/0/0
X-purgate-type: clean
X-purgate-size: 1813
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.330.7ff4f4efefd786fa.1a18d2157da.bbbdb346bb00492b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you Andrew for your review and valuable insights! I have addressed
your remarks=2E I have added 2 new patches=2E As you suggested I have made
the more generic paging mempool domctls the default for sizing a
domain's paging pool=2E

The only issue I had is that on x86, these
arch_{get,set}_paging_mempool_size() functions reject PV domains=2E But
you already added a "TODO: Relax in due course"=2E So, I did this, keeping
the check only for builds without CONFIG_SHADOW_PAGING=2E

The last patch then reimplements shadow_allocation_{get,set} on top of
the new bindings, keeping their MBytes based interface=2E What do you
think?

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v2:
- Patch 2: convert the domid before the blocking section, and check it
  for truncation
- Patches 3 and 4: new
---
Julian Vetter (4):
  tools/ocaml: expose the supported guest GIC versions in physinfo
  tools/ocaml: add bindings for the paging mempool size
  x86/paging: allow the paging mempool size domctls for PV domains
  tools/ocaml: implement shadow_allocation_{get,set} via the paging
    mempool

 tools/ocaml/libs/xc/xenctrl=2Eml      | 23 ++++++++++++++---
 tools/ocaml/libs/xc/xenctrl=2Emli     | 12 ++++++---
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 40 +++++++++++++++++------------
 xen/arch/x86/mm/paging=2Ec            |  4 +--
 4 files changed, 52 insertions(+), 27 deletions(-)

--
2=2E53=2E0


-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.330.7ff4f4efefd786fa.1a18d2157da.bbbdb346bb00492b=---

