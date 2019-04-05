Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA965C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 11:30:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA9D2186A
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 11:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFA9D2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCN2k-0000jP-Aw; Fri, 05 Apr 2019 11:29:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCN2j-0000jK-MT
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 11:29:57 +0000
X-Inumbo-ID: 221552fc-5796-11e9-a3d1-fff88b5fcb98
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 221552fc-5796-11e9-a3d1-fff88b5fcb98;
 Fri, 05 Apr 2019 11:29:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 05:29:53 -0600
Message-Id: <5CA73C2E0200007800224D98@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 05:29:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Kevin Tian" <kevin.tian@intel.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
In-Reply-To: <20190314135125.1958-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405112950.EgY6kZCmXE5nWNC-tVgUCtHuIWjnsQsboNsasgYDdAM@z>

Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjUxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFNhdmluZyBhbmQgcmVzdG9yaW5nIHRoZSB2YWx1ZSBvZiB0aGlzIE1TUiBpcyBjdXJyZW50
bHkgaGFuZGxlZCBieQo+IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBi
ZWluZyBhcmNoaXRlY3R1cmFsLiBUaGlzIHBhdGNoCj4gbW92ZXMgaGFuZGxpbmcgb2YgYWNjZXNz
ZXMgdG8gdGhpcyBNU1IgZnJvbSBodm0uYyBpbnRvIHRoZSBtc3IuYywgdGh1cwo+IGFsbG93aW5n
IHRoZSBjb21tb24gTVNSIHNhdmUvcmVzdG9yZSBjb2RlIHRvIGhhbmRsZSBpdC4KPiAKPiBOT1RF
OiBCZWNhdXNlIHZteF9nZXQvc2V0X2d1ZXN0X2JuZGNmZ3MoKSBjYWxsIHZteF92bWNzX2VudGVy
KCksIHRoZQo+ICAgICAgIHN0cnVjdCB2Y3B1IHBvaW50ZXIgcGFzc2VkIGluLCBhbmQgaGVuY2Ug
dGhlIHZjcHUgcG9pbnRlciBwYXNzZWQgdG8KPiAgICAgICBndWVzdF9yZG1zcigpIGNhbm5vdCBi
ZSBjb25zdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgo+IC0tLQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4K
PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgo+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IENjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4gCj4gdjQ6Cj4gIC0g
Q29zbWV0aWMgcmUtYXJyYW5nZW1lbnRzIGFuZCBhbiBhZGRpdGlvbmFsIEFTU0VSVCByZXF1ZXN0
ZWQgYnkgSmFuCj4gCj4gdjM6Cj4gIC0gQWRkcmVzcyBmdXJ0aGVyIGNvbW1lbnRzIGZyb20gSmFu
Cj4gIC0gRHJvcHBlZCBLZXZpbidzIFItYiBiZWNhdXNlIG9mIGNoYW5nZSB0byB2bXguYwoKS2V2
aW4sCgp5b3UgbWF5IG5vdCBoYXZlIG5vdGljZWQgdGhlIGFib3ZlLgoKVGhhbmtzLCBKYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
