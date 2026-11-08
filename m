Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10DF606A31C
	for <xen-devel@archiver.kernel.org>; Sun,  8 Nov 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+SlQOYJ
Received: from list by lists.xenproject.org with outflank-mailman.1478800.1683112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPyUF-0006FC-Gx; Sun, 08 Nov 2026 08:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1478800.1683112; Sun, 08 Nov 2026 08:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPyUF-0006F4-CS; Sun, 08 Nov 2026 08:42:51 +0000
Received: by outflank-mailman (input) for mailman id 1478800;
 Sun, 08 Nov 2026 08:42:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rppt@kernel.org>) id 1xPyUE-0006Ey-8l
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 08:42:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPyUC-000bDa-2U
 for xen-devel@lists.xenproject.org; Sun, 08 Nov 2026 09:42:48 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rppt@kernel.org>)
 id 6af035ad-bab6-0a2a0a5309dd-0a2a450ad8ac-22
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 09:42:48 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <rppt@kernel.org>)
 id 6af03606-f2d2-0a2a450a0019-aceafc1fbeb2-3
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2026 09:42:47 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 62AF1448C4;
 Sun,  8 Nov 2026 08:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7861F0089F;
 Sun,  8 Nov 2026 08:42:43 +0000 (UTC)
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
	s=k20260515; t=1794127365;
	bh=OvMwR2q246pcD5TId5yUQvPErCrIqP4Yqwl75kEJdv4=;
	h=From:Date:Subject:To:Cc;
	b=R+SlQOYJPlqMQtkVfLLLVQdln/NbRUqFxW6q8kybGmJI1Ss8JrmkDqLK/CPMlI6as
	 bIXH2ERjSanKhItHNzpQp2YWjyNIbJLQKMRBKCdsaiTxa+iQRwJ0iv2IK5Lmeqt4hM
	 ln8SZIfloQ24RJTpkL7MMm8AkApe/fkzdJGLQ7fuN1nzuSK9MMQHP/XQObI2TnFjkz
	 CHMCXy2uwEqTAXbWzPX0orhE1GqNVNEsTOapZD60AsVPV0SLpQvHGH7aILXYgo9SVh
	 jJhXEO65lpzewbkcFZBljrIEo2uiIRgtJO+HutILFfIQJnCcX5OWF8pnNCN8C/3Blo
	 9TazDZceW7c6A==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 08 Nov 2026 10:42:40 +0200
Subject: [PATCH] xen/events: replace __get_free_pages() with kmalloc()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-b4-xen-v1-1-76095f25cbf4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMAxFf0XyvDItpeB+ZewhrVEzWByJDkH89
 7Xb47mccw8wUiaDW3OA0oeNFynQXRrIM8pEjofC4Fsf2+iDS8HtJA67PETfZ+rHAEV+K428/47
 ujz/blp6U11pXI6GRS4qS5zotyhPL9YW2ksJ5fgHuiZ8TigAAAA==
X-Change-ID: 20260624-b4-xen-a1cd629ce9f4
To: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: David Hildenbrand <david@kernel.org>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.1-dev
X-purgate-ID: tlsNG-4011c0/1794127367-51CC3CFC-282494F1/0/0
X-purgate-type: clean
X-purgate-size: 2320
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

set_evtchn_to_irq() allocates a page for the event channel to IRQ
number software lookup table.

This buffer can be allocated with kmalloc() as there's nothing special
about it to go directly to the page allocator.

kmalloc() provides a better API that does not require ugly casts and
kfree() does not need to know the size of the freed object.

Performance difference between kmalloc() and __get_free_pages() is not
measurable as both allocators take an object/page from a per-CPU list for
fast path allocations.

For the slow path the performance is anyway determined by the amount of
reclaim involved rather than by what allocator is used.

Replace use of __get_free_pages() with kmalloc() and free_pages() with
kfree().

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
 drivers/xen/events/events_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index fd16d652c81f2..8c377493429b7 100644
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

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260624-b4-xen-a1cd629ce9f4

--
Sincerely yours,
Mike.


