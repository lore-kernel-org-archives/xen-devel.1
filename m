Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767DC5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 09:33:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398753.1634889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyR2j-0007H9-PU; Mon, 24 Aug 2026 09:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398753.1634889; Mon, 24 Aug 2026 09:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyR2j-0007H2-Mn; Mon, 24 Aug 2026 09:32:37 +0000
Received: by outflank-mailman (input) for mailman id 1398753;
 Mon, 24 Aug 2026 09:32:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@swg.vates.tech>)
 id 1wyR2i-0007Gu-4k
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 09:32:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyR2h-001LEV-Eu
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 11:32:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@swg.vates.tech>)
 id 6a8c0fa9-8faa-0a2a0a5109dd-0a2a4503cea2-22
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 11:32:35 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@swg.vates.tech>)
 id 6a8c0fb2-fae8-0a2a45030019-b9ff1c23a21d-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 11:32:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0331d3dbc000c4f3.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Aug 2026 09:32:29 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B1BF181C0F;
 Mon, 24 Aug 2026 11:32:28 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=frKZvkkoHuZO+4+eIBclrbgx87D7UdiHPGG3Sjh8yOc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=My4odkJLBO7r4pTldO8P4Rz15mkVZC8//CHKMqNxraZDX7QQ4nXjO/GJaA5IOvacteE7VvUrB
 OcAoI5srn46SXYRx8M3RCBb+rlJaaDhct5TZE+t3+ScF/OGYlUYwAyTVGrKiHsKv7d69y9oYsUr
 YuL+WnFB5i5QvmhjRKrCFDJXwWQ/NwX3gEdr+8xKxBrDPVSbi9ejcvaPFJuXvgS5F+h9pmqSY32
 G2PpscrTU2cINrFJNQFNJdbrMHN2rEza1N8zS4mNVpdmYH50EVT0IOJCIbrIqaf1TILAvehh/Sp
 Bo3Aqb8Fmj84OJS48e51VpdpvSV3TZgZcUWOqmXIaGlg==
X-Zone-Loop: 3f1f859c254e0d9ecc5ab89c0d9f252527c8cfc0b01d
x-campaign-type: default
x-transaction-id: bd0b3e67-a9e3-473f-9845-76bf1b19e373
x-swg-uid: 01-52ff2f37-3c8a-4b48-bdb7-c16eb44b22d6
X-Mailer: Sweego
Message-ID:
 <1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@vates.tech>
x-swg-bid: 1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3
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
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2] public/xen.h: Update comment on mmu_update sub-command size and PTE alignment
Date: Mon, 24 Aug 2026 11:31:36 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2999.e393777c230f96c6.1a0331d3b9b.11373df49aec6867=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787563948959
X-purgate-ID: tlsNG-33051d/1787563955-6ECCB4E9-C7AF6876/0/0
X-purgate-type: clean
X-purgate-size: 4750

---=Part.2999.e393777c230f96c6.1a0331d3b9b.11373df49aec6867=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

HYPERVISOR_mmu_update passes a set of request, where each request has a poi=
nter
to the PTE along with a sub-command=2E

The PTE alignment padding is used to transport the sub-command while the r=
est
is used as an address to a PTE entry=2E The current documentation state th=
at the
2 first bits are used for sub-command, hence the other ones for PTE which
imply here a 4-bytes alignment on PTEs=2E

On PV64 and PV32-PAE guests, all pagetable PTEs are 8-bytes aligned, hence
off-by-4 PTEs addresses are always incorrect=2E Non-PAE PV32 guests used
"legacy pagetables" which had 4-byte aligned PTEs=2E However, support had
been completely removed since Xen 4=2E0, and was only available when Xen w=
as
built in 32-bits non-PAE mode [1]=2E

Current Xen logic behaves as if 3 bits are used as sub-command, thus all
off-by-4 PTEs are actually rejected as being unknown sub-commands=2E

Adjust the documentation to match the current logic implemented in Xen,
also expanding the documented sub-command parameter to 3 bits=2E

[1] 84d54d5d8b31 ("i386: Remove non-PAE hypervisor build target=2E")

Signed-off-by: Frediano Ziglio <frediano=2Eziglio@citrix=2Ecom>
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2:
* Fixed typos
* Added Frediano Ziglio S-o-B
* Added historical note regarding non-PAE Xen=2E

 xen/include/public/xen=2Eh | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/xen/include/public/xen=2Eh b/xen/include/public/xen=2Eh
index 2149b8dd38=2E=2Ecf32e74f14 100644
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
@@ -260,21 +260,26 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
  * hypercall=2E Also if so desired the OS can also try to write to the PT=
E
  * and be trapped by the hypervisor (as the PTE entry is RO)=2E
  *
+ * Note: Historically, Xen had support for non-PAE PV guests with 4-bytes=
 wide
+ *       PTEs (if Xen was built in non-PAE mode); which support got remov=
ed in
+ *       Xen 4=2E0=2E As a result, in current Xen,, all PTE are now alway=
s 8-byte
+ *       aligned which allows expanding sub-commands part (now 3-bits wid=
e)=2E
+ *
  * To deallocate the pages, the operations are the reverse of the steps
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
2=2E55=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.2999.e393777c230f96c6.1a0331d3b9b.11373df49aec6867=---

