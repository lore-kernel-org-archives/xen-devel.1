Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1217606A320
	for <xen-devel@archiver.kernel.org>; Sun, 22 Nov 2026 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXnW3mlk
Received: from list by lists.xenproject.org with outflank-mailman.1499534.1696288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HL-0004iY-8N; Sun, 22 Nov 2026 09:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499534.1696288; Sun, 22 Nov 2026 09:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xV4HL-0004iN-3O; Sun, 22 Nov 2026 09:54:35 +0000
Received: by outflank-mailman (input) for mailman id 1499534;
 Sun, 22 Nov 2026 09:54:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1xV4HJ-0004iB-Tv
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 09:54:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xV4HG-00G0sz-4J
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2026 10:54:30 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bb9e-e002-0a2a0a5209dd-0a2a450293f2-14
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:30 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6b02bbd5-4900-0a2a45020019-d155802ce02f-3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 10:54:30 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so21976175e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 01:54:29 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849e598sm218409605e9.8.2026.11.22.01.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 01:54:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341269; x=1795946069; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zms46dcTZ7ZJdJt51y/WxtlLFLQ69IMr0P+0B8pulb8=;
        b=pXnW3mlkhoiyh63ZmuMVML1row93VERT7rDDsk8Aq8JdBAVtXBPxl4vuLD0CwniSwj
         V9pznWVlK4t/Ps4SAiiw7THNO6w7Yib6DGIFN5wan0duDFrEtEpMmyDTHOf2tMYzMzZR
         yoM7+JtdMNQ8MsHBMlY8sPQKnkUY8WlQTBXHRJEmrWTt7vROst+6GnNcFer4Pg7aY3Hp
         rTwhVwDXpiGv+vtlBLTUnLKbjP4PTbSgIAT9iKVRZOf5jrgr66YHJFfYn7rDL7AmXw1J
         GZgciOZRjK/WJtalPsWZFu1owg2jFY/LBGQ9TXCzDprN47dJ6ogRyKbMMaamiH0XojdL
         v0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341269; x=1795946069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zms46dcTZ7ZJdJt51y/WxtlLFLQ69IMr0P+0B8pulb8=;
        b=YBNCxYLwzMkZB3IpbLG7IgpkhSz/DqSXfjCpU9dJyz4qK6HbCS7wStOQmtIlViaJRa
         gn036L8qg2QxIOksrnQRJHApcT03/sGH91pPvNn0reHrXZDnjN1VOEjaOE49j8mNQd2J
         6NvvRgfncquceJsC7tPILM9r79xnLcPBv34vC9Me6SsweeVt3CmIq/S7gb6+M0dCtAN1
         4jb58bCcEwAb6ei1x9dRlsfKzPS+/kwO9qsN1zNbajFO13H+ky+kgSb8MTngFeIllazh
         eDh6222l8ZCwOGOQGCbYLphqH3AfG3rqC8vMkH1l9qYqggtTGfoWb+DkGngUceYPOwlK
         BfrQ==
X-Gm-Message-State: APuU4Z8mr2NkA8Li3ShixZYELGldrYo/EN26cgkY07KCct4S6qVvzO7B
	JGwAz5caDGct6RIYctYjyY9YQb5aC/2yvHrlOtfrcfZsxnhQvHE3fYgp98HkM3P84Q8=
