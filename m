Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C530FCC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 05:37:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448445.1664446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGrfc-0002nl-TO; Wed, 14 Oct 2026 05:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448445.1664446; Wed, 14 Oct 2026 05:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGrfc-0002ne-Pz; Wed, 14 Oct 2026 05:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1448445;
 Wed, 14 Oct 2026 05:36:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gregkh@linuxfoundation.org>) id 1xGrfa-0002nX-HT
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 05:36:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGrfX-00HW0V-P7
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 07:36:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gregkh@linuxfoundation.org>)
 id 6acf14c8-bab6-0a2a0a5309dd-0a2a450ac172-44
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 07:36:49 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gregkh@linuxfoundation.org>)
 id 6acf14f0-f2d2-0a2a450a0019-aceafc1f9d74-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 07:36:49 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D84B407C1;
 Wed, 14 Oct 2026 05:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60E01F000FF;
 Wed, 14 Oct 2026 05:36:46 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=korg header.d=linuxfoundation.org header.i="@linuxfoundation.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791956207;
	bh=20IeJwlfbHOwAOqBybbPglj4DioVDbfCTggyOUmG6AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qh2L+lns+TC45tZ3ta2Bf3sHpQuD7ArGYrxTnkjJVsISJDd215cAUFX7buojC10XX
	 PxZbUFGpn526urHl9iW1zA+jq+Q49VIAoWCaSVIjSYQA+Pdp0aIxZO/l3JMBTZ5a0o
	 W38eNJtQMa+oY0XJ4+Fg38TXLC108OEL5jmzsnVI=
Date: Wed, 14 Oct 2026 07:36:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ian Rogers <irogers@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Nayna Jain <nayna@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	David Teigland <teigland@redhat.com>,
	Alexander Aring <aahringo@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	gfs2@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct
 kobj_type::release
Message-ID: <2026101425-why-boring-4f2d@gregkh>
References: <20261013223946.1836757-1-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
X-purgate-ID: tlsNG-4011c0/1791956209-5A5DBCFC-BD1C7D6D/0/0
X-purgate-type: clean
X-purgate-size: 1795

On Tue, Oct 13, 2026 at 03:39:35PM -0700, Ian Rogers wrote:
> Clang supports the 'require_explicit_initialization' attribute on struct
> fields to enforce that the field is explicitly initialized when an
> aggregate object is constructed, emitting -Wuninitialized-explicit-init
> (enabled by default) if the field is omitted.
> 
> Following discussion at the Linux Plumbers Conference [1], this series
> introduces __require_explicit_initialization in
> include/linux/compiler_attributes.h and applies it to
> struct kobj_type::release.

Cool, sorry I missed that talk.

> As Documentation/core-api/kobject.rst notes:
>   "One important point cannot be overstated: every kobject must have a
>   release() method, and the kobject must persist (in a consistent state)
>   until that method is called. If these constraints are not met, the code
>   is flawed."
> 
> Annotating struct kobj_type::release caught 30 struct kobj_type
> definitions across the tree that omitted .release:
> - Patches 2-10 fix 10 struct kobj_type definitions where dynamically
>   allocated kobjects, ksets, or enclosing structures were either leaked on
>   kobject_put() or freed prematurely before kobject release (risking a
>   use-after-free when CONFIG_DEBUG_KOBJECT_RELEASE=y).
> - Patch 11 annotates struct kobj_type::release with
>   __require_explicit_initialization and explicitly sets .release = NULL
>   (with explanatory comments) on the remaining legacy struct kobj_type
>   definitions whose kobjects are static, per-CPU, or embedded in devm- or
>   parent-managed structures.

Sounds great, but let's fix up the users before adding the attribute.
Looks like some of these need another version so it might take a bit of
time to get them all merged.

thanks,

greg k-h

