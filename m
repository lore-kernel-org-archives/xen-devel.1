Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB69C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:49:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366720.1616667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFH-00064g-V2; Mon, 20 Jul 2026 15:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366720.1616667; Mon, 20 Jul 2026 15:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFH-00064Z-Qz; Mon, 20 Jul 2026 15:49:31 +0000
Received: by outflank-mailman (input) for mailman id 1366720;
 Mon, 20 Jul 2026 15:49:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFF-00064T-TW
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:49:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFF-00CFQ6-5e
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:49:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e4387-e002-0a2a0a5209dd-0a2a450bacbc-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:29 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e4388-b7e8-0a2a450b0019-a0658309d8a6-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:49:29 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 0668D8291CA3;
 Mon, 20 Jul 2026 11:47:46 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: [PATCH v1 0/6] tools: optional LZ4 compression of the libxenguest migration stream
Date: Mon, 20 Jul 2026 16:48:25 +0100
Message-ID: <20260720154832.1907401-1-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784562569-188C99EA-9387D184/0/0
X-purgate-type: clean
X-purgate-size: 7126

Hello,

This series adds optional LZ4 compression of the REC_TYPE_PAGE_DATA records
of the libxenguest migration stream, reducing the data transferred during
live migration (and suspend-to-file).
It is opt-in for:
* the build: compiled in only when liblz4 is present (HAVE_LZ4), which
  tools/configure already autodetects
* the toolstack: via new flag XCFLAGS_COMPRESS_LZ4 (off by default)
* libxl: via new option xl migrate --compress

Example usage:

 xl -vvv migrate --compress <vm> <destination host>

 xc: detail: fd .., dom .., flags 5, hvm  <= 5: XCFLAGS_COMPRESS_LZ4 is on
 xc: debug: LZ4: 4190208 -> 20732 bytes (0.5% ratio) <= compress 4MB batch
 ...
 Migration successful.


Motivation
==========

It's common for recent VMs to have large memory footprints. This increases
the effort to stream the memory during live migration or suspend, as the
streamed data hops across several steps before the VM memory reaches the
intended endpoint. The stream is encrypted, transmited over the network or
persisted in storage, decrypted at the endpoint etc. In each step, CPU
could have been saved and I/O data paths avoided bottlenecks if the stream
had been compressed as close to the origin of the data as possible.
Compressing at the first opportunity, inside libxenguest:
* keeps the compressor co-located with the guest page mapping so the fast
  path can be made zero-copy from the guest page into the compressor,
* saves on the amount of data copied/piped across processes in dom0,
* saves on the amount of data transmitted/persisted.

The LZ4 compression has a small cost, but this cost is amortized across all
the operations above, resulting in a net gain (see below). LZ4 was chosen
for its very high compression/decompression throughput on commodity CPUs,
low memory footprint, and the existence of a stable common upstream
library (liblz4).

We found the use of compression useful in general when migrating individual
VMs, as LZ4 typically halves or better the streamed data, and especially
useful when:
* migrating several VMs in parallel, as the net savings in CPU and I/O data
  paths reduce bottlenecks in dom0.
* networks are slow, as less data is transmitted
* many pipelined processes in dom0 are used to manipulate the stream data,
  as the dom0 kernel avoids data copy and scheduling activities.


Wire format
===========

A new record type REC_TYPE_PAGE_DATA_LZ4 (0x00000013) is added. It shares
the existing xc_sr_rec_page_data_header layout but the trailing payload is
a sequence of per-page sub-blocks: for each page a uint16 little-endian
length `clen` then `clen` octets of a independently compressed page,
or the raw page when clen == 0.
Senders that do not opt in continue to emit REC_TYPE_PAGE_DATA exactly as
before; receivers built without liblz4 produce a clear error when they meet
a compressed record rather than the generic "unrecognised record"
diagnostic.


Compatibility
=============

* Default behaviour is unchanged: without XCFLAGS_COMPRESS_LZ4 (or
  xl migrate --compress), the stream is byte-for-byte identical to before
  this series.