X-Gm-Gg: AZFdTZfKipIClwRQPa/BczMZmyrAoML0cmNFyGnUBwgdMktA7H9gS6z+6CNy1YuOrNa
	i82w5CCjpG/VeUT7KUvxwY0F4BOfOjhsQSxQUmkOk3h86+sD4E+WOquUn7H7uoEzHPeIH9pXlur
	1j/faibg85WCpaXx9Bnr2ntsJNgs+fj8x65FvP97DhuoClBOEuaDAlnFkttPGRGjYrECDZb0XE8
	whm69mya8sRKTNYmyl0YpvOhcBX1o7kFN1kFE44IpdwrtLsHxdm/5DCfviUaQW6+Miib3SsUGfn
	jx3iKeH7Bjv2NO9m+qFovKqc4zzvcBwmMYzzR51uAcMNK8sXijx9qaiVelOOTKTCwY/o1k4tNTP
	7carUTa5xE+hkuM/JhFSuRh803r1tEGwwmmRaEWHcqIlD4X69lzKbou9WonNTNO7a3yw8YZ/gMg
	aPN7oKMFlaFpJHOeV7QSO8WM4iToBK/7vh6+3CVrAHRm/297qUsKfMflTTA+eT4k9Z0pZHi3wL2
	GJasB3U1JdBafx8aojZrECDjfpAt/aYJyvXmN8JzBtVyHkNJ3JGF4PJsmdJtUWud/LOvbW0qtOP
	jvNSqeYktxfSvPf6ijP00msgKQfIzEG373iguCx5e4b785TgeOb1hTOq1h5p7sZxUTiTbAHUnyR
	eQ9zpzeYh0Ocrv7qsDLMBzail
X-Received: by 2002:a05:600c:4584:b0:4b8:4af2:88b3 with SMTP id 5b1f17b1804b1-4bb88817aa2mr175040165e9.22.1795341269091;
        Sun, 22 Nov 2026 01:54:29 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	roger@xenproject.org,
	oleksii.kurochko@gmail.com,
	community.manager@xenproject.org,
	dpsmith@apertussolutions.com
Subject: [XEN][PATCH v5 0/8] xen/arm: narrow stage-2 TLB invalidation and batch physmap updates
Date: Sun, 22 Nov 2026 14:54:14 +0500
Message-ID: <cover.1795336377.git.haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765197209.git.haseeb.ashraf@siemens.com>
References: <cover.1765197209.git.haseeb.ashraf@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1795341270-F2F916C6-6166BD86/0/0
X-purgate-type: clean
X-purgate-size: 14377
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Base commit: ada7fa3491668bbcf1afe525057c470903625d26

Previous version:
https://patchew.org/Xen/cover.1765197209.git.haseeb.ashraf@siemens.com/

This series depends on a complementary Linux KVM change [1][2], "KVM:
arm64: Resume stage-2 range walks where they stopped". Without it, a DomU
cannot be run in practice on Xen as a guest (L1) of KVM. The cost of
emulating TLBI VMALLS12E1IS and ALLE1IS is the reason: each trap walks
the whole IPA space of the shadow stage-2 in 2^18 separate walks, and on
the AmpereOne host used below it took 905.8 ms on average. One create and
destroy cycle of an 8GB guest caused 226 of them, about 205 s of
emulation (measurements in [1]). With the Linux change a trap takes a
few milliseconds (4.06 ms on average in [1], 1.8 ms in Table 2 below).
All the results below were taken with it applied on L0, so it is the
baseline. This Xen series does not depend on it to be correct. It
addresses a separate cost that remains: a trap still takes milliseconds,
and many full invalidations are not optimal when a narrower one is
enough.

[1] https://lore.kernel.org/all/20261118051648.74580-1-haseebashraf091@gmail.com/  (cover letter)
[2] https://lore.kernel.org/all/20261118051648.74580-2-haseebashraf091@gmail.com/  (patch)

Updates of the Arm stage-2 page tables are followed by a TLB
invalidation that is much broader than the update. Most paths issue
VMALLS12E1IS, which discards all the stage-1 and stage-2 translations
of the VMID on every CPU, whatever was changed. Removing guest pages one
at a time also costs a hypercall, a p2m lock round trip and an
invalidation per page.

This series narrows the invalidation to what changed where Xen knows it,
drops an invalidation that has no work to do, uses FEAT_TLBIRANGE and
FEAT_nTLBPA when the CPU has them, and adds batched interfaces that
spread the per-page cost of hypercalls, locking and invalidation. These
are general improvements of the Arm p2m code and do not depend on how
Xen is run. The effect is largest where TLB maintenance traps, for
example when Xen itself runs as a guest (L1) of another hypervisor: the
results below show it on the creation and the destruction of an L2
guest.

