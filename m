Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32357606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 04:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ha4V+Px4
Received: from list by lists.xenproject.org with outflank-mailman.1458823.1670880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7GA-0002Up-1O; Fri, 23 Oct 2026 04:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458823.1670880; Fri, 23 Oct 2026 04:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK7G9-0002Ug-Ux; Fri, 23 Oct 2026 04:52:05 +0000
Received: by outflank-mailman (input) for mailman id 1458823;
 Fri, 23 Oct 2026 04:52:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <netdev-bot+sashiko@kernel.org>) id 1xK7G9-0002H7-2S
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 04:52:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK7G8-00FSb5-E4
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 06:52:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7e7-e002-0a2a0a5209dd-0a2a4506e104-14
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:04 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <netdev-bot+sashiko@kernel.org>)
 id 6adae7f3-195a-0a2a45060019-ac6904fec71e-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 06:52:04 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D86CB600E2;
 Fri, 23 Oct 2026 04:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92E71F01825;
 Fri, 23 Oct 2026 04:52:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Subject:From:To:Cc:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792731122;
	bh=BoB/A1sIi/INkgoVC9AAFNKr7YKhQUbQ+JtYOmccKaE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ha4V+Px40uunuItMDirEmvN1G4w/6nhYdHlSNLpf8paKd/rUtTd+wHcsWbIWeh3GD
	 LKrDwytd64GaIIfsmbD/j/9gf7BHplAqBgp3l/kTDVED007liwV2WGOermBWF5qfcO
	 tLGgQLX1Y6A8QeXHVR2/tSCuONL96UW/Bjn/xiiVoz4Y4Kd/gnKCPhA0T96Io5fZu5
	 KqK5I2Zbhb6R/KGZKRp/We9eIpPMEBdMj1glD5VbZUY7eRcxsXRAOmp8cPanCmDJsJ
	 SErKFtysFh+XDSmW/y5rDCe2OyDG+E5MBzBUz2TRTWAg+64uso+iw/+/rBv+IQDT7j
	 N/2qfuwKE/wyg==
Subject: Re: [PATCH net-next 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
From: netdev-bot+sashiko@kernel.org
To: josef@toxicpanda.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, jgross@suse.com,
 sstabellini@kernel.org, willemdebruijn.kernel@gmail.com, fmancera@suse.de,
 almasrymina@google.com, david.laight.linux@gmail.com, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Date: Fri, 23 Oct 2026 04:52:01 +0000
Message-ID: <179273112116.3134.13075947496257634766@kernel.org>
In-Reply-To:
 <20261019-b4-skbuff-bug-on-followups-v1-4-41dbef50b9f7@toxicpanda.com>
References:
 <20261019-b4-skbuff-bug-on-followups-v1-4-41dbef50b9f7@toxicpanda.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-16d1c6/1792731124-FE87577B-50A78BD3/0/0
X-purgate-type: clean
X-purgate-size: 2518
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes a real, user-visible TX bug but has no Fixes:
  tag (and no Cc: stable).

--

net: skbuff: fail segmentation when a segment can't be checksummed

This patch changes the sg && !csum software checksum path in
skb_segment() to use skb_checksum_full(). The segmentation now fails with
-EFAULT when a segment can't be checksummed. This covers devmem TCP skbs
whose payload is in unreadable frags: skb_checksum() used to warn and
return 0, so the TCP checksum didn't cover the payload.

Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/

> Found by the Sashiko AI review of an earlier fix for the same path with
> SG off.
>
> Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

[Severity: Low]
Should this have a Fixes: tag, and possibly Cc: stable?

Before this patch, the perform_csum_check branch of skb_segment() called
skb_checksum() on segments that share the devmem skb's net_iov frags.
zerocopy_fill_skb_from_devmem() in net/core/datagram.c never sets
SKBFL_SHARED_FRAG, so the __skb_linearize() fallback is skipped and
__skb_checksum() ends up here:

    if (WARN_ON_ONCE(!skb_frags_readable(skb)))
        return 0;

That WARN is fatal with panic_on_warn. tcp_gso_segment() then writes a
TCP checksum that doesn't cover the payload that goes out.

This path became reachable when unreadable-frag TX skbs were added by:

bd61848900bf ("net: devmem: Implement TX path")

That looks like the right Fixes: target. Another patch in this series,
"net: skbuff: fail checksum validation when the skb can't be checksummed",
does carry a Fixes: tag. Without one here, the stable tooling won't pick
up this fix.

This patch also calls skb_checksum_full(), which is added by the earlier
patch in this series, "net: skbuff: add skb_checksum_full() that reports
failure". Could the commit message mention that dependency, so a backport
takes both patches?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7%40toxicpanda.com

