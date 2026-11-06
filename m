Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F284606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=k/JwLrTU
Received: from list by lists.xenproject.org with outflank-mailman.1476312.1682452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0d-0007AN-Du; Fri, 06 Nov 2026 08:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476312.1682452; Fri, 06 Nov 2026 08:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPF0d-0007AG-9L; Fri, 06 Nov 2026 08:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1476312;
 Fri, 06 Nov 2026 08:09:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xPF0b-00078z-HS
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:09:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPF0a-000tIA-H5
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:09:12 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b21-e002-0a2a0a5209dd-0a2a4508817c-38
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:12 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6aed8b28-f659-0a2a45080019-d1558034d881-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 09:09:12 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so1991825e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 00:09:12 -0800 (PST)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492ff85585esm1534507f8f.5.2026.11.06.00.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 00:09:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793952552; x=1794557352; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYgjSx6ztXwWw8pUeZQnPzDV6xkhD2nykKrf2tut3DI=;
        b=k/JwLrTUO2kSwTZeOhJQX4JQhL5K4PJDeKbQKWiIgbytE1NaTcmTYAvW1f9WpDBhgq
         CNAoF2aXDBQ0TFGfW88LBXDlB14dopaGM3WinIdCZG/0zF7Ju+S/ZD948BH0oy0Is6zo
         ZENQq7+i8ncFjoiJVrJzQx+rxBx9/rB7uYoSWSbQvHNKzCHcdmh3YKa2dTK8pLpEYxYt
         fV/rZo1q6gGOdHK9gGaZ4kmprvM0tnbHrTknSkVUmhv86CjyIgxNbgnVV+Dlj3t7gE4d
         vl+KbfhqHcuKuFXPY4pZUDvzKYxLGuxJi4q6E43M9u+8zr6u9LGcV3G8xW9zPcyNpnfv
         Km3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952552; x=1794557352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYgjSx6ztXwWw8pUeZQnPzDV6xkhD2nykKrf2tut3DI=;
        b=aDe9wgyc5wtX2s/4tPQ8qZ0hrdl99cxMxe9XtT0xZVM2D9f4FRexXEB7D0UGddqFzS
         L66VwD6e12QdcO1R0YSxZ4MxIRkOT+sVq5flfsgiueuPhU5+RrlRJxj/cmTsmbVw09eH
         9EBlOVUitxKRrreVtnGK0JM9Y40Qc2n+NzcEghauSKlxoes3GXHy/E8fQdIG7UZpnrQY
         m2n6YJqopbUZ/frQc4/YYbQIk+D3cDBRDnm0NfS5do+CA8EKG0HR5AICMjZZmYL1slkP
         lMIqhTBvilhH2oIwtUiLjUK0QyYhOYasRDoGWWaYvj0t5ldO/KtPL3QVYQTqfo1/Fbxi
         LFAg==
X-Gm-Message-State: APuU4Z/QNEPqieOs2Sst92bDQOfiEkaErBPqGQfNpqcs08MQ+Kn7PDj/
	9eQJRpFvZmDbfVOZY3fBNxkO84Ofn5AUWiEkV/tt/NqRYtSFftYpxn6Gd81YAHDvRbWFWlQPp3h
	EvfrbNsI=
X-Gm-Gg: AYBFou2UTT+0gYsEliDcWhdRX2JIys1nGtHbDUXU0HT0fSx9UB/LRcl4Vu3OyBL7lM/
	yH95hV6mUj6QwH7ICULSycuLoN8JVBe/Z01hUxRF6X6NBc6eQTGfHK90Py1MHl/J7TaQbMeQB93
	gWFIWpQFALpjLnwu3/A+haj1dmIhkee6LF3uFiW4I/ikvv7pHMB8kOAohWDJ1Ryj+l2sQRoKnvh
	CJqk7KfUQXc+fEvus4WCnVcCThu3mqRZOZSW6a7knhjTl+VsuVJG5VMlgd2ayWBX4VWm2rG5JiM
	ik4/ihwwN2530NCQ8IRByZ3FLCrREa7yvIDxntTIJzFKHfqjpltteShn5oaJSUoKDKObaujc+Pc
	jt8QHYrRy6AsYDV0/dafP/f+EL0++cRf96TPAiVVK80eTfqeHU9VtMbG98fdvNjREQQ7jw0mh2C
	DvmwzmPg80iqVU9m9818EIUPIf285kkJkwwoPo6cbkyKUf1hl2BARy6ppgjoMxShNqBe7AJ8Bx7
	HIxeEUctpy9Qi9o3HGN9uP/Y7rad188uxoN00c4rjlUcPpdWxEN344mESZBIcqQ4EjCWT10Giwa
	WPOGqXh922uCTvwIfj1yuzH2EA==
X-Received: by 2002:a05:600c:3ba5:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b6f74694a1mr23590085e9.23.1793952551715;
        Fri, 06 Nov 2026 00:09:11 -0800 (PST)
From: Luca Di Maio <luca@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: Luca Di Maio <luca@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Alex Zenla <alex@edera.dev>,
	Andres Rodriguez <andres@edera.dev>
