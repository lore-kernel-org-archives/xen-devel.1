Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DB3606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=VJ2onIU+
Received: from list by lists.xenproject.org with outflank-mailman.1465932.1676352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpoa-0005GH-4d; Fri, 30 Oct 2026 16:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465932.1676352; Fri, 30 Oct 2026 16:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMpoa-0005G9-1k; Fri, 30 Oct 2026 16:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1465932;
 Fri, 30 Oct 2026 16:50:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca@edera.dev>) id 1xMpoY-0005G3-SJ
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:50:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMpoY-00AJPO-8f
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:50:50 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4caba-2eae-0a2a0a5409dd-0a2a4501818a-46
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:50:50 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luca@edera.dev>)
 id 6ae4cae9-5984-0a2a45010019-d155dd31cc96-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 17:50:49 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so859514f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 09:50:49 -0700 (PDT)
Received: from framework13.home ([2a01:e11:3:1ff0:831:b00b:e409:f875])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf396dfdbsm74305045e9.1.2026.10.30.09.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 09:50:48 -0700 (PDT)
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
        d=edera.dev; s=google; t=1793379049; x=1793983849; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrWmUVeXvr8yzGN2lo9pRWCfwNmsf3a3Upj9/tVt5M4=;
        b=VJ2onIU+MN4qaOvJXiBdGnmp8NaqJVg2leLIvwoHgPsF8IgoVS/nsxqslkjcSKk9Jn
         p+QaGlA5xhf9PNmrlEtITfnm2KHUQ3n1N0fJfBP77pMscNS1x1LvvvWHxZszahN/JyfX
         0xxt4HemNbDVbfktJjmjh7dhxoh/dtWRbh+MMJLokzvuUTS+3u3w9eyveyXhXuVmn0cS
         u/Hu4jXtaktpNkGxalMtpRRXW9h7DKrWLhCZoFJXQ3t1juNyRfXpC+p+d61HFyukFu+c
         d2JwF4xNINlC06kLAzs5vkCgYOJWak5Krq4pIeUfmMiRauvktNHPrfBABTec99iegkF2
         KpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379049; x=1793983849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrWmUVeXvr8yzGN2lo9pRWCfwNmsf3a3Upj9/tVt5M4=;
        b=C0fD4D3utOwXzqTcVhezHkX0m0yHGyZIDP6JgEcOuyIjgr91eJylb4UyfydvlwGtU+
         aZVafFbleRwjrvwIWq47uNqF9juXimIZ+/Z0E/8cGZLqp2DgKl1FWbafRMFc8UQuDFpZ
         7YeYCFj1yluk1Violu0iwLweecoSor2NbfNHves7bcHsG4pzfNJqTcF+itRkum7i8DQK
         TpAh9/Kp3VRwgLpYIQ5vWJdYFzbQWmaGszz0acUTDjXwDbIjBfsGUTWjhAqvpuRXiRys
         jJ6/tQPwvwiVEAsCe20rRzV1d0j5aczst92TLTPEdMesjtDYvAv+0u4zq0dcon7RcEe6
         MEhw==
X-Gm-Message-State: AFq9FYJcMZ3Z/D5+XegaQfqWRk4EqqjUbKEq/O5Xkb4zCJV/OlqxXzI1
	hhatFrgnz29aTcAKl07sc6L9xjqsG1I9dU5hTRT4PLDXQ2FaQU20QqbCpVh5cifknt0OgDmPKMO
	TTQjWAF6erQ==
