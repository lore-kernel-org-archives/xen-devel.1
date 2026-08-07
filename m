Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C66BC5ACAB
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 21:29:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386340.1628293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsS7U-0000IL-GY; Fri, 07 Aug 2026 21:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386340.1628293; Fri, 07 Aug 2026 21:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsS7U-0000IE-DV; Fri, 07 Aug 2026 21:28:48 +0000
Received: by outflank-mailman (input) for mailman id 1386340;
 Fri, 07 Aug 2026 21:28:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@swg.vates.tech>)
 id 1wsS7S-0000I7-SF
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 21:28:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsS7R-008FS8-JY
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 23:28:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@swg.vates.tech>)
 id 6a764dc4-2eae-0a2a0a5409dd-0a2a4502dd92-32
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 23:28:45 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@swg.vates.tech>)
 id 6a764e0c-6ca4-0a2a45020019-b9ff1c239c41-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 23:28:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fde20d3e4000e099.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 07 Aug 2026 21:28:41 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 540A1835D6;
 Fri,  7 Aug 2026 23:28:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=siQjNhS1rXHQWa6eDG4c4KcvJWFe9SWt3KniEaLmaqw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=oOchjdIjqNY73vWIm+X3lBJirJzsJpZnFCh+IN2ROdO7Nm4qe4Qv5qUmQ5mWndQQ3DHXGwTK6
 PytkPhENDY8BW2FP5j/tKa1hD1XvZHfFBJFgx6p6csPsOgZxFK4HJ61RosdYGe5DW///shObQjq
 cEmHuNsc/b+1jmJ06gaY15+OI6/crVWEuyvrNt8lZ6YGwRrcRSX0LN9hZAho+4UYrazo/GOANUD
 qgf3hP1+dChhmszwOi+Pld/h6+3lunu67hDyN1lhymUhpdOSxENItYXUfU3bv6KjtEne/T2jp4+
 1UqtERyGqjcJTPp9XZPGip8FxCqn4B3bvQqYSJHgxUeQ==
X-Zone-Loop: 0f7696cbc95cc987e045f65c6e6af76de5cb2c0eb37c
x-campaign-type: default
x-transaction-id: fd0e310a-1f27-4724-be14-41255f131e87
x-swg-uid: 01-db421d96-5e6c-44da-b753-4c378dd236cc
X-Mailer: Sweego
Message-ID:
 <1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099@vates.tech>
x-swg-bid: 1786138121.8631fc262581453bbf619ec5b2062170.19fde20d3e4000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] public/xen.h: Update comment on mmu_update sub-command size and PTE alignment
Date: Fri,  7 Aug 2026 23:28:10 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1f09.34907377b737dadc.19fde20d17d.acbe1d96dc5fb6c6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786138120576
X-purgate-ID: tlsNG-720697/1786138125-323D42AC-1DCA6395/0/0
X-purgate-type: clean
X-purgate-size: 4436

---=Part.1f09.34907377b737dadc.19fde20d17d.acbe1d96dc5fb6c6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

HYPERVISOR_mmu_update passes a set of request, where each request has a poi=
nter
to the PTE along with a sub-command=2E

The PTE alignment padding is used to transport the sub-command while the r=
est
is used as a address to a PTE entry=2E The current documentation state tha=
t the
2 first bits are used for sub-command, hence the other ones for PTE which
imply here a 4-bytes alignment on PTEs=2E

On PV64 and PV32-PAE guests, all pagetable PTEs are 8-bytes aligned, hence
off-by-4 PTEs addresses are always incorrect=2E Non-PAE PV32 guests used
"legacy pagetables" which had 4-byte aligned PTEs=2E However, support had
been completely removed since Xen 4=2E0, and were only available when Xen =
was
built in 32-bits non-PAE mode [1]=2E

Current Xen logic behave as if 3 bits are used as sub-command, thus all
off-by-4 PTEs are actually rejected as being unknown sub-commands=2E

