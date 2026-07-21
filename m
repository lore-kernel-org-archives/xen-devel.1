Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C24C4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:55:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367523.1617265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Je-0004xu-9k; Tue, 21 Jul 2026 07:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367523.1617265; Tue, 21 Jul 2026 07:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5Je-0004xn-6w; Tue, 21 Jul 2026 07:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1367523;
 Tue, 21 Jul 2026 07:55:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <haseebashraf091@gmail.com>) id 1wm5Jc-0004xh-I0
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5Jb-00E2ej-O6
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:54:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25c1-2eae-0a2a0a5409dd-0a2a450193d0-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:54:59 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <haseebashraf091@gmail.com>)
 id 6a5f25d3-5984-0a2a45010019-d1558032c422-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:54:59 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso21552875e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:54:59 -0700 (PDT)
Received: from PKL-HASEEBA-LT.. ([139.135.37.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956537c7desm64018485e9.7.2026.07.21.00.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 00:54:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784620499; x=1785225299; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/DA1flYZrLnr3pT99vJmWvln9YXqGU9jEeeo0V52gbU=;
        b=EkkqugL4U56oM2ByN9X2Ddrj0ogBi8IA5FriAFgNM0dhLteho8JAF6uasrAvX8h2LT
         g4JLRpKDHiehGwcReKTktoWAVK2PwJU2jntqksYrzhZj61YHUQfdMdp+cP4p2661WQvi
         rfWP+Cw1hWJOxx055KKs7oP3gV+BQC53SuoJI5O2vxkr5YlZzQRVizV+DOSFtcK7M2wF
         7hFWcG1bhv3EKYn5xcIynOxRPTU2fo5sY9jMT6pToizc87zedaBfOPlKUb6Ye+AgKbWo
         CFWv+b4hXgUGdHQmcOdghAuA0zTHew3qehE5R1qia2XFncLJRUKA3S6U59amsokyUeNG
         5pUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620499; x=1785225299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DA1flYZrLnr3pT99vJmWvln9YXqGU9jEeeo0V52gbU=;
        b=I6s3+Qm+6Wb8SId6Hl6BuiHZubAru3TH+dnUtnTOrsDZY8RWGhy4tvFsiYy9ThcGyD
         4FONQXGfM65M1lqN/h0L7YVOyEJXj5Ktdldcnsl2ojJt1cUWGkYE2Cyx1dPPca1CYYI4
         Iai0F05jXiZTBy6ew6l4WOpR26X2in8KLYedOlGHiBqHMg1UfdmuoHZY3V96eZ+aYA4N
         zBAteMKAxNqRovHdMR9yVkwMRs0eA+9zKoubo99Gg1yXVvPX+YziY0F1EByyVb8weXgD
         PeO+lBHbWjVlTu/otXbEkaoZAPLbfdvOroRiwRIEZqCaE+yh7vsoDM4rj1jr92X42iPF
         9ZuA==
X-Gm-Message-State: AOJu0YyzLe24XjhMZ3bK8+9ALaF115NHvg141QS9IejMp0Cxvtgn2Fe3
	8CFcsIM9CiUZ1f1277VURNcxSTjA4Qd45zqYC+kE8azI4vtnOnIJDti/+xFkHCJS
X-Gm-Gg: AfdE7cn7XVzyq5/mXEJjA/yLbPzrFJIdOQkylSzqIeGwWJGphK/YrZBVmQ907Hiq1ou
	1+TJmb7e/H3Gu+W6Qka53yWHo/mJ59VQuXY5BVNZ9oh1G0MU5CCobDptaFoLwRQE4Fj7DwSn0zQ
	3mL88hIT8SdcEpk619J1AsrD8NnB3wfya/WCTFtgPjSf8MzH9RjlY8jTYXm8klp5sUw9T7JOr4D
	ZQSOmGX312WT1fEUaFmEtf8vBfrcZCU5H5i7MljHaaYK6GW/rs2wocGKyOWAiPMez9s+Vvyfu13
	XBHimBfm+X1ovf2FY9PHHdd/Gdi8mjBNezvzH76wnS3wjwhcBPR8KMUo2gU2CeEJjR1uonqwx0A
	0KoB8ZdgUIt/YJYqFf6e+ktzxknuUi4a97gviMh3gBH4svebKYkkMVWxwMiIoNOUuPpWQJeqBW0
	Miit2tXuJZmEZ4aEuYncd8e8KPzOGyW+yLkt8ZGemQWtZEVfjHonXaeA==
X-Received: by 2002:a05:600c:4f09:b0:495:5b32:df72 with SMTP id 5b1f17b1804b1-4955b32e0c7mr101439545e9.35.1784620498561;
        Tue, 21 Jul 2026 00:54:58 -0700 (PDT)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: haseeb.ashraf@siemens.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RESEND][PATCH v4 0/3] xen/arm{32,64}: perform IPA-based TLBI when IPA is known
Date: Tue, 21 Jul 2026 12:54:48 +0500
Message-ID: <cover.1765197209.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784620499-BCF47757-C9F5DF39/0/0
X-purgate-type: clean
X-purgate-size: 4312
Message-ID: <20260721075448.WXJGHB4JyvHmIL4VMdYkf9RaZyUCidpqDuJn34m3rHw@z>

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

This patch series addresses a major performance issue when running Xen as
an L1 hypervisor on KVM, where emulation of VMALLS12E1IS is significantly
more expensive than narrower invalidation sequences and becomes especially
problematic when invoked frequently.

Two common cases are affected:

  (a) vCPU migration on a pCPU, where Xen currently flushes combined
      stage-1+stage-2 guest translations even though the stage-2 regime is
      shared at the domain p2m level.

  (b) teardown of DomU mappings exported into Dom0, where
      XENMEM_remove_from_physmap can trigger repeated full guest TLB
      invalidation even when the affected IPA range is known.

This series reduces reliance on full guest TLB invalidation and prefers
IPA-based invalidation where possible.

Patch 1 introduces IPA-based invalidation in the p2m code when the
affected IPA range is known, and uses stage-1-only invalidation for the
vCPU migration case.

Patch 2 optimizes combined stage-1/stage-2 invalidation in the presence
of FEAT_nTLBPA by avoiding redundant stage-1 invalidation.

Patch 3 adds Arm32 capability detection for TLBI-by-IPA and uses it in
the IPA-range helper when FEAT_nTLBPA is also present. When that
combination is unavailable, Arm32 retains the conservative full-flush
behaviour.

The Arm64 IPA-range helper has also been reworked in v4 to make the TLBI
sequence more explicit:
  - stage-2 invalidation by IPA is performed in a loop,
  - stage-1 invalidation is issued separately only when required,
  - completion of the broadcast TLBI sequence (including the repeat-TLBI
    workaround) is handled explicitly rather than being piggybacked onto a
    stage-1 helper.

This makes the intended semantics clearer and avoids relying on hidden
barrier/workaround side effects.

Measured on Graviton4 with Xen-on-KVM, a full guest TLBI was observed to
be roughly comparable in cost to tens of thousands of single-page
IPA-based invalidations, which motivates using a bounded IPA-based loop
for smaller ranges and falling back to full invalidation above a
threshold.

For Arm64, the 256MB threshold is based on those measurements. For Arm32,
the same cutoff is reused as a conservative practical bound rather than
as an Arm32-specific tuned value.

Haseeb Ashraf (3):
  xen/arm/p2m: perform IPA-based TLBI when IPA is known
  xen/arm: optimize stage-1,2 combined TLBI in presence of FEAT_nTLBPA
  xen/arm32: use IPA-based TLBI when supported with FEAT_nTLBPA

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

-- 
2.43.0

