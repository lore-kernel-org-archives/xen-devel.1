Return-Path: <SRS0=s5AT=DT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E9CC43467
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 05:52:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B72BA20714
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 05:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B72BA20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5791.15041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRqkx-00006N-V0; Mon, 12 Oct 2020 05:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5791.15041; Mon, 12 Oct 2020 05:52:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRqkx-000062-Qq; Mon, 12 Oct 2020 05:52:23 +0000
Received: by outflank-mailman (input) for mailman id 5791;
 Mon, 12 Oct 2020 05:52:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kRqkx-00005u-A3
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 05:52:23 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cfe2325-0548-49c5-bc49-3513849e67fe;
 Mon, 12 Oct 2020 05:52:21 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:20 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2020 22:52:19 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uzT3=DT=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kRqkx-00005u-A3
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 05:52:23 +0000
X-Inumbo-ID: 4cfe2325-0548-49c5-bc49-3513849e67fe
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4cfe2325-0548-49c5-bc49-3513849e67fe;
	Mon, 12 Oct 2020 05:52:21 +0000 (UTC)
IronPort-SDR: IZoSZ/GPXERgY4pSWfMFevrkmP+3iWYjSO6Y6o1NEk2j35ezRz042p/BH0mZHp3/ACJDi3IEMK
 Y+FNgg9/JeRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="162227139"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="162227139"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 22:52:20 -0700
IronPort-SDR: Ya9EDAn3SOMd08SCKVKBtueoni+yyq9EF8H8N9tr+YE/IrdFHweYy6SREcwPgxnde0DbbLRvxa
 rOKYCbITG9ew==
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="520573207"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 22:52:19 -0700
Date: Sun, 11 Oct 2020 22:52:19 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, devel@driverdev.osuosl.org,
	linux-efi@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-aio@kvack.org,
	io-uring@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-um@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-cachefs@redhat.com, samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 57/58] nvdimm/pmem: Stray access protection
 for pmem->virt_addr
Message-ID: <20201012055218.GA2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-58-ira.weiny@intel.com>
 <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd3f5ece-0e7b-4c15-abbc-1b3b943334dc@nvidia.com>
User-Agent: Mutt/1.11.1 (2018-12-01)

On Fri, Oct 09, 2020 at 07:53:07PM -0700, John Hubbard wrote:
> On 10/9/20 12:50 PM, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The pmem driver uses a cached virtual address to access its memory
> > directly.  Because the nvdimm driver is well aware of the special
> > protections it has mapped memory with, we call dev_access_[en|dis]able()
> > around the direct pmem->virt_addr (pmem_addr) usage instead of the
> > unnecessary overhead of trying to get a page to kmap.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >   drivers/nvdimm/pmem.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index fab29b514372..e4dc1ae990fc 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -148,7 +148,9 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
> >   	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> >   		return BLK_STS_IOERR;
> > +	dev_access_enable(false);
> >   	rc = read_pmem(page, page_off, pmem_addr, len);
> > +	dev_access_disable(false);
> 
> Hi Ira!
> 
> The APIs should be tweaked to use a symbol (GLOBAL, PER_THREAD), instead of
> true/false. Try reading the above and you'll see that it sounds like it's
> doing the opposite of what it is ("enable_this(false)" sounds like a clumsy
> API design to *disable*, right?). And there is no hint about the scope.

Sounds reasonable.

> 
> And it *could* be so much more readable like this:
> 
>     dev_access_enable(DEV_ACCESS_THIS_THREAD);

I'll think about the flag name.  I'm not liking 'this thread'.

Maybe DEV_ACCESS_[GLOBAL|THREAD]

Ira


