Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41837606A681
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VZI6SFsB
Received: from list by lists.xenproject.org with outflank-mailman.1501494.1697541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-0007rY-AD; Tue, 24 Nov 2026 23:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501494.1697541; Tue, 24 Nov 2026 23:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzqh-0007pl-3e; Tue, 24 Nov 2026 23:22:55 +0000
Received: by outflank-mailman (input) for mailman id 1501494;
 Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xVzqd-0007o7-Ne
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:22:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzqd-005lV7-4C; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c22-bab6-0a2a0a5309dd-0a2a4503b900-24
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:51 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+7be3010b4cb4d9f5c1a9+8493+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6b061c49-fae8-0a2a45030019-5a9b3222e7bc-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:49 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqZ-0000000Gdhw-3GD6; Tue, 24 Nov 2026 23:22:48 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000061n-0jZH;
 Tue, 24 Nov 2026 23:22:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UhsfjYUkefenudq7k8katnMa4HWcZvDO5UQ4amhsZi0=; b=VZI6SFsB2tJKEOmodYze3pyZs9
	HXpSlLdbJq8Wdo0KwYk9sO31sebtfK8VlPb681SrMYvbbuLVMv/Y9uLJkS2beE/ETTmYItpIjbM2s
	CDN1Hcz4cXNMLgG7MCzU56p2Sc0zcRZoIGV4+kwaEjUkKTSjS1wp07Csa0OiF7rqTPbyphlykT93J
	opLHI76b9QL/WWjV00+UzTGtP/lCmuu333SObyfXcDPVRTbWmZCzC+DDc3b1S6SGml1LTdGkUcEck
	H/ci+Onlp9Yir3guE5WjZF3Bzd+g/wcz31/ax0czz/01msyfjuCe8ipUumCLSwVkUcP7SaCcUofoQ
	8Nr0Ccug==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Hui Peng <benquike@gmail.com>,
	Mark Syms <mark.syms@citrix.com>,
	Feifan Qian <bea1e@proton.me>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v1 00/21] hw/xen, i386/xen: security and robustness fixes
Date: Tue, 24 Nov 2026 23:22:26 +0000
Message-ID: <20261124232247.23169-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-33051d/1795562571-6E8CD4E9-9ECC13ED/0/0
X-purgate-type: clean
X-purgate-size: 5484
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Addressing the backlog of mostly AI-discovered issues in the KVM/Xen
support.

Disclaimer: The fixes here were diagnosed by AI, fixed by AI, the
commit messages written by AI, and all the testing done by AI. And
then the new things which I would *never* have found if I'd have to do
all the typing myself were also fixed the same way. All under my close
direction, occasionally completely redirecting the way it wanted to do
things and rewriting its prose from scratch — but still AI first.

You can stop reading now if that's a problem. I was hoping to see the
policy changes¹ go in first and send these fixes afterwards, but that
still hasn't happened. Nevertheless, I have neither the time nor the
inclination to do a complete clean room implementation with my own
meat fingers. Take it or leave it, or tell me to wait for the official
policy change.

This fixes:

 • CVE-2026-61403: xen_xenstore get_req() copies a full header length
   regardless of how much was already consumed, so a guest feeding the
   header in two parts overshoots req_offset and the next length
   calculation underflows: a guest-controlled linear heap overwrite.
 • CVE-2026-123069: the per-vCPU Xen timers survive ACPI ejection of
   their vCPU, with the freed CPUState as the callback opaque.
 • CVE-2026-123070: PHYSDEVOP_eoi and irq_status_query index the PIRQ
   tables with no bounds check (OOB read).
 • CVE-2026-123071: the xen-console output trim underflows when the
   frontend sets a small enough 'limit' — up to ~2 KiB of
   guest-controlled bytes written *before* the buffer.
 • CVE-2026-123072: xen-9p-backend re-reads the guest's ring indices
   after validating the request, so the iovecs can reach up to 1 MiB
   past the end of the ring mapping (OOB read, disclosable via Twrite).
 • CVE-2026-123074: grant copy segments weren't validated against the
   page size. I don't believe this one is guest-reachable in-tree
   (xen-block already bounds its segments), so this is hardening to
   match Xen's GNTST_bad_copy_arg.

