Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2569C432C0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 16:15:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD7821844
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 16:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAD7821844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWjgM-0000a9-MQ; Mon, 18 Nov 2019 16:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eRBh=ZK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iWjgL-0000a2-6r
 for xen-devel@lists.xen.org; Mon, 18 Nov 2019 16:15:17 +0000
X-Inumbo-ID: 9b535246-0a1e-11ea-a2d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b535246-0a1e-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 16:15:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8B3CB1AC;
 Mon, 18 Nov 2019 16:15:14 +0000 (UTC)
To: florijanh@gmail.com
References: <CAOhq9FydFPJBvJ_uPZFjDfpjZ0tLBV6tRamTdVupVFHRPFFm1A@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2766bc29-db3a-e37e-6f68-56a1a5bc94aa@suse.com>
Date: Mon, 18 Nov 2019 17:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAOhq9FydFPJBvJ_uPZFjDfpjZ0tLBV6tRamTdVupVFHRPFFm1A@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Issue with 5.3.8 kernel in a ArchLinux guest
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RmxvcmlqYW4gSGFtemljIDxmbG9yaWphbmhAZ21haWwuY29tPiB3cm90ZToKID4gbXkgbWFjaGlu
ZSByZWNlbnRseSBjcmFzaGVzIHJhbmRvbWx5LiBJIGZvdW5kIHRoaXMgdGhpbmcgaW4gbXkgbG9n
cwogPiBiZWZvcmUgdGhlIGNyYXNoIGhhcHBlbmVkOgoKLi4uCgpDYW4geW91IHNoYXJlIG1vcmUg
aW5mb3JtYXRpb24gcmVnYXJkaW5nIHRoZSBYZW4gdmVyc2lvbiB5b3UgYXJlCnVzaW5nPwoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
