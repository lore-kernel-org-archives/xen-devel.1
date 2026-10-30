Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AC1606A323
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bd5mnlMY
Received: from list by lists.xenproject.org with outflank-mailman.1466007.1676408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMrNN-0007OF-3K; Fri, 30 Oct 2026 18:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466007.1676408; Fri, 30 Oct 2026 18:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMrNM-0007O6-Vj; Fri, 30 Oct 2026 18:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1466007;
 Fri, 30 Oct 2026 18:30:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kees@kernel.org>) id 1xMrNL-0007Nx-J0
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 18:30:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMrNK-002VV8-NM
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 19:30:50 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kees@kernel.org>)
 id 6ae4e246-bab6-0a2a0a5309dd-0a2a4502e812-14
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 19:30:50 +0100
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kees@kernel.org>)
 id 6ae4e259-6ca4-0a2a45020019-aceafc1fc23c-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 19:30:50 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5A0CB43856;
 Fri, 30 Oct 2026 18:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365561F000C1;
 Fri, 30 Oct 2026 18:30:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793385048;
	bh=Ymmdwc5PEMgv61WbZEAXoHrjiG+5VIZ10E632soWGCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bd5mnlMYQl798ipBazvCyuBvEJ+dWQPwsnUhVWLaW7b1vz5ZxxwwDFJAXipNxVYkZ
	 1YMHg32fNUCuoVzm2HCBW3ov7kG+JMaBOx03FaMytt2PrrA5GHA2Tvi5hKn/EfloYP
	 2beONBCAOHLRlOst0mi76+aNgfLm6mIii3Lr5Fvstx8lw6wGj/SrTAbdVuY0LzPwAU
	 bCJanwYpvATD+HqFWKlmHWzxbYzpj5FiFEot/sqUcaxCu2/PrJulmkzTYLC6de+Ext
	 aaZWpT6UFdWy/d0gaseRtXTvi4oQtl70vUfG4Wb6sIpH14qDGlI1q3EhfXbEG7UOrn
	 +aykTDKlAEfuQ==
Date: Fri, 30 Oct 2026 11:30:48 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/9] Compiler Attributes: Add __must_init macro
Message-ID: <202610301130.FEF31E7F@keescook>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-2-irogers@google.com>
 <202610281155.4D2AA663@keescook>
 <20261028190233.GA669046@ax162>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028190233.GA669046@ax162>
X-purgate-ID: tlsNG-720697/1793385050-F3EBB2AC-57C470AD/0/0
X-purgate-type: clean
X-purgate-size: 859
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:02:33PM -0700, Nathan Chancellor wrote:
> On Wed, Oct 28, 2026 at 11:56:08AM -0700, Kees Cook wrote:
> > On Tue, Oct 27, 2026 at 03:38:36PM -0700, Ian Rogers wrote:
> > > Note that Clang does not yet diagnose file-scope objects declared
> > > without any initializer (initializers at file scope that omit the field
> > > are diagnosed), see https://github.com/llvm/llvm-project/issues/232483.
> ...
> > As part of this, can you open a Clang bug for the lack of detecting
> > global initializers? It'd be nice to get that fixed.
> 
> Is that this linked issue or a different one? Looks like you filed that
> one and it got fixed in clang ToT about a week ago:
> 
>   https://github.com/llvm/llvm-project/commit/58936cb3678b4b5b96177f24cac3940b9a389fe3

Oh! Hah, it moved so fast I missed it. Great!

-- 
Kees Cook

