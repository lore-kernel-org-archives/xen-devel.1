Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A99C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:18:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402FB2084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402FB2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDsVM-00005W-3s; Tue, 09 Apr 2019 15:17:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDsVK-00005R-4m
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:17:42 +0000
X-Inumbo-ID: 9d74f72d-5ada-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9d74f72d-5ada-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 15:17:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 09:17:39 -0600
Message-Id: <5CACB7900200007800225F17@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 09:17:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
 <08968726-0f4a-f267-b1f7-c1e08893c5a6@citrix.com>
In-Reply-To: <08968726-0f4a-f267-b1f7-c1e08893c5a6@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] timers: limit heap size
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409151736.D3cwbKURrQI9PgQQdwknO9P7b0aCnGNQLKXQigGp1uQ@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE1OjM4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDkvMDQvMjAxOSAxNDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC00NjMs
OSArNDYzLDE0IEBAIHN0YXRpYyB2b2lkIHRpbWVyX3NvZnRpcnFfYWN0aW9uKHZvaWQpCj4+ICAg
ICAgaWYgKCB1bmxpa2VseSh0cy0+bGlzdCAhPSBOVUxMKSApCj4+ICAgICAgewo+PiAgICAgICAg
ICAvKiBvbGRfbGltaXQgPT0gKDJebiktMTsgbmV3X2xpbWl0ID09ICgyXihuKzQpKS0xICovCj4+
IC0gICAgICAgIGludCBvbGRfbGltaXQgPSBoZWFwX21ldGFkYXRhKGhlYXApLT5saW1pdDsKPj4g
LSAgICAgICAgaW50IG5ld19saW1pdCA9ICgob2xkX2xpbWl0ICsgMSkgPDwgNCkgLSAxOwo+PiAt
ICAgICAgICBzdHJ1Y3QgdGltZXIgKipuZXdoZWFwID0geG1hbGxvY19hcnJheShzdHJ1Y3QgdGlt
ZXIgKiwgbmV3X2xpbWl0ICsgCj4gMSk7Cj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBvbGRfbGlt
aXQgPSBoZWFwX21ldGFkYXRhKGhlYXApLT5saW1pdDsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50
IG5ld19saW1pdCA9ICgob2xkX2xpbWl0ICsgMSkgPDwgNCkgLSAxOwo+PiArICAgICAgICBzdHJ1
Y3QgdGltZXIgKipuZXdoZWFwID0gTlVMTDsKPj4gKwo+PiArICAgICAgICAvKiBEb24ndCBncm93
IHRoZSBoZWFwIGJleW9uZCB3aGF0IGlzIHJlcHJlc2VudGFibGUgaW4gaXRzIG1ldGFkYXRhLiAq
Lwo+PiArICAgICAgICBpZiAoIG5ld19saW1pdCA9PSAodHlwZW9mKGhlYXBfbWV0YWRhdGEoaGVh
cCktPmxpbWl0KSluZXdfbGltaXQgJiYKPj4gKyAgICAgICAgICAgICBuZXdfbGltaXQgKyAxICkK
Pj4gKyAgICAgICAgICAgIG5ld2hlYXAgPSB4bWFsbG9jX2FycmF5KHN0cnVjdCB0aW1lciAqLCBu
ZXdfbGltaXQgKyAxKTsKPiAKPiBJdCB3b3VsZCBwcm9iYWJseSBiZSBoZWxwZnVsIHRvIGhhdmUg
YSB3YXJuX29uY2UvcHJpbnRfb25jZSBpbiB0aGUgY2FzZQo+IHRoYXQgd2UgZG8gaGl0IHRoZSBt
ZXRhZGF0YSBsaW1pdAoKSSBjYW4gZG8gdGhpcywgYWxiZWl0IHRoZSBsYWNrIG9mIHRoZSBjb25z
dHJ1Y3RzIHlvdSBzdWdnZXN0IHdpbGwKbWFrZSB0aGlzIGEgbGl0dGxlIHVnbHkuCgo+IFdoYXQg
aXMgdGhlIG5ld19saW1pdCArIDEgZm9yPyAgSXMgaXQgYW4gb3ZlcmZsb3cgY2hlY2s/CgpLaW5k
IG9mOiBJdCBhdm9pZHMgdGhlIHNlY29uZCBhcmd1bWVudCB0byB4bWFsbG9jX2FycmF5KCkgdG8K
ZGVnZW5lcmF0ZS4KCj4gR2l2ZW4gYSkgdGhhdCB3ZSdyZSBub3QgbW92aW5nIGZyb20gdWludDE2
X3Qgd2hpbGUgd2UgaGF2ZSAzMmJpdAo+IGh5cGVydmlzb3IgYnVpbGRzIGluIHVzZSwgYW5kIGIp
IHRoZSBjYWxjdWxhdGlvbiBvZiBuZXdfbGltaXQgd2lsbAo+IHRydW5jYXRlIGJlZm9yZSBnZXR0
aW5nIGludG8gYSBwb3NpdGlvbiB3aGVyZSB0aGlzIG92ZXJmbG93IGNoZWNrIHdvdWxkCj4gdHJp
cCwgSSBkb24ndCB0aGluayBpdCBpcyBoZWxwZnVsIHRvIHJldGFpbi4KCkJ1dCB0aGF0J3Mgd2hh
dCBJJ20gKHRyeWluZyB0bykgc3RhdGUoaW5nKSBpbiB0aGUgZGVzY3JpcHRpb246Ck1ha2luZyB0
aGUgc2l6ZSBoYWxmIGEgcG9pbnRlcidzIHdpZHRoIGlzIHN1cmVseSBhbiBvcHRpb24sIHdoaWNo
CndvdWxkIG1ha2UgaXQgMzIgYml0cyBvbiA2NC1iaXQgYnVpbGRzIChhbmQgcmVzdWx0IGluIGJl
dHRlciBjb2RlCnRvIGJlIGdlbmVyYXRlZCBvbiB4ODYpLiBGcm9tIGEgc2l6ZS9saW1pdCBmaWVs
ZCB3aWR0aCdzCnBlcnNwZWN0aXZlIHRoZSBjaGFuZ2VzIGRvbmUgaGVyZSB3b3VsZCBiZSBzdWZm
aWNpZW50LiBUaGUgbGVmdApzaGlmdGluZyBpbiBkb3duX2hlYXAoKSB3b3VsZCBzdGlsbCBuZWVk
IHRha2luZyBjYXJlIG9mIGlmIHdlIHJlYWxseQp3ZXJlIHRvIGdvIHRoYXQgcm91dGUuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