X-Gm-Gg: AYBFou3o6CZHmbu5cxbMT8rxqZBsBo86GSf6o3vLdW+6WTKpKQ9YUcCiqZ7Plk8M+wh
	GTu5wizwipnv2EiabVx2wgVtQmnURdNIm6Pkg1M+W/7vpVItRMArAiOUkdR/EGv5p1v11roPgwp
	fKAKSfHfrGZsySPJnghxGenAzawDDP7sFD0Ckjr71crI1kPvqz/0U94hhNTWrZV7dDx+xXgAuwT
	xG8gWL38ZA/wSrnVETAKJGlylpalSjMA+xJe8U8b+z9WFNZSoAToPAwlaZ9oatgve4Mny17lTor
	aLZizB4isV5NndZfNNzPIrGONH/KOuHQMPGlNJpTqE+wsGrjg7El3mSM15Pnc7R/5TbfghIUi8M
	Mc0Vjp1oOznJ3dN7edEeEW1+CryZNB4FRG28TTPlc9j483l5Q9avDQOsHjVeknxQOozVXMmL2Ik
	Ol25kHy7efeFuQr7X/jjaHFQQQKOGnYG/9MWN58jDiiCdC2BgeJyDZXxj8OTOYCmfFQRuqf7wq8
	3k7eNE3daTnQYZ5jidmQW3eCzPARXJ8QwFyopfBem5EKcKk4zs+e+ZNZGuUl4ZuQh/zKFZVV/iK
	SCsX88U2iCumMoGXrB9EGZhAnQ==
X-Received: by 2002:a05:600c:a00a:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4ac19802310mr73043895e9.35.1793379049175;
        Fri, 30 Oct 2026 09:50:49 -0700 (PDT)
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
Subject: [PATCH 0/3] x86/HVM: batch the flushes of grant unmaps
Date: Fri, 30 Oct 2026 17:50:07 +0100
Message-ID: <20261030165031.2560020-1-luca@edera.dev>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1793379049-BEE60757-8CE4C035/0/0
X-purgate-type: clean
X-purgate-size: 3746
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
grant unmaps don't touch it. Patch 1 is preparatory, and patches 2 and
3 have the details.

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
    1 stream       0.64 +/-1%    3.07 +/-3%      +379%
    2 streams      0.81 +/-6%    3.09 +/-2%      +282%
    4 streams      0.84 +/-4%    2.74 +/-6%      +227%
    8 streams      0.83 +/-2%    2.40 +/-5%      +190%
    16 streams     0.81 +/-2%    2.22 +/-3%      +174%
  domU to domU
    1 stream       0.62 +/-6%    2.26 +/-3%      +263%
    2 streams      0.73 +/-7%    2.31 +/-10%     +218%
    4 streams      0.75 +/-4%    1.86 +/-11%     +149%
    8 streams      0.73 +/-4%    1.62 +/-10%     +122%
    16 streams     0.71 +/-3%    1.59 +/-6%      +124%
  dom0 to domU
    1 stream       4.19 +/-6%    4.12 +/-6%      -1.7%
    2 streams      4.87 +/-9%    4.71 +/-10%     -3.4%
    4 streams      8.73 +/-21%   8.52 +/-23%     -2.5%
    8 streams     12.53 +/-17%  12.57 +/-17%     +0.3%
    16 streams    16.85 +/-12%  16.72 +/-11%     -0.7%

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

Thanks,
L

Luca Di Maio (3):
  IOMMU: record the flushes skipped under iommu_dont_flush_iotlb
  x86/HVM: defer IOTLB flushes across a grant unmap batch
  x86/HVM: defer p2m TLB flushes across a grant unmap batch

 xen/arch/arm/include/asm/grant_table.h     |  3 ++
 xen/arch/x86/hvm/grant_table.c             | 53 +++++++++++++++++++++-
 xen/arch/x86/include/asm/grant_table.h     | 13 ++++++
 xen/arch/x86/include/asm/hvm/grant_table.h |  5 ++
 xen/arch/x86/include/asm/hvm/vcpu.h        | 10 ++++
 xen/arch/x86/mm/p2m-ept.c                  |  4 ++
 xen/common/grant_table.c                   |  6 +++
 xen/drivers/passthrough/iommu.c            | 12 ++++-
 xen/include/xen/iommu.h                    |  1 +
 9 files changed, 105 insertions(+), 2 deletions(-)


base-commit: 41ddcfe808ec1228289ae60c30768d50a58c98fe
--
2.54.0

