Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE0AC55174
	for <xen-devel@archiver.kernel.org>; Sat,  8 Aug 2026 06:41:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386466.1628321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsakK-0006We-Nc; Sat, 08 Aug 2026 06:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386466.1628321; Sat, 08 Aug 2026 06:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsakK-0006WN-IG; Sat, 08 Aug 2026 06:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1386466;
 Sat, 08 Aug 2026 06:41:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wsakI-0006WE-He
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2026 06:41:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsakH-0091b7-Uk
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2026 08:41:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a76cf95-2eae-0a2a0a5409dd-0a2a4508a826-0
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 08:41:25 +0200
Received: from [209.85.128.180] (helo=mail-yw1-f180.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a76cf94-f659-0a2a45080019-d15580b4c591-3
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 08:41:25 +0200
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-81ecf499af9so3572887b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 23:41:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1786171284; cv=none;
        d=google.com; s=arc-20260327;
        b=Sb6dl+QXVy3YRSDc0669Gdd5we154J9Bmi3TfZQeeeHQrzm8REsqO7/KBAO8AKxs/Y
         JVrwP/ollsKnfSCteINcoqTz3ipoMTfwJR/YfNeYwoQupoaREdNu4Rkde7+Zy3mx9hbf
         iLSjAvGYUI3Nd9lDoVYMBAAMyG70gZsDggvpk7Dtb0RDGLkCEDTCjN/AG6SjJMtEMkoB
         SkbGIdZ86aAD2NH0tQMpJxBU0boed0G8LiB1rrgWhDmhaH/hk2mv9EBgyPB0r0kpN2NL
         CME7OTMupcnH9hU9ifmPJKIzSXQ1H87Gk4CwiUFCmu4+lDYrGDDk7/0gAIBvVgRnULAL
         DYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=brAEPTkTQJOk5s9dmGcGn0aA5cl+Wfl2BWYesPthOS8=;
        fh=gKNe9p6CUigmZ3hfEbBZPSHY3Mosr9iEmW1Mh4pK8Uo=;
        b=f4pGPcNVR1ELSiTv1/5B9HiSg7wS31Gl5H6EJUPtzccjQmUgiM142Iy9Mhs2tnglJP
         f/uayeTQk+4uKUxTCvqnWHQyo8NzTToyq6aV72S4V88ZYAgIC5QfljpFv4lr9OnoJAvn
         pO/JO4PxenvYnXGp+vV9yuaW9bHThCEr5JL+Alt7BmIT6D6NaoydZBnvUTGSumAme/k2
         NYd+V0nMwCqCzkTHGo4bjaCFHLsZzDspehBjagqgjidg96djfT5keRJ1XRGqrVBC2S/4
         so10GGazjKUejwH28BOR0o/Lw5T1rJybyZU2NIQqAc7xAV7qUbBFPvwckrf2mFUDWDMN
         a/CA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786171284; x=1786776084; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brAEPTkTQJOk5s9dmGcGn0aA5cl+Wfl2BWYesPthOS8=;
        b=rxIXKgN/tEvlg+Ne5hGF0Dn2JgfevxaBIDCLmF+aRSNSmU3rShDDxrhb+N43+dRYUF
         ySxV6whzb5LkHVJgfeRtLknApfiaeULI5BozEORBH2SQsy22G15Rsn1Nh6JEd0rucEfK
         0P+dXDKqLcNBssyDP5rLu2gcfzRCkxL1N9q5LKO/ryDflGaHySP/CuKWd+2SdVFSsQpd
         OhETg5BpTmzAn1K7jqVqxTwIeQv0oQ1uUjbbFVIv5OOX5C6fPEDQISY4kaOXOulypLOj
         tNezjYkQzfdfsjkl+QnJ0ciFrY1O2RJ2IA2KQlayLzlzEXLCrR/bphp3FRV3VWnmu9Rv
         o/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786171284; x=1786776084;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brAEPTkTQJOk5s9dmGcGn0aA5cl+Wfl2BWYesPthOS8=;
        b=oOOMULCOAOfAnRX7gxYfUm8UtLZCbH+NLpo6ugSNzrcfBxCKOqadLSPiKkLaUYMmfk
         MxJZkQGIKwp9f75HyFAYaCpgcFw2bg40nI0LK/QpyLpOhdNl2eNXkTyWbXjoaBJ42dxB
         jYI44FZJpiKr//rDfeJ9bH0guP8FScuBbmE0Qc9Mli+TLDPpxbZimCV1Tt9VvyRJ9w1U
         WiCGFQi2ee2YFWH2MDm27eukXx/DpyFiBU6g6yDgM1BLdHGhfV0DdU9/tNBVEBC64zdV
         jdkkjeVGXch5VmhnzZqn2yfgkKwsgwI+0EiKQf+GEQelEkY+WjgQZwY4+Fmdfrrfc2zt
         Ochw==
X-Gm-Message-State: AOJu0Yzu+AV5m21LT6gYBgdCeOVtT9PvewK4CLDn1jhfC7QDs+3onZ69
	Rt3c04fFllgM0zjvqudEs2x5BehKR7MMrkxbFHCSHWTeoEY4C1bFRmAJULzjlAS/+tggdmD+1TJ
	Br6ofApzyD2RYjPw84mkcCF8H/v0Ohv1cdkPx
X-Gm-Gg: AR+sD11WmNWCERp1MoJeZfqYvWqNif/R67c9LAI76GcPbW6fGiXuCLAGfocd/YRQHAY
	Fwft4xEImrXzlvkuP5Nzhto77dFFuJ7UnogKrqKzgUMKrKI9Y2yuWryUB5sCpB0ym3rtAYnVXhs
	VFqxZchActqMlZbTo0Ifo2VMatj3bQyivvbjVzB3qVnwfNIowXebw5sVGrNhIUHnQVFz/rgzNiY
	D98INrW+WxBCe5kAQYQ3xJpIZ9B70eRE5PqL8iB6hnfzzn2/7YhmIGNWdZ5ON/5Px/qk+pwu5w3
	qw3IBoX/rSG5QWHwO9M51SIuC5+PDl+hT2qXUl6PuAkir0dk7uqFyZicfs97udWfviMeeQGFLPn
	Viw==
X-Received: by 2002:a05:690c:e3ed:b0:81f:d505:8ea4 with SMTP id
 00721157ae682-8202243d372mr183759337b3.18.1786171284309; Fri, 07 Aug 2026
 23:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 8 Aug 2026 07:41:11 +0100
X-Gm-Features: AUfX_mzZA91mCnnCMSoV-jVtHsRISJpZXkdZfeKuQnapIB88c-QFN9wkflUB9TE
Message-ID: <CAHt6W4cG_-=8MBJ+7dWQrLuC2Lf-fLOHDUyGwWDGQn6=9bO1Lw@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1786171285-D715E87B-E74CC900/0/0
X-purgate-type: clean
X-purgate-size: 1734

On Wed, 15 Jul 2026 at 07:22, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> These patches improve support for Secure boot.
> UEFI CA memory mitigation requires memory pages to be not executable and
> writable at the same time. So changing permissions and splitting some sec=
tion
> is required.
> Remove multiboot pieces from EFI executable.
>
> Changes since v1:
> - improved some comments;
> - merged 2 pacthes removing multiboot support in x86 PE;
> - removed a patch dealing with SBAT;
> - other minor changes (see single patches).
>
> Changes since v2:
> - improved some comments.
>
> Changes since v3:
> - Added Acked-by;
> - Improve commit message.
>
> Changes since v4:
> - Messages updates;
> - Clean some dependencies cause by code removal;
> - Add small commit to remove a possibly unused string.
>
> Changes since v5:
> - removed merged commit;
> - remove more code/data from xen.efi output.
>
> Changes since v6:
> - fix commit message.
>
> Changes since v7:
> - added Acked-by, all commit are now acked.
>
> Frediano Ziglio (2):
>   Align relevant sections to 4KB
>   x86: Split .init section to satisfy UEFI CA memory mitigation
>
> Roger Pau Monn=C3=A9 (2):
>   x86/efi: discard multiboot and PVH support for PE binary
>   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
>
>  docs/hypervisor-guide/x86/how-xen-boots.rst |  6 -----
>  xen/arch/x86/boot/head.S                    |  8 +++----
>  xen/arch/x86/efi/efi-boot.h                 |  7 ++++--
>  xen/arch/x86/xen.lds.S                      | 25 ++++++++++++---------
>  xen/tools/combine_two_binaries.py           |  2 +-
>  5 files changed, 25 insertions(+), 23 deletions(-)
>

Ping

Frediano

