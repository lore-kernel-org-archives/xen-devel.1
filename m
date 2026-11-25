Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6499606A329
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 08:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=GnMJ55aj
Received: from list by lists.xenproject.org with outflank-mailman.1501894.1697895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8ZH-0000dL-PT; Wed, 25 Nov 2026 08:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501894.1697895; Wed, 25 Nov 2026 08:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8ZH-0000dE-Mu; Wed, 25 Nov 2026 08:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1501894;
 Wed, 25 Nov 2026 08:41:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a211dde4c80000fa0@swg.vates.tech>)
 id 1xW8ZG-0000d7-L0
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 08:41:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW8ZF-006AO6-TO
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:41:29 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a211dde4c80000fa0@swg.vates.tech>)
 id 6b069f39-e002-0a2a0a5209dd-0a2a450ccf34-0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:41:29 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a211dde4c80000fa0@swg.vates.tech>)
 id 6b069f39-f479-0a2a450c0019-b9ff1c22ad55-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:41:29 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a211dde4c80000fa0.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 25 Nov 2026 08:41:24 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 48E7A8298E;
 Wed, 25 Nov 2026 09:41:23 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=82uAfTDnqVAKSG5a77QsF1MTM4c4Xzbc2rr+dRQxpWU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GnMJ55ajSKlqdRq3o45HbJPN8OokNDMWV9M0kOh2OxUsAH/JYMKCQ1EuQ6nbbcLJuXN/Rttor
 4RIvFyyUZf3BkrcDaUm1/uWWg8Op/qtVvcMiHbFhqjZ0JbyPKi5okZal52cRe8bjhLkyeFiOVXP
 hrjZGlGsosTLffCvN55Slv4s43E5JGL4hfDAWq7dmqEDTBu7QfNDXKT1FlJLis4+KllJByLAfoS
 GWNXDfzi3Ks8/cWevsGM9JdrisK+EJBSgD3tG/s7kxs5Dl6awBFEFGGnO4s2M6ojZ7ynt48ZQ1D
 b3cwqgodKe5empUkjTvigpQLuR0d/23npUJ0c/dE8ZTA==
X-Zone-Loop: 8e6f631c5ca7fac6c43f803364f30aca78eadc218225
x-campaign-type: default
x-transaction-id: a3be5402-dbb6-476d-8d42-1008832e7cd7
x-swg-uid: 01-04189a84-687c-4c03-a0df-71b2ecb212ad
X-Mailer: Sweego
Message-ID:
 <1795596084.8631fc262581453bbf619ec5b2062170.1a211dde4c80000fa0@vates.tech>
x-swg-bid: 1795596084.8631fc262581453bbf619ec5b2062170.1a211dde4c80000fa0
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH] xen/arm: efi: reset bootinfo banks before retrying ExitBootServices()
Date: Wed, 25 Nov 2026 09:41:17 +0100
In-Reply-To: <3d783a50-06bc-4c6b-815e-bd42ce5e54d1@arm.com>
References: <3d783a50-06bc-4c6b-815e-bd42ce5e54d1@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.15c.f6efd37c88a3a858.1a211dde221.86262c3c3c42e79f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795596083751
X-purgate-ID: tlsNG-d25034/1795596089-51339A5B-8D965CBE/0/0
X-purgate-type: clean
X-purgate-size: 3046
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.15c.f6efd37c88a3a858.1a211dde221.86262c3c3c42e79f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

efi_exit_boot() retries ExitBootServices() once if the first call fail=2E
But each pass calls efi_arch_process_memory_map(), which on Arm appends
the memory regions to bootinfo_get_mem() (and bootinfo_get_acpi() with
CONFIG_ACPI) without clearing what the previous pass added=2E

After a retry every RAM bank is therefore registered twice, and
populate_boot_allocator() hits a BUG in bootmem_region_add() on the
overlapping ranges:

  (XEN) RAM: 0000000040000000 - 000000004668ffff
  (XEN) RAM: 0000000040000000 - 000000004668ffff
  =2E=2E=2E
  (XEN) Xen BUG at common/page_alloc=2Ec:308
  (XEN)    [<=2E=2E=2E>] page_alloc=2Ec#bootmem_region_add+0xd8/0xec (PC)
  (XEN)    [<=2E=2E=2E>] init_boot_pages+0x44/0x1b0
  (XEN)    [<=2E=2E=2E>] bootinfo=2Ec#dt_unreserved_regions+0x70/0xac
  (XEN)    [<=2E=2E=2E>] populate_boot_allocator+0x124/0x1c8
  (XEN)    [<=2E=2E=2E>] setup_mm+0x60/0x84
  (XEN)    [<=2E=2E=2E>] start_xen+0x118/0x988

This is hit with edk2 since commit 12c5ded287 ("FatPkg: Clean any volume
caches during exit boot services"), which flushes FAT volumes from an
EFI_EVENT_GROUP_BEFORE_EXIT_BOOT_SERVICES handler and can change the
memory map during the first ExitBootServices() call=2E It reproduces on
QEMU virt with a Debian qemu-efi-aarch64 2026=2E08 package when xen=2Eefi =
is
started directly from the ESP=2E

Reset the bank counters at the start of each pass so the bootinfo view
is rebuilt from the current memory map=2E x86 already does the equivalent
by resetting e820_raw=2Enr_map in efi_arch_process_memory_map()=2E

Reported-by: Pierre Gondois <pierre=2Egondois@arm=2Ecom>
Suggested-by: Pierre Gondois <pierre=2Egondois@arm=2Ecom>
Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/arm/efi/efi-boot=2Eh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot=2Eh b/xen/arch/arm/efi/efi-boot=2Eh
index 069cc68b0a=2E=2E44ebc9fbba 100644
--- a/xen/arch/arm/efi/efi-boot=2Eh
+++ b/xen/arch/arm/efi/efi-boot=2Eh
@@ -197,6 +197,16 @@ static EFI_STATUS __init efi_process_memory_map_booti=
nfo(void *map,
 {
     int Index;
=20
+    /*
+     * efi_exit_boot() may retry after EFI_INVALID_PARAMETER from
+     * ExitBootServices()=2E Rebuild the bootinfo view from scratch on ea=
ch
+     * pass so later boot allocator population doesn't see duplicate bank=
s=2E
+     */
+    bootinfo_get_mem()->nr_banks =3D 0;
+#ifdef CONFIG_ACPI
+    bootinfo_get_acpi()->nr_banks =3D 0;
+#endif
+
     for ( Index =3D 0; Index < (mmap_size / desc_size); Index++ )
     {
         EFI_MEMORY_DESCRIPTOR *desc_ptr =3D map + desc_size * Index;
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.15c.f6efd37c88a3a858.1a211dde221.86262c3c3c42e79f=---

