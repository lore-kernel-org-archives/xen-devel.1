Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE3606A32E
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dUlp1lAd
Received: from list by lists.xenproject.org with outflank-mailman.1487452.1689875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqWg-00022e-7m; Fri, 13 Nov 2026 12:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487452.1689875; Fri, 13 Nov 2026 12:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqWg-00022X-45; Fri, 13 Nov 2026 12:37:06 +0000
Received: by outflank-mailman (input) for mailman id 1487452;
 Fri, 13 Nov 2026 12:37:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xRqWe-00022R-G3
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:37:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRqWd-003na5-TB
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:37:03 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6af70469-e002-0a2a0a5209dd-0a2a4505b840-14
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:37:03 +0100
Received: from [74.125.225.138] (helo=mail-wm2-f10.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6af7046f-4cb1-0a2a45050019-4a7de18ae4ab-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:37:03 +0100
Received: by mail-wm2-f10.google.com with SMTP id
 5b1f17b1804b1-4b886ebe069so3303815e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 04:37:03 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com.
 [80.187.86.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55af2901sm57437255e9.13.2026.11.13.04.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 04:37:02 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794573423; x=1795178223; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=dUlp1lAdiS5HKJo0Gg3mywdA4dyDSVpNEKhrv3bza5WNIA/d+TSucAD/e8rIcxIqgV
         U1hOqP7m0WqKMEctK2q6Mf72vUFOMHs7S4DeRBl1RFMbwaPi5jUJkg2V5Y8s/CDhuxWs
         y2SdA2JwiMEZZfiD0Waj0zWwWhh/LgimhVwt2oe8kBH9ZJM/gakxrCxGVhR8fgaoMgYN
         TxpBKYhc74fqRQPG/++gEfXY8CrRK7uG0WtjtchwVkUwq6o5cOMQQoypIGAcFCOyb2MB
         m/7HaXr7KZ7hmtzO5Bg2CV2/eykMhWtE42IaH5eM71cEWlPuxq0V/S4XrjvRlHpTsUwh
         BkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794573423; x=1795178223;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87/Ge5NhXdmtGpcXCLUvnqWpWEAxiW5M6eWOW+m4zUs=;
        b=08KKQmoeqXktRyp6Gaa9M9DYDFjpsHLsp67nLgLc0uspw/EPbZDxi+81SRO6nnloZh
         GU9GPeV3DTwjnrA41esTzyN252oNOeFOqc7UDq7UnuKQyk+iRDYwXH+I+cFrdv7moF3c
         tp9g9N0rsrtuqhNkSqUwLaIRwsyC5sc0R6h2628AeyQMk9Bo9eivDgwRiZ/ZWYibbJXw
         NrO76T3sTkOUyDgBZNbwB1n9wcLW5Fo6QHwxIxBotPsdiZRL6dvJAfYrdI8VDomKdlaE
         /A6g0whm5vXyRvyIhIW3TWnNdx+5vD41zY8dt7j39sVdnCYlXkknaih8JIUVEgRZO/uW
         SbEw==
X-Forwarded-Encrypted: i=1; AL+hErHXmp1bTM9aT4VwD6Ui5spTzgvMGr445o0b9YAKbUQsZdhKczmSNyeY89ogQOzjwll2hQ2fCr0rFjk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+KBmxD0I81KQod4eCtX6l0sb5dULCRb6JZUwPq0FwROj+helak
	pX66XQpBxB4oO48ZavdzxsBVETaYRSDcTBwhkez7iBPCGjXiIAGlx+beE5rZSWgbE6a3
X-Gm-Gg: AYBFou1QLRPVaV0MgM9tBU1Z79BsHiXHbaqovVlRsXehHMytThZJfHmufMqpWMHTbRn
	v5D5+PMJbb9h937/tVbdL8UwH6gK3TE4zjFPL9uGoxkQrFf3f0II/+FI+WtFQBnQnb/4tRJVt6n
	JzkLq5714xhGhL2hxZLvtPvrDu90et5SxUVUy8hMSZxzzGIaMtlo7EH/RjajouZOX+enr5rAb0Q
	yBdO0bEb92l98dl/flhlW0WO5BnalpnCjxEP3q/bUSSkeTtPHRkVu/YwQhL9XZxsi4D5UmR8P+X
	XA4xg4jwI+970jrhpGTOSrZDqeaQnLPcQaHLTeXPDO6ttFPWQvaktotKSs1Po2KO1v8aaBAMDdF
	5HGtsaUVznYBp7keS03Zx+0Xner0/MgPyORFe81RGPnPhgx8FXOFsP/6paD4TujTWhUVn6aq6Ou
	yYqrO3K4ghwxEsbHXJJocxcgH93j3jy2Z1wU4YUvtgP84/5LZGvSaQ72tgTVy5dKhPXXDcGTyMI
	yr/jWAZH9CAKyaJbM5RS+8K/CQmE9T6LwGBjAFrqqd7zFIF2sK6fZCB1bi+b9WQNnkhNaWgUHYK
	zeG1ueuRnHwXlTiv9EtndqqqxXJgF6xy1I3qDNbbZeylzJsLwVI8B9a1eJULoISFesy3XBPwMGG
	rKhh2e8B4
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr49782945e9.34.1794573423157;
        Fri, 13 Nov 2026 04:37:03 -0800 (PST)
Message-ID: <f12140be54ffc4d1e8e4026f80c41c75cf5727e0.camel@amutable.com>
Subject: Re: [PATCH RFC 39/41] usb: gadget: f_mass_storage: refuse files on
 pseudo filesystems
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
Date: Fri, 13 Nov 2026 13:36:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-39-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-c201ff/1794573423-732B32A1-CB47484E/0/0
X-purgate-type: clean
X-purgate-size: 1342
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> fsg_lun_open() takes any regular file as the backing file of a LUN.
> The
> file-storage kthread then reads and writes it with kernel_read() and
> kernel_write() on behalf of the USB host. With a procfs or sysfs file
> behind a LUN the host gets to read and write kernel interfaces with
> kernel credentials. Refuse files on pseudo filesystems just like loop
> does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/usb/gadget/function/storage_common.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/function/storage_common.c
> b/drivers/usb/gadget/function/storage_common.c
> index 75831f2c7abe..83683ade20c2 100644
> --- a/drivers/usb/gadget/function/storage_common.c
> +++ b/drivers/usb/gadget/function/storage_common.c
> @@ -211,6 +211,11 @@ int fsg_lun_open(struct fsg_lun *curlun, const
> char *filename)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(filp)) {
> +		LINFO(curlun, "file on a pseudo filesystem: %s\n",
> filename);
> +		goto out;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If we can't read the file, it's no good.
> =C2=A0	 * If we can't write the file, use it read-only.