Three common cases are affected:

  (a) vCPU migration on a pCPU, where Xen flushes the combined stage-1
      and stage-2 translations of the guest, although the stage-2
      regime is shared by all the vCPUs of the domain.

  (b) teardown of DomU mappings exported into Dom0, where
      XENMEM_remove_from_physmap flushes all the TLBs of the guest,
      although the affected IPA range is known.

  (c) device models that map and unmap many guest pages: removing pages
      individually takes a hypercall, a p2m lock round trip and a TLB
      invalidation per page, and XENMEM_add_to_physmap_batch copies
      three guest values per entry.

Patches:

  #  Change                            Condition and bound
  -- --------------------------------- --------------------------------
  1  Invalidate by IPA when the range  Fewer than 512 pages (4KB
     is known; local flush on a vCPU   granule), else the whole VMID
     switch on the same pCPU (stage-1
     only on Arm64)
  2  Skip the stage-1 invalidation     FEAT_nTLBPA only
     that follows an IPA invalidation
  3  IPA-based invalidation on Arm32   FEAT_nTLBPA and TLBI by IPA,
                                       same 512 page bound
  4  Range invalidation (RIPAS2E1IS)   FEAT_TLBIRANGE, at most four
                                       range operations
  5  Drop the flush when resolving a   None
     translation fault
  6  Arm helper: remove a list of      Arm with an MMU
     pages under one p2m lock, one     (HAS_PHYSMAP_REMOVE_BATCH)
     range flush per run of GFNs
  7  XENMEM_remove_from_physmap_batch  Opt-in for callers, Arm with an
     hypercall using patch 6           MMU, -ENOSYS elsewhere
  8  Copy add_to_physmap_batch         Common code, 128 entries per
     entries in chunks                 chunk

Results: Xen as L1, creation and destruction of an L2 guest

Setup: an AmpereOne host runs Linux (L0) with KVM nested virtualization
and the Linux change above, in the baseline and in v5. Xen 4.23-dev and
its Dom0 run as an L1 guest, and a DomU is the L2 guest (8GiB of RAM, 4
vCPUs). Five back-to-back cycles per run: create the DomU, boot it to a
login prompt, then "xl destroy". "Baseline" is Xen master and "v5" is
master with this series. A bpftrace script on L0 times the KVM handlers
(handle_vmalls12e1is, handle_ripas2e1is and handle_tlbi_el1) of the TLBI
instructions that L1 traps on, over all five cycles.

Table 1: L2 guest lifecycle, wall clock and system time

  Cycle   VM creation        xl destroy (wall)       xl destroy (sys)
          base      v5       base        v5          base       v5
  ------- --------- -------- ----------- ----------- ---------- --------
  1       27 s      9 s      106.411 s   2.693 s     87.877 s   0.627 s
  2       20 s      3 s      107.549 s   2.690 s     88.966 s   0.635 s
  3       23 s      2 s      114.707 s   2.703 s     95.182 s   0.654 s
  4       27 s      2 s      107.946 s   2.702 s     89.189 s   0.651 s
  5       20 s      3 s       92.778 s   2.697 s     76.813 s   0.645 s
  ------- --------- -------- ----------- ----------- ---------- --------
  mean    23.4 s    3.8 s    105.878 s   2.697 s     87.605 s   0.642 s
  median  23 s      3 s      107.549 s   2.697 s     88.966 s   0.645 s
  change  6.2x faster        39x faster              136x less

Table 2: TLBI instructions emulated by L0 KVM (five cycles)

  Run       Instruction   Entries   Cumulative   Mean       Max
  --------- ------------- --------- ------------ ---------- ----------
  Baseline  VMALLS12E1IS  448,959 * 824.771 s    1.843 ms   39.429 ms
  v5        VMALLS12E1IS         15  26.863 ms   1.791 ms    3.787 ms
  v5        RIPAS2E1IS       24,854 525.967 ms   21.16 us   30.475 ms
  v5        VMALLE1IS        24,812  66.215 ms    2.67 us    0.019 ms
  v5        all              49,681 619.045 ms

  * 447,539 of these calls returned in the trace. The cumulative time
    and the mean are over the returned calls.

  Traps: 9.0x fewer (448,959 against 49,681). Cumulative handler time:
  about 1,330x less (824.8 s against 0.619 s).

