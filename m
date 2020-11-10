Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFD6C388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 08:49:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4586020731
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 08:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iuo8f+7v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y7osrUd/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4586020731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23095.49658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcPKN-0000ob-PG; Tue, 10 Nov 2020 08:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23095.49658; Tue, 10 Nov 2020 08:48:35 +0000
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
	id 1kcPKN-0000oU-KC; Tue, 10 Nov 2020 08:48:35 +0000
Received: by outflank-mailman (input) for mailman id 23095;
 Tue, 10 Nov 2020 08:48:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywAc=EQ=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kcPKL-0000oP-UO
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 08:48:33 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a5526d0-a1a7-4887-9989-79d6b1c40017;
 Tue, 10 Nov 2020 08:48:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ywAc=EQ=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kcPKL-0000oP-UO
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 08:48:33 +0000
X-Inumbo-ID: 5a5526d0-a1a7-4887-9989-79d6b1c40017
Received: from galois.linutronix.de (unknown [193.142.43.55])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5a5526d0-a1a7-4887-9989-79d6b1c40017;
	Tue, 10 Nov 2020 08:48:32 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1604998111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lFM+Dy1hrzRRrrrA3qnbGkxEtyVqIh0g4peYrriLeU=;
	b=iuo8f+7vFglLggVRQElkiZ2WEkqCMbTG8xoMGtVyBk3DBfZOlzK9bn4iYE9n5TJlXEeyiw
	mK2AsUoeE727uJ+eyVgbEeyt2qz1CsngbkfMTC30zg6BSGbxrFxVJV/nTlcmtj9NHSMsJn
	sU38ljGJ30NJ8ooIZ53QTax6dO6NfnLLpRxklxBphTMVejdacYZZqkmCK8e4gkxhfN2Hq9
	zuGNw+h8VUH3NFZO14JlYgbkNPH833xVYFQ2lmqEAC35a4/baTqfi6uG7ey36+HQyygrEi
	Jy4I41umlX4stejJrRBLu7awPrfWhbLcelHNMzqQQSqRZrKTpO34TDntXU+02A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1604998111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+lFM+Dy1hrzRRrrrA3qnbGkxEtyVqIh0g4peYrriLeU=;
	b=y7osrUd/437dzM5/Hc5G9cQ/HuZ2jh7vgX8EDHSswmJuPLkHyLG6iEX8rrCl2sg3XohELe
	1aQhUu8PTNjq+DAw==
To: Ira Weiny <ira.weiny@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap
 <rdunlap@infradead.org>, x86@kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>,
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
 linux-ext4@vger.kernel.org, linux-aio@kvack.org, io-uring@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-ntfs-dev@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, ecryptfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, drbd-dev@lists.linbit.com,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-cachefs@redhat.com, samba-technical@lists.samba.org,
 intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH RFC PKS/PMEM 05/58] kmap: Introduce k[un]map_thread
In-Reply-To: <20201110045954.GL3976735@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com> <20201009195033.3208459-6-ira.weiny@intel.com> <87h7pyhv3f.fsf@nanos.tec.linutronix.de> <20201110045954.GL3976735@iweiny-DESK2.sc.intel.com>
Date: Tue, 10 Nov 2020 09:48:31 +0100
Message-ID: <87eel1iom8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 09 2020 at 20:59, Ira Weiny wrote:
> On Tue, Nov 10, 2020 at 02:13:56AM +0100, Thomas Gleixner wrote:
> Also, we can convert the new memcpy_*_page() calls to kmap_local() as well.
> [For now my patch just uses kmap_atomic().]
>
> I've not looked at all of the patches in your latest version.  Have you
> included converting any of the kmap() call sites?  I thought you were more
> focused on converting the kmap_atomic() to kmap_local()?

I did not touch any of those yet, but it's a logical consequence to
convert all kmap() instances which are _not_ creating a global mapping
over to it.

Thanks,

        tglx


