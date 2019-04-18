Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21248C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 15:09:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E319B205F4
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 15:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E319B205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH8fH-0002jf-Nh; Thu, 18 Apr 2019 15:09:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z9nG=SU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hH8fH-0002jY-2d
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 15:09:27 +0000
X-Inumbo-ID: f4184ea9-61eb-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f4184ea9-61eb-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 15:09:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E00515AB;
 Thu, 18 Apr 2019 08:09:25 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AC223F5AF;
 Thu, 18 Apr 2019 08:09:22 -0700 (PDT)
To: Wei Liu <wei.liu2@citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
 <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
 <20190418114627.GC30543@zion.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
Date: Thu, 18 Apr 2019 16:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418114627.GC30543@zion.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418150921.2_NHJp80lPt3uqjF_tNc68vhuxAOHwcC-EAgHM-HdnM@z>

SGksCgpPbiAxOC8wNC8yMDE5IDEyOjQ2LCBXZWkgTGl1IHdyb3RlOgo+IE9uIFdlZCwgQXByIDE3
LCAyMDE5IGF0IDA2OjQyOjQ3UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+
Cj4+IEBXZWksIEBJYW46IERvIHlvdSBoYXZlIGFueSBpbnB1dD8KPiAKPiBTb3JyeSBJIGhhdmVu
J3QgYmVlbiBmb2xsb3dpbmcgdGhpcyBjbG9zZWx5LCBidXQgc2hvdWxkbid0IHdlIGZpeCB0aGUK
PiBpbnRlcmZhY2UgdG8gcmV0dXJuIGdmbiBpbnN0ZWFkPyBBbmQgdGhlbiB0aGUgbWFwcGluZyBv
ZiBpdCBzaG91bGQKPiBpbnRlcnByZXQgdGhlIHZhbHVlIHByb3Blcmx5IHBlciBndWVzdCB0eXBl
LgoKV2UgYWxyZWFkeSByZXR1cm4gYSBHRk4gdG9kYXkuIFRoZSBwcm9ibGVtIGlzIHdlIG9ubHkg
aG9sZCBhbiBNRk4gYXQgdGhhdCB0aW1lLgoKQXQgdGhlIG1vbWVudCwgd2UgcmVseSBvbiB0aGUg
TTJQIHRvIGZpbmQgdGhlIGNvcnJlc3BvbmRpbmcgR0ZOLiBBcyB3ZSBkb24ndCAKaGF2ZSBhbiBN
MlAgb24gQXJtLCB3ZSB3b3VsZCBoYXZlIHRvIHN0b3JlIHRoZSBhc3NvY2lhdGVkIEdGTi4KCkJ1
dCBhbGwgdGhpcyBsb2dpYyBpcyBhIGJpdCBicm9rZW4uIEl0IHJlbGllcyBvbiB0aGUgdG9vbHN0
YWNrIChvciB0aGUgZ3Vlc3QpIHRvIApoYXZlIG1hcHBlZCB0aGUgc2hhcmVkIGluZm8gZnJhbWUg
aW4gdGhlIFAyTSB1c2luZyB0aGUgcGh5c21hcCBoeXBlcnZpc29yIHdpdGggClhFTk1BUFNQQUNF
X3NoYXJlZF9pbmZvIGJlZm9yZWhhbmQuIFRoaXMgaXMgYWxzbyByYWN5IGFzIHlvdSBtYXkgcmV0
dXJuIGEgR0ZOIAp0aGF0IHdhcyB1bm1hcHBlZC9yZW1hcHBlZCB0byBzb21ldGhpbmcgZWxzZSBi
ZWZvcmUgdGhlIHRvb2xzdGFjayBoYXMgYSBjaGFuY2UgCnRvIG1hcCBpbiBpdHMgYWRkcmVzcyBz
cGFjZSB0aGUgcGFnZS4KClRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHBoYXNlIG91
dCB0aGUgZmllbGQgc2hhcmVkX2luZm9fZnJhbWUgYW5kIHVzZSAKWEVOTUVNX2FjcXVpcmVfcmVz
b3VyY2UgaW5zdGVhZC4gSG93ZXZlciwgdGhpcyByZXF1aXJlcyB0aGUgYXNzb2NpYXRlZCBpb2N0
bCB0byAKYmUgaW1wbGVtZW50ZWQgaW4gTGludXguCgo+IAo+IEkgZG9uJ3Qgc2VlIGltbWVkaWF0
ZWx5IGhvdyB1c2VyIHNwYWNlIHByb2dyYW0gd2lsbCBuZWVkIHRvIGFjY2VzcyB0aGlzCj4gcGFn
ZSBmb3IgYXV0b3RyYW5zbGF0ZWQgZ3Vlc3RzIHRob3VnaC4KCklmIHRoZXJlIGFyZSBubyB1c2Us
IHRoZW4gSSBhbSBub3QgY29udmluY2VkIGl0IGlzIHdvcnRoIHRyeWluZyB0byBtYWtlIApzaGFy
ZWRfaW5mb19mcmFtZSB3b3JraW5nIG9uIEFybS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
