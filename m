Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F6060A3827
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Da8rglp8
Received: from list by lists.xenproject.org with outflank-mailman.1487042.1689609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoK8-0003NL-95; Fri, 13 Nov 2026 10:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487042.1689609; Fri, 13 Nov 2026 10:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRoK8-0003NE-68; Fri, 13 Nov 2026 10:16:00 +0000
Received: by outflank-mailman (input) for mailman id 1487042;
 Fri, 13 Nov 2026 10:15:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRoK7-0003Lg-AJ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 10:15:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRoK6-009tb3-My
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:15:58 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e33e-bab6-0a2a0a5309dd-0a2a45099c7a-48
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:15:58 +0100
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af6e35e-be1a-0a2a45090019-d155da2bc4b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 11:15:58 +0100
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c4d21051042so151914666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 02:15:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b7d1b7sm75606066b.74.2026.11.13.02.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 02:15:57 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564958; x=1795169758; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PfCz/38ILdxPmJBY1NDzDaIsiECcLTMyKpoKPJStEV0=;
        b=Da8rglp8sCzTy1HF1OX15Y10iX0C/d9X4zMkochMMydSFyxoVGHlyng3muJ3GoLjBy
         16okqk2VE6a65Wu5KnjjvRnbms/Vk06SnwOeo/loepnjSM3KafrhWDFMkPlBhPBmV1SV
         QhvXhSTyCwjY6rC3/bx2to58lF9rZT002V0mZt3M6m1ydRMVqiV5WxzTDPyzxp6Taiwj
         p3xCANzhfSi6NO0QWzKI5sS/tcwcFFoK3U6cgeRYgIM4hQ81RAHAAKUP03kwERH29Q1Z
         r7IMBzDSFkkbnX7ERSVSOpw0ACv48VoRlrXGUXYC6m6qlNqZt9vvGOXwxjmjHCUekvuD
         +b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564958; x=1795169758;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfCz/38ILdxPmJBY1NDzDaIsiECcLTMyKpoKPJStEV0=;
        b=oQpaM7UO1QRZdScB/QNLUzKD0FJZewE/H+1AiouCorgVY1RVmBMHgVMVdPXUOIwXTu
         QBYVCX7yhA7KE8fBdjE0kJyrkQjyT5fsl7m3MIe57LQBbo73sjW69/eJjSoRzKtbO33p
         r1Xu3v9+KxvOqsiXe7T3QuamK3gZN0u+75L2ElFbvg21tB3wv9yAyzhiu0XbbbobeVK/
         FAgDtW3P+dqJRsYPnq3W1QBXLMvqKpx7TXOQzTR3THSR1eQToQ6ZQmMPE3nnpn9X9LIQ
         1QqEUZzDQjJ9qM1a9cLnWuacRqbbpn98nhu/NdlSJ82/GvKk8noJ0HL6dVQ/onOCqXSw
         GQ5g==
X-Forwarded-Encrypted: i=1; AL+hErHo7kSxVTCnQQUPWpF9H7JFZY5Lw+MUDUTUgaQ8ofYLihPHSXFYk0Q2AuyAmAYnk1+kr46F0S9kUOs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+ks93HjLDJL/fsSIHEKdR0TGcWY+9BhCsDooIUtBgz//2RUu0M
	HBG7qz9oaIvKpo8XOA0cvEnnbJXwpyi1kzZ9EYSWouMbM4kHwd63vYaXcghu/RV9SXv9
