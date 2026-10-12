Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F937CA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 10:13:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446055.1662011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD1f-0001MS-0l; Mon, 12 Oct 2026 10:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446055.1662011; Mon, 12 Oct 2026 10:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGD1e-0001ML-UI; Mon, 12 Oct 2026 10:12:58 +0000
Received: by outflank-mailman (input) for mailman id 1446055;
 Mon, 12 Oct 2026 10:12:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGD1d-0001MF-L7
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:12:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGD1d-00000001hAA-25iW
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:12:57 +0000
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGD1c-000000086UU-3J1j
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:12:57 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3a98fc80925so12137751fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 03:12:57 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=w0KJ3I7EbRo6QxuQIXiqkb7Ghk6+lH8PEiyu3fRgGr4=; b=xOz4B7DCgiTFXVFa/qadMEsmW2
	UXPt+RQ+pOKoG8C5ogYBwBluLf2HraROKFknacQF4sWcJHc5Rypdrf/KxuVBQksG9atGddTVlQV4w
	ChI+3Pa40PMMxYuRzdLMNlbsl7OgKqtwF+pzkmGmcC01hiV/VPT7Ong+44y1WGBzlJc0=;
X-Gm-Message-State: AFq9FYJYOJ4XX8hBehvgacw39h7Kf9iBB1OjBp6LTKDiGnWF3zZGtLga
	M9ylu6MzS64aJqbo7zLE4AA0AHh+TEbTFl9EbIkZ3RFNkQ+X/xgh1kplXsGFZdYzBC0WvVPIEKt
	aatQQoi7tq3HRwUhM+AeXJp9AybDP0RQ=
X-Received: by 2002:a05:651c:a20f:10b0:3a9:8408:8c5f with SMTP id
 38308e7fff4ca-3a9c54b827emr13297491fa.10.1791799976013; Mon, 12 Oct 2026
 03:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com> <bc140f68-a6a8-48be-950d-813ea33de071@suse.com>
In-Reply-To: <bc140f68-a6a8-48be-950d-813ea33de071@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 12 Oct 2026 11:12:44 +0100
X-Gmail-Original-Message-ID: <CAFLBxZaruHp0XzV-8iJvfTwgLNaiALjFHNxL7jJMjtnWivf0KA@mail.gmail.com>
X-Gm-Features: AclHuK8buKSKVzS7zce6lcxZ4SvaTlMZTEKwR0yLQYoJP2uD1bOezoDqexnlkKU
Message-ID: <CAFLBxZaruHp0XzV-8iJvfTwgLNaiALjFHNxL7jJMjtnWivf0KA@mail.gmail.com>
Subject: Re: [PATCH 01/15] x86/EFI: guard against oversized modules
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Marek Marczykowski <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Re-sending from @xenproject.org, since my other email bounced]

On Mon, Oct 12, 2026 at 9:19=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> x86/EFI: guard against oversized modules

Nit: This repeats the subject line.  `git am` of this has two identical lin=
es.

> module_t's mod_end field (which we repurpose to hold a module's size)
> cannot hold values 4Gb and up. Don't let truncation go silently.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With the repeated subject line fixed:

Reviewed-by: George Dunlap <gwd@xenproject.org>

