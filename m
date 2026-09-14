Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E8C88E6E
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:31:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421118.1647248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68eW-00066U-Bo; Mon, 14 Sep 2026 15:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421118.1647248; Mon, 14 Sep 2026 15:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68eW-00066N-8A; Mon, 14 Sep 2026 15:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1421118;
 Mon, 14 Sep 2026 15:31:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1x68eU-0005t7-VZ
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:31:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x68eU-004ExS-B7
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:31:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <patchwork-bot+f2fs@kernel.org>)
 id 6aa8134c-bab6-0a2a0a5309dd-0a2a450ad290-8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:31:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <patchwork-bot+f2fs@kernel.org>)
 id 6aa8134b-f2d2-0a2a450a0019-aceafc1fcd92-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:31:25 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 953F9408EA;
 Mon, 14 Sep 2026 15:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F361F0089A;
 Mon, 14 Sep 2026 15:31:23 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D092A3924A79; Mon, 14 Sep 2026 15:30:19 +0000 (UTC)
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
	s=k20260515; t=1789399883;
	bh=nR/vh4GvI0WOU5I3SDjzgrYVoTA8r4/N125W3zwVcoM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RbCEKtn4AO+w1y1Nm4+9OPjd3F5HeNMHAg3uez+4FdxFCGDSSpv7EiKf+nOYlAqRD
	 WpbEgLLqAW4/l8pXzRAprjeTjPg5iYhCGnBEarYYppZgnkrHtBmnFS9mupbuYxw5uF
	 9IaiI70goJcN/QHzRT88UUSpAI4Re7c2DETfrByKeR3s4TjTlq6nG8lVpXAeCBJkvv
	 0JK4xXezKzgYlQ+Oc3bwKs3QN943NILxYGwTYwEDkh+jk8qAJukkZVAb2U57/OORtM
	 maeohl2NdOmJIEX01jxCO7utzNVfC1W0jyXsjrJ+AH6xFXa9Zfjke3MaE5gkTOu/bL
	 U9AI6BB36tibg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH v4 00/16] Remove PG_private by using
 page/folio->private checks instead
From: patchwork-bot+f2fs@kernel.org
Message-Id: 
 <178939981839.647967.9641554131485178993.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:30:18 +0000
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
In-Reply-To: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
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
 guochunhai@vivo.com, skhan@linuxfoundation.org, tz2294@columbia.edu,
 baoquan.he@linux.dev, matthew.brost@intel.com, anna@kernel.org,
 sstabellini@kernel.org, zbestahu@gmail.com, rakie.kim@sk.com,
 minchan@kernel.org, richard@nod.at, x86@kernel.org,
 ceph-devel@vger.kernel.org, ebiggers@kernel.org,
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
X-purgate-ID: tlsNG-4011c0/1789399885-4B8D5CFC-CEC5E8D3/0/0
X-purgate-type: clean
X-purgate-size: 789

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 13 Sep 2026 22:23:58 -0400 you wrote:
> Hi all,
> 
> This patchset removes PG_private to make space for upcoming PG_folio for
> identifying pages from a folio (more details in Note below). Instead of
> checking PG_private, all code is changed to check page/folio->private !=
> NULL instead.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,06/16] f2fs: stop using PG_private
    https://git.kernel.org/jaegeuk/f2fs/c/60105162524e
  - [f2fs-dev,v4,07/16] f2fs: convert the ->private flag helpers to folio-only
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



