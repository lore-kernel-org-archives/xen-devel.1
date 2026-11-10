Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6712606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKPLbiiv
Received: from list by lists.xenproject.org with outflank-mailman.1480712.1684478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg3w-0008F8-Mh; Tue, 10 Nov 2026 07:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480712.1684478; Tue, 10 Nov 2026 07:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQg3w-0008F1-JW; Tue, 10 Nov 2026 07:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1480712;
 Tue, 10 Nov 2026 07:14:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rppt@kernel.org>) id 1xQg3v-0008Et-Gr
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 07:14:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQg3u-00DVMK-U1
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 08:14:34 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rppt@kernel.org>)
 id 6af2c43f-bab6-0a2a0a5309dd-0a2a450ab6d8-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:14:34 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rppt@kernel.org>)
 id 6af2c459-f2d2-0a2a450a0019-ac6904feb7f0-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 08:14:34 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CBEBF63792;
 Tue, 10 Nov 2026 07:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DFA1F0089F;
 Tue, 10 Nov 2026 07:14:30 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294872;
	bh=JeBczRWUIYEnZGuPHhbnKleDwqSoORE3VajfVV+2ChI=;
	h=From:Date:Subject:To:Cc;
	b=fKPLbiivanrEzD0lDTSnLnW+s/csuy7zmF/rQB69ecBnZGkkMcGW82NV5pFLA16bh
	 84z8u8ZKsezk0gYvkBpaWKmkB/ti1yMKn+uXWxAze4muXfT6Q9+ylkElk9VeSLKbd3
	 3URD86VRiixps3P+Z8PM+90U+NYNcy2eMdKeOMdHhJ++2/mcCNMufVBbVJJMfzG/p2
	 mc28TlVdjw+vnhpCmNyhtsqkpeGz5K5ogqQGT0HmG2L8a3nUHWOjuOA6DL49rUoXRX
	 vkQgdAghDuSKqy1+cSnm7w8cRkNFX/e5T8W6ZAVKr5foh+Vkwbr1ayP8ewc73Vd0Fp
	 DzSaXhkrVZFZg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 10 Nov 2026 09:14:27 +0200
Subject: [PATCH v2] xen/events: replace page allocator calls with
 k[mz]alloc()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-b4-xen-v2-1-21ece28be7d4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOzQ6CMBCEX4X0bJU2pYon38NwaMsW1p/WbJFgC
 O8uxXj8ZmZndmYJCCGxczEzghETxrCC3BXM9SZ0wLFdmclS6lJLxa3iEwRuhGu1rB3UXrE1/CL
 wOG1F1+bH6W1v4IZ8nRPWJOCWTHB9liJhh+HwNGkAyn6PaYj02T4ZRe7ZRoUoT//RUXDBj7qsK
 y8rZ7263IECPPaROtYsy/IFeJUJSc8AAAA=
X-Change-ID: 20260624-b4-xen-a1cd629ce9f4
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev
X-purgate-ID: tlsNG-4011c0/1794294874-4B2D8CFC-4F5B5F29/0/0
X-purgate-type: clean
X-purgate-size: 3404
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

set_evtchn_to_irq() allocates a page for the event channel to IRQ
number software lookup table and xen_init_IRQ() allocates the PIRQ EOI
bitmap that is registered with the hypervisor in PV domains.

These buffers can be allocated with kmalloc() as there's nothing special
about them to go directly to the page allocator. The PIRQ EOI bitmap is
passed to the hypervisor by its frame number and must occupy a whole
page, which is guaranteed for a PAGE_SIZE kmalloc() allocation as it is
naturally aligned.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_pages() with kmalloc(), __get_free_page() with
__GFP_ZERO with kzalloc() and free_page[s]() with kfree().

Link: https://lore.kernel.org/all/635405e4-9423-4a25-a6e7-e03c8ea0bcbe@redhat.com
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
This is a (small) part of larger work of replacing page allocator calls
with kmalloc.

Largely, anything that doesn't need struct page (or a memdesc in the
future) should just use kmalloc() or kvmalloc() to allocate memory.
Removing needless calls to page allocator helps with memdesc (aka project
folio) conversion and gives a nicer API without casts.
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261108-b4-xen-v1-1-76095f25cbf4@kernel.org
---
 drivers/xen/events/events_base.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index fd16d652c81f2..9828ed41d7a7f 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -230,7 +230,7 @@ static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 		if (irq == -1)
 			return 0;
 
-		evtchn_row = (int *) __get_free_pages(GFP_KERNEL, 0);
+		evtchn_row = kmalloc(PAGE_SIZE, GFP_KERNEL);
 		if (evtchn_row == NULL)
 			return -ENOMEM;
 
@@ -241,7 +241,7 @@ static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 		 * thread was faster inserting it, we can drop ours.
 		 */
 		if (cmpxchg(&evtchn_to_irq[row], NULL, evtchn_row) != NULL)
-			free_page((unsigned long) evtchn_row);
+			kfree(evtchn_row);
 	}
 
 	WRITE_ONCE(evtchn_to_irq[row][col], irq);
@@ -2314,11 +2314,11 @@ void __init xen_init_IRQ(void)
 		int rc;
 		struct physdev_pirq_eoi_gmfn eoi_gmfn;
 
-		pirq_eoi_map = (void *)__get_free_page(GFP_KERNEL|__GFP_ZERO);
+		pirq_eoi_map = kzalloc(PAGE_SIZE, GFP_KERNEL);
 		eoi_gmfn.gmfn = virt_to_gfn(pirq_eoi_map);
 		rc = HYPERVISOR_physdev_op(PHYSDEVOP_pirq_eoi_gmfn_v2, &eoi_gmfn);
 		if (rc != 0) {
-			free_page((unsigned long) pirq_eoi_map);
+			kfree(pirq_eoi_map);
 			pirq_eoi_map = NULL;
 		} else
 			pirq_needs_eoi = pirq_check_eoi_map;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260624-b4-xen-a1cd629ce9f4

--
Sincerely yours,
Mike.


