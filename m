Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37F4C624DE
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 18:46:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407516.1640583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2CSD-00061J-KK; Thu, 03 Sep 2026 18:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407516.1640583; Thu, 03 Sep 2026 18:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2CSD-000607-GZ; Thu, 03 Sep 2026 18:46:29 +0000
Received: by outflank-mailman (input) for mailman id 1407516;
 Thu, 03 Sep 2026 16:11:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1x2A1s-0003cQ-Tf
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:11:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2A1s-006nB7-AE
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 18:11:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <patchwork-bot+f2fs@kernel.org>)
 id 6a999c17-e002-0a2a0a5209dd-0a2a450ae13c-8
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 18:11:08 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <patchwork-bot+f2fs@kernel.org>)
 id 6a999c1a-f2d2-0a2a450a0019-ac6904fe8a04-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 18:11:07 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 60E6F60A5B;
 Thu,  3 Sep 2026 16:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119AE1F00A3E;
 Thu,  3 Sep 2026 16:11:06 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9386938119CB; Thu,  3 Sep 2026 16:10:08 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:Date:References:In-Reply-To:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788451866;
	bh=wQC/B3FS4e5cPaDkFUi05H5/4Cpx4sxh25n+vGHWmYc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cX5S97uavmnQ1oACZHN9HgQC0w4BW6l7gd3KhLLv7D3CEwvQqVkkISIabPe6cAz15
	 lWkG+FcJx8T5bL8zvHYmPd7BTeb+q0xV22oPkTs+7zHVI76huUqtzlAazKHgiijpXC
	 fPayLcChJfd8lQhKnDDxnDwCYBYoono4GRg6E8M/XmWnKu3w06nB/6JtY5EZEZ4JTc
	 Ls6Rs/u56x5sozaE9TxltbKV3YH5hTFABAAIOg6efQ6qc4ZyXelz1bMHFgK7aaDnWZ
	 9Y02WV5P78L1/Fs/n5/fmLT+8/kOHgOC2mjZC6o6yNFynXnGH6uYX4iYf9Gpt3FU4F
	 Kd4tFkH7OtvQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v2 00/14] Remove PG_private by using
 page/folio->private checks instead
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178845180715.3423963.14220073137991024856.git-patchwork-notify@kernel.org>
Date: Thu, 03 Sep 2026 16:10:07 +0000
References: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
In-Reply-To: <20260831-remove-pg_private-v2-0-3668159cd9e8@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: david@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
 muchun.song@linux.dev, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, hannes@cmpxchg.org, qi.zheng@linux.dev,
 shakeel.butt@linux.dev, kasong@tencent.com, mark.rutland@arm.com,
 irogers@google.com, jack@suse.cz, linux-doc@vger.kernel.org,
 amarkuze@redhat.com, peterz@infradead.org, kexec@lists.infradead.org,
 dave.hansen@linux.intel.com, ruirui.yang@linux.dev, adrian.hunter@intel.com,
 linux-mm@kvack.org, hongbohbli@tencent.com, hpa@zytor.com,
 guochunhai@vivo.com, skhan@linuxfoundation.org, ceph-devel@vger.kernel.org,
 baoquan.he@linux.dev, matthew.brost@intel.com, anna@kernel.org,
 sstabellini@kernel.org, zbestahu@gmail.com, rakie.kim@sk.com,
 minchan@kernel.org, richard@nod.at, x86@kernel.org, ebiggers@kernel.org,
 alexander.shishkin@linux.intel.com, mingo@redhat.com, slava@dubeyko.com,
 weixugc@google.com, yukuai@fygo.io, xen-devel@lists.xenproject.org,
 xiang@kernel.org, magiclinan@didiglobal.com, mhiramat@kernel.org,
 joshua.hahnjy@gmail.com, xiao@kernel.org, byungchul@sk.com,
 james.clark@linaro.org, acme@kernel.org, linux-raid@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, bp@alien8.de, rostedt@goodmis.org,
 linux-mtd@lists.infradead.org, axelrasmussen@google.com,
 jefflexu@linux.alibaba.com, namhyung@kernel.org, jaegeuk@kernel.org,
 yuanchu@google.com, idryomov@gmail.com, osalvador@suse.de, jgross@suse.com,
 pratyush@kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 oleksandr_tyshchenko@epam.com, song@kernel.org, corbet@lwn.net,
 pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-perf-users@vger.kernel.org,
 senozhatsky@chromium.org, tglx@kernel.org, jolsa@kernel.org,
 linux-fsdevel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 trondmy@kernel.org
X-purgate-ID: tlsNG-4011c0/1788451868-5A5DBCFC-31A78567/0/0
X-purgate-type: clean
X-purgate-size: 707

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 31 Aug 2026 15:25:23 -0400 you wrote:
> Hi all,
> 
> This patchset removes PG_private to make space for upcoming PG_folio
> (reserved as __PG_folio) for identifying pages from a folio (more details
> in Note below). Instead of checking PG_private, all code is changed to
> check page/folio->private != NULL instead.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,06/14] f2fs: stop using PG_private
    https://git.kernel.org/jaegeuk/f2fs/c/5ad9409a9533

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



