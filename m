Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DBDC432C3
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 12:36:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2EF2075E
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 12:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2EF2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWgGI-0004BC-8c; Mon, 18 Nov 2019 12:36:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWgGH-0004B7-2e
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 12:36:09 +0000
X-Inumbo-ID: fe46a4b2-09ff-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe46a4b2-09ff-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 12:36:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30586AC5F;
 Mon, 18 Nov 2019 12:36:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <45f6c5bf-2d24-d3d7-1c61-f8e2da04b5b7@citrix.com>
 <537a13c0-34eb-8687-3e75-6cf6e1f98874@suse.com>
Message-ID: <a3fbe4eb-570c-1a1c-1d21-7fbf06269cc6@suse.com>
Date: Mon, 18 Nov 2019 13:36:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <537a13c0-34eb-8687-3e75-6cf6e1f98874@suse.com>
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxMzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMTEuMjAxOSAx
MjozOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTEvMTUvMTkgNTowNiBQTSwgQW5kcmVh
cyBLaW56bGVyIHdyb3RlOgo+Pj4gSGVsbG8gQWxsLAo+Pj4KPj4+IEkgY29tcGFyZWQgdGhlIENQ
VUlEIGxpc3RpbmdzIGZyb20gUnl6ZW4gMjcwMFggKGF0dGFjaGVkIGFzIHRhci54eikgdG8KPj4+
IDM3MDBYIGFuZCBmb3VuZCBvbmx5IHZlcnkgZmV3IGRpZmZlcmVuY2VzLiBJIGFkZGVkCj4+Pgo+
Pj4gY3B1aWQgPSBbICIweDgwMDAwMDA4OmVjeD14eHh4eHh4eHh4eHh4eHh4MDEwMHh4eHh4eHh4
eHh4eCIgXQo+Pj4KPj4+IHRvIHhsLmNmZyBhbmQgdGhlbiBXaW5kb3dzIHJ1bnMgZ3JlYXQgd2l0
aCAxNiB2Q1BVcy4gQ2luZWJlbmNoIFIxNSBzY29yZQo+Pj4gaXMgPjIwNTAgd2hpY2ggaXMgbW9y
ZSBvciBsZXNzIHRoZSBiYXJlIG1ldGFsIHZhbHVlLgo+Pgo+PiBTbyB0aGlzIGlzIHNldHRpbmcg
dGhvc2UgYml0cyB0byAwMTAwLCBvciA0LiAgV2hhdCBpcyBpdCBvbiB0aGUgMzcwMFggaWYKPj4g
eW91IGRvbid0IGNoYW5nZSBpdCBoZXJlPwo+IAo+IEFjY29yZGluZyB0byB0aGUgQ1BVSUQgb3V0
cHV0IEFuZHJlYXMgaGFkIHNlbnQgaXQncyA0LiBUaGUKPiBjdXJyZW50IG1hc3NhZ2luZyBpbiBs
aWJ4YyAod2hpY2ggeW91ciBwYXRjaCB3b3VsZCBjb25kaXRpb25hbGx5Cj4gc3VwcHJlc3MpIHdv
dWxkIGRvdWJsZSB0aGlzIHRvIDggYWZhaWN0LgoKT3VjaCwgbm8gLSBpdCB3b3VsZCBpbmNyZW1l
bnQgaXQgKHRvIDUpLCBub3QgZG91YmxlIGl0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
