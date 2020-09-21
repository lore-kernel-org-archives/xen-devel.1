Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13253C43463
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 11:47:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB8A820EDD
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 11:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="x1Ponr6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB8A820EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKKII-0008Mm-4f; Mon, 21 Sep 2020 11:47:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=etcF=C6=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kKKIG-0008Mh-5A
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 11:47:40 +0000
X-Inumbo-ID: 3f56fa0b-9a8a-4cb8-8e95-81302f32096e
Received: from mail-40133.protonmail.ch (unknown [185.70.40.133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f56fa0b-9a8a-4cb8-8e95-81302f32096e;
 Mon, 21 Sep 2020 11:47:37 +0000 (UTC)
Date: Mon, 21 Sep 2020 11:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600688856;
 bh=JCDPtqxytWHbcVL+9QQ23fdaCQ8LYNt/REH3k7vJDWw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=x1Ponr6nqOUAQBxTOkkuOHYevaegJLEMAxDgtAnvU1vKgQzwFkzxypXh2kujLYKEP
 8PepamSr0blCbfjXLaZgvYRlN76nUH7iBakHlI12s8RnKe4lzIrhbuMFNOQN+Pwy9X
 Iy+ECuFRvcIa5p4NHohipLRfm3iF/kbG0F4fjecM=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 4/5] efi: Enable booting unified
 hypervisor/kernel/initrd images
Message-ID: <8SCsKmmE_x1CSekfis7_T8O-sWPNAlOzWW4-X_eiW5-iDudhm8rRmnUf1Ft-i92wHoFVxncXaAYgXI54rK34SxGaf3ihuX0cKXnIt5UOBe4=@trmm.net>
In-Reply-To: <51b0beda-11bc-a587-d390-63e5613ac309@suse.com>
References: <20200917154048.1140580-1-hudson@trmm.net>
 <20200917154048.1140580-5-hudson@trmm.net>
 <51b0beda-11bc-a587-d390-63e5613ac309@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Friday, September 18, 2020 11:15 AM, Jan Beulich <jbeulich@suse.com> wro=
te:
> On 17.09.2020 17:40, Trammell Hudson wrote:
> Instead of forcing the caller to pass in a dot-prefixed name
> and you assuming it's a dot here, how about ...
> ... pe_find_section() looking for '.' followed by <name>?

v6 adds a special name compare function to do this with a
CHAR16 section name to avoid the extra s2w() you mentioned.

(btw, even if the EFI constness patches don't go in, just
making PrintStr cast away the const would allow several of
these startup functions to have const CHAR16* arguments since
the only reason they are non-const is to be able to print)

> [...]
> > -          if ( read_section(loaded_image, ".config", &cfg, NULL) )
> > -              PrintStr(L"Using unified config file\\r\\n");
>
> Maybe "embedded" instead of "unified"? The config file isn't unified
> after all, it's the Xen binary which is.

How about "builtin"?

I missed the reviews on the need_to_free patch; they are also incorporated =
into v6.

--
Trammell

