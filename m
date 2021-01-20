Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF77C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 08:23:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D614823131
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 08:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D614823131
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71252.127443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l28lK-0001Bf-Ry; Wed, 20 Jan 2021 08:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71252.127443; Wed, 20 Jan 2021 08:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l28lK-0001BY-N4; Wed, 20 Jan 2021 08:22:46 +0000
Received: by outflank-mailman (input) for mailman id 71252;
 Wed, 20 Jan 2021 08:22:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l28lI-0001BT-Py
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 08:22:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d93247b-2ee4-4623-ab4f-b40d55608f79;
 Wed, 20 Jan 2021 08:22:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D535B807;
 Wed, 20 Jan 2021 08:22:42 +0000 (UTC)
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
X-Inumbo-ID: 9d93247b-2ee4-4623-ab4f-b40d55608f79
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611130962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHjEpTNzsFiFc8Xu/W1YqAEVvFDE+UGY4IcPVO0byPI=;
	b=gxJCfomT+YIhyLLg7r2cB+wikhJN81U50cP71trhrNBZRi1OhW2NtfbIsaHAkcuO8I6qOU
	/J1X68ZZhTeoT+cV9+AKIs3uekUxpVJSZt+mITcyhyqNSdjrFYpJRUJ2Pp2ao2CIrgkl2H
	cjZw/pQ5D2nb6lVStU/pL9udjj0jjKE=
Subject: Re: zstd compressed kernels
To: Michael Young <m.a.young@durham.ac.uk>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home>
 <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com>
 <6edb6c99-4289-b991-c767-333e376ce66@austen3.home>
 <e500ee3a-01fb-ac1b-5ea2-47fd0f2a67db@suse.com>
 <ebca949a-719c-ad5a-37a1-d340f37b59d8@austen3.home>
 <52fba28b-9652-e4c1-88e1-e35e2645c72e@austen3.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54fec3c2-06c4-9d26-75fa-9770a380c180@suse.com>
Date: Wed, 20 Jan 2021 09:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <52fba28b-9652-e4c1-88e1-e35e2645c72e@austen3.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.01.2021 00:10, Michael Young wrote:
> I have been trying the "[PATCH v2 1/5] libxenguest: support zstd 
> compressed kernel" patch, and (assuming I haven't broken anything trying 
> to migrate it to 4.14) it fails with
> 
> onfigure: error: Package requirements (libzstd) were not met:
> 
> Package 'libzstd', required by 'virtual:world', not found
> 
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> 
> Alternatively, you may set the environment variables libzstd_CFLAGS
> and libzstd_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> configure: error: ./configure failed for tools
> 
> I didn't give it any zstd packages so I would expect this test to fail, 

Hmm, maybe I either misunderstood the purpose of
PKG_CHECK_MODULES(), or didn't use it correctly. The goal clearly
is for there to be no failure, but simply a libxenguest without
zstd decompression support. But I will admit I didn't try
configuring on a system without libzstd; apparently I should have.

I specifically didn't want to use AC_CHECK_HEADER() / AC_CHECK_LIB()
since pkg-config is - aiui - to help abstract the need to know where
exactly to look for headers and libraries of a particular package,
and libzstd comes with a libzstd.pc "out of the box". Cc-ing the
tools maintainers in the hope they may know right away what my
mistake here is.

> but I would have expected the build to continue and attempt to use the 
> zstd code in the xen tree instead.

No, this - very specifically - is not the intention. This also isn't
how things work for the other compression methods. The hypervisor
code gets reused only for the stubdom build.

Jan

