Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E8C606A330
	for <xen-devel@archiver.kernel.org>; Sat, 14 Nov 2026 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKD1C/qp
Received: from list by lists.xenproject.org with outflank-mailman.1488612.1690422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSCM7-0004EM-JM; Sat, 14 Nov 2026 11:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488612.1690422; Sat, 14 Nov 2026 11:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSCM7-0004EF-FM; Sat, 14 Nov 2026 11:55:39 +0000
Received: by outflank-mailman (input) for mailman id 1488612;
 Sat, 14 Nov 2026 11:55:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <amir73il@gmail.com>) id 1xSCM6-0004E9-0o
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 11:55:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSCM5-001Aeo-Dr
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 12:55:37 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <amir73il@gmail.com>)
 id 6af84be8-bab6-0a2a0a5309dd-0a2a4506afe4-40
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 12:55:37 +0100
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <amir73il@gmail.com>)
 id 6af84c39-195a-0a2a45060019-d155da2db14d-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 12:55:37 +0100
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c50604721c8so370135166b.3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 03:55:37 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 03:55:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="In-Reply-To:Content-Transfer-Encoding:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=HKD1C/qpHKKaVEYQvnvSPhfSCLSTpmzN/Fmt6im6/GxFSS5ejeiHKBGjW2Xn3693t7
         A1n0jS8HjZ2GUCgpHdnskgBoShsGYtsPZkUgCJZa4JqHAvsC5EcI4a4yT6z+ANxaq6pa
         TDXKxJ/U7tSZVy5OJ/7Nr6valKRpjd0lFT7Sif/yo3gGfJxY30KyvKf5XKxcIPiN9JHg
         TWoz7QHTAHfuROLHVLwZWbCIh4/gNGbNPsywrwxG048IoXKEqwFDIMBWj2kywPRKKqB5
         e5Ah+2IBFOgHzgVMBBU+5y2Td+jJC+JxIgO/J+N+5Pj9m5Ofmc9WbiMPuWkOopuLxxur
         0GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=DoEcglyhjDNB6Yx/EBChhR1BPDPfpwbpU41AvnpZoZyOXkqeG665xrvCAMYsjeERqF
         3z/O3DDHqogW1rtkQ5fW2vvVJ1HVLI41zV5jrR02S/gCSj78ReaydLd2WK2fmomxQFj3
         IS+mOjlNwYm2/xVU0pe+JkLXWVkTTIDB+PVUFXO8i5KdTfhh2VKFjlCxohlxfkjA3U/r
         kca1rgtn3AhX18A8uIYK2CPqS6HJfEItu68Knu87AOh04fjNkBmUNFZmNcucmRzeXEZ9
         cUh9FKt8Z/gvWqstJGinMcVP3n+iXOq9Mc+o57oAmsF/PP/+Roi6ID3x1uiuXZT4iC+t
         14lg==
X-Forwarded-Encrypted: i=1; AL+hErGGF4ERDTSjfmCDepYJMl9OuDFfbKIfvdO+cgNZVVU82AIVOgH4bbtGcLROHXOkkKuwqfN9B1xngWg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9KNQz88RrMfS7rcBIdtsIjb9qadmHHhsSGtBNsgZJUx2iL6gCg
	m+s1U2ohUCcuY6XdPX9ZHuO1snpUr9kW+Oss368uduLJyzcDRbwYcHXDAgwMdnf3+G8=
X-Gm-Gg: AYBFou2I0FlEhKsSTDvEQFYHSVVzFtda1QGNwTcCpmiYZTIwOih676a+NEBOKrBC4rH
	CJzJeYxjLqjvvei1XmixQhKQQ4FLjlW7N9mjoUs7W4nxsnqxYrJIuyAYk0hxtIpek84IewIi8PI
	24zZSK3s0zwRwLo4RBk/vYz+RA50nIL35gl0ksebqJiIBbIioS6Pj/16DCCMmk/GQ9GBEMykx+u
	9YfdbiGmKg26JeVKgejuQMXzvRqVI2S6twd/hxpVm1BVD3f3HblusRxBlMoiUOaEE2LY9yBALBO
	bftuNo7E6+29P6xtWc5QzuPjj4obVy57bpygHnKZ+UrZefdFtVXwKmjOoA1oeIuaM3s5go+V+Ju
	86e4HBo5PGynxxMMTttZc5a5hS0qgue2FeCXsCx9D7SnMpic8IOSTVTGTplKQjZyIzjZNNmGZHx
	t3MiaHR8zblSpG/SrQJPouROkuQUIWhPcy6JuO33i9/Q8osWbL1ZRPMMlKGV/B6rYlG5ZNM4nPs
	wXj8i42FtsUBwP6addQyukSORpzsFlXwfAPyZxKHPRIT2CGF4ZEUlr65EzU9JOYhmVBT1tFZiib
	0PGqdyh6Sfvs5EM989vKlT22bYWYkD2uAD6vlPYPfRJOUCAXOMAHuQVMDg/CLSyCI7ivmXEVlp8
	FjLAzGbqmtGU=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
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
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-purgate-ID: tlsNG-16d1c6/1794657337-FE27077B-2D8B01E2/0/0
X-purgate-type: clean
X-purgate-size: 927
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.

