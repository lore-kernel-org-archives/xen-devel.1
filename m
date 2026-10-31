Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C8606A324
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=UMXRmLLA
Received: from list by lists.xenproject.org with outflank-mailman.1466758.1676594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNRXm-0007Gc-SX; Sun, 01 Nov 2026 09:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466758.1676594; Sun, 01 Nov 2026 09:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNRXm-0007GV-Nx; Sun, 01 Nov 2026 09:08:02 +0000
Received: by outflank-mailman (input) for mailman id 1466758;
 Sat, 31 Oct 2026 13:22:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hippalectryon@protonmail.com>) id 1xN92f-0000yh-P0
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 13:22:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xN92e-00CGf8-RT
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 14:22:40 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hippalectryon@protonmail.com>)
 id 6ae5eb81-e002-0a2a0a5209dd-0a2a4504deec-24
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 14:22:40 +0100
Received: from [109.224.244.28] (helo=mail-24428.protonmail.ch)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hippalectryon@protonmail.com>)
 id 6ae5eba0-b57f-0a2a45040019-6de0f41c8a5f-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 14:22:40 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Cc:Subject:Message-ID:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793452959; x=1793712159;
	bh=Pyv3gFJcRcLxJPgmWMAiEaUERPQvoCSqmhyXW8/Iubw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UMXRmLLAFOg60ScsSxvNjj06tAJNsC7BBhQ2DWVZFomD9a/QKNQL5pn+tDygUdhpB
	 sPmJaMcSquyZD3ehMr/FuZcunU6EqZS2SoEuJCm/YcVswzeTP497WZGpgiOyFWVef+
	 M4SErhiAFvD+DpnJOcIPNprGfsFjx76U+MN/Mqjza7H1ZkutET8olnOoYlGMIQ8PHD
	 AZcTNCAN1dg5uvNKfueCPqgL6lI6pN3v9wdAGgfsxP66Ws4Uddvc7LP4irLXH0XMxM
	 NJ+dB9648/GwL4yL3ToNUt2GzYNVAYzcV5c3zS0El6Fb25LbT0uAbxSaTh1NknXu/E
	 yLMJujWjF96QQ==
Date: Sat, 31 Oct 2026 13:22:34 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: hippalectryon@protonmail.com
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "roger@xenproject.org" <roger@xenproject.org>
Subject: x86/p2m: mapping a grant of a domain's own page on HVM/PVH  unmaps the original gfn
Message-ID: <2DneAh-CXJlcHA5aISMPcKJm8Q8kOW2_02w_fam2if2BB1WKUlNRB7RLXeSEJWSUvIwhUBQwvGFytpWa-avIgPdmGb7qYPViE9jDnXyrnsM=@protonmail.com>
Feedback-ID: 1135737:user:proton
X-Pm-Message-ID: 9b41e0315081ef224e0554c8d1c04f9b2c1d5a81
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1793452960-52ECEB50-C3C9BC48/0/0
X-purgate-type: clean
X-purgate-size: 3404
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On x86 HVM/PVH, when a domain maps a grant that it issued to itself
(granting domid =3D=3D own domid), the original gfn of the granted page
loses its backing. I ran into this while looking at why Qubes OS
blocks vchan connections from a domain to itself:
https://github.com/QubesOS/qubes-issues/issues/951

I tested this on Xen 4.19.5 (Qubes OS R4.3 build, running nested)
with a PVH Linux 6.18 guest, from inside the guest using libxengnttab
(gntalloc + gntdev) and libxenevtchn with the guest's own domid as the
peer. Here's what I see:

- xengntshr_share_pages() to own domid, then
  xengnttab_map_grant_ref() of that ref: both succeed.
- The new mapping reads the page's old contents (zeros). The
  granter's own mapping of the page then reads all 0xff, and writes
  through it are lost. This stays the case after unmap.
- Seconds later the guest oopses in fork (__split_huge_pmd_locked, a
  page table entry read as all ones): Linux reused the lost frame as a
  page table.
- With libxenvchan the server reads the ring's cli_live byte as 0xff
  and both sides hang.
- Event channels bound to self work fine. Without the map step the
  shared page behaves normally.

Reading the code, I believe the cause is in p2m_add_page(), which the
grant map reaches via create_grant_p2m_mapping(). Its second loop
looks up the M2P entry of every frame owned by d, and if the frame is
already mapped at another gfn, it treats the new mapping as a move and
calls p2m_remove_entry() on the old gfn. For a foreign grant owner !=3D d
and the loop skips it, but for a grant of d's own page the original gfn
gets removed. On unmap, replace_grant_p2m_mapping() only removes the
grant entry, so the original gfn never comes back.

The check dates from b37d30c8fc ("Mapping grant references into HVM
guests, take 2"), whose comment said "If we get here, we know the
local domain owns the page, so it can't have been grant mapped in".

This change fixes it for me. I tested it on 4.19.5 with the Qubes
patches, and it applies to current staging:

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ p2m_add_page()
-        if ( owner !=3D d )
+        /*
+         * A grant mapping of a domain's own page adds a second gfn for it=
;
+         * the page must stay mapped at its original gfn.
+         */
+        if ( owner !=3D d || p2m_is_grant(t) )
             continue;

p2m_add_page() already leaves M2P alone for grant types, and unmap
goes through p2m_remove_entry(), which leaves M2P alone for
P2M_SPECIAL_TYPES, so the original gfn's M2P entry stays valid.

With this change, the self-mapped page reads and writes correctly in
both directions, the original mapping still works after unmap, there
is no oops, and libxenvchan loopback works. After also removing
qrexec's loopback checks, qrexec calls and file copies from a guest to
itself worked too, including concurrent calls and killing both ends
in the middle of a transfer. A build of the same tree without the
change fails the same way as stock.

I haven't tested PV guests (I couldn't boot one on this setup),
migration or log-dirty mode, or Xen versions other than 4.19.5.

I can't send a signed-off patch myself. If the fix looks right, could
someone pick it up, or suggest a better approach (for example
rejecting such mappings instead)?

Thanks,
Hippalectryon

