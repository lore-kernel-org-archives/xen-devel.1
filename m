From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [GIT PULL] (xen) stable/for-jens-4.15
Date: Thu, 8 Mar 2018 09:25:51 -0700
Message-ID: <f386ba9b-d331-ee8d-2b2f-27ff0074ed7d@kernel.dk>
References: <20180308161914.GN12029@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308161914.GN12029@char.us.oracle.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

On 3/8/18 9:19 AM, Konrad Rzeszutek Wilk wrote:
> Hi Jens,
> 
> Please git pull the following branch for your for-linus branch:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git stable/for-jens-4.15
> 
> It has one simple fix for the multi-queue support not showing up after a block
> device was detached/re-attached.
> 
> The patch was originally posted in Dec 22nd but with the Spectre/Meltdown
> circus I forgot about it until now.
> 
> Thank you!
>  
> drivers/block/xen-blkfront.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> Bhavesh Davda (1):
>       xen-blkfront: move negotiate_mq to cover all cases of new VBDs

Pulled, thanks.

-- 
Jens Axboe