Subject: [PATCH v2 0/4] x86/HVM: batch the flushes of grant unmaps
Date: Fri,  6 Nov 2026 09:08:50 +0100
Message-ID: <20261106080859.2285309-1-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793952552-D574B87B-B54463BD/0/0
X-purgate-type: clean
X-purgate-size: 4388
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

GNTTABOP_unmap_grant_ref already batches the TLB flushes of a PV
caller: gnttab_unmap_grant_ref() unmaps up to 32 grants, flushes the
TLBs once with gnttab_flush_tlb(), and only then releases the pages.
gnttab_flush_tlb() does nothing for a translated caller, whose unmaps
go through the p2m, and the p2m code flushes the guest TLBs and the
IOTLB for every page instead. A PVH dom0 running netback pays both
flushes for every page a domU transmits.

This series gives translated callers the same batching, for both
flushes, before the pages are released. The IOTLB half has no PV
counterpart: a PV dom0's IOMMU maps all of RAM by default, so its
grant unmaps don't touch it. Patches 1 and 2 are preparatory, and
patches 3 and 4 have the details.

iperf3 between a PVH dom0 running netback and two PVH domUs:

  machine:  c7i.metal-24xl, Xeon Platinum 8488C, 96 threads,
            VT-d with shared EPT tables
  dom0:     96 pinned vCPUs, 4 GiB, Debian 13, Linux 6.12
  domUs:    8 vCPUs, 1 GiB, Linux 6.18, on a bridge
  Xen:      staging at 9a6cc49b44, built with GCC 14.2
  runs:     10 s, Gbit/s received, higher is better, 60 per row
            from 4 boots of each build, interleaved
  shown:    mean of the runs +/- their relative standard deviation

                   base          patched       %change
  domU to dom0
    1 stream       0.64 +/-1%    3.11 +/-2%      +386%
    2 streams      0.81 +/-6%    3.16 +/-2%      +291%
    4 streams      0.84 +/-4%    2.69 +/-7%      +221%
    8 streams      0.83 +/-2%    2.40 +/-5%      +190%
    16 streams     0.81 +/-2%    2.23 +/-2%      +175%
  domU to domU
    1 stream       0.62 +/-6%    2.29 +/-5%      +267%
    2 streams      0.73 +/-7%    2.26 +/-10%     +211%
    4 streams      0.75 +/-4%    1.86 +/-16%     +150%
    8 streams      0.73 +/-4%    1.73 +/-9%      +136%
    16 streams     0.71 +/-3%    1.62 +/-6%      +128%
  dom0 to domU
    1 stream       4.19 +/-6%    3.93 +/-8%      -6.2%
    2 streams      4.87 +/-9%    4.68 +/-11%     -4.0%
    4 streams      8.73 +/-21%   8.34 +/-19%     -4.5%
    8 streams     12.53 +/-17%  13.05 +/-17%     +4.1%
    16 streams    16.85 +/-12%  16.40 +/-16%     -2.7%

The table comes from one of 13 sessions on this instance type, which
ran 7,779 runs over 57 boots in total.

A domU transmits 2.2 to 4.8 times as much, and 2.2 to 4.0 times as
much per busy dom0 vCPU, where base never exceeds 0.84 Gbit/s whatever
the number of streams.

From dom0 to a domU, netback fills the domU's buffers with grant
copies and maps few of its packets, so the series barely runs there
and the differences stay within the margin of error.

Between boots of the same build, the single-stream mean varied no
more than the run-to-run spread predicts. A debug build ran the same
benchmark without assertion failures or IOMMU faults.

Changes in v2:
- Patch 1 is new: VT-d rounds flush ranges to an aligned power of two
  itself, instead of the grant unmap batch doing it (Teddy).
- iommu_iotlb_flush() checks iommu_dont_flush_iotlb and records the
  range as well as the flags of the flushes it skips, instead of its
  callers recording the flags in a uint8_t (Teddy, Jan).
- The grant unmap batch flushes the recorded range, instead of the span
  of the unmapped gfns (Teddy).
- The table's patched column is now re-run against v2

Thanks,
L

Luca Di Maio (4):
  VT-d: round IOTLB flush ranges up to an aligned power of two
  IOMMU: record the flushes skipped under iommu_dont_flush_iotlb
  x86/HVM: defer IOTLB flushes across a grant unmap batch
  x86/HVM: defer p2m TLB flushes across a grant unmap batch

 xen/arch/arm/include/asm/grant_table.h     |  3 ++
 xen/arch/x86/hvm/grant_table.c             | 55 +++++++++++++++++++++-
 xen/arch/x86/include/asm/grant_table.h     | 13 +++++
 xen/arch/x86/include/asm/hvm/grant_table.h |  5 ++
 xen/arch/x86/include/asm/hvm/vcpu.h        | 10 ++++
 xen/arch/x86/mm/p2m-ept.c                  |  2 +-
 xen/common/grant_table.c                   |  6 +++
 xen/drivers/passthrough/iommu.c            | 17 ++++++-
 xen/drivers/passthrough/vtd/iommu.c        |  4 ++
 xen/include/xen/iommu.h                    |  6 +++
 10 files changed, 117 insertions(+), 4 deletions(-)


base-commit: 41ddcfe808ec1228289ae60c30768d50a58c98fe
-- 
2.47.3


