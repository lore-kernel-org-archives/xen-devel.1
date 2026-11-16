Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8D606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPomNfWI
Received: from list by lists.xenproject.org with outflank-mailman.1491369.1692184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT0e2-0001qV-3d; Mon, 16 Nov 2026 17:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491369.1692184; Mon, 16 Nov 2026 17:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT0e2-0001qO-0n; Mon, 16 Nov 2026 17:37:30 +0000
Received: by outflank-mailman (input) for mailman id 1491369;
 Mon, 16 Nov 2026 17:37:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <amir73il@gmail.com>) id 1xT0e0-0001pD-QI
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:37:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT0e0-001Y18-6f
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 18:37:28 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <amir73il@gmail.com>)
 id 6afb3f51-e002-0a2a0a5209dd-0a2a4506929c-14
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 18:37:28 +0100
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <amir73il@gmail.com>)
 id 6afb3f58-195a-0a2a45060019-d155d02ba5c0-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 18:37:28 +0100
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6b596569640so140946a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:37:28 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794850648; cv=none;
        d=google.com; s=arc-20260327;
        b=Z95iZixBBER8KxiRNvWxP4Y/fwP7HWIrXoQUPoX0H5aQ527P/Z4eVh4wzsbZbJG403
         K9zjF3jTAlUdWOETF8gJ2cf9ta+M4xkufQsNIbpn0N//fEbyHyVF05mb0608Ucet/gMp
         YTYetdQ2Pz4qCyrp0nXub5bMiGqJ4XY0Ob9cjDl0SMQYf6DwopiwszEkW/bwXPbyIU/G
         FCjzIFMXw07WjIMXS2dqXm8DNqORUsKpwIG0r8zYxKntdsXDMRoh800qbKiyW81Oz23v
         +nBJ1ml+IOyXM0jGV/fIfj4UDG4XaWHIZ3BVjjfRmxM8l9VLu/N+xfk7go3/sEs7QUxg
         zT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        fh=AhP2+MIe04k5y3IjOc5qnJTx7dZpxoPP2QIV0hmioz4=;
        b=Uy4XX/mxUk1yI76a+z4Oj114VJT1GQ0qrVtiva+urHQLPelup8ji0K2Z4DMWTsEFCn
         dBGHAhWhvfSxRXFeJhJg+DhQ9bZ26PsmuUuSkJkK4Y9+vxqeNiYZyVPv5dznhLq1C9Th
         YGqiu1NFxjFcHE4VZvZa3LWy5/HvUoVtiv6fVNxoTBKlz3UBiaskyvT3ULynbe2hxZqD
         oVKZu1ypJ1bXejfbHunrO2dmhDBLhoWgiCLlLRAsGXxcbbz9lKXWtxYb0r3ofUZ2f8+c
         UfjVPm5dGjiNtOMxmH1LPlogitv6XxwfVGFbjig589h2qWOo1jT37YDDipqfPA3u4GOw
         Yk9w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850648; x=1795455448; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=RPomNfWIekQjBHowvQXykIWVyWNXHyi/e4faIhauiIVdzCxlNOW4vIhPvNMR6YJrKD
         Bar1FW/dc903juVBIWhPWv2MnZkM2lLoz9+B68Ja5hKG2P672EC3vzAG8LeBx9OiDKwf
         UJCDvg4sbXNwPGCzcfJW6uL3bGWVibj3FaPuxFoDgK+voj8zQcJzJRvUmAO1a1DjZuWJ
         UbovN4B1X5Fj6+h3I/rHU4r5qoxi4n/TrXc2xNnPKHvD1+/fQIjxP7SfDU7777bXnmyi
         MXutIR/IC/qDSIjSJ8+smmHvJxyFtkpIWmZTjZne47+8+Z/LHnaCZiFch8JWOJtfW//K
         qolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850648; x=1795455448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASqD7yYrxwRTXpvky24aSldHzEJHTNv4OUWKJ01NHN8=;
        b=tVLJ02nraIIP8EpZEt1//2n3wwIXxWMdNHC8WYLARPluDK2APXziH1YTSM8HSH9Bxo
         EDhV6bSpmhojWlcigBslG1xAO9Gz/Ziw2ZO6dhslpaQZelGO8EGxEvKbdvkODCOSy8Vw
         0My8ZVn5vt76il/SJczDNN5omvSwfyD8/phHtAPzXAUYi+r5/Iv5oK2CHYNmrDzN/FNw
         phcxkCh1j8gyb303d64UOzmGhfhQheIfuRPPo7/lGzoX6ckXWJ2T0B9LCuH6Ft0/t5kt
         hDMjvtiEdqIMK7M2jPKAwd/Dh/ouhLCzbtxS234GBItzezd2HPxl+mx0LDJhaqJL+SFl
         8Riw==
