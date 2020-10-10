Return-Path: <SRS0=K75F=DR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1FCC433E7
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2020 03:43:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2CA12184D
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2020 03:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2CA12184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xmission.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5276.13809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR5mv-0007dw-KQ; Sat, 10 Oct 2020 03:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5276.13809; Sat, 10 Oct 2020 03:43:17 +0000
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
	id 1kR5mv-0007dp-Gw; Sat, 10 Oct 2020 03:43:17 +0000
Received: by outflank-mailman (input) for mailman id 5276;
 Sat, 10 Oct 2020 03:43:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyxi=DR=xmission.com=ebiederm@srs-us1.protection.inumbo.net>)
 id 1kR5mu-0007dk-Ay
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 03:43:16 +0000
Received: from out01.mta.xmission.com (unknown [166.70.13.231])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfde5a33-e930-4dc7-83bd-c708f08867f0;
 Sat, 10 Oct 2020 03:43:14 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1kR5ma-003qSe-1R; Fri, 09 Oct 2020 21:42:56 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
 helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
 (envelope-from <ebiederm@xmission.com>)
 id 1kR5mZ-0002tO-03; Fri, 09 Oct 2020 21:42:55 -0600
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Kyxi=DR=xmission.com=ebiederm@srs-us1.protection.inumbo.net>)
	id 1kR5mu-0007dk-Ay
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 03:43:16 +0000
X-Inumbo-ID: dfde5a33-e930-4dc7-83bd-c708f08867f0
Received: from out01.mta.xmission.com (unknown [166.70.13.231])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dfde5a33-e930-4dc7-83bd-c708f08867f0;
	Sat, 10 Oct 2020 03:43:14 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
	by out01.mta.xmission.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1kR5ma-003qSe-1R; Fri, 09 Oct 2020 21:42:56 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
	by in02.mta.xmission.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1kR5mZ-0002tO-03; Fri, 09 Oct 2020 21:42:55 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: ira.weiny@intel.com
Cc: Andrew Morton <akpm@linux-foundation.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov
 <bp@alien8.de>,  Andy Lutomirski <luto@kernel.org>,  Peter Zijlstra
 <peterz@infradead.org>,  x86@kernel.org,  Dave Hansen
 <dave.hansen@linux.intel.com>,  Dan Williams <dan.j.williams@intel.com>,
  Fenghua Yu <fenghua.yu@intel.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-nvdimm@lists.01.org,
  linux-fsdevel@vger.kernel.org,  linux-mm@kvack.org,
  linux-kselftest@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm@vger.kernel.org,  netdev@vger.kernel.org,  bpf@vger.kernel.org,
  kexec@lists.infradead.org,  linux-bcache@vger.kernel.org,
  linux-mtd@lists.infradead.org,  devel@driverdev.osuosl.org,
  linux-efi@vger.kernel.org,  linux-mmc@vger.kernel.org,
  linux-scsi@vger.kernel.org,  target-devel@vger.kernel.org,
  linux-nfs@vger.kernel.org,  ceph-devel@vger.kernel.org,
  linux-ext4@vger.kernel.org,  linux-aio@kvack.org,
  io-uring@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
  linux-um@lists.infradead.org,  linux-ntfs-dev@lists.sourceforge.net,
  reiserfs-devel@vger.kernel.org,  linux-f2fs-devel@lists.sourceforge.net,
  linux-nilfs@vger.kernel.org,  cluster-devel@redhat.com,
  ecryptfs@vger.kernel.org,  linux-cifs@vger.kernel.org,
  linux-btrfs@vger.kernel.org,  linux-afs@lists.infradead.org,
  linux-rdma@vger.kernel.org,  amd-gfx@lists.freedesktop.org,
  dri-devel@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
  drbd-dev@lists.linbit.com,  linux-block@vger.kernel.org,
  xen-devel@lists.xenproject.org,  linux-cachefs@redhat.com,
  samba-technical@lists.samba.org,  intel-wired-lan@lists.osuosl.org
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-52-ira.weiny@intel.com>
Date: Fri, 09 Oct 2020 22:43:15 -0500
In-Reply-To: <20201009195033.3208459-52-ira.weiny@intel.com> (ira weiny's
	message of "Fri, 9 Oct 2020 12:50:26 -0700")
Message-ID: <87k0vysq3w.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1kR5mZ-0002tO-03;;;mid=<87k0vysq3w.fsf@x220.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1+M6Nwc1eevosTTnX6IxBw6BnHTGm05YjI=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH RFC PKS/PMEM 51/58] kernel: Utilize new kmap_thread()
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

ira.weiny@intel.com writes:

> From: Ira Weiny <ira.weiny@intel.com>
>
> This kmap() call is localized to a single thread.  To avoid the over
> head of global PKRS updates use the new kmap_thread() call.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  kernel/kexec_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index c19c0dad1ebe..272a9920c0d6 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -815,7 +815,7 @@ static int kimage_load_normal_segment(struct kimage *image,
>  		if (result < 0)
>  			goto out;
>  
> -		ptr = kmap(page);
> +		ptr = kmap_thread(page);
>  		/* Start with a clear page */
>  		clear_page(ptr);
>  		ptr += maddr & ~PAGE_MASK;
> @@ -828,7 +828,7 @@ static int kimage_load_normal_segment(struct kimage *image,
>  			memcpy(ptr, kbuf, uchunk);
>  		else
>  			result = copy_from_user(ptr, buf, uchunk);
> -		kunmap(page);
> +		kunmap_thread(page);
>  		if (result) {
>  			result = -EFAULT;
>  			goto out;
> @@ -879,7 +879,7 @@ static int kimage_load_crash_segment(struct kimage *image,
>  			goto out;
>  		}
>  		arch_kexec_post_alloc_pages(page_address(page), 1, 0);
> -		ptr = kmap(page);
> +		ptr = kmap_thread(page);
>  		ptr += maddr & ~PAGE_MASK;
>  		mchunk = min_t(size_t, mbytes,
>  				PAGE_SIZE - (maddr & ~PAGE_MASK));
> @@ -895,7 +895,7 @@ static int kimage_load_crash_segment(struct kimage *image,
>  		else
>  			result = copy_from_user(ptr, buf, uchunk);
>  		kexec_flush_icache_page(page);
> -		kunmap(page);
> +		kunmap_thread(page);
>  		arch_kexec_pre_free_pages(page_address(page), 1);
>  		if (result) {
>  			result = -EFAULT;

