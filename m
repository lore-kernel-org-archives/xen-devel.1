Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F2CC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448819.1664842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxAW-00008e-1o; Wed, 14 Oct 2026 11:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448819.1664842; Wed, 14 Oct 2026 11:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxAV-00008X-VM; Wed, 14 Oct 2026 11:29:11 +0000
Received: by outflank-mailman (input) for mailman id 1448819;
 Wed, 14 Oct 2026 11:29:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <miguel.ojeda.sandonis@gmail.com>) id 1xGxAU-00008Q-OX
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:29:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxAU-00Bv14-1c
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:29:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <miguel.ojeda.sandonis@gmail.com>)
 id 6acf677d-bab6-0a2a0a5309dd-0a2a4502d1b8-20
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:29:09 +0200
Received: from [74.125.82.174] (helo=mail-dy1-f174.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <miguel.ojeda.sandonis@gmail.com>)
 id 6acf6784-6ca4-0a2a45020019-4a7d52ae9e28-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:29:09 +0200
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-35159e0092aso446333eec.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 04:29:09 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791977348; cv=none;
        d=google.com; s=arc-20260327;
        b=Uj5rfTIRTdHTmQmz5l2RGtvJXZBoiv0SLPAAG8cN8boW67AJFfKXfe6hgXzgR1FeVR
         pB0ir/fI3O6doonB3Nxi8Q2WGHe6nff2XscRpsW/+Ul4Hw+5uOxDdOa1QQ+1AtDMGW/t
         YNpNP9Ys5c0qK8EA4mZz1rKX5emzoiK4Yn2RIPyBt5GaTBUXy474Cfh2RNEHVxRu5jmI
         M8Li5g0Gvb5wgMbMbPZn9n9DzxsJWtpIRMRuL2wYhT38uS2pLODBgkIdqXrOohqQYlM2
         4rNHahWseb2IzTBfrYfd+l3dhIzA0XGXgjVIFsNxw5XjOh76BgbkVMesKQDGaqrdrmuw
         5Rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        fh=yPtcoeQFsAo9lXGb61vAWgz6GoL9BIq2U4FsndOWfJY=;
        b=WAR8VeJOC6B67SX7XZ1e+VsRytDCC5h+u3ujDRdoVL0TglG2vOpGTRDSEunJV8Em17
         31v0o42w1SCaj5o1OfPOJ+XGSqjOhPhXqxeu6JL4p3coawVjqlIdxc9m3c/Bz9gUsBXm
         6xvNJdKy4SuXtlM0o8c412qwCtyo5uWKW/1iWau2zwJm7yq7xdO2r/9BhaDJELrAa6mY
         B2x5MdVrVIpcdHaNT4nYhJsXAmRhstknGkGZcH4ATd9fC/4Yh4yoetgTsmxjrbTWK2uy
         cwj2YgTa6+s69QZKupOk51xhZFjG8f4JYLyqbHFHtll7EnYX3jv/Dfll0vrejA9JhDxK
         Cyqg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977348; x=1792582148; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=iKXvaElS6gELKlFMETwsfU1oTqjFOQoINlVHKfdhRJw3E1d7YedgRlO3nNpcKi+nxp
         CobuJkmEW+b/53QmiuNh4OZ6IFNRAtGy63r/1Ghm6y5n7nEircIr7pzISvv5rhTo11Q6
         75/24ogH3g+bob4xYp1JcMTepLVUS4mNrPHhH6TKntFCQhbtsrR4zvkHkyEjofjK87kZ
         N2zoENZw0PC5zX+Gaj4S+d01tsX90PLvfFde1BfAtq+PGL1duWRUKSWIQu8r4FMtIpNe
         5/jgPn5lvTYNUhLMZ34xQdC1zuxQKmc/KCqM3uWSwmoFB2JP7OeUo/ZzZVdWc5I/dhrP
         OE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977348; x=1792582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=TomNf663ui3W5gH6jc/vhQXFNlfDsA91SUbwluHd6U6YPwJpuLcs0m2SKiFkN59qD1
         zNNm/bfej72aayawJszz/Eew+CAvBwWJinLB3ZdxiqcLMJMSVNMCfUfTKsZ2b0oBP05F
         g8AtSBWRB83pFg9lRyGdPaQZR2csA7VdIJ8wee31KSuYSIMIravg51RYNFS0Yr3+X1G+
         DEySR8yob8k+gikCKn6ZGkW13E5dAzwV1FYXO6pWTzwTVDoWTy7dC6V+KEK7ncPaf2Dr
         BUJ0GO3At9bGoPGmABICc8O+oiNSmNsERjSRW/s333+yl2NSpXoNupUiVI5T/o8Pyd8z
         jl8A==