Table 3: number of handler calls by duration (five cycles)

  Duration          Baseline      v5            v5          v5
                    VMALLS12E1IS  RIPAS2E1IS    VMALLE1IS   VMALLS12E1IS
  ----------------- ------------- ------------- ----------- ------------
  below 4 us                    0           871      22,831            0
  4 us to 16 us                 3        18,982       1,967            1
  16 us to 64 us                1         4,981          14            1
  64 us to 1 ms               149             0           0            3
  1 ms to 2 ms            247,974             0           0            6
  2 ms to 4 ms            197,756             9           0            4
  4 ms and more             1,656            11           0            0

How to read it: the baseline needs about 90,000 emulated VMALLS12E1IS
per cycle, each about 1.8 ms, and this is what the 106 s of "xl destroy"
and most of the creation time are spent on. With the series the same
work needs about 5,000 RIPAS2E1IS and 5,000 VMALLE1IS per cycle. A
RIPAS2E1IS takes about 21 us and is followed by a VMALLE1IS of about
2.7 us, because the CPU has no FEAT_nTLBPA: the pair costs about 24 us,
against 1.8 ms for the full flush. "xl destroy" takes the same 2.7 s in
every cycle of the v5 run, while the baseline takes between 93 s and
115 s. The 15 remaining VMALLS12E1IS (three per cycle) are for ranges
that are too large for an IPA invalidation. They still take about 1.8 ms
each, and are 4% of the cumulative handler time of v5.

The lifecycle runs do not exercise the batch interfaces in patches 6 to
8. The tables therefore provide no performance result for those
patches; dedicated device-model workloads using the batch interfaces
are needed to quantify their benefit.

Impact when Xen is not nested:

 - The series changes common Arm p2m invalidations. No bare metal
   performance measurement is available yet.
 - Without FEAT_TLBIRANGE, Arm64 ranges under 512 pages can issue up to
   511 broadcast IPA TLBIs, and ranges of 512 pages or more use the
   whole VMID. Arm32 uses the same bound only with FEAT_nTLBPA and TLBI
   by IPA, and the whole VMID otherwise. With FEAT_TLBIRANGE, ranges
   that can be encoded use at most four range operations, and larger
   ranges use the whole VMID. This bounds the number of instructions,
   not the latency.
 - The flushes that are deferred to p2m_write_unlock() are unchanged.
   The FEAT_nTLBPA and FEAT_TLBIRANGE paths depend on the capability.
 - The batched removal hypercall is opt-in for callers and exists for
   Arm with an MMU. Patch 8 changes common code, so its effect on bare
   metal also needs a measurement.

Testing: the runs above were done on Arm64 (AmpereOne) with this series.
An x86_64 build completed with CONFIG_COMPAT=y. The Arm64 Cppcheck MISRA
add-on reported no diagnostics on changed lines.
Not yet validated: Xen on bare metal, the FEAT_nTLBPA path, Arm32 at run
time.

Notes:
 - Like XENMEM_add_to_physmap_batch, the batched removal reports per-entry
   errors in errs[] and is not transactional: -EFAULT can follow removals
   that completed.
 - Patch 8 keeps that semantics, but reads and writes the entries in
   chunks of 128, so more entries may be processed before an -EFAULT.

Changes in v5:
- Replace the 256MB limit, measured on one platform, with
  TLBI_MAX_PAGE_OPS, the limit of Linux, and use the Linux limit for
  range operations (patches 1 and 4).
- Keep the deferred flush of removals: p2m_remove_mapping() flushes
  its range once, other removals are flushed by p2m_write_unlock() as
  before. Keep the deferred flush of permission-only changes with
  memaccess (patch 1).
- Keep patch 1 independently usable with the MPU stub for
  p2m_force_tlb_flush_range_sync(); defer the locked-helper refactor
  until patch 6, its first user.
- Move Arm32 nTLBPA and UniTLB capability detection from patch 2 to
  patch 3, where the Arm32 IPA-based invalidation first uses it.
