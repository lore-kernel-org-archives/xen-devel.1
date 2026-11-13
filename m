Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D3606A32D
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dJdcDMcq
Received: from list by lists.xenproject.org with outflank-mailman.1486967.1689467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005Gy-Fj; Fri, 13 Nov 2026 10:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486967.1689467; Fri, 13 Nov 2026 10:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoGb-0005GC-9G; Fri, 13 Nov 2026 10:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1486967;
 Fri, 13 Nov 2026 10:02:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRo7E-0003JQ-P0
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:02:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRo7E-00Go37-5g
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:02:40 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e03f-e002-0a2a0a5209dd-0a2a4506dfae-6
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:02:40 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e03f-195a-0a2a45060019-d155da33b498-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:02:39 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c49c32650adso135814166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:02:39 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b23afdsm74417566b.13.2026.11.13.02.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:02:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=amutable-com.20260707.gappssmtp.com header.i="@amutable-com.20260707.gappssmtp.com" header.h="MIME-Version:User-Agent:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564159; x=1795168959; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
        b=dJdcDMcq22FnJNmK+kO+nuJnqYFR/HyDRnSzQYNSvsKdshgYK9WGtZdG4Gk42ivzIG
         pjOyKGLxtxOdbV33OGZOyqZ/RwsRQcvyTOT2SycK8U9Kyyp7KQraBvGPYuOekVBDFn8T
         iY1UpWrdM+bEyGHt4IHmJ8um07FVWQ0UzSD/OKYM9WQJJxsWY8KcC5kEBJ4Zcks6Vu/H
         zK/PiFBKY4pI/TapWf84lVGr3oPOYaeQVcfUEV6Hcr0Aq8LtE+6fdhH6wmPjzrlvW8aR
         wZny1mDkmBLYvgZGpE/hunJOqAKi2+teR83j5lkFJVGjBYqUIIznOQXshbbLkR4/El5o
         6Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564159; x=1795168959;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
        b=ctJyUYqB9z0385IRktM6GSfGmtZ4+R0dJbc0O4zrFwr8S3l4+mlbw5XcJ3JdFXSylJ
         Qx317q8JkcWjIBQEfcRcjYgVoCE90gOBwaCASSmDePi6HDqqJq4qQ5epVapS8mQGHz7l
         KO466I8u2ceia9n6Na7GKH8Hu4uGYIUWdd/rchQSVudGTeZkyCG7WXH+H2OVtC6J2Hgm
         7lcsFMvxluQtoXBwIGOI/l4GHrNszbov+wJyrFusffD6JqPbkhxYtFWCcIqSkcD6GLxn
         TMRPjv7WshC6rLhfJvDNzQWbixQnZCDbCXjvYidFdeaDqD8HHJ8V6MoCCikfufUsCRHK
         3daQ==
X-Forwarded-Encrypted: i=1; AL+hErHVo2co4dDBcqDHjgKLYEYQaqti5IOu/Ez4n9EqqtKPrvMjcEVirxBsohkAKOhB+Q/aaGyHLtSLc9s=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8w/UVAF598wj85X88Yl4gtNMwuA3OF7L56DyhdsDUIwr/NDLrR
	05nqQhmDQcruB80hilUxh96cDqMjv5ig0+nTF1CuJ5pCB0hGLy70D2HtgI6mYq5Y0oaq
X-Gm-Gg: AYBFou1X5TdCkjbUFEO5uQeKSZ8nZ8SllnUKpQsSQXUSNcDkySsdHIHtHHkTDzv9xUo
	oVMPzxp7REnq+osrflQHTgeJbyVqen0NDu61+WKIh2R5fq3N6lHHOBGjvKBvNmNMEJ544ECHm7C
	8js1wE+gsNBPrYKRKeJPLHuK6Y283JhxXo6GmgLKj5uHEg3NNjTBImc1pP04+w1VPyv7aiL8Dw1
	C3AcS8FwksKuZO2pLOmCD+1h0nPvjaDjB4CMMvYVhsn45HcuAz6/1OUyAnXq9i9+OONNh3Ms7mZ
	C7ubkG15E6oHpQv/lKe5BteIKdBYJqf4fyXT0mvmcXXL0V+zHIeuIwFm0pIRswLtbecZBLkN4KQ
	jV11dwy8d52RiTDJ//gmA76RqDQFDcqLbeSItj1ga7f7alhL0ul2/AUH6Q97DEcFYkuW/ZxYp8E
	zndqBjmTschnXJAa+qSB/lvpNpv2PBYdPlJvrMyDFVzTZ3PVfdl4rNVVrXLOe6a8db8Hw4NCE9i
	K/7ltWRYKNJWIqyKHcT61c7h3h0KY8LG5cvlAVzzOEyvpd2gcTtN7Uxrf1EQcyL9Lh02EvryBMU
	qBGencEyD4S0EbeQhhSXd78UfumLGSPid5x3/gECXSIIKTw4ENmgmvraz0+lGhE=
X-Received: by 2002:a17:907:7b93:b0:c29:f5d5:5a9c with SMTP id a640c23a62f3a-c509654de57mr163595166b.38.1794564159104;
        Fri, 13 Nov 2026 02:02:39 -0800 (PST)
Message-ID: <8c51aa1ad231dea30af06ecf761a971f5958d063.camel@amutable.com>
Subject: Re: [PATCH RFC 05/41] kernfs: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:02:36 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-5-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-5-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-16d1c6/1794564159-F667277B-6B0D2B84/0/0
X-purgate-type: clean
X-purgate-size: 1621
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize all kernfs based filesystems as pseudo filesystems in
> kernfs_get_tree() instead of raising SB_I_NOEXEC and SB_I_NODEV by
> hand
> in kernfs_fill_super(). This adds SB_I_PSEUDO for sysfs, cgroupfs and
> resctrl.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/kernfs/mount.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
> index a0be784bfb06..6b60d212b003 100644
> --- a/fs/kernfs/mount.c
> +++ b/fs/kernfs/mount.c
> @@ -8,6 +8,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/magic.h>
> @@ -298,8 +299,6 @@ static int kernfs_fill_super(struct super_block
> *sb, struct kernfs_fs_context *k
> =C2=A0	struct dentry *root;
> =C2=A0
> =C2=A0	info->sb =3D sb;
> -	/* Userspace would break if executables or devices appear on
> sysfs */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	sb->s_blocksize =3D PAGE_SIZE;
> =C2=A0	sb->s_blocksize_bits =3D PAGE_SHIFT;
> =C2=A0	sb->s_magic =3D kfc->magic;
> @@ -388,6 +387,7 @@ int kernfs_get_tree(struct fs_context *fc)
> =C2=A0	info->ns =3D kfc->ns_tag;
> =C2=A0	INIT_LIST_HEAD(&info->node);
> =C2=A0
> +	fc_init_pseudo(fc);
> =C2=A0	fc->s_fs_info =3D info;
> =C2=A0	sb =3D sget_fc(fc, kernfs_test_super, kernfs_set_super);
> =C2=A0	if (IS_ERR(sb))