Adjust the documentation to match the current logic implemented in Xen,
also expanding the documented sub-command parameter to 3 bits=2E

[1] 84d54d5d8b31 ("i386: Remove non-PAE hypervisor build target=2E")

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
This happens to be a complete rewording of [2]=2E I'm not sure what to do =
exactly
regarding the signed-off=2E

CC: Kevin Lampis <kevin=2Elampis@citrix=2Ecom>
This now expanded sub-command field can be used for your "unmap_page_range=
 optimisation"
series to avoid having to introduce a new dedicated hypercall=2E

[2] https://lore=2Ekernel=2Eorg/xen-devel/20260528075539=2E10209-3-fredian=
o=2Eziglio@cloud=2Ecom/

 xen/include/public/xen=2Eh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/public/xen=2Eh b/xen/include/public/xen=2Eh
index 2149b8dd38=2E=2Eb4fef2c5ba 100644
--- a/xen/include/public/xen=2Eh
+++ b/xen/include/public/xen=2Eh
@@ -218,16 +218,16 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  *                     x =3D=3D 0 =3D> PFD =3D=3D DOMID_SELF
  *                     x !=3D 0 =3D> PFD =3D=3D x - 1
  *
- * Sub-commands: ptr[1:0] specifies the appropriate MMU_* command=2E
+ * Sub-commands: ptr[2:0] specifies the appropriate MMU_* command=2E
  * -------------
- * ptr[1:0] =3D=3D MMU_NORMAL_PT_UPDATE:
+ * ptr[2:0] =3D=3D MMU_NORMAL_PT_UPDATE:
  * Updates an entry in a page table belonging to PFD=2E If updating an L1=
 table,
  * and the new table entry is valid/present, the mapped frame must belong=
 to
  * FD=2E If attempting to map an I/O page then the caller assumes the pri=
vilege
  * of the FD=2E
  * FD =3D=3D DOMID_IO: Permit /only/ I/O mappings, at the priv level of t=
he caller=2E
  * FD =3D=3D DOMID_XEN: Map restricted areas of Xen's heap space=2E
- * ptr[:2]  -- Machine address of the page-table entry to modify=2E
+ * ptr[:3]  -- Machine address of the page-table entry to modify=2E
  * val      -- Value to write=2E
  *
  * There also certain implicit requirements when using this hypercall=2E =
The
@@ -264,17 +264,17 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * mentioned above=2E The argument is MMUEXT_UNPIN_TABLE for all levels a=
nd the
  * pagetable MUST not be in use (meaning that the cr3 is not set to it)=
=2E
  *
- * ptr[1:0] =3D=3D MMU_MACHPHYS_UPDATE:
+ * ptr[2:0] =3D=3D MMU_MACHPHYS_UPDATE:
  * Updates an entry in the machine->pseudo-physical mapping table=2E
- * ptr[:2]  -- Machine address within the frame whose mapping to modify=
=2E
+ * ptr[:3]  -- Machine address within the frame whose mapping to modify=
=2E
  *             The frame must belong to the FD, if one is specified=2E
  * val      -- Value to write into the mapping entry=2E
  *
- * ptr[1:0] =3D=3D MMU_PT_UPDATE_PRESERVE_AD:
+ * ptr[2:0] =3D=3D MMU_PT_UPDATE_PRESERVE_AD:
  * As MMU_NORMAL_PT_UPDATE above, but A/D bits currently in the PTE are O=
Red
  * with those in @val=2E
  *
- * ptr[1:0] =3D=3D MMU_PT_UPDATE_NO_TRANSLATE:
+ * ptr[2:0] =3D=3D MMU_PT_UPDATE_NO_TRANSLATE:
  * As MMU_NORMAL_PT_UPDATE above, but @val is not translated though FD
  * page tables=2E
  *
--=20
2=2E54=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.1f09.34907377b737dadc.19fde20d17d.acbe1d96dc5fb6c6=---