X-Forwarded-Encrypted: i=1; AL+hErFLxPciZeC4/ovGycDhA89QgE46BkejmMYVoTF2SYTqAgv/HUTXhSnn3XW2Gp0MwcisjlhV+R5rrzI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/3+McfJSS2ifyNX1HTtnSvpmb0D45XB/B9glnIwqnVnO6pID5c
	lel19VFpiODOU5WR2Mg66Ub9yyrlbvfasqS5UHk0sALHy4BzrtbqPafQG1zlQIqwM6meLFdhhFC
	b5Q/pe+Fz8TGwk5ofsL18JDoQmpg7suw=
X-Gm-Gg: AYBFou0ka7uAm2OujXzrqegvpw0F0r15Wxd8e49mPCcIxVQg7IWMf7pTnhfvFhHa3+A
	vnfDfsRzvH/Ve0UIKUoPQFF31ZCGoN5q8vn5C/p5YcNhggMUOND++1DuHpB+YoNfkGh63hMKFOC
	BLQgGE+3j76oWzZ3aJMTA7b1wExpEYbwd08Tm+0AXys8BNXtbqI52uXv0Ddok/wOtL7XhvNCMYX
	MyzEMyJl8fuiBKeVxeGaTIFsN+U3xVYGfYIfInyNgLh7ggRt/OtR+YKzY3w+JeSc6Cp3ItfeKXL
	9ZUIY1o5/f1mH4lM2hUM12o3ZIYIRI6Li/xuiHBGjHaJD64ll02K1WxwYy8PzF7l7oR3QrByf43
	062XCmpnX8Dv3t0RQ5ip9vcESaHTpqcXks1bEIauUmBIjZC1KBi3Sg4BEg2bWGmpxLZoZog==
X-Received: by 2002:a05:6402:1598:b0:6b5:7250:d621 with SMTP id
 4fb4d7f45d1cf-6b859ae1a00mr134291a12.15.1794850647426; Mon, 16 Nov 2026
 09:37:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-33-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:37:16 +0100
X-Gm-Features: AclHuK_sKnxFPAK3k65pZhjyZC94SJD4eZ9z2j_P12s3kyb9TMw6hurQcjyq55Q
Message-ID: <CAOQ4uxgPerkkG4ie0SyHVXaBD9VZN2wYfQpEAEi4hytn=ara3A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 33/44] ovl: refuse data-only layers on pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-purgate-ID: tlsNG-16d1c6/1794850648-1F8CB77B-3373465F/0/0
X-purgate-type: clean
X-purgate-size: 2870
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> The data of a metacopy file can live in a data-only layer. overlayfs
> doesn't look that data up when it looks up the file. It only remembers
> the absolute redirect and looks up the data lazily the first time
> someone needs it. So until then nothing can tell which filesystem holds
> the data of such a file.
>
> But a data-only layer has no business being a pseudo filesystem in the
> first place. All it does is hold the data of metacopy files and the
> regular files of a pseudo filesystem are kernel interfaces, not storage.
> So let's refuse data-only layers on superblocks with SB_I_PSEUDO at
> mount time.
>
> Data-only layers can be added via the "::" separator in "lowerdir=3D" and
> via "datadir+" by path or by file descriptor. All of them end up at the
> end of ctx->lower. So a single check in ovl_get_lowerstack() covers all
> of them.
>
> Note that regular lower layers on pseudo filesystems are left alone.
> Stacking overlayfs on top of sysfs keeps working.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Link: https://lore.kernel.org/all/CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo=
91QjJHH9T_Yw@mail.gmail.com
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/overlayfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 39d4d57dec230..719c2569dfeaf 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1237,6 +1237,14 @@ static struct ovl_entry *ovl_get_lowerstack(struct=
 super_block *sb,
>         for (i =3D 0; i < ctx->nr; i++) {
>                 l =3D &ctx->lower[i];
>
> +               /* Pseudo filesystems don't hold data for metacopy files.=
 */
> +               if (i >=3D ctx->nr - ctx->nr_data &&
> +                   (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
> +                       pr_err("filesystem on %s not supported as data-on=
ly layer\n",
> +                              l->name);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +

How about we make this just a tad more restrictive:

                /* Pseudo filesystems don't belong in composefs setup */
                if (ctx->nr_data &&
                    (l->path.dentry->d_sb->s_iflags & SB_I_PSEUDO)) {
                        pr_err("filesystem on %s not supported along
with data-only layers\n",
                               l->name);
                        return ERR_PTR(-EINVAL);
                }

I could send this as followup patch, but since this version is simpler
there is no real reason to have the intermediate "only ban datadir" step.

Only the commit message needs a little more flexing to justify this.

Thanks,
Amir.

