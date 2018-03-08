From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [GIT PULL] (xen) stable/for-jens-4.15
Date: Thu, 8 Mar 2018 11:19:14 -0500
Message-ID: <20180308161914.GN12029@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, xen-devel@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

Hi Jens,

Please git pull the following branch for your for-linus branch:

git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git stable/for-jens-4.15

It has one simple fix for the multi-queue support not showing up after a block
device was detached/re-attached.

The patch was originally posted in Dec 22nd but with the Spectre/Meltdown
circus I forgot about it until now.

Thank you!
 
drivers/block/xen-blkfront.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

Bhavesh Davda (1):
      xen-blkfront: move negotiate_mq to cover all cases of new VBDs