X-Gm-Gg: AYBFou3dRCJ7fFbbfaTTaoktyxMgTNXisdNN6MdP+JFid5oL66yP4gl2kDS0ArhX8KT
	XVzqxh5PM1Ri+kw9/9Wj+NQHpFYQk8I7KkvW4r4jiuqo+QlDjMBoxdRtb4A9DhcNiALTysTO7ij
	HMkQ81Ck5Lzf41bzhCEJY1C8yq8S/piHNZOin5sTRJ2LSIFF9N9xlaNIgu2NSv80c+HdiYru5T1
	0haXmP4tixwIXMMey31/EOdknz1JXV2LMlTRig2mDJA7FtZ6LY8NPkQQ9bpsuHrKhZ3BLuqgT4f
	24Ic4WkJSAis5HTQbL481E+LO9GQkpjyhVNbsYkvHIUih5AnM2j/Ot9cI80MzFTa5KXWVrsKLx5
	S6YCBVkeQNm9BnYpX/z4wC0ZQSZSSrk3q2aAU5m823P81UsGTKgXx9ql/XdTnnLlNx2L5vqD8RG
	nt3O98k/qnrlmw7bahHkAGnhmNT+l7hycIfwfXCA7Qc0NFEz8WelxInO+8NXnfMumqXADGGrbc6
	a7SrN1pIHFe2/kHFnR8uUeL4Fhcuz/dpMxyOWJZfmqytr5mY8mPwYNPaoRRF4vxJb3+I78uByt+
	VUVtiErDbVg1N6R8QqqBz27U46TW2VwmbowRjwcDQkCW1sBYLDtwiyhTXqzLWQQ=
X-Received: by 2002:a17:906:f59c:b0:c42:102f:15f0 with SMTP id a640c23a62f3a-c509614d4c1mr171873666b.3.1794564958075;
        Fri, 13 Nov 2026 02:15:58 -0800 (PST)
Message-ID: <c5a694991af7e9182fd475a20bf4cfd73a13e395.camel@amutable.com>
Subject: Re: [PATCH RFC 34/41] loop: refuse files on pseudo filesystems as
 backing files
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
Date: Fri, 13 Nov 2026 11:15:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-34-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-34-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-bad1c0/1794564958-BE6DA034-06BD5728/0/0
X-purgate-type: clean
X-purgate-size: 2848
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Currently loop accepts any regular file that implements ->read_iter()
> as
> a backing file and any that also implements ->write_iter() as a
> writable
> one. That includes files on procfs, sysfs and other pseudo
> filesystems.
> For example, /proc/kcore attaches read-only as a loop device the size
> of
> the kernel's virtual address space, 64 PiB with 5-level paging. sysfs
> attributes attach read-write as 4096 byte loop devices. Writing a
> block
> to the loop device of /sys/kernel/mm/transparent_hugepage/enabled
> changes the THP setting.
>=20
> That's not just nonsensical, it can be abused. Loop calls -
> >read_iter()
> and ->write_iter() of the backing file directly from its worker which
> runs with kernel credentials. But pseudo files enforce part of their
> access rules at read and write time against current. Dozens of sysfs
> ->show() and ->store() methods call capable(). Behind a loop device
> all
> of these checks are done against the loop worker instead of the task
> that opened the file. And setting up a loop device requires no
> capabilities, only access to the device nodes. So on v7.4-rc1:
>=20
> - uid 0 without any capabilities can't write to
> /sys/kernel/reboot/mode
> =C2=A0 as mode_store() requires CAP_SYS_BOOT. Writing "warm" through a
> loop
> =C2=A0 device works.
>=20
> - uid 0 without any capabilities can't read the files in
> =C2=A0 /sys/firmware/dmi/entries/*/ as dmi_sysfs_attr_show() requires
> =C2=A0 CAP_SYS_ADMIN. Reading them through a loop device works.
>=20
> - An unprivileged container that was handed a loop device can't
> change
> =C2=A0 gro_flush_timeout of its own network devices as
> =C2=A0 gro_flush_timeout_store() requires CAP_NET_ADMIN in the initial
> user
> =C2=A0 namespace. Writing it through a loop device works.
>=20
> The same goes for hard_offline_page, the md and sd attributes, rfkill
> and others.
>=20
> Refuse files on pseudo filesystems as loop backing files. Note that
> file_is_pseudo() looks through overlayfs so stacking overlayfs on top
> of
> sysfs doesn't get around this.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index c96e35c3ef42..1482580a1979 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -537,6 +537,9 @@ static int loop_check_backing_file(struct file
> *file)
> =C2=A0	if ((file->f_mode & FMODE_WRITE) && !file->f_op->write_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (file_is_pseudo(file))
> +		return -EINVAL;
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

