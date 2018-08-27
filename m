From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [GIT PULL] (xen) stable/for-jens-4.19 for 4.19..
Date: Mon, 27 Aug 2018 11:13:02 -0600
Message-ID: <a54a78c4-14e5-140f-e18d-a23bebd4726d@kernel.dk>
References: <20180827161949.GG29187@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827161949.GG29187@char.us.oracle.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, jgross@suse.com, roger.pau@citrix.com, xen-devel@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

On 8/27/18 10:19 AM, Konrad Rzeszutek Wilk wrote:
> Hey Jens,
> 
> Would you be OK pulling the following branch:
>  git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git stable/for-jens-4.19
> 
> which has a fix for flushing out persistent pages at a deterministic rate.
> 
> Thanks to the L1TF I did not manage to send this email until today - but
> hopefully it won't be an issue to push it to Linus after -rc1?
> 
> It is based on your 'b86d865cb1ca (for-4.19/block) blkcg: Make blkg_root_lookup()
> work for queues in bypass mode' branch.

Pulled, thanks.

-- 
Jens Axboe
