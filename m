Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B62606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhEMPzkS
Received: from list by lists.xenproject.org with outflank-mailman.1490894.1691836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwdp-0003ju-Gv; Mon, 16 Nov 2026 13:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490894.1691836; Mon, 16 Nov 2026 13:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSwdp-0003jn-DJ; Mon, 16 Nov 2026 13:21:01 +0000
Received: by outflank-mailman (input) for mailman id 1490894;
 Mon, 16 Nov 2026 13:21:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brauner@kernel.org>) id 1xSwdo-0003jh-0B
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:21:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSwdn-000p2Q-5o
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 14:20:59 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brauner@kernel.org>)
 id 6afb0338-e002-0a2a0a5209dd-0a2a45098690-8
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:20:59 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brauner@kernel.org>)
 id 6afb0339-be1a-0a2a45090019-ac6904fe93be-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:20:58 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 06B4A62A16;
 Mon, 16 Nov 2026 13:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287C11F000C4;
 Mon, 16 Nov 2026 13:20:47 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794835256;
	bh=Zwp/b2OseRP/BP0MRnYEMv10Xx5652k/ysAi77DyTUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MhEMPzkS8ELyUuZJvWfSoeeWuf7By4IL/aj2kb/a2OV4l4EgVqKXjiioyUz2RieNk
	 XgpnwYQk+l7IQUQIb2TJG9rqwlNZZd2t4tSSz2FIOFgSK4qv3MUw+KnfbEysg8x4iS
	 RMX98jFDrMhGiTX7izqJwsUslncHgd0fLN7Yyo0X4gX89YKFy614i608nuofc5428F
	 SfK4Vb1AO45G7cvMjjgv1ixrvwKqD7DXpAnyYbrMZDnbnAmpR0a9mRVyF+s9eImB9m
	 jgQn4Dmx1KWjFDTc0G8bS5OCGFot8PkE1fqYZHJngkkRDFtxZNJw9/svWtFGNRWRiW
	 sc42i9H1mtjtg==
Date: Mon, 16 Nov 2026 14:20:45 +0100
From: Christian Brauner <brauner@kernel.org>
To: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org
Cc: jannh@google.com, mason@kernel.org, josef@toxicpanda.com, hch@lst.de, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	viro@zeniv.linux.org.uk, jack@suse.cz, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, driver-core@lists.linux.dev, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	ocfs2-devel@lists.linux.dev, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, amir73il@gmail.com, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, chris@chrisdown.name, ast@kernel.org, andrii@kernel.org, 
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, ihor.solodrai@linux.dev
Subject: Re: [PATCH RFC v3 38/44] nvmet: refuse files on pseudo filesystems
 as namespace backing files
Message-ID: <20261116-geplagt-gemein-zufrieden-72c3817de2c6@brauner>
References: <20261116-work-loop-pseudo-v3-38-8cbbea1cf34f@kernel.org>
 <cb28f09c85a473a23f14c9bd6ef135950197c9fbf966c1f7055d791977d29286@mail.kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb28f09c85a473a23f14c9bd6ef135950197c9fbf966c1f7055d791977d29286@mail.kernel.org>
X-purgate-ID: tlsNG-bad1c0/1794835258-3B0DD034-717BEF60/0/0
X-purgate-type: clean
X-purgate-size: 314
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 12:00:14PM +0000, bot+bpf-ci@kernel.org wrote:
> Is a prerequisite patch adding d_real_data_inode() missing from the series?

No. d_real_data_inode() comes from "fs: let d_real() fail" which is in
the base-commit of this series (vfs-7.5.lookup). This was applied to
bpf-next instead.

