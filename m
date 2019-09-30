Return-Path: <SRS0=D6zB=XZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12754C32792
	for <xen-devel@archiver.kernel.org>; Mon, 30 Sep 2019 16:51:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6CC9215EA
	for <xen-devel@archiver.kernel.org>; Mon, 30 Sep 2019 16:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6CC9215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEyss-0000RZ-RF; Mon, 30 Sep 2019 16:50:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/AJ=XZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEysr-0000RP-NK
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 16:50:49 +0000
X-Inumbo-ID: 735a8f2c-e3a2-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 735a8f2c-e3a2-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 16:50:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDD2B1000;
 Mon, 30 Sep 2019 09:50:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 384343F534;
 Mon, 30 Sep 2019 09:50:46 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190930164502.408-1-julien.grall@arm.com>
 <83f709aee54f4fe58640e7ca7e6dddbe@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dbb320af-8370-8ea0-4cd9-39c591b690d0@arm.com>
Date: Mon, 30 Sep 2019 17:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <83f709aee54f4fe58640e7ca7e6dddbe@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Update my e-mail in MAINTAINERS
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "julien@xen.org" <julien@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMC8wOS8yMDE5IDE3OjQ4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlz
dHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKdWxpZW4gR3JhbGwKPj4gU2VudDogMzAg
U2VwdGVtYmVyIDIwMTkgMTc6NDUKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+PiBDYzogamdyb3NzQHN1c2UuY29tOyBqdWxpZW5AeGVuLm9yZzsgSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT47IFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tCj4+IFN1Ympl
Y3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gVXBkYXRlIG15IGUtbWFpbCBpbiBNQUlOVEFJTkVSUwo+
Pgo+PiBJIHdpbGwgc29vbiBsb3NlIGFjY2VzcyB0byBteSBBcm0gZS1tYWlsIGFkZHJlc3MuIFVw
ZGF0ZSBpdCB0bwo+PiBqdWxpZW5AeGVuLm9yZwo+IAo+IGp1bGllbkB4ZW4ub3JnLCBvciBqdWxp
ZW4uZ3JhbGxAeGVuLm9yZz8KCkRvaCwganVsaWVuQHhlbi5vcmcuIEkgd2lsbCByZXNlbmQgaXQu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
