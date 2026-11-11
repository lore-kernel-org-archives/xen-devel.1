Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55C606A89F
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:56:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1483984.1687353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9kp-0004FV-Op; Wed, 11 Nov 2026 14:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483984.1687353; Wed, 11 Nov 2026 14:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9kp-0004FO-LL; Wed, 11 Nov 2026 14:56:51 +0000
Received: by outflank-mailman (input) for mailman id 1483984;
 Wed, 11 Nov 2026 14:56:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hch@lst.de>) id 1xR9ko-0004Dg-HY
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:56:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9kn-0047IJ-Ud
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:56:49 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hch@lst.de>)
 id 6af48231-2eae-0a2a0a5409dd-0a2a4509e03e-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:56:49 +0100
Received: from [213.95.11.211] (helo=verein.lst.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hch@lst.de>)
 id 6af48231-be1a-0a2a45090019-d55f0bd3d72e-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:56:49 +0100
Received: by verein.lst.de (Postfix, from userid 2407)
 id BF2AF68D09; Wed, 11 Nov 2026 15:56:47 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Wed, 11 Nov 2026 15:56:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 03/41] target: fileio: check that the backing file
 supports ->{read,write}_iter
Message-ID: <20261111145647.GC9996@lst.de>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org> <20261110-work-loop-pseudo-v1-3-4c998976c6c7@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-3-4c998976c6c7@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-purgate-ID: tlsNG-bad1c0/1794409009-BE2C4034-6BD10488/0/0
X-purgate-type: clean
X-purgate-size: 604
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:14:19AM +0100, Christian Brauner wrote:
> With fd_async_io=1 the fileio backend calls ->read_iter() and
> ->write_iter() of the backing file directly. The synchronous path goes
> through vfs_iter_read() and vfs_iter_write() which check for them but
> the aio path doesn't. So a backing file without them calls a NULL
> pointer on its first I/O.
> 
> Refuse such files when configuring the device. On the synchronous path
> every read or write that needed the missing method failed with EINVAL
> anyway.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


