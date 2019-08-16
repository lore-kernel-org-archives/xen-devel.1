Return-Path: <SRS0=neah=WM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF6CC3A59C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Aug 2019 16:35:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6D120665
	for <xen-devel@archiver.kernel.org>; Fri, 16 Aug 2019 16:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC6D120665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyfBj-00013Z-Qr; Fri, 16 Aug 2019 16:34:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyfBj-00013S-A6
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:34:51 +0000
X-Inumbo-ID: c38b1d40-c043-11e9-8bb8-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c38b1d40-c043-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 16:34:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB4B28;
 Fri, 16 Aug 2019 09:34:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CCC63F694;
 Fri, 16 Aug 2019 09:34:48 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190815173258.20752-1-julien.grall@arm.com>
 <87y2ztf4v0.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5763512a-f2bd-845c-f4ba-3219323ae72d@arm.com>
Date: Fri, 16 Aug 2019 17:34:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y2ztf4v0.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct
 domain in initrd_load()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi8wOC8yMDE5IDE3OjMyLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBpbml0cmRfbG9hZCgpIGNhbiBiZSBjYWxsZWQgYnkgb3Ro
ZXIgZG9tYWluIHRoYW4gZG9tMC4gVG8gYXZvaWQKPj4gY29uZnVzaW9uIGluIHRoZSBsb2csIHBy
aW50IHRoZSBjb3JyZWN0IGRvbWFpbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsg
PHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgo+IAo+IEJ1dCB3aHkgZGlkbid0IHlvdSBnYXRo
ZXJlZCBhbGwgdGhvc2UgcGF0Y2hlcyBpbnRvIG9uZSBwYXRjaCBzZXJpZXM/CgpCZWNhdXNlIEkg
Y291bGRuJ3QgYmUgYm90aGVyZWQgdG8gd3JpdGUgYSBjb3ZlciBsZXR0ZXIgZm9yIGl0IGFuZAp0
aGV5IGRvbid0IGRlcGVuZCBvbiBlYWNoIG90aGVyLi4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
