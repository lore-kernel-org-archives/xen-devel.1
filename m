Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198FECC6B2D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 16:44:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449344.1665202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH25j-0000gL-Ta; Wed, 14 Oct 2026 16:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449344.1665202; Wed, 14 Oct 2026 16:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH25j-0000gE-QN; Wed, 14 Oct 2026 16:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1449344;
 Wed, 14 Oct 2026 16:44:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <miguel.ojeda.sandonis@gmail.com>) id 1xH25i-0000g7-IH
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 16:44:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH25h-00E2c3-VQ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 18:44:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <miguel.ojeda.sandonis@gmail.com>)
 id 6acfb167-bab6-0a2a0a5309dd-0a2a4501d5f4-14
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:44:33 +0200
Received: from [74.125.82.169] (helo=mail-dy1-f169.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <miguel.ojeda.sandonis@gmail.com>)
 id 6acfb170-5984-0a2a45010019-4a7d52a997cd-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 18:44:33 +0200
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-34c522572bfso548247eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 09:44:33 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791996272; cv=none;
        d=google.com; s=arc-20260327;
        b=sgx76TeYqAHTHFJkiRXm0g8j+34/2xN2OjCIz48pLuBytqcOCfBYAVoVA3iHUerTFU
         XMVLm33aj/JGic/N6EkREEPVz1kgZgvHlt/AmVCfPag+0OdVClISaJFieCGile+s4hZV
         LSWrmCwJvHjazZvU6KAO8NvAwr+2ygdL2lhNp7tMqo0oqYx4koAXa3Rirutmpr3SAEh+
         H6oy+ezJTACX+SH1O2/ggiBcd84bNKLkE6TTWoa/ZD9d464rjI/XFj0MwzYQXextsBGm
         w14bhyQlCkJv/lTyClsHT//GeImSqDiRuIl/IP4Q8YgoszzDn2fnKma4Uudabi6eIWfA
         7f3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        fh=AiCmKLTLbfiF+IgaOklRbXWvoIXr7KSCud2f0JCapIA=;
        b=AVuDwIxAd++szmyLPr4Yb0YOPqhz8Xi8uu2NUMwfqcH1XawCdyzh4HYs0w+r6V0MO2
         P49MTExAelz2LSU/W2w7Cfdb8XQPxt9blIcYsk21+skGScTzTMQSmVdquSEOE/L5PYZI
         CH4pIPTcSAJVkxH50VqcJwMBXthl/R52iNQ55fICI8oZvENpW/z9qTB/LPmUNWuPU8D4
         on6uLrDth1Q5kEQQXK5tFIszj4LxndcUMqKiSyS+ev+BZidr5SbH14APUIGDaF0SQSD2
         YdeJIVdX3Rk0RAc938o8ZHMbe/OrJX4/ffbjbrlUj9HneXX9lr818Eaiu0VV3rqU8X9n
         VEKw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996272; x=1792601072; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=H78jwmoP6MgHCjRqkq+iNodXTO5UBTYgMkiRCDKD1Cjg0PBwvxLNsYRnFo2JuOjEtF
         W/br1G+7x4JwZfW8eTd6oU17MUA6cP5k3DfXt1hVhgMCI6TE6/kvKyEuPlDiW7xzVho3
         IYHWTLIgkY1cfNrpUv0NEtgZwHiPm/P4gEyuqAMob6Ptglrl1KjZHn+s5dQLZp2H7bHi
         uW1lZbrI8bqi469+sWgHFAFMEAsvJpauomHzp5hg8dBHrrZxTB/75Eh71zliRgYAMo4f
         /oWrVgXqN3PCuOxzJOerX5HrpBY75eOdtwjes3JE2XAUzlU+OMOUlOGbkNk3EFrXRhNg
         JxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996272; x=1792601072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=GflNEkJ8/mL7PX8b9QNcKGv6NgnNM6bFDIjcLOz/IruaRPORfUSGk2j9lCLxKMMcLc
         0BKgfb+Jm7+rH6BHiM44IRv3rzKJok3SA8zHF3Hf3M9RR5mZDpNwLTJ+00VAyGBSyRsZ
         1Iuq/DoGJFGZej2LPXekOh0dgO96d3OC8NzUn+KD+UPPIab6y8SfTuPp0UMY6AN5I0Wx
         PAwgXaMZnQl8cNbSIuIeO4X1iW43e0J5owtEHGKrGqnVQ6eYiVXZpbHoC12G1R6mT9VG
         Mo2R08khsF3E8iy7iBCz8pI4pcYcqFwVZ5FZAJ/XIEXYMejcz98o5tw7aiKxqJYe+pOR
         0Fdg==
X-Forwarded-Encrypted: i=1; AKwUvBx0Biqf63+pgO4GVwhc3uwX5dFXb6TPnB2rhSlIXLnYL+c/vNiOTzR2yIOHaEYon0kukfP8suSZzL0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJklLGfbH6MNgjIlcIIc6gmdw0/Pf6QF6fwNIyHR+CfjBESJU/h
	HIDg/iS5kVmGXGtICpRo5pmUWtmGKM0Q6HLhtBr8qBFg36ew0C0/NCVE/2QYyXJnr0Iu6NU/GJh
	fPh/AFRhJ9u6tT84tq5D3sXV/+xzhN7s=
X-Gm-Gg: AYBFou1DFYWYwFdHcGDagA6pIqlkaWTiP5o/6tYLftcFMyyNwmhsle7uhl8dnf93FYV
	FjaKjGzL6O9qwpVHUjAPldc+0SWUDPiyPXOYUFXCnoEb7zXYwBc7klD+6gQzjMEX5BLqE08oYPR
	Lnua/VI3J4OtjeOcZTFkzbxlLJKyNad6KLTrUWQJVQDUvcRz63bjKuyda0S9jcV/dKC9+GhEdR/
	hsLQHlBEbjiCMS0vHu6nGbzkuJnCHbvFK7apC1LcEc3k35PKdFQSVEOeSb7i93FJMsmRjcqGBJR
	UIBqWbV4+0tT3W8WAlQTZJqunaB4CIRIhx1HhO4Q0T7+PldJu926dCrq3dlbaRiymQqltccpfJn
	dwrgjNHgsza9v9ssdSGXWnlZ53hPX1tJECVW4dmfkGrGTfc0F3AZzbhRPf15xxKu5Jg3E4a6hYW
	Ebgs/Z4pR2BYz2FIrjy+8nk57iuoMFpVVz53rSUePzUghX6k7h7zo=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr28158500eec.1.1791996271702; Wed, 14 Oct 2026
 09:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 18:44:18 +0200
X-Gm-Features: AclHuK_d31yoge0njHjovdIQh7JfJY6W-PLjzMLBq14NjY-schAqigzEJUAQwG8
Message-ID: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1791996273-BFE68757-8EC13C06/0/0
X-purgate-type: clean
X-purgate-size: 1132

On Wed, Oct 14, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

Of course, please feel free to pick it up (with the small tweak I
requested) if you have a user.

And if you don't pick the user, I could still pick the first patch up
through the compiler attributes tree if you and other folks want to
use it after -rc1.

Greg: adding the attribute itself should be safe and would unblock
others that may want to "protect" themselves, without having to wait
for every potential user to get fixed (but of course I agree they
should get fixed -- we should not forget about them, if that is your
concern).

Cheers,
Miguel

