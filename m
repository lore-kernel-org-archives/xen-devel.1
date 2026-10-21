Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C044560A261B
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=qGU9reyo
Received: from list by lists.xenproject.org with outflank-mailman.1457174.1670047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWes-0002hu-6L; Wed, 21 Oct 2026 13:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457174.1670047; Wed, 21 Oct 2026 13:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWes-0002hn-2O; Wed, 21 Oct 2026 13:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1457174;
 Wed, 21 Oct 2026 13:47:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWer-0002hh-20
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWeq-0065HB-Em
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c25a-2eae-0a2a0a5409dd-0a2a4504a012-12
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:08 +0200
Received: from [209.85.219.48] (helo=mail-qv1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c25a-b57f-0a2a45040019-d155db30cc58-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:07 +0200
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-917a04338c1so7513186d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:07 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10b71043sm25068716d6.9.2026.10.21.06.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:05 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792590426; x=1793195226; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NSUQxko8Tfcm6XPL29du3h24csJ7ZCIrANnIj8sRtpc=;
        b=qGU9reyoNuwEV+jT+EE0WRYnHrs/vuun/NL9enKxKsjvgrS8eZq+kcoXtx/P4wuPqC
         3O7YBneJUTDgJOlrYWHIiZHvAM7Q1X5weyLUn+HChZkBLA5BpZAJ+CY9dCCfNe8WRL9I
         MN5YQcieI9t7EtvIbQXwA9KgaemM7+WVn2/E4rbOQO17r0anqO7Y+CRy7EWVzQ6UUBeh
         6R/YMVtwm1iW/4vghPfSxVZVD6Mz0Kxh4mBhnIKlewNuFXl+P4+TDtVPC/l367sdk8jF
         Cjf+Fotugpor47TymtfRa4V5MCwkP9PoBw/qXNE90ywOA2uVylZUk+jt2vhZEad+nW9Z
         b9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590426; x=1793195226;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NSUQxko8Tfcm6XPL29du3h24csJ7ZCIrANnIj8sRtpc=;
        b=eXVADDfLeSzqNKiiv2MZ3JxBh7Nn4iSg5sU/PyusHTUQiPAVFQJApHJDlF7GmpgcpU
         ux1Mu+HcheqCD59tof4gwmtWPjfDNw6KR27a1zMpK4bQ0hEXfeOiXjknZ6tPiUduQIiT
         Q4ysxD4xsJDhADCCyI84NdUJF3/lD8vcKUHbPrQv1ZcDTm6slHZiJnoJzo7hxXP43U2J
         K52WEYv8mxThgnuR7XgxXioUcezmgqkwybUf4YXpKJgdeVQw5IevQHXjS0e4rAqo5gtW
         BUHTm7zZKWVH0nQv30RbAC6gzb9wHkxXVR4zwkcCeerTi6pPndR7SD/ps1OafC0njN7L
         G77Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2KTnokSptizcgkMHFLmrM9CTs+KjzYCo1wXRYXZoq1IscI/hxfl+BsdzqxWpeBaXugkXhO9d4eFU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKMyoMyX6523q+HkBA6yfEs6xAIDRh2vZ/Bcu3J4emIbi3FfIeO
	drEztPJTWCL2WwqNjrXNL5DDhsHL4TT4IEvtIQXCeW41++KowVcD4gqmEFysSJt0MCE=
X-Gm-Gg: AYBFou13T/V1ClVHQn59NeifrJ0LUavbp2qmKri4OwhynXchIkHkFza9E1dMzCsWsFx
	vrI/JLJOK3c6GySqITxkusTMQJQRpdSv5Ov+0r/Zt+nSMyFjZ+uW/reS/bsZj9m6GtospECK2P1
	MNcv/ar0TRW65ZxGbs+Na723dY4MPS12OBIzrzOuEyafBQeQfXoHT97qZnJJFm+DFMZpVNLuemV
	Ulgg2vIh/S2RYMubYk/37aYWb+/gee1AOIMr8aSG+yCL83X1GtXljT2rimTJZ4Y9h+O4PYSlCRI
	A5kqLz06mzHqrvCa1PbSsKBTVz9Ql1h7NCOzSlmhvt1qchj8Z99z6/SYmTRQkq0mT8KbNRFRFsJ
	/SlH+MzsX2wyitWNblgbgXnQmQkuPBq1oTeKm4uI/qktDZYHxsx7XENKbrP/oCY1tOIcXEH0bjl
	AaC0Ul6ucGKmPwvyi+6R8NfZgn3WDdobU9lxODms4BHh8MKET/qtH/XLysETKyNUR1r5X0Y8jIM
	wBNNQUqGpgH1QXPK6t+UpBhQVZGf/W486zkVbFYtInUqHT4+HHY8xjdux2yDP7nBEXV2QwPn4o7
	EMqwTnsaUIt8u7iktg==
X-Received: by 2002:a05:6214:5684:b0:91b:925f:d0dd with SMTP id 6a1803df08f44-91c12ed41a6mr37332546d6.24.1792590426192;
        Wed, 21 Oct 2026 06:47:06 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next v2 00/15] net: skbuff: follow-ups to the BUG_ON()
 removal
Date: Wed, 21 Oct 2026 13:46:44 +0000
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbC2GoC/32OzQ6CMBCEX8Xs2VVK8PfkexgO3XYrVWxJWxBje
 HcBvepxZmdnvhdEDpYjHBcvCNzZaL0bRb5cgKqkuzBaPWrIs3wrMrFFKjDeqDUGqb2gd2h8Xft
 H20SUWgipTb7fyALGgiawsf1cfgbHCR33CcrPJbZ0ZZWm7ilLMjJSkE5Vk1U3ayrWs/ljbXqqb
 Ew+PGf4TswzX87DP85OYIaF0MRmk9HB7E7J91Y10mm5Uv4O5TAMb/GmpXoaAQAA
