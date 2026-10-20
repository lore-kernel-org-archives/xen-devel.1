Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99818606A31D
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 20:03:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1456180.1669685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG3L-0000gR-80; Tue, 20 Oct 2026 20:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456180.1669685; Tue, 20 Oct 2026 20:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJG3L-0000gK-4v; Tue, 20 Oct 2026 20:03:19 +0000
Received: by outflank-mailman (input) for mailman id 1456180;
 Tue, 20 Oct 2026 20:03:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1xJG3J-0000gE-Se
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:03:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJG3J-001DD3-49
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:03:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c8e7-bab6-0a2a0a5309dd-0a2a45059b30-46
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:03:16 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6ad7c904-4cb1-0a2a45050019-a0658309cb22-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 22:03:16 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 527BB842420D;
 Tue, 20 Oct 2026 16:02:32 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Marcus Granado <marcus.granado@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin@tarides.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/9] tools: optional LZ4 compression of the libxenguest migration stream
Date: Tue, 20 Oct 2026 21:02:28 +0100
Message-ID: <20261020200238.1815766-1-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1792526596-F56AD2A1-5D0A127F/0/0
X-purgate-type: clean
X-purgate-size: 6580
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This series adds optional LZ4 compression of the PAGE_DATA records of
the libxenguest migration stream.  It is off by default: a toolstack
asks for it with XCFLAGS_COMPRESS_LZ4, xl with "xl migrate --compress",
and it is compiled in only if a supported liblz4 is present.
Based on staging at 7e020a4dd6ed (2026-10-15).

v1: https://lists.xenproject.org/archives/html/xen-devel/2026-07/msg00916.html

Main changes since v1 (details in each patch):
- No new record type: PAGE_DATA's reserved field becomes a flags field
  (algorithm in bits 7-0, bit 8 for a compressed pfn array, bits 31-9
  must be zero).  New patch 1 makes receivers reject non-zero reserved
  fields.
- One LZ4 frame for each record's page data (patch 9 adds a second for
  the pfn array), with mandatory block checksums, compressed from a
  staged copy of the batch rather than from the live mapping.
- A batch is sent compressed whenever that makes it smaller (v1: below
  97%).  The 90% cut-off is unchanged: once an iteration's total after
  compression is 90% or more of its total before, compression stops for
  the rest of the save.
- xl marks compressed streams with a mandatory flag, so an older xl
  refuses them before creating the domain (new patch 8).
- New patch 9 compresses each record's pfn array too, as discussed in v1,
  so the whole record body apart from count and flags is compressed.  It
  saves a little: 0.33% of the page data bytes on a compressible guest.

Notes for reviewers:
- Patches 1-2 check PAGE_DATA's reserved field and use it to extend the
  record in place.  To allow this, they amend two general rules of the
  stream spec: reserved fields are ignored on restore, and a record type
  is extended only by adding a new one.  An old receiver rejects an LZ4
  record rather than misreading it: with patch 1, at the reserved-field
  check; without it, at its PAGE_DATA checks, at the latest the length
  check.
- Patch 9 keeps the pfn array in plaintext when the compressed record
  would have a valid uncompressed length.  This only protects receivers
  without patch 1, and can be removed once none of those remain.
- 64KB interleaved staging (compressing each 64KB as it is copied),
  suggested on v1, was measured and not taken.  It needs 64KB LZ4
  blocks, and in a dom0 benchmark it compressed 25-124% slower than
  this series' staging with 4MB blocks, on EPYC 9354 and Xeon Gold 6430
  with 0%, 50%, 90% and 100% random data.

Performance: wall time of the whole command, mean of 2-6 runs, and
change against no compression.  Ten Windows VMs of 64 GiB evacuated
together (xe host-evacuate, which returns when all ten have moved), or
one of them migrated (xe vm-migrate), while the guests:
- are idle: optimistic scenario;
- run desktop applications: average scenario;
- or run an extreme memory-write burner: a worst-case scenario.

                           off        LZ4
