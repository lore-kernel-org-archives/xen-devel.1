From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [GIT PULL] (xen) stable/for-jens-4.19 for 4.19..
Date: Mon, 27 Aug 2018 12:19:49 -0400
Message-ID: <20180827161949.GG29187@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, jgross@suse.com, roger.pau@citrix.com, axboe@kernel.dk, xen-devel@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

Hey Jens,

Would you be OK pulling the following branch:
 git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git stable/for-jens-4.19

which has a fix for flushing out persistent pages at a deterministic rate.

Thanks to the L1TF I did not manage to send this email until today - but
hopefully it won't be an issue to push it to Linus after -rc1?

It is based on your 'b86d865cb1ca (for-4.19/block) blkcg: Make blkg_root_lookup()
work for queues in bypass mode' branch.

Thank you! 

 Documentation/ABI/testing/sysfs-driver-xen-blkback |  10 ++
 drivers/block/xen-blkback/blkback.c                |  99 ++++++++++---------
 drivers/block/xen-blkback/common.h                 |  14 +--
 drivers/block/xen-blkfront.c                       | 110 ++++++++++++++++++---
 4 files changed, 163 insertions(+), 70 deletions(-)

Juergen Gross (5):
      xen/blkback: don't keep persistent grants too long
      xen/blkfront: cleanup stale persistent grants
      xen/blkfront: reorder tests in xlblk_init()
      xen/blkback: move persistent grants flags to bool
      xen/blkback: remove unused pers_gnts_lock from struct xen_blkif_ring