* A receiver that includes this series can decompress streams from any
  sender (legacy or compressed)
* If the toolstack asks for compression but libxenguest was built
  without liblz4, xc_domain_save() fails immediately with EOPNOTSUPP
  rather than silently emitting an uncompressed stream.


Testing
=======

Tested with xl migrate --compress and with a patched version of XAPI.


Measurements
============

XAPI host-evacuation scenario: 64GB VMs, dom0 with 16 vCPUs, stunnel-
encrypted migration transport, where
* hosts: 2x Intel Xeon Gold 6430, 1TB DDR5-4800, NIC 100 Gbps
* VM: 12 vCPUs, 64GB RAM, Windows OS
show significant wall-clock reduction when LZ4 compression is enabled.

Test           = time xe host-evacuate (for 10x VMs)
evacuate_ratio = host_evacuate_time_with_LZ4 / host_evacuate_without_LZ4
LZ4_ratio      = transmitted_LZ4_compressed_memory / total_VM_memory

Host Evacuation: Scenario 1: (BEST CASE)
----------------------------------------
guest load:
* VMs idle just after reboot
LZ4  LZ4_ratio  evacuate_time  evacuate_time_ratio
off  -          3m18s          100% (baseline)
on   1.4%       1m44s          52% when LZ4 is on

Host Evacuation: Scenario 2: (AVERAGE CASE)
-------------------------------------------
guest load: 
* VMs running desktop apps in loop for 1 hour before migration
LZ4  LZ4_ratio  evacuate_time  evacuate_time_ratio
off  -          3m18s          100% (baseline)
on   7.0%       2m02s          62% when LZ4 is on

Host Evacuation: Scenario 3: (WORST CASE)
-----------------------------------------
guest load:
* 100% constant CPU load quickly dirtying all memory pages
* all memory filled with random uncompressible buffers
* constant swapping to disk
LZ4  LZ4_ratio  evacuate_time  evacuate_time_ratio
off  -          23m12s         100% (baseline)
on   98.8%      23m25s         101% when LZ4 is on

The scenario 3 is the expected upper bound of time when LZ4 compression is
used, and it's around 101% compared to when LZ4 compression is not used.
The limit of 1% maximum overhead when compression is enabled is due to:
* using a fast LZ4 compression/decompression algorithm
* if the 4MB compressed batch ratio is >97%, then send uncompressed to
  save the time that would be used decompressing on the receiver.
* if a whole iteration of migration achieves >90% LZ4_ratio, then
  disable compression for the subsequent iterations.

The thresholds are conservative: 97% per-batch compresses only when it
saves over 3% (when compression is more likely to repay decompression),
and 90% per-iteration disables compression for the rest of the migration
once a iteration saves under 10% (effectively uncompressible). Together
they cap the worst case (Scenario 3) at about 1% over uncompressed.


Patch summary
=============
 
 1. tools/migration: introduce PAGE_DATA_LZ4 stream record type
     - define `REC_TYPE_PAGE_DATA_LZ4` (0x00000013)
 2. tools/libs/guest: decompress PAGE_DATA_LZ4 records on restore
     - empower the receiver to handle and decompress incoming LZ4 payloads
 3. tools/libs/guest: compress PAGE_DATA with LZ4 on save
     - add the save-side LZ4 batching and streaming path with persistent
       buffers
     - emit REC_TYPE_PAGE_DATA_LZ4 records depending on per-batch ratio
       threshold (XC_SR_COMPRESS_BATCH_THRESHOLD = 97%)
 4. tools/libs/guest: adaptively disable LZ4 on poor compression ratio
     - downgrade ctx->compression to XC_SR_COMPRESS_NONE after an
       iteration whose average per-batch ratio fails the 90% threshold
 5. tools/libs/guest: opt in to LZ4 save-side compression
     - via XCFLAGS_COMPRESS_LZ4 flag in public API to request
       compression
 6. tools/libxl,xl: add --compress flag to xl migrate
     - wire the feature up to `xl migrate --compress` and libxl, so that
       xl users can opt in to compression during migration


Comments/feedback are welcome!


