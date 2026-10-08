Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6203DCA6016
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 21:03:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443800.1660910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvGs-00046B-2a; Thu, 08 Oct 2026 21:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443800.1660910; Thu, 08 Oct 2026 21:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEvGr-000460-UM; Thu, 08 Oct 2026 21:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1443800;
 Thu, 08 Oct 2026 21:03:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEvGq-00045s-Fr
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 21:03:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEvGp-00Dgxi-T3
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 23:03:19 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac804ff-2eae-0a2a0a5409dd-0a2a4504996c-34
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:19 +0200
Received: from [209.85.160.170] (helo=mail-qt1-f170.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac80516-b57f-0a2a45040019-d155a0aae0aa-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 23:03:19 +0200
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-5338f65913dso60592461cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 14:03:19 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5359b7dd1a0sm3101431cf.27.2026.10.08.14.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2026 14:03:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791493398; x=1792098198; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=veWMGuSVswTQSpRQuCY1UJnPdK7Vk9Kj0h3fikv2+bk=;
        b=lOhict64goEkLiXbsm/Ks8z7FJQkwMOCblP9e1I9yXFIdSQuaM0MV7A2MmulKJ0eD6
         FbKyNBFGQP2jE7kjJAPWXxQUfKgDvJBIWyp60COFsjnRbCkVt99H+4hWyYVLb4/Fok25
         IATSb4Li02kY54CaaHTHDyUPltOe0b0pIqIAx8+FjntgedNvnzb5vxR3RQhA8Q01PGeq
         xXeUdEevkk39uE5o7bZ/y6cKrd1Sm94rSOnmM+AZTK1f5afd3fwRhZoTveVgIp6Yy9SO
         djGoS7unPY27N2HyddB+TGEN/GudrYincCfv9uwCByouO8CGfYvNn1TeuDxO7KBQgk0c
         EHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493398; x=1792098198;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=veWMGuSVswTQSpRQuCY1UJnPdK7Vk9Kj0h3fikv2+bk=;
        b=2nmc4v7EUfdgueHuEcIByIUEOhAY4sJqGSopBQ+nMYmCk7jM0xoOfPIdtzLF43Km83
         YvqWoWI7k4S45ee4vaI34QQ9RL5kLRM43IUBkj6Pbu2WuZtePaErHwvoF0WhIpZjoKo3
         /BzWVoPEtlDn1bFr1MTe6mQyn02UEaZ23YqiWyNLiNspQSA74/fbTf2VTargDyl8mMJi
         0EzZ5FUyOsG6ssU7iipBS7dvn+zSpUjc1K/HdGTkr76c2adBfMjpJ3CiXi12NlyChvgR
         WOFHkr6jWgKQev0VezkmHo+aXZcXafQzkwHHHMEnn7lAZsU5w6eb0AutNjE75UMyAyEv
         PDlA==
X-Forwarded-Encrypted: i=1; AKwUvBwEUOghXKr45O7HlWADjb83evswQSnlk9voivfwd7AvEgun7PiNHPNtUVcDarJo0d56fga3uZxtfZM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lGfzHza7zgUoB36p+B79u05Wn8G5lSJThNtATrC+6IW5GBzo+o
	SDzr2wdpEGLHLcIMIgFZIPLu3BD3Cyc6u/D+VOB6cYg4rVYOnqzen0rRMIGsXhh8FSI=
X-Gm-Gg: AYBFou1ferAmJ1h9a0QZzYGc0XL872AyfF8YQLYGZ5G4l5dVOrpW5mKPzFZdBuetUJ9
	0haBDA4EJ0/GzEZc4+GHfsRGZldt/irsvsBpvXmNWtPJgG6TA35fxj0+lzVFiQ95Zo1GfrLDmas
	GqfnA4ySh4YaRaBAwti3qQ942UU0DSpVIbjgVaKLGhcDHebIgKrhqPxccnILNOw3Zlb8OBfgodl
	cO6CvjyybdNTLGVrxICe9yltTxGQv6l+ytvVKxQ0P0HbTLoImexA/YpMxO2q1RVQo33qfJ3D8Sx
	N/4dtHimpHMeuzgFlILgGDj8yTK827Fzb/bbtKzPGIMOee2HVySDhfZ3ldpbqyqE1evqN6t7vTo
	9RFG129rI40noixRdA7c0kp6StvZioa0E8omE7KHcD7pv+fMzFDQpxXTpMouNXXg1o4u7+QCO/G
	vubm9axsQF78jMipDKzeLBswjXXNlcNt5pxOKsBGW2Y1kLIrZMWYghj+oYke6fg0Gvv2oU6b581
	uFbQ/+Yz/c6S60=
X-Received: by 2002:a05:622a:1f1b:b0:535:70b3:aa38 with SMTP id d75a77b69052e-5357573e670mr108763961cf.74.1791493396306;
        Thu, 08 Oct 2026 14:03:16 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next v2 00/10] net: stop calling __pskb_pull_tail()
 from drivers
Date: Thu, 08 Oct 2026 21:02:47 +0000
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkEyGoC/32OwW6DMBBEfyXac7exLQqip/5HlYPXrMMmxFi2g
 4gi/j1Ae6x6nNmdmfeEzEk4w+fhCYknyTKGVZi3A7jehjOjdKsGo0ytlaqRKoz5Shjvw4DFyoB
 dkolTRu8rT6atK9YW1nxM7GXeu78hcMHAc4HTzyXf6cKubNXbL9nMSMkG12/WEI9UHXfz77Et0
 0suY3rs6JPeV34pm38oJ40K2w9tSHlqm4a+yjiLizZ09t2NNzgty/IC68Wn+BcBAAA=
