Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570FA606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JoaZXa4u
Received: from list by lists.xenproject.org with outflank-mailman.1491947.1692636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEVc-0000VQ-GC; Tue, 17 Nov 2026 08:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491947.1692636; Tue, 17 Nov 2026 08:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEVc-0000VF-DV; Tue, 17 Nov 2026 08:25:44 +0000
Received: by outflank-mailman (input) for mailman id 1491947;
 Tue, 17 Nov 2026 08:25:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex@amutable.com>) id 1xTEVa-0000Ul-66
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:25:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEVZ-003aWQ-8I
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:25:41 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0f77-8faa-0a2a0a5109dd-0a2a450ad870-24
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:25:41 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex@amutable.com>)
 id 6afc0f84-f2d2-0a2a450a0019-d155dd32ddcd-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:25:40 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-492690dd5daso4102941f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:25:40 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2?
 (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de.
 [2003:cf:572c:2800:de4c:6789:33ce:97c2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5ff2be55sm26907832f8f.28.2026.11.17.00.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 00:25:38 -0800 (PST)
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
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903940; x=1795508740; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=JoaZXa4uRoOQHDb4HuL6NUxrVFN+/I1gT1Uzo8lFm1BFeTkuUrjjffOhwzgZycXFrW
         hcDjCt+hLX8wYqt/xUOuMU8PUVgk8FvFqrQhOavmPQff7jfUCqbIhd6qvPvJUN0AtUe3
         kZ9aZ3ffOLSwcX714wZZa/S3mVNFYmCK/xAf5KZ0vaJSr6HtsyqwtUVnaZF6KaXT8+5z
         2fBXQ5yi1sOBGyXlGUCHohxUoEluufEqmCmO6YcD829xs/HyL5kEF2Y13MPh0u1ITNDu
         K7rCb05CanGnUOupIPJTJOA+S52WCjvJdzbcHpj0f6BB/vK/s3phyXdFGFj2rK7rXkUd
         eGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903940; x=1795508740;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGlayfD5Z/El6cdpm6ie0HDMH84kD107OWGXScU9uXE=;
        b=t6yCjBYDLojNa5wXww0+l26fHuavIwjSKGBjHGroV0fIhLFH//GK6P/lUkNtUEyOfX
         N0j7LW6qSaUm06DOZ+pELR+2CnKTwn31cfYVqsSN/XkMV6pKhkewcDMFi/hUhUOHYHE1
         S4cTZBSudrfVQVJ7JGVFrqh93Sf6eqpCoUS59Fui78qD3YzvvNSvJ/BXh1gk2kTUuN1J
         Jp2JBFfxnNr1AnZrFIWTX3MivpRmOqkFweR9aaTkqSdqp9MExrjQFIsPp6ew4YFUKthT
         14TiKYapUlMc+jnO766+TCwYUil/Q225gQTVer6O6uhgJGJpY9L4eWsLtGUaKgSzqYKY
         G6qw==
X-Forwarded-Encrypted: i=1; AL+hErGQU5YqtwCt2Zp2ciggq4hep4/+eWIOBZH1zHiXFtPu7QuSVyByLzAfL+uDKsr5oloDipo8tPL/9Y4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8CYZytbM+NRVv1XcjSZV1FmY7/orV9U8QzuaMqAiGK2MKhnp37
	CPBLjf8OqSIl4QJHQB0+8oMN5SlzIsJI3VZWbhiRPZIj0jQHZjOlz5yjL0z4baJUJA61
X-Gm-Gg: AZFdTZfNHmNgJbGvb26T65V/eWlpcBrfdr7PJOKleVwV8QiUBApzjXQrjGDIhwP/ECx
	W81mZrfXhe3JCoKfIt40aJLIZU82H2BgZTU9+uafPgyW91o1ZoItJvmYLMDqG2PPrcGKWO4rHoz
	lr6RPeDO00a82hS5j8epoZEk3sLhHWp68FzG1lq/6n2NVusGx/cj3og7B1nrwxgCAOKTx22Glh3
	iJ0OnqexOrxLrVy2XlVwMKcniaxx36XvZ8VM2FVvF/If2OrAlpY+js6NCMU1I1N6tLKxAM++UqE
	3apEK3gH4lDTTDcTP7LCHuDbv5MSfYkB9o61Go5GlyOOKxPv5Swq+QJeMFVHf0iPecwkcQ4PouZ
	aB6rVbk7Yow/hNeWoU5YkUOcqcyseiXGFKzOsS/DsPaV6NNLzdIs9Vgw0KMP0VAMWZsvc+z/8iz
	o7Xh+sV72r2DbNt3AXxmxg1bc+9VbmGHCPSnnQiNQI/43p3XEbATTRi0m2N8rwwfAF0fA+NVQf4
	d5UO914if1As3T4PX0FXOd0BgT8InCmA2WBiY6lV9M19Al4kb5zCsgPsu6zNim74wkIdZbctMs4
	NG7MvDn7HwcrsJ42/2ixhyR0Mv6YDfc5wqL6sczPNIMlheZRRpQXvWzvN8vmKzbjQDekbrrk6xI
	wn54cO9H5nUXT9PLCqOfyJ4paSLlSvQA383776Xb7k3k1L2xWTC5RKHD0/gANDijoxB2OqR6ex6
	FDfQ==
X-Received: by 2002:a05:6000:2084:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-49c6fd932c8mr25238543f8f.13.1794903938925;
        Tue, 17 Nov 2026 00:25:38 -0800 (PST)
Message-ID: <a9124bf1c858cef3e8ac06b1b2396dcb0e19e2a5.camel@amutable.com>
Subject: Re: [PATCH RFC v3 02/44] nvmet: check that the file backend
 supports ->{read,write}_iter
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:25:36 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-2-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-purgate-ID: tlsNG-4011c0/1794903941-4ABD8CFC-9048BB22/0/0
X-purgate-type: clean
X-purgate-size: 1587
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> The file backend calls ->read_iter() and ->write_iter() of the
> backing
> file directly but never checks that they exist. Everything that isn't
> a
> block device ends up in the file backend. So a namespace pointing to
> a
> file without them calls a NULL pointer on its first I/O. Only
> buffered_io=3D1 gets that far as the O_DIRECT open fails for such
> files.
>=20
> Refuse them when the namespace is enabled the same way zloop does
> since
> commit 0c10f8a1a7ae ("zloop: check that the zone backing file support
> ->{read,write}_iter").
>=20
> Fixes: d5eff33ee6f8 ("nvmet: add simple file backed ns support")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/nvme/target/io-cmd-file.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/nvme/target/io-cmd-file.c
> b/drivers/nvme/target/io-cmd-file.c
> index 695963dd932ee..dfa8aa46188c8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -47,6 +47,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (!ns->file->f_op->read_iter || !ns->file->f_op-
> >write_iter) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> =C2=A0	nvmet_file_ns_revalidate(ns);
> =C2=A0
> =C2=A0	/*

