Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86C4CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442670.1660209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWBu-0008Ak-OE; Wed, 07 Oct 2026 18:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442670.1660209; Wed, 07 Oct 2026 18:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWBu-0008Ab-L4; Wed, 07 Oct 2026 18:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1442670;
 Wed, 07 Oct 2026 18:16:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWBt-0008AV-QJ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWBt-0013Km-3p
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c78-2eae-0a2a0a5409dd-0a2a4505dcac-16
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:32 +0200
Received: from [209.85.160.172] (helo=mail-qt1-f172.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c7f-4cb1-0a2a45050019-d155a0acc568-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:32 +0200
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-5350cc60b51so35408561cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:32 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5357209ff04sm25811551cf.7.2026.10.07.11.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:30 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791396991; x=1792001791; darn=lists.xenproject.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+d7uJDJhZJvHZwnUFL8rPNX4HlSixikJ7Pt8tEZOBOA=;
        b=MeASrOUDeYRs+g8VxXwVJtQUIB+Y+/wmmKmA0NYddPcSJTYcS0KYj/TZIKs+P9lRsP
         TezsLVI8gqoApHMJGRfoz8ICw7baY9mWpWpqUQH0VYgV9wN/fe5Yo7cVjrC0OZBtzvCl
         VXr5orDU2wLldyDe2tCJE6KSKyjCakixEqZc2sl2LAgiEsePxAkmKTMCJHdh02vmmeUp
         7vVliCyJz0r5H4j1Moj96xXHFsWENJ62q/wVnU3mkkDGh6+UKAKq7T1EFRf/ZmPSJkTX
         7Ei71AUWH6rsuyUACWzrHeBkrAP1aWpq6ksjD90/MatSBI7u82El1Tza3zy5pMOLoTUT
         LBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396991; x=1792001791;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+d7uJDJhZJvHZwnUFL8rPNX4HlSixikJ7Pt8tEZOBOA=;
        b=co0AhnZu/oynUhjuOYicNUkN+BpDkH5rfsEk5Rivk7EIIILzpCa1/jgdLUv6abvj5V
         XYiLj/yu2fUfDGOFK5GA1rIgJ06G5Lsfm2D6MlSFBFUZlAFJJ/OzZnfFlgiuzaCS/J3f
         LxRNx0L7vyYZkJzC2MExEytxjcWa+QyulXjg7WyIXYtsr+yLglDjv0VF8mfNJDZZoIfI
         MYN2ghDv5o7gIqVFFmgix3qyVxVltpzYaJYArN/t7FELgTByGRQbdjcBnzYkUeBHJVW1
         bnR3mblYwVBhbqZYrTIJJeWCq/bjaDdi6NoATNIvmaPdOQlA5WYGG4ZNZw+uX1J+Yri9
         BvNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrE4o5y72aP1sYmrAlXEDM+mJR4UcP5vcJD7sRe3WswU/s8YybLsjqTK5Sn1y4E0wDJQ5kUAL4gsY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lDn7gVBZUB8Um7DMlisrjXgKZ0yu5ACUWQMt58cXlCdG9T4T5W
	wk+C5bWHJ81VoLN9QRtUAY2sc5W3WljtLZpCyYaVq/XtcGbWJ+3612vTnX/UPqRXqhU6whGCNVR
	pU01urwcGlg==
X-Gm-Gg: AYBFou1YqTqqVwwzh3Yi5VokIljwhr7rRDZDlZIBHEm33NhzPUk5RQRMHhfZTt6rRQK
	NCQJCWeCihGUaUjM6rjLIUPJOnhXZ8QM7WizViNenfe3bC9AmSVhIY3iRtsgQCuGC2Ye68TCSyV
	g3Lt/ADP/zMkxfNiwJphX3urC7qniAa5kx9xJkJrskIOPnfNWnrJucTWqulUJO8akW3wmXbJ2ea
	ofE2zfsnfsUJH2VRKijDmmPLzXFLjNMit5mu8+bxUYF3xZfcFfeBzohVN7BJvBiwK4qSyghz9f7
	9N+OB/tecECpyQ5U0Z2i9TokP1xpwmdV9wYy+ezRR3FdvrP7Pvzn2HgEviJZaEJDIoUe+DWjLpc
	K+Yf/jND7S8FskoyZHEgQ87TN+bNNDLIojTb79OSfQNcqotzxYIPbm/X7gVTcA2veRc4omTFH8M
	DVIKMhtoF3icjN65juZTtQ0ZqzDKlCSgK6IXqXOZDpBNLS7GVI9hxhgdbjEJiJvbDcjFp51fNns
	147IEmc34DKykI=
X-Received: by 2002:a05:622a:98b:b0:535:15a9:2516 with SMTP id d75a77b69052e-5357560fcb8mr47504081cf.53.1791396991271;
        Wed, 07 Oct 2026 11:16:31 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH net-next 0/9] net: stop calling __pskb_pull_tail() from
 drivers
Date: Wed, 07 Oct 2026 18:16:13 +0000
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+MxmoC/22NywqDMBBFf0Vm3cEHQWh/pXSRiZM6bUhDJoog/
 nvVbru8r3NXUM7CCrdqhcyzqHziLtpLBW608ckow66ha7q+bZoeyWDSN2GaQsBiJeCQZeas6L3
 x1F17w62FfZ8ye1lO9h0iF4y8FHj8Ep3oxa4c6KNLVhkp2+jGwwqpJlOf5v8z2LYvyPZACbsAA
 AA=
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=4206;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=vn8FTVHGMrT37pYQ+kom/lZJg3xw5yD+Z8WzSqCiJUE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNQafSGevfmZO2PVgBdAMDrT/Q8BcDOZO7ALSZDi6LHzWalQ1RcI/ykJ522k74cd/ODbB0drvUX
 1QhkjFs1aWQY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1791396992-F62AB2A1-1C90D3C0/0/0
X-purgate-type: clean
X-purgate-size: 4208

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
Josef Bacik (9):
      net: ftmac100: check for failure when pulling in the RX header
      net/mlx5e: check for failure when pulling the Ethernet header after XDP
      net: niu: check for failure when pulling in the RX header
      xen/netfront: check for failure when pulling in xennet_fill_frags()
      e1000: use pskb_may_pull() in the 82544 TSO workaround
      e1000e: use pskb_may_pull() in the 82571/2/3 TSO workaround
      netxen: use pskb_may_pull() to pull excess TX frags into the head
      qlcnic: use pskb_may_pull() to pull excess TX frags into the head
      net: skbuff: don't reset truesize in skb_condense() if the pull fails

 drivers/net/ethernet/faraday/ftmac100.c            | 10 ++++++++--
 drivers/net/ethernet/intel/e1000/e1000_main.c      |  5 ++---
 drivers/net/ethernet/intel/e1000e/netdev.c         |  4 ++--
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |  9 ++++++---
 .../net/ethernet/qlogic/netxen/netxen_nic_main.c   |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c     |  2 +-
 drivers/net/ethernet/sun/niu.c                     |  6 +++++-
 drivers/net/xen-netfront.c                         | 22 ++++++++++------------
 net/core/skbuff.c                                  |  3 ++-
 9 files changed, 37 insertions(+), 26 deletions(-)
---
base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
change-id: 20261006-b4-pskb-pull-tail-drivers-ff4fb2964e1a