X-Change-ID: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590422; l=4828;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=MkdG+2v6TUl21fjtjrRq3//sPUH2f8XRlORQeByLWDY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO2vlJS71pMOkXvl8dcJMiw3/K0ESBPLJ0YBRx9eL5GrB+5fwCnrWBfCg1SGoHqd9H8+QO+i+vN
 43y042wwUbw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792590428-C30CDB50-AD143268/0/0
X-purgate-type: clean
X-purgate-size: 4830
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v1: https://lore.kernel.org/all/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com/

v1->v2:
- skb_segment(): check each frag_list member as the walk takes it,
  instead of an extra pass over the frag_list up front (Willem).
- KUnit test: braces around the suppressed skb_segment() call (Willem),
  and the comment update for the non-uniform case moved into the same
  patch (Mina).
- Picked up Willem's Reviewed-by and Mina's Acked-bys.

--- Original email (v1) ---

Hello,

Jakub applied v2 of my skbuff BUG_ON() series[1] before I got v3 out, so
this is what v3 would have changed, as fixes on top of what landed, plus
the skb_copy_and_csum_bits() patch I'd been sending to net on its own.

Patch 1 is that patch[2], moved to net-next as Mina suggested, with his
Reviewed-by.  It makes skb_copy_and_csum_bits() report failure, and the
rest of the series builds on it.  Please drop the net version.

Patches 2 through 6 deal with skb_checksum() and skb_crc32c().  My v2
had them return 0 when they run out of skb, and that turned out not to
be safe: 0 is a valid checksum, and it can make a packet that was never
fully checksummed pass verification.  So they get versions that report
failure, skb_checksum_full() and skb_crc32c_full(), and the core users
switch to them: checksum validation now rejects a packet it can't
checksum, skb_segment() and pskb_trim_rcsum() fail instead of using a
bad sum, and skb_crc32c_csum_help() drops the packet.  skb_checksum()
and skb_crc32c() stay as wrappers that behave as before, and I'll
convert the rest of their callers per subsystem in later series.

Patches 7 through 10 fix problems Sashiko and an LLM review found in
what was applied.  skb_zerocopy() refuses a zero-length copy that Open
vSwitch can trigger from a user namespace, skb_try_coalesce() and
skb_copy_and_csum_bits() can be handed a negative length, and
skb_headlen() can underflow in skb_copy_and_csum_dev().

Patches 11 and 12 make skb_segment() refuse a nested frag_list, which
could still oops on a NULL list_skb, and add KUnit cases for the layouts
it refuses.  Patches 13 and 14 get rid of the same BUG_ON()s in
xen-netfront's bounce_skb() and tls's __skb_nsg(), and patch 15 updates
comments that still describe the old BUG_ON()s.

I tested this with the net_core KUnit tests, a test module that drives
each of these paths under KASAN and fault injection, an Open vSwitch
reproducer for patch 7, and a stress run over veth with netem.  Thanks,

Josef

[1] https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
[2] https://lore.kernel.org/all/20261013-b4-skb-segment-nosg-unreadable-v2-1-6c28d8ffa51e@toxicpanda.com/

---
Changes in v2:
- Link to v1: https://patch.msgid.link/20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com

---
Josef Bacik (15):
      net: skbuff: make skb_copy_and_csum_bits() report unreadable frags
      net: skbuff: add skb_checksum_full() that reports failure
      net: skbuff: fail checksum validation when the skb can't be checksummed
      net: skbuff: fail segmentation when a segment can't be checksummed
      net: skbuff: fail pskb_trim_rcsum() when it can't checksum the tail
      net: skbuff: add skb_crc32c_full() that reports failure
      net: skbuff: let skb_zerocopy() copy a short skb without head_frag
      net: skbuff: make skb_try_coalesce()'s len unsigned
      net: skbuff: check csum_start against len in skb_copy_and_csum_dev()
      net: skbuff: reject a negative length in skb_copy_and_csum_bits()
      net: skbuff: refuse to segment a nested frag_list
      net: test the frag_list layouts skb_segment() refuses
      xen-netfront: don't BUG() when skb_copy_bits() fails in bounce_skb()
      net/tls: don't BUG() on leftover length in __skb_nsg()
      net: update comments that still describe the skb BUG_ON()s

 drivers/net/ethernet/sun/sunvnet_common.c |  10 +-
 drivers/net/xen-netfront.c                |   7 +-
 include/linux/skbuff.h                    |   8 +-
 net/core/dev.c                            |   7 +-
 net/core/filter.c                         |   6 +-
 net/core/net_test.c                       |  53 +++++-
 net/core/skbuff.c                         | 275 +++++++++++++++++++++++-------
 net/ipv4/icmp.c                           |   9 +-
 net/ipv4/ip_output.c                      |  11 +-
 net/ipv6/icmp.c                           |   7 +-
 net/ipv6/ip6_output.c                     |  11 +-
 net/sunrpc/socklib.c                      |   9 +-
 net/tls/tls_sw.c                          |   5 +-
 13 files changed, 327 insertions(+), 91 deletions(-)
---
base-commit: 6b3e73774815910a39d8ca75b9ad7df963f61d50
change-id: 20261016-b4-skbuff-bug-on-followups-ad11adf285a4


