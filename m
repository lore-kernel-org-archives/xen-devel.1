Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D04C4363A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 08:35:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFDA2463F
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 08:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="B7iQOhra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFDA2463F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13370.33973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgv9-0000T9-Mn; Wed, 28 Oct 2020 08:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13370.33973; Wed, 28 Oct 2020 08:35:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgv9-0000T2-Jn; Wed, 28 Oct 2020 08:35:03 +0000
Received: by outflank-mailman (input) for mailman id 13370;
 Wed, 28 Oct 2020 08:35:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXgv8-0000Sx-Ui
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:35:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74f374e3-f120-4981-9fda-4c90a254eda0;
 Wed, 28 Oct 2020 08:35:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 68D2BACB6;
 Wed, 28 Oct 2020 08:35:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXgv8-0000Sx-Ui
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:35:02 +0000
X-Inumbo-ID: 74f374e3-f120-4981-9fda-4c90a254eda0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 74f374e3-f120-4981-9fda-4c90a254eda0;
	Wed, 28 Oct 2020 08:35:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603874101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rYNFhhYWGWRe40YrMvFyoHGRdvEqDiP65gRjd5q3Skg=;
	b=B7iQOhra9VrbTMACrUglGugUlD6YEAlYqhk7s2JPmAN/1Jv1XYzARxCIu3OaNOA7ptbUTK
	qyPDPEQcvp13/gBEtGA1BGVAdPyzLhxH97/N6gI2f3WCUYQsqRD3NM9hUVdM3Lc8tK54N3
	inFCi/Mmgv1l+3mFZFWSKMQjGltphKw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 68D2BACB6;
	Wed, 28 Oct 2020 08:35:01 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/ucode: Introduce ucode=allow-same for testing
 purposes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
 <20201026172519.17881-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67f2df64-68e2-23e6-172f-9824eb8f7e14@suse.com>
Date: Wed, 28 Oct 2020 09:35:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026172519.17881-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 18:25, Andrew Cooper wrote:
> Many CPUs will actually reload microcode when offered the same version as
> currently loaded.  This allows for easy testing of the late microcode loading
> path.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> @@ -2248,6 +2248,11 @@ precedence over `scan`.
>  stop_machine context. In NMI handler, even NMIs are blocked, which is
>  considered safer. The default value is `true`.
>  
> +'allow-same' alters the default acceptance policy for new microcode to permit
> +trying to reload the same version.  Many CPUs will actually reload microcode
> +of the same version, and this allows for easily testing of the late microcode
> +loading path.

Either "easy" or drop "of"?

Jan

