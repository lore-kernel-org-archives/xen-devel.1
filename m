Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FD9C44501
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 13:39:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363113.1614933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzpq-0006ew-KL; Wed, 15 Jul 2026 13:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363113.1614933; Wed, 15 Jul 2026 13:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjzpq-0006ep-Hi; Wed, 15 Jul 2026 13:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1363113;
 Wed, 15 Jul 2026 13:39:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@swg.vates.tech>)
 id 1wjzpp-0006cw-Nh
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 13:39:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjzpp-004YXE-4R
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 15:39:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@swg.vates.tech>)
 id 6a578d92-5cb7-0a2a0a5109dd-0a2a45059218-14
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:39:37 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@swg.vates.tech>)
 id 6a578d98-4cb1-0a2a45050019-b9ff1c23a93d-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 15:39:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f66010afa000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 13:39:32 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 73E3E8238B;
 Wed, 15 Jul 2026 15:39:31 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=d8HOKesRg7+u2RNJ15DXUeICrSBaG7VCp9ZN1Lsp1dA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=jDnDk7Pj2KVOoJuvKJB/8JbCbUFoQVTDQJXSsLPrZOLyLDrAT7/ht3mvU6KEVRjDC8CMlAE2C
 FE844hGWHz9OtZqw00C/i7a33WGdC4FnyiQVrDh+kqlhvjQmdkrigB3P16EV2w+sBd58qAaWgtX
 fmCj7nmF6XYiX6HHO/nz2wyG2Ub0cHtEMuXriwIIH81i02rbkVITJn5ruqU/1Hiq4uLEWT45o0F
 Y6HKJataQyL0GuxOB3a7rCTcBA5JTbf3XvxjgXbdsZsZKUfO/23aLjH0r59BZt8DZBGmoMrCB4v
 1PShPiAmfoMID4ndiioEmNFuFmFXnKouATNuEPu5sNhg==
X-Zone-Loop: bda43f2ba9cee3b97782477fdaed3894d01644c65831
x-campaign-type: default
x-transaction-id: e7fa47a8-4105-4295-a9fb-bcfc82e3d741
x-swg-uid: 01-36f729c9-5dde-44ac-b4de-e9776a21f68d
X-Mailer: Sweego
Message-ID:
 <1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5@vates.tech>
x-swg-bid: 1784122772.8631fc262581453bbf619ec5b2062170.19f66010afa000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 0/2] vvmx: Reinject L2 TDX exit reasons to L1 instead of crashing L1
Date: Wed, 15 Jul 2026 15:38:25 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.88e.e304df691848a237.19f66010898.e0e7072a90765b3d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784122771612
X-purgate-ID: tlsNG-c201ff/1784122777-F7EB92A1-E15E4E2A/0/0
X-purgate-type: clean
X-purgate-size: 1501

---=Part.88e.e304df691848a237.19f66010898.e0e7072a90765b3d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On hardware that support TDX, guests performing SEAMCALL or TDCALL causes a
VMEXIT(SEAMCALL) or VMEXIT(TDCALL) regardless of VMCS configuration (there
is no flag to opt-out these VMEXIT)=2E

This instruction can only be called in a guest with CPL =3D 0 [1], thus it=
 cannot be
leveraged from guest userland to crash the entire guest=2E However, it can=
 still be
used by a L2 guest kernel space to crash the L1 as such exit reason is unh=
andled
which defaults to crashing the entire domain=2E

RFC: I don't have access to hardware that supports TDX to test it; and I'm=
 not
sure this is enough given that some other instructions may exhibit similar
issues; but these 2 ones in particular don't seem to have a opt-out=2E

[1] https://lore=2Ekernel=2Eorg/all/20251016182148=2E69085-2-seanjc@google=
=2Ecom/

Teddy Astie (2):
  vmx: Introduce TDX instruction exit reasons
  vvmx: Reinject TDX instruction exit reasons to L1 when emitted by L2

 xen/arch/x86/hvm/vmx/vvmx=2Ec            | 2 ++
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh | 2 ++
 xen/arch/x86/include/asm/perfc_defn=2Eh  | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

--=20
2=2E54=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.88e.e304df691848a237.19f66010898.e0e7072a90765b3d=---

