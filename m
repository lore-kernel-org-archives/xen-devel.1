Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EE560A6F47
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrP2Pg4Q
Received: from list by lists.xenproject.org with outflank-mailman.1481469.1685367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQizX-0008U4-4u; Tue, 10 Nov 2026 10:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481469.1685367; Tue, 10 Nov 2026 10:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQizX-0008Tx-0k; Tue, 10 Nov 2026 10:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1481469;
 Tue, 10 Nov 2026 10:14:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <amir73il@gmail.com>) id 1xQisB-0004ot-HH
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:14:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQisA-00E9lo-GK
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:14:38 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <amir73il@gmail.com>)
 id 6af2ee8a-e002-0a2a0a5209dd-0a2a4502bfec-24
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:14:38 +0100
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <amir73il@gmail.com>)
 id 6af2ee8e-6ca4-0a2a45020019-d155d029e9b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 11:14:38 +0100
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6b56bbf8330so2383291a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 02:14:38 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a593eacsm90433466b.36.2026.11.10.02.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 02:14:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794305678; x=1794910478; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=WrP2Pg4Q7t4/b0jQ7vkfc48t9U+zY8csmw/RLlmzMKzMrN8g/oNh5n4tC+MdlLRfd/
         RAu6K5mX3lV+8/Dh6J1rbu8wEROkqOZ0sDcHhl1RJ5AvJqHjmmT5fntMpoWzWM7Lv73w
         szPmWzp0Op+uKL2uKt6XpkuYMmVbvz0ImOjlQgkAH4UHqE9Cj3w+UXGUHK0eDrQoGcTb
         W/Cr4Ssr2ThxTr90XZwWKqbuaquiIv4/FuKCSMPs9PXGaOZPZsy+31WrhKr66LCyt6hA
         WVPE/+E8i4PW4Fz6oeJsjFSESedYfY25M+iG9BIUJZAOrpyKKXn/l+2mIphnzcmH+OM+
         G1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305678; x=1794910478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=AjHIeZwJT9WIJ7TH9r3KmuyF3knSyuTx+7HvUbx8jOopWpHmOlerpnUbctVy+6Vise
         IF+BnV4H4u6sbC8GTO37NmkGBAMS1/GfeTsp1gYK1pscGy8iNDZp9iVOKnDPIw86FrZN
         G+mzH2nJ8vEqs4Vj/bfBKUjxkIOz4yOUAyU7MiE40z7MuE4zyo7lFzLAaIfjWkU6RWKj
         iQ+zWkeaiHiWCmjvLQZ3/8pK5Y1RqcQnINM70v+My4lqY3S1Ce1LOVT/fmEZJ18UVyIK
         ZDrZJTAx8mR39BrH4ACWyYsmcf6JRC533hPAlCD51ORXC5y9ZSEkhzf/A+Vnkr+o7oPp
         qoSw==
X-Forwarded-Encrypted: i=1; AL+hErEqLLXBeB+d+RA0PGFaBEUAZhaDH+ChZvwHcpyVSQPtZTWJH6bxCpeGKzs009WqNA7yOPbQ+a72H/c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+CLIjCddcog5BIt3YjCZXlyK5bUZLYijeCcjRfESMSu3GQVDAN
	7G1d80h5LBiVAllg7/GcSkXdgouLl8IFu8kyUp6wYV7E6JIUYW2vSmw5
X-Gm-Gg: AYBFou1Xu3v1L721IJtdDTyjaUABXtCqN/jYS/6vNnAwZt5FHpj6MRu5Yj0bKQKQODP
	Hv2XlXVmJR7w/Hrmr/jzr4mFz26wbjwPiXLvXwStFvbf+jMdDC6I6Uf8CHImQuVc6iDpYCCcUp6
	TSlpggy5lxEETksVvurhyI4evnq31inHq9abYcPBuLhyLLBnGxC2bNDeRHbMFP1YBDUIWThHQvf
	yUsE8ARLJ4akGXaDC2UTw1KcOr/cdzN7jRYoe2r4ZtFasmFs7mSjwY9lqS8rYyyjiOLOPZUvoIc
	nC86tgcfNBwTWEqEGZdH/4iIq2wPAOXgZi/gWSGtNT+WK77EoPjwKqve/bXgFzCpuOH3JVO62LC
	XIOtCumYwWdZI6tKLqmiKHlRresbaXwKt75UeXmATE7VzUQdkiSY6/LRtLSZzPUJ0a5jlOmL1Vi
	h9I5FeX9CruYmmOB5+5vYGbilBigIajnn/B1n8/txj1Dzc2hn6KwVGEu0bC0nSGAOwf8IHfoWRt
	HZqeWHjnm9OKPP0EszspeVDzEw8qVh3n9jHNOIVfRqUNwIYTj6ESxkAG9ixUYujZm0tdUDLx0GW
	6UWKsFPJO0OgBcgH/nsxTYHtwdmSgt3dv6Pq+Akf1zurRqrnPkR4cFM2uLQePSNM6cPM9ndgy8g
	m+UbE2+hwVd74
X-Received: by 2002:a17:907:944d:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c504963ce05mr189793966b.44.1794305677695;
        Tue, 10 Nov 2026 02:14:37 -0800 (PST)
Date: Tue, 10 Nov 2026 11:14:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
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
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avLui6Mpf8GbKbtc@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
X-purgate-ID: tlsNG-720697/1794305678-30BC02AC-10D551BD/0/0
X-purgate-type: clean
X-purgate-size: 1221
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:14:54AM +0100, Christian Brauner wrote:
> The fuse server can register any regular file as a backing file. procfs
> and binfmt_misc files are already refused by the stacking depth check as
> both set s_stack_depth to FILESYSTEM_MAX_STACK_DEPTH. sysfs and the
> other pseudo filesystems aren't. Reads and writes of the fuse file would
> then be done on the pseudo file with the fuse server's credentials.
> Refuse files on pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/fuse/backing.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 8c21a8a74efb..4e4fb810ddaa 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -147,6 +147,9 @@ static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb,
>  		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
>  			return -ELOOP;
>  
> +		if (file_is_pseudo(file))
> +			return -EINVAL;
> +
>  		fb->type = FUSE_BACKING_PATH;
>  		fb->path = file->f_path;
>  		path_get(&fb->path);
> 
> -- 
> 2.53.0
> 

Reviewed-by: Amir Goldstein <amir73il@gmail.com>