- Invalidate the whole old block when a superpage is split (patch 1).
- Do not skip the stage-1 invalidation of the vCPU switch with
  FEAT_nTLBPA: it separates the vCPUs, it is not about walk caches
  (patch 2).
- Complete the stage-2 invalidation before the stage-1 one, as the Arm
  ARM requires, and complete the broadcast sequence before the
  repeat-TLBI workaround (patch 1).
- Fix the Arm64 helper macros of patch 1 so that it builds on its own.
- Put the TLBI instructions in one-instruction helpers (MISRA C
  Directive 4.3) and drop the unused inner-shareable stage-1 helper.
- Add patches 4 to 8. Cite DDI 0487 M.d.

Changes in v4:
- Rebased on master branch
- Reworked the Arm64 IPA-based TLBI sequence to make completion of the
  broadcast TLBI explicit instead of relying on a stage-1 helper for the
  final barriers/workaround.
- Reused __tlb_repeat_sync() for repeat-TLBI workaround handling in the
  Arm64 completion path.
- Fixed the Arm32 IPA-based TLBI helper to fall back to a full guest TLB
  flush when the required capability combination is unavailable, instead
  of becoming a no-op.
- Added a small robustness check in p2m_force_tlb_flush_range_sync().
- Refined comments and commit messages to make the architectural intent
  clearer.

Changes in v3:
- Mainly reworked handling of the repeat-TLBI workaround with IPA-based
  TLBI so that the extra TLBI and DSB are applied only at completion of
  the overall sequence.
- Updated code comments as per feedback. Further details are available in
  each commit's changelog.
- Minor code updates as per feedback. Further details are available in
  each commit's changelog.

Changes in v2:
- Split the original change into three commits. The first commit
  implements the baseline implementation without adding new CPU
  capabilities. CPU capability handling is introduced in follow-up
  commits to make each optimization clearer.
- Moved Arm32 and Arm64 specific TLBI implementations to the respective
  architecture-specific flushtlb.h.
- Added ARM ARM references in code comments.
- Added a threshold to select between IPA-based invalidation and
  fallback to full guest invalidation above that threshold.
- Introduced ARM_HAS_NTLBPA CPU capability for both Arm32 and Arm64.
- Introduced ARM32_HAS_TLB_IPA CPU capability for Arm32 IPA-based TLBI.

Haseeb Ashraf (8):
  xen/arm/p2m: perform IPA-based TLBI when IPA is known
  xen/arm: skip the stage-1 TLBI after IPA flush with FEAT_nTLBPA
  xen/arm32: use IPA-based TLBI when supported with FEAT_nTLBPA
  xen/arm64: use range TLBI for IPA flush with FEAT_TLBIRANGE
  xen/arm: do not flush the TLBs when resolving a translation fault
  xen/arm: batch stage-2 removal with range flushes
  xen/memory: add XENMEM_remove_from_physmap_batch
  xen/memory: copy add_to_physmap batch entries in bulk

 CHANGELOG.md                              |   5 +
 xen/arch/arm/Kconfig                      |   1 +
 xen/arch/arm/cpufeature.c                 |  45 +++++
 xen/arch/arm/include/asm/arm32/flushtlb.h |  67 +++++++
 xen/arch/arm/include/asm/arm64/flushtlb.h | 178 ++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h         |   1 +
 xen/arch/arm/include/asm/cpufeature.h     |  26 ++-
 xen/arch/arm/include/asm/flushtlb.h       |  12 ++
 xen/arch/arm/include/asm/mmu/p2m.h        |   2 +
 xen/arch/arm/include/asm/mpu/p2m.h        |   4 +
 xen/arch/arm/include/asm/processor.h      |   9 +
 xen/arch/arm/mmu/p2m.c                    | 114 ++++++++++--
 xen/arch/arm/p2m.c                        | 111 +++++++++--
 xen/common/Kconfig                        |   3 +
 xen/common/memory.c                       | 215 ++++++++++++++++++++--
 xen/include/public/memory.h               |  35 ++++
 xen/include/xen/p2m-common.h              |  16 ++
 17 files changed, 799 insertions(+), 45 deletions(-)


