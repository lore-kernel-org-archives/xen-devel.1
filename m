Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E6CC55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 19:29:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382611.1625954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKp8-0006n1-52; Tue, 04 Aug 2026 19:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382611.1625954; Tue, 04 Aug 2026 19:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKp8-0006mu-29; Tue, 04 Aug 2026 19:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1382611;
 Tue, 04 Aug 2026 19:29:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099@swg.vates.tech>)
 id 1wrKp6-0006mm-VW
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 19:29:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrKp6-004lvs-0x
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:29:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099@swg.vates.tech>)
 id 6a723d79-5cb7-0a2a0a5109dd-0a2a450286d6-16
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:29:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099@swg.vates.tech>)
 id 6a723d87-6ca4-0a2a45020019-b9ff1c228979-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 21:29:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fce4038dd000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Aug 2026 19:29:03 +0000
Received: from l14 (82-67-99-167.subs.proxad.net [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2E4F881FA4;
 Tue,  4 Aug 2026 21:29:02 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=kqZ+2ADVwqlVsYaAlIYvrBJpz0kUI7mX5ygvag4vGGo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=l7LfxUowQGpuaYVgk0GYAZLvihpODE7NqpSuqW8SoV27t+f19jbMnXUyLfYHNncl3O4mGRqmD
 n6edZK/Rguw7bAteIrQVmAZbRlstVguS3jnGl5ehfgcJaixPzdJmV2Y8crufjKPf83wVQe4GcSA
 BPK5XGcwXnl7GiFBKUwdrflnG76quYXw22VM1Ajlqrk1mREJNJ/wM8247PeZ56LsLs2wECTI9E0
 N7G6rLkppa3Q/0fW5OO9ZYf8h0Z73G78bJHDzPOl77R3ZJwXhceiBvmwFY/liO1uwD1O381J812
 MoLr45RgozMx4APrKnUxzlZzrw5YkvVddetT5GSNbjZw==
X-Zone-Loop: 1cc3a5874ce419e693a20bee8b22273485fa0c627fd1
x-campaign-type: default
x-transaction-id: 12587eb6-e6d1-4239-ab16-3a7037affca0
x-swg-uid: 01-e90026e4-62bc-4f4b-8530-1edc21fa8f5d
X-Mailer: Sweego
Message-ID:
 <1785871743.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099@vates.tech>
x-swg-bid: 1785871743.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 4 Aug 2026 21:29:01 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] CI: Simplify directories creation
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-2-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260804174219.835096-2-frediano.ziglio@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1c3f.63ba4c08b36f0347.19fce4035b7.9383ca257edc557f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785871742391
X-purgate-ID: tlsNG-720697/1785871751-F06A72AC-A2D84C92/0/0
X-purgate-type: clean
X-purgate-size: 1782

---=Part.1c3f.63ba4c08b36f0347.19fce4035b7.9383ca257edc557f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2026 at 06:42:17PM +0100, Frediano Ziglio wrote:
> diff --git a/automation/scripts/qemu-alpine-x86_64=2Esh b/automation/scr=
ipts/qemu-alpine-x86_64=2Esh
> index 242ffca693=2E=2E60f5cc49fc 100755
> --- a/automation/scripts/qemu-alpine-x86_64=2Esh
> +++ b/automation/scripts/qemu-alpine-x86_64=2Esh
> @@ -4,16 +4,7 @@ set -ex -o pipefail
> =20
>  # DomU Busybox
>  cd binaries
> -mkdir -p initrd
> -mkdir -p initrd/bin
> -mkdir -p initrd/sbin
> -mkdir -p initrd/etc
> -mkdir -p initrd/dev
> -mkdir -p initrd/proc
> -mkdir -p initrd/sys
> -mkdir -p initrd/lib
> -mkdir -p initrd/var
> -mkdir -p initrd/mnt
> +mkdir -p initrd/{bin,sbin,etc,dev,proc,sys,lib,var,mnt}

This makes it really hard to find out if more directory or less
directory are been created=2E When reviewing a patch, we don't see what
changed in a line without using more complex tools=2E

For this patch, I have now idea at a glimpse if all the directory that
was created before are still created=2E

In the future, we might need to create more directories, this would
change on very long line to another, and make it hard to find out what
was the logical change, by just looking at the output of `diff -u`=2E

So I don't see this patch as an improvement=2E

But that just my opinion, but that would apply equally to other similar
changes, like packing all the variable declaration on a single line in C=
=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1c3f.63ba4c08b36f0347.19fce4035b7.9383ca257edc557f=---

