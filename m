Return-Path: <SRS0=OoRj=ZL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E277C432C0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 23:12:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060122245B
	for <xen-devel@archiver.kernel.org>; Tue, 19 Nov 2019 23:12:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BfaTNSv6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060122245B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXCf3-0005f9-Sh; Tue, 19 Nov 2019 23:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J7Es=ZL=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iXCf2-0005f4-8k
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 23:11:52 +0000
X-Inumbo-ID: f67cef34-0b21-11ea-9631-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f67cef34-0b21-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 23:11:49 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id ECA162400FE
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 00:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1574205108; bh=pD59aDUjIkslPP8SDGh/Zu7Gt0pzuDtCHwK+Ke2AOJk=;
 h=Subject:To:From:Date:From;
 b=BfaTNSv6XmpN+qcrvvL2kYhzOO+fKsTJMuLNx8BLBcbHCiBKDAEeK0rq2RiLZkOtM
 uDI9JA+6toVTWrkU0LEDpNgU1o1ZrtYC9MD703AXbu2/MJeZPwemV9gLbOnHwfcNNo
 Xk8IrRXrRLlDekjBLaqBwCAzw/XWowNcO1itl6Or5p1EHl/EXQ2Co6KD2SqOaM7Sp2
 VpdRZEUNFWtMhYr4ETupJHUjjquQBXy3LeLTKCCPrCrXhLjURJvPjcjij/l7xcqIkI
 00zyBm+P6AXycHFhZoTfPjXdQueLayyEBIjLO9JtxTy1mGoNhvfz8BvcXWa4vhw989
 1Z2+54Ojuyzig==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47HhR62fmQz9rxG;
 Wed, 20 Nov 2019 00:11:45 +0100 (CET)
To: George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <4f9cb404-995a-1479-160a-1cf96815cb9d@citrix.com>
 <be40e4d0-f03f-a855-a93a-031abed36c81@posteo.de>
 <91ad90a1-c265-506d-fd68-3bc1deb708c4@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <de069e8d-55ce-3f27-5e4d-27bfd7ec7fc1@posteo.de>
Date: Wed, 20 Nov 2019 00:11:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <91ad90a1-c265-506d-fd68-3bc1deb708c4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ryzen 3xxx works with Windows
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxNzoyNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBXaGVyZSB3ZXJlIHRo
ZXNlIHZhbHVlcyBjb2xsZWN0ZWQgLS0gb24gYSBQViBkb20wPyAgT3IgZnJvbSB3aXRoaW4gdGhl
Cj4gZ3Vlc3Q/CgpOZWl0aGVyLiBCYXJlIG1ldGFsIGtlcm5lbCAtIG5vIFhlbiBhdCBhbGwuCgo+
IENvdWxkIHlvdSB0cnkgdGhpcyB3aXRoIGAwMTExYCBpbnN0ZWFkPwoKV29ya3MuICcxMDAwJyBj
cmFzaGVzIGFnYWluLiBOb3cgaXQgaXMgY2xlYXIgdGhhdCA3IGlzIHRoZSBtYXhpbXVtIApXaW5k
b3dzIGFjY2VwdHMuCgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
