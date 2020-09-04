Return-Path: <SRS0=ERFX=CN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F491C43461
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 10:06:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E73220791
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2020 10:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="UE7bJ6FJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E73220791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE8bk-0007kR-FM; Fri, 04 Sep 2020 10:06:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YEB=CN=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kE8bj-0007kM-PO
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 10:06:12 +0000
X-Inumbo-ID: 06ec0d77-5d69-4adf-b737-f874727649bf
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06ec0d77-5d69-4adf-b737-f874727649bf;
 Fri, 04 Sep 2020 10:06:11 +0000 (UTC)
Date: Fri, 04 Sep 2020 10:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599213970;
 bh=oCsKjIn13CIs4J/Uj65jAv76jjK2sA+lPd6fMRXn07U=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UE7bJ6FJDx1INOOAAUHapk++o/uqunhRZ0f62LwJ7vmW5faVaU3t11XvAOJHtT9Eo
 6FclyBULnZUfV9ZW6iA1upNBMkRLqsFanvlzSUXcfxSACo6yISzjTLF+3Z2wGuFyir
 8cXhIQbYtFhBtHkwhgwoQrjxsOdwy/Z0inO8MHAg=
To: Julien Grall <julien@xen.org>
From: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
Message-ID: <kxO4Q0LRhrdqHcPTtg_JQYmf2jaNOF-nUvckzLF_IhHTicunRP3-_CWWMDw2Jg7_-RSg56X_4ULzsL5rU84eIjWV9apUH9sRnu2rVf-6_Mk=@trmm.net>
In-Reply-To: <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
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

On Friday, September 4, 2020 5:29 AM, Julien Grall <julien@xen.org> wrote:

> On 28/08/2020 12:51, Trammell Hudson wrote:
>
> > -   /* PE32+ Subsystem type */
> >     +#if defined(ARM)
> >
>
> Shouldn't this be defined(aarch64) ?

To be honest I'm not sure and don't have a way to check if
this code works on ARM. Does an Xen EFI build on ARM even
use the PE32+ format?

--
Trammell

