Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E52606A336
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QzwqcO4I
Received: from list by lists.xenproject.org with outflank-mailman.1487031.1689601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoJT-0002Xv-2Z; Fri, 13 Nov 2026 10:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487031.1689601; Fri, 13 Nov 2026 10:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoJS-0002Xo-Uu; Fri, 13 Nov 2026 10:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1487031;
 Fri, 13 Nov 2026 10:15:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoJS-0002XZ-9h
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:15:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoJR-009cii-Mi
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:15:17 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e320-2eae-0a2a0a5409dd-0a2a4502ce42-40
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:15:17 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e335-6ca4-0a2a45020019-d155802ebde9-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:15:17 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so5374045e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:15:17 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb56680ea9sm31982365e9.0.2026.11.13.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:15:16 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564917; x=1795169717; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=QzwqcO4IonlZH8zgQAcY6hv+2R5oPoVtICSKjQBxsptt2w5pYwaNUZdAQaPPtsW4aV
         3SyuM31i/AFC5n/74Tk5lsWTjz3x1LNMBvjgPLFTNHvOrH8+dqu7xqQD8EXursp/u7pG
         etWi1FH86HcoCcJKxBoIDhosg6G0+X2atJH3nGvv0DZTzZFJRZp8ZrtNRs3JW2dGFxCR
         aSTJ7zmX4LlnUyW1C37kk4TX/BwOi3H5j82nx6/LWrwG/1Blm+Ipz6zwvLJfSdeL3IED
         BAC1UjPFyCj9XMSwmtrv5hC4PQ7tTT/yDmbkMBhnlilLp8oHTMdt5HdNjbv4QAd4+wUw
         uzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564917; x=1795169717;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtOsdPCKGJ1fBhMqXd/zLQfd50NEx4L7veNiE/G2OUE=;
        b=OzT/SU8wHG0aYVCVm9SsMjcoNjsW3xuCS/cb3umNk1ebyav8AYBND43WK2ZARmLxOB
         0t5XZ0ohyIArlQ1Y/l84NHnJ1kte9StgjxTfUZrch1clLFXKSRujqXb34HEzbNw1OOl4
         DqwKBVnTjnEgyQhpEYwdWXti9ZQPX7k5V/vG55Jc6aTcZgwWU5ZHTA7+hB2swKxX1QR2
         BwtGLKq5WQjCxZzgyYVF69gS9loBZVax65W2JYCOXxvyAkJr+t1pp7Ky+EOjayQgxJpT
         +fFE7AFTn9ecgFwTHzSRnmx8b3JDi/O4gWnIRerw9KAN8niN6O59gxhDy9uy2CPF0Jwt
         al+A==
X-Forwarded-Encrypted: i=1; AL+hErFGZoEF/PTxkJGZ2cIHUumjahjiSE8vei7lzSVPrGzN2jVSGpdYulf7qLp7bd9dR6JU+BRxXGM7zn4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/iThaemEG7Kv/0ucXyAiC09PZhscByAb8RBRunhatls34gWdep
	weFmicpNLnN/KTBS41UwHePjN1T5UJ9DBAb1EH4uXPv6gK+salEeacNFp0rNyCuD9wOO
X-Gm-Gg: AYBFou1Z2gZ711A0CbT/kb4yotSiyUiPJqhTu56N+s1yPgzs9muvicFpLOULq2rHa/U
	Nf9Hh1rDZOUW06YiYzqWy70VzCbYisUsDVv+ocxGV2lSfC5uvYhkhTXZekGLk6QJkcifjGMrgCZ
	oftGinhN279UD+BNyehTZQrEE6T16ba3cin2LEGtgcKy8g9DtP1HR5FK/55Drs2TZVMr530xFH7
	ky+2gvjXZBVW6tTcpPUuF0/fBX4eHHjwHlPtoPsOI+95Ncn0ZeA1re8C5tato1UR4pPcc/CsoI1
	83NZgbnl1DFrMUC9NncB1fB70Mhfsc4ftZ32MWTQVVfo0YwNfyVQVdAWP7pOmqOSGAGXWcpxfq9
	M6vzW8KZH5dh65G3wwudJzeIFXIXMRJCe8rfX/pn0Ym35SNjPlp/g6E9hKXHyA2ovJ/cb5UKocc
	cUxw3Mgw2GQJF/A2uNkQERZxSje7KzduzTNQFyrbiIOlnR08zmxgX5Ygv1qgmYQ/9qi73H3gbRy
	I48PGMvKhRNcrV71wKPtDvHudGbzHNpDH4NRRMKXL5A4k/NgN4lINBF956SgvLuugTMB3ZRJvIt
	q4W1e/juomkKB9SOgd3uwwcBCr1UpxckPb50X6UojsSjdCx9TkiiTMdzULJLCbs=
X-Received: by 2002:a05:600c:4f84:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb5599ade1mr43492835e9.0.1794564916955;
        Fri, 13 Nov 2026 02:15:16 -0800 (PST)
Message-ID: <e2edfa06d185acd86b46945622b6eb6dff97b307.camel@amutable.com>
Subject: Re: [PATCH RFC 33/41] fs: add file_is_pseudo()
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
Date: Fri, 13 Nov 2026 11:15:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-33-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-720697/1794564917-660A82AC-D447AE3E/0/0
X-purgate-type: clean
X-purgate-size: 1784
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Add a helper to check whether a file is a regular file on a pseudo
> filesystem. Only regular files count. Device nodes on pseudo
> filesystems
> such as devpts, binderfs or the block devices on bdevfs are what they
> are.
>=20
> Look at the inode that actually provides the data via d_real_inode().
> overlayfs accepts sysfs, cgroup2, debugfs, tracefs, configfs and
> securityfs as lower layers and reads of such an overlayfs file are
> served by the file on the pseudo filesystem. Checking the overlayfs
> inode would miss that.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0include/linux/fs.h | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 99caef43ff3c..407ffb6342ec 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2553,6 +2553,18 @@ static inline const struct inode
> *file_user_inode(const struct file *f)
> =C2=A0	return file_inode(f);
> =C2=A0}
> =C2=A0
> +/*
> + * Regular files on pseudo filesystems are kernel interfaces and
> must not be
> + * used as storage. Look through stacking filesystems at the inode
> that
> + * provides the data.
> + */
> +static inline bool file_is_pseudo(const struct file *file)
> +{
> +	const struct inode *inode =3D d_real_inode(file-
> >f_path.dentry);
> +
> +	return S_ISREG(inode->i_mode) && (inode->i_sb->s_iflags &
> SB_I_PSEUDO);
> +}
> +
> =C2=A0static inline struct file *file_clone_open(struct file *file)
> =C2=A0{
> =C2=A0	return dentry_open(&file->f_path, file->f_flags, file-
> >f_cred);

