Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1633A606A32D
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W564umKA
Received: from list by lists.xenproject.org with outflank-mailman.1489582.1690991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSN2a-0005vh-8s; Sat, 14 Nov 2026 23:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489582.1690991; Sat, 14 Nov 2026 23:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSN2a-0005va-66; Sat, 14 Nov 2026 23:20:12 +0000
Received: by outflank-mailman (input) for mailman id 1489582;
 Sat, 14 Nov 2026 23:20:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <amir73il@gmail.com>) id 1xSN2Y-0005vU-KT
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 23:20:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSN2Y-006f3e-1U
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2026 00:20:10 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <amir73il@gmail.com>)
 id 6af8eb95-8faa-0a2a0a5109dd-0a2a4508a520-40
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2026 00:20:09 +0100
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <amir73il@gmail.com>)
 id 6af8eca9-f659-0a2a45080019-d155d031a54c-3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2026 00:20:09 +0100
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6b596569640so4611876a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 15:20:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=iSNMHchSMpPnYiZQ8Mn5XxXES6Pc/dFADNNIOEGhZ51x7v8tc+Iofv9Cmw6EQ7R74d
         xxJ91+StPnMFhmq1rVw20kwMpfXu7Bsv9wr5gOxqp55OsNNnSXlQdfeqOMWcr9MlLWWk
         5uO9mHVyEFjb02iAc8a8VJOtu7wR3P2nL+wW8g+I6wal+2ifyk3pZxX8h1pmi745JaEd
         Yk0jl2v45Fc40Tm0BQEO45ytZrJ2NpPisSYH4BH8V22FSV2i7vm/WkZbnp7ju/GuAFPs
         kuVMPnSG4xNu3TsbB94kOC6dPUjTzVUlwaz23mKtUxnG1unRfF/LGDw77CejjjsU1lrA
         hgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=PnMlckc2mHwAKI6QRQw4d75G+adqSQZCq9Rb7q2rces=;
        b=Vo5k7EIDnVKCmGXdUlfJa8+WgiaAHQpwuBo3BdpqKByiTBBjN8psITbnDR6iVRSBMl
         yWzlKBlV+4YuztcDV/f7WK9/0GcuflBYSd6u+/zZYAJKmFOd9TI47FiwuOT1Jq8H7qiu
         eQ/uurNGFwPTyDl5eVvk+ZS2hlX6dQqTW3aDI9GJgusfU4UIAosWgreUNpVuzaYGrB+A
         RpGjzcUuZy59R4Re3lQXZkpapzn00eCydx+lMcmPaLZSYn0hZbPan8rq2zHa22Xsoc+S
         Ffb1PyPxhowIy4wzJW/mBAWzroy9D3GnFT90JxCgVhCdtSmiej/+GqbpFdGpkhhMcrSU
         nHAQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=W564umKACQ3qi/YeFv2H2krXOgJqmUrGmFWsVzSfsJQmQLGnRtIFMiRxjKI4r+IYBd
         l+eS3/djDBmhu4J+k3tTBzn/B3zxSLyl/CVy9qcVZmLBoImGF8eeSR8sIfAarcCHxPwv
         NkbIN+YZu2k5nFZ7PynoSTt6U/JYcmphIPX72JSI5gqim2pXe5a97hr64LHczU4GydzS
         e9O/1uo7sx+fzUp4sS3n14UdRYJCsRJZKJHCxypJ5jrHPKSpbDQVFWlzFsNiK+HeG3gr
         /Lp5VYDeEl2Qs/41zAhaQzZ4OQIj8tN0d1cZpLwFmVtiAUpMEGp+pCvMESE6qa+sI73E
         Njlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=Hm5/kYviaf1gKQQLDop335b09q7pg2yF3KM/t5Qsf4snWZXMvkzLxjPvP4cYGiGTxC
         bUuW7xBfYn+FiLBgf71SXQbybcsCouddg15qDblj3qIFsU+k2v7NWEjFW3r8bSkNrpIj
         tQJF3bSUd4QaAmqQ2Skum2PaBonDGsAQQKZ0uG/XvoTkysX0MVUY6p9N4xeB97TzNTWW
         DEHGjXdwllZzGeDYyI2C7x9slwE+hFe47gpXgIe9sbi3Ri5ErhMZ/aR6by+UCy/nFmIW
         o/xF0SINB1coeRZBPMXfXC1ZtPjzPC3HJlEbICtNbC7/rNGkcWRnxTZi74hhx9NDduQ9
         tcUA==
X-Forwarded-Encrypted: i=1; AL+hErFeMSzzkOtaNTG7QpOYaTPMeQyZ2rvp8T/g/SW1fp/FLNqtOAgFi1rXEO4sa4ol02JapC2RqGeYGZw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9X9WpZfiUUwfwleLJdcz8CH96ga4NkxgN5xYbK6g154ePefxdC
	hw7K45KHTxr7n20gC/yEOe1V8J8DK7ozTw/+4wCOxBmus8JPaqN/G9GKDoqSW61/vJfK1LRUs6n
	M4I+U+AsQwDG2I5iu33GIIb4V4gJtmp0=
X-Gm-Gg: AYBFou2IaZ6UCo1iZ0bbl/xnJ56ODfHRMwsHQbVAIUhFK8sltfZSDcKAl7zAHmrx4/M
	rVYT4UJ2YFs0I8FI5GFUadL0Z+wG6of9EvpuZjBEIN63ut48VB/HuOGMABNJD28uAFQMysf5tdR
	mhdTt+xxGXFh7NrrrRg8/2NTOWJrk+0o1yRQWHHOLs3I5eNPRKBmnVpEb6H567OPc39+17YcerA
	SLNZfrgq6Ycr3xlltzRePzK+ilVbZMcTKxrxdGH0V/r/xNzCt/Rbmvemj8KqR869LXfZWWlK/sn
	KlaAU0nGYHEL8KRAUctTK5LWORlyWV3S+0x9lBSRQA5h8GCpZ3zsaCl7kEaH4q2yPWgjBTkcGWD
	UANKfbNlE1BsC/VCqae5/HEdiza9ynF6EAfLanLCqva8tMP16zaZ/qpRRWiPzFfp4rvPN1g==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1794698409-D574B87B-691164D9/0/0
X-purgate-type: clean
X-purgate-size: 2344
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.