Intel Xeon Gold 6430, 100 Gb/s
  idle           evacuate  195s    123s  -37%
                 migrate   182s     96s  -47%
  desktop apps   evacuate  318s    197s  -38%
                 migrate   208s    156s  -25%
  memory burner  evacuate 1339s   1417s   +6%
                 migrate  1004s    992s   -1%
AMD EPYC 9354, 25 Gb/s
  idle           evacuate  260s     73s  -72%
                 migrate   167s     49s  -71%
  desktop apps   evacuate  266s    105s  -61%
                 migrate   179s     82s  -54%
  memory burner  evacuate  556s    416s  -25%
                 migrate  1833s   1883s   +3%

PV guest, xl migrate to the same host, 2 GiB, n=3: 15.1s and 2.54 GB
plain, 10.1s and 0.89 GB with --compress.

Testing: every patch builds with and without liblz4, and the Python
stream tests pass.  Out of tree, with Xen stubbed out and under gcc's
ASan and UBSan, the changed save and restore functions round-trip
uncompressed and LZ4 records with plaintext and compressed pfns, and
reject damaged and malformed ones, with every supported liblz4 release.
On XenServer hosts: performance tests; 100 migrations of a loaded guest
between two hosts; uncompressed migrations both ways between hosts with
and without the series; xl migrate of PVH and PV guests with --debug
(the receiver checks every page against a second copy: no mismatch);
xl save/restore; a sender built without a supported liblz4 fails with
--compress, as expected, before sending any guest memory; older
receivers refuse LZ4 streams cleanly; damaged streams are rejected (bad
checksum, reserved bits, unknown algorithm).  With patch 9: 200 live
migrations of loaded 64 GiB Windows VMs (100 to the same host, 100
between two hosts), evacuations of 10-VM hosts, and receivers without
patch 9 refuse the compressed pfn array stream as expected.

Marcus Granado (9):
  tools/libs/guest: reject non-zero reserved fields in PAGE_DATA
  docs/specs, tools: define the PAGE_DATA flags field
  tools/libs/guest: decompress LZ4 PAGE_DATA records on restore
  tools/libs/guest: compress PAGE_DATA records with LZ4 on save
  tools/libs/guest: stop compressing PAGE_DATA when it stops paying off
  tools/libs/guest: add XCFLAGS_COMPRESS_LZ4 to request LZ4 compression
  tools/libxl,xl: add a --compress option to xl migrate
  tools/xl: mark LZ4 migration streams with a mandatory header flag
  tools/libs/guest: compress the PAGE_DATA pfn array too

 CHANGELOG.md                             |   3 +
 docs/man/xl.1.pod.in                     |   8 +
 docs/specs/libxc-migration-stream.pandoc | 108 +++++++++-
 tools/include/libxl.h                    |   1 +
 tools/include/xenguest.h                 |   5 +-
 tools/libs/guest/Makefile                |   2 +-
 tools/libs/guest/xg_sr_common.h          |  39 ++++
 tools/libs/guest/xg_sr_restore.c         | 243 ++++++++++++++++++++--
 tools/libs/guest/xg_sr_save.c            | 250 +++++++++++++++++++++++
 tools/libs/guest/xg_sr_stream_format.h   |  18 +-
 tools/libs/light/libxl_dom_save.c        |   4 +-
 tools/libs/light/libxl_domain.c          |   1 +
 tools/libs/light/libxl_internal.h        |   1 +
 tools/python/xen/migration/libxc.py      |  90 +++++++-
 tools/python/xen/migration/tests.py      |  87 +++++++-
 tools/xl/xl.h                            |   7 +-
 tools/xl/xl_cmdtable.c                   |   2 +
 tools/xl/xl_migrate.c                    |  21 +-
 tools/xl/xl_saverestore.c                |   7 +-
 19 files changed, 850 insertions(+), 47 deletions(-)


base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
-- 
2.43.0


