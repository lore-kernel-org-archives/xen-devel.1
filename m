Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247D5C43603
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 16:11:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0016A2073B
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 16:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0016A2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifR3m-0003hn-If; Thu, 12 Dec 2019 16:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifR3l-0003hc-2t
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 16:11:25 +0000
X-Inumbo-ID: 05f95bd4-1cfa-11ea-a1e1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05f95bd4-1cfa-11ea-a1e1-bc764e2007e4;
 Thu, 12 Dec 2019 16:11:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17522AB71;
 Thu, 12 Dec 2019 16:11:15 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-144726-mainreport@xen.org>
 <24050.24437.97024.719788@mariner.uk.xensource.com>
 <6ae910a6-933b-0b6a-6371-7cc6a09097b3@suse.com>
 <90371b30-7f3b-eec8-b93b-833d7f591780@suse.com>
 <24050.25716.339742.836725@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb726ace-69c4-4332-81cb-4cb41a8e4ec9@suse.com>
Date: Thu, 12 Dec 2019 17:11:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24050.25716.339742.836725@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.8-testing test] 144726: regressions -
 trouble: fail/pass/starved [and 1 more messages]
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxNzowMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2ggd3Jp
dGVzICgiUmU6IFt4ZW4tNC44LXRlc3RpbmcgdGVzdF0gMTQ0NzI2OiByZWdyZXNzaW9ucyAtIHRy
b3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4+IE9uIDEyLjEyLjIwMTkgMTY6NDAsIElhbiBK
YWNrc29uIHdyb3RlOgo+Pj4gRnJvbSBKdWVyZ2VuIEkgd291bGQgbGlrZSBhIHJlbGVhc2UtYWNr
IGZvciB0aGUgb3NzdGVzdCBjb21taXQgdG8KPj4+ICJhbGxvdyIgaXQgZm9yIHRoZSBmdXR1cmUu
Cj4+Cj4+IElzIHRoaXMgcmVhbGx5IHdvcnRoIGl0PyBUaGUgNC44IHRyZWUgaXMgZGVhZCBub3c7
IHN0cmljdGx5IHNwZWFraW5nCj4+IGV2ZW4gdGhlIGxhc3QgYmF0Y2ggb2YgWFNBcyBzaG91bGRu
J3QgaGF2ZSBnb25lIHRoZXJlIGFueW1vcmUsIGJ1dAo+PiB3ZSBkaWQgc28gdG8gYmUgZnJpZW5k
bHkgdG8gY2VydGFpbiBkaXN0cm9zLCBhcyBpdCB3YXMganVzdCBiYXJlbHkKPj4gcGFzdCB0aGUg
ZXhwaXJ5IGRhdGUuCj4gCj4gVGhpcyBpcyBwYXR0ZXJuIGxpa2VseSB0byBvY2N1ciBhZ2FpbiBp
biB0aGUgZnV0dXJlIHdpdGggbmV3ZXIKPiB1bnN1cHBvcnRlZCBidXQgc2VjdXJpdHktc3VwcG9y
dGVkIGJyYW5jaGVzLgo+IAo+IEhhdmluZyBnb25lIHRvIHRoZSB0cm91YmxlIG9mIGZpZ3VyaW5n
IG91dCB3aGF0IGlzIGdvaW5nIG9uIEkgdGhvdWdodAo+IEkgd291bGQgd3JpdGUgaXQgdXAgYW5k
IHByb2R1Y2UgYSBjb21taXQgaW4gb3NzdGVzdC5naXQgdGhhdCBzZXJ2ZXMgYXMKPiBhbiBleGFt
cGxlIG9mIGhvdyB0byBmaXggaXQuCgpNYWtlcyBzZW5zZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