X-Change-ID: 20261006-b4-pskb-pull-tail-drivers-ff4fb2964e1a
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493384; l=4998;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=uEkT7bvpoCXxFRYilwrMqw4m/avYlKD/tw+E4y7qkfI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCXCcPzYE6MckGlWvZs5GlcBhgvsQUwMKctcIvHVU60iM6MoRF4p5/Zxb/dlkHyUCxdBM8d4+e7
 75wiNZDfujgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1791493399-C3EC6B50-BC1503CD/0/0
X-purgate-type: clean
X-purgate-size: 5000

v1: https://lore.kernel.org/all/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com/

v1->v2:
- New 1/10: skb_drop_empty_frags(). xen-netfront, netxen and qlcnic
  relied on __pskb_pull_tail() releasing zero-length frags even when
  there's nothing to pull, which pskb_may_pull() doesn't do (Sashiko).
- xen-netfront, netxen, qlcnic: call skb_drop_empty_frags() after
  pskb_may_pull().
- skb_drop_empty_frags() checked with a boot-time test under KASAN and
  kmemleak, on cloned and uncloned skbs.

--- Original email (v1) ---

__pskb_pull_tail() is the slow path behind pskb_may_pull() and
__skb_linearize(), and drivers shouldn't be calling it directly.  It
takes the number of bytes to pull relative to the current head and does
no bounds checking on it.  Ask for more than the skb holds and it BUG()s
in skb_copy_bits().  Ask for a negative amount, which is what a caller
computing "len - skb_headlen(skb)" gets once the head is already long
enough, and skb_copy_bits() is handed a length of nearly 4GB to copy
into the head.  Under KASAN that shows up as an out-of-bounds read of
size 4294967288, after which __pskb_pull_tail() returns success with the
skb's head and paged lengths no longer matching its frags.

It also returns NULL on failure with nothing making the caller look at
it.  Eight network drivers call it directly and four of them don't
check.  All four are RX paths where a failed pull is followed by
eth_type_trans() or skb_pull(), which BUG() in __skb_pull() once the
head is shorter than what they pull.  As far as I can tell none of the
four can fail today, since the skb is fresh, isn't shared and has room
in the head, but that only holds because of how each driver happens to
allocate.

pskb_may_pull() and __skb_linearize() take the length the head should
end up with, check it against skb->len and fail cleanly, which is what
every one of these callers wants.  Convert all eight drivers to them,
check the result, and drop the packet on failure.

The last patch makes skb_condense() check its pull as well.  It can't
fail there today, but it would undercount truesize if it ever did.

The callers left in aoe and xen-netfront are fixed separately, through
the block and net trees:

  https://lore.kernel.org/r/20261007-b4-aoe-short-packets-v1-1-db5155f7bb9c@toxicpanda.com
  https://lore.kernel.org/r/20261007-b4-xen-netfront-short-head-v1-1-12d7113a7e4e@toxicpanda.com

Once those are in I'd like to stop exporting __pskb_pull_tail() so new
drivers can't pick it up.

Testing: every touched file builds with W=1 on x86_64 allmodconfig
(ftmac100 on i386, it's 32-bit only).  e1000e under QEMU, which hits
the converted TSO workaround on every TSO packet, passes TCP traffic
between two emulated 82574Ls, and with failslab failing 5% of atomic
allocations the failed pulls drop the packet and nothing falls over.
The same setup with jumbo frames and copybreak off makes
skb_condense() pull frag data into the head tens of thousands of times
a run.  xen-netfront ran as a Xen HVM guest under QEMU's KVM Xen
emulation, with the backend changed to spread frames over 18 and 19 RX
slots, which takes the converted pull in xennet_fill_frags() and its
overflow path.  The other drivers are compile tested only.

Thanks,
Josef

---
Changes in v2:
- Link to v1: https://patch.msgid.link/20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com

---
Josef Bacik (10):
      net: skbuff: add skb_drop_empty_frags()
      net: ftmac100: check for failure when pulling in the RX header
      net/mlx5e: check for failure when pulling the Ethernet header after XDP
      net: niu: check for failure when pulling in the RX header
      xen/netfront: check for failure when pulling in xennet_fill_frags()
      e1000: use pskb_may_pull() in the 82544 TSO workaround
      e1000e: use pskb_may_pull() in the 82571/2/3 TSO workaround
      netxen: use pskb_may_pull() to pull excess TX frags into the head
      qlcnic: use pskb_may_pull() to pull excess TX frags into the head
      net: skbuff: don't reset truesize in skb_condense() if the pull fails

 drivers/net/ethernet/faraday/ftmac100.c            | 10 ++++-
 drivers/net/ethernet/intel/e1000/e1000_main.c      |  5 +--
 drivers/net/ethernet/intel/e1000e/netdev.c         |  4 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |  9 +++--
 .../net/ethernet/qlogic/netxen/netxen_nic_main.c   |  3 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c     |  3 +-
 drivers/net/ethernet/sun/niu.c                     |  6 ++-
 drivers/net/xen-netfront.c                         | 26 +++++++------
 include/linux/skbuff.h                             |  1 +
 net/core/skbuff.c                                  | 43 +++++++++++++++++++++-
 10 files changed, 84 insertions(+), 26 deletions(-)
---
base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
change-id: 20261006-b4-pskb-pull-tail-drivers-ff4fb2964e1a