(CVE-2026-123073 was also assigned from the same combined report, but
it's simply a duplicate of CVE-2026-61403 above. I think that wants
rejecting.)

Followed by a handful of other issues found on the journey, including
the XenBus InitWait ordering regression reported by Mark Syms².

Patches 20-21 fix the two Coverity CIDs (1527403, 1507603) and
conflict textually with the lock-guard conversion recently posted³.
That conversion doesn't actually fix the bug that Coverity was whining
about, so I'd suggest these go first.

Testing: each original report's reproducer triggers its ASan signature
on the unfixed tree and is clean with the fix applied; the KVM/Xen
functional tests pass; a real Fedora guest with PV console and disk
survives kexec soft-reset cycles (although that surfaces a handful of
kexec and kdump issues which I'm looking at separately).

¹ https://lists.gnu.org/archive/html/qemu-devel/2026-09/msg00260.html
² https://lore.kernel.org/qemu-devel/178912129220.24041.799369954881004447@citrix.com
³ https://lore.kernel.org/qemu-devel/20261101150847.29157-1-drifabdelmalekmohamedsaid@gmail.com


David Woodhouse (21):
  hw/xen: Fix partial request header handling in emulated XenStore
  i386/xen: Don't resample GSI when per-vCPU upcall vector is in use
  i386/xen: Free Xen vCPU timers when a vCPU is destroyed
  hw/xen: Publish backend features before setting state to InitWait
  hw/i386/kvm/xen_gnttab: Fix error handling in xen_be_gnttab_map_refs()
  hw/xen: Validate grant copy segments against the page size
  hw/i386/kvm/xen_evtchn: Validate PIRQ numbers in physdev operations
  hw/i386/kvm/xen_evtchn: Fix off-by-one in do_remove_pci_vector()
  i386/xen: Don't inject event on invalid port in qmp_xen_event_inject()
  hw/i386/kvm/xen_evtchn: Reuse existing backend port in find_be_port()
  hw/i386/kvm/xen: Don't leak gnttab handle on reset
  hw/i386/kvm/xen_xenstore: Apply offset before truncation in
    xs_append_strings()
  hw/char/xen_console: Fix buffer trim when size exceeds twice the limit
  hw/9pfs/xen-9p-backend: Use validated snapshot for request iovecs
  hw/9pfs/xen-9p-backend: Validate the request header size field
  hw/9pfs/xen-9p-backend: Validate frontend-supplied connect parameters
  hw/9pfs/xen-9p-backend: Close event channel handle on disconnect
  hw/net/xen_nic: Bound the TX and RX rings' producer index
  hw/xen: Bound the rep count of PIO and MMIO ioreqs
  hw/i386/kvm/xen_evtchn: Hold port_lock for whole of bind_pirq_op
  hw/i386/kvm/xen_evtchn: Allow unmapping an emulated MSI PIRQ

 hw/9pfs/xen-9p-backend.c          | 65 +++++++++++++++++--------------
 hw/char/xen_console.c             | 20 +++++++---
 hw/i386/kvm/xen_evtchn.c          | 59 ++++++++++++++++++----------
 hw/i386/kvm/xen_gnttab.c          | 22 ++++++++++-
 hw/i386/kvm/xen_primary_console.c |  3 ++
 hw/i386/kvm/xen_xenstore.c        | 31 +++++++++------
 hw/net/xen_nic.c                  |  9 ++++-
 hw/xen/xen-bus.c                  | 16 +++++++-
 hw/xen/xen-hvm-common.c           | 19 ++++++++-
 hw/xen/xen-operations.c           | 11 ++++++
 target/i386/kvm/kvm.c             |  6 +++
 target/i386/kvm/xen-emu.c         | 49 ++++++++++++++++++++++-
 target/i386/kvm/xen-emu.h         |  1 +
 13 files changed, 235 insertions(+), 76 deletions(-)

-- 
2.43.0


