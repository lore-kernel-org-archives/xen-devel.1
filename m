Return-Path: <SRS0=BsMM=CY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594EFC43461
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2020 11:09:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FBF721D43
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2020 11:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="l28JiBQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FBF721D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI8po-0004Wb-JZ; Tue, 15 Sep 2020 11:09:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix3r=CY=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kI8po-0004WW-1M
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 11:09:16 +0000
X-Inumbo-ID: 3f15bb0d-f5d3-41d7-8271-ca2cf4e8b77f
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f15bb0d-f5d3-41d7-8271-ca2cf4e8b77f;
 Tue, 15 Sep 2020 11:09:14 +0000 (UTC)
Date: Tue, 15 Sep 2020 11:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600168152;
 bh=Ta6F2zXGAU84jlAQ34NcNinr0AMUIkaN+8afezuZBjQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=l28JiBQe99jfzMqVOEN7Q8twHYOIMi/Cx3dWZx/KMAHiMqN4MT2QLosFIVtLrUjHE
 xoYizx1S2HNkbfxeFxrNpY9D9KOVLsDaydqnrHDiWt5b8s8lu1T27KaA6lBgj+6HST
 KJu9Bp9WxUKp9qJGwFX+P/DbyIUUMF31y64xw0vs=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v2] efi: const correct EFI functions
Message-ID: <tuF1SZMvlq3rgo88wHqlXXKX_8quZfLVhBFc_yfjlrZfdnBny5S40cdU3jpzQRsPQ0zkOEbWNsxxBr-ZNPMzIL5EFfnvHrxotTogXLdy_eQ=@trmm.net>
In-Reply-To: <f5720a67-6156-7b90-1621-e680589eb420@suse.com>
References: <H6ozE5MaNxWCNeoYOjzIuwr5pFTnlM2wAGkSFsWA3-c6OZ4x0TpuFSJTh2e6zTVD-ZC-f9KRfA6THcbHLD2hNNbiByTbEHl56_itVZuLBYw=@trmm.net>
 <f5720a67-6156-7b90-1621-e680589eb420@suse.com>
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

On Tuesday, September 15, 2020 12:36 PM, Jan Beulich <jbeulich@suse.com> wr=
ote:
> In order for these casts to be halfway safe, they need to happen in
> inline functions, not macros. That way it'll be sufficiently clear
> and certain that it's really only the const which gets changed,
> but not e.g. also the pointed-to type.

At some point it really looks easier to just add const to
the efi headers rather than having to recreate all of their
verbose APIs.  The efiapi.h header was added nine years ago
and has been edited once, seven years ago, so it isn't a source
of significant churn.

Meanwhile, if someone wants to delve into the cursed mines
of sourceforge, perhaps the gnuefi devs can be convinced to
update their sources.

> Apart from this I think the whole change wants splitting up, to
> (about) one basic change at a time.

Yeah, the string and file const changes ended up mixed in the
change set.  They are sort of related, but it would be easiest
if the EFI constness was fixed first so that the printed strings
don't need additional casts.

--
Trammell