X-Forwarded-Encrypted: i=1; AKwUvBztRoRBu22gzbn7j5svpD0xGM2ZouOWbwSHX9U7VVLiDkYvZ2K69c+pe6t6SOITPGLiNVA9bI5iFMU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKP5BUjtwiP+3IE7yYsemgu8AGtP4eA60RAWZ1WU74wJ3t7yDmQ
	XhVJdbHirHpU2KPLUlmIp4R/NOjVmq1YtW+YUbxDW95AY/xCbKHU0iEOaY7WFNZlOCn/GGAWqII
	ww59q4WgdUIkVEeM4CVG7t/B6X5bUBM4=
X-Gm-Gg: AYBFou2mKEIocMrD+ih1FzhlsWu6mlDtvPUwAR8FyBMzA5cBVI7MLJOpbQBSR+CTBRa
	tcfmy5EvcBbH/LbzopFiZypgT9LZA7YSqgtC0FF9l1fZwh5hd7a5pwlEh0AuYNOIssrKTdZv8wc
	v3g33AxKzZoaVK25Rh5M+isTMimGpWYDf1ys0vviCwKuVqaqU2HCYiyY2RJooPlN9xsstjEb5j4
	RUAryCgySIX2mXwnUjemdVxGvpJvPkXwIVoeASg8WdbtPjiC88oauZjQi8saPouSSsBKVq8av/S
	uIGbgmeDhJX63uUgIbGgiS2MLmRwoSolRzcQmb1mpmdRd6xTXlIVJZXkcE9rgQq5NoTw6BxUuFn
	YVtJauC0BbSMEYznUwKKsMRgBvkOjbZoI3cE511+mr91uKOBEV9cH4ye8D9PFA2KKeuzn2oVxph
	WvdYyEeSoFfu4jtHg4P+OpfViogg1rDGQTAqb3QU+P5NPonpek3tE=
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr14326600eec.1.1791977347656; Wed, 14 Oct 2026
 04:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
In-Reply-To: <20261013223946.1836757-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:28:55 +0200
X-Gm-Features: AclHuK8qVHO7HVQy6LgzcUgjYcQf3EimC6SJcN58PVqcWVdOf6T45eXZNeTLsEY
Message-ID: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
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
X-purgate-ID: tlsNG-720697/1791977349-F18AC2AC-FCD3F2C6/0/0
X-purgate-type: clean
X-purgate-size: 933

On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> +/*
> + * Optional: not supported by gcc
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#require-ex=
plicit-initialization
> + */
> +#if __has_attribute(__require_explicit_initialization__)
> +# define __require_explicit_initialization __attribute__((__require_expl=
icit_initialization__))
> +#else
> +# define __require_explicit_initialization
> +#endif

The LPC slides mention Clang 14+, but from a quick test in Compiler
Explorer and a `git log --grep` on the LLVM repository to confirm, it
seems the attribute was introduced in Clang 20+, no?

If that is correct, then it is not available in all LLVM versions we
support (LLVM 17+), so we should add:

     * Optional: only supported since clang >=3D 20.0

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

