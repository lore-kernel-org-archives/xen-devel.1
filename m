Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5E5C04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:42:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B8D20882
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29B8D20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5mm-0005xe-Fs; Fri, 10 May 2019 13:42:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5ml-0005wT-DI
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:42:03 +0000
X-Inumbo-ID: 63b1a615-7329-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 63b1a615-7329-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:42:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D3D2A78;
 Fri, 10 May 2019 06:42:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50A3A3F575;
 Fri, 10 May 2019 06:42:00 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
 <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
 <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fac9e2db-c746-5f53-bebc-0615fe60e8a4@arm.com>
Date: Fri, 10 May 2019 14:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510134158.wKwyA-O_X6zC6cbaGURDoA_brQdtmqeimXhShtkd9Do@z>

T24gMTAvMDUvMjAxOSAxNDozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDUuMTkg
YXQgMTU6MjcsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDEwLzA1LzIwMTkg
MTM6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDcuMDUuMTkgYXQgMTc6MTQsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRf
Z3Bmbl9mcm9tX21mbih1bnNpZ25lZCBsb25nIG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pCj4+Pj4g
K3sKPj4+PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSBwYWdlX2dldF9vd25lcihtZm5fdG9fcGFn
ZShfbWZuKG1mbikpKTsKPj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZW50cnkgPSAoZCAmJiAoZCA9
PSBkb21fY293KSkgPyBTSEFSRURfTTJQX0VOVFJZIDogcGZuOwo+Pj4KPj4+IFRoZSAmJiBoZXJl
IGxvb2tzLCBlaG0sIGZ1bm55LCBidXQgSSBndWVzcyBpdCdzIG5lZWRlZCBmb3IgZWFybHkgYm9v
dD8KPj4KPj4gSSBoYXZlIG5vIGlkZWEsIHRoaXMgaXMgeDg2IG5vdCBBcm0uLi4KPj4KPj4+IEJ1
dCB0aGF0J3MgcGVyaGFwcyBhIHNlcGFyYXRlIHRoaW5nIHRvIGNsZWFuIHVwLiBIb3dldmVyLCBs
b29raW5nIGF0Cj4+PiB0aGlzIC0gd2h5IGlzIEFybSBzZXR0aW5nIHVwIGRvbV9jb3cgaW4gdGhl
IGZpcnN0IHBsYWNlPwo+Pgo+PiBDb21tb24gY29kZSBpcyB1c2luZyBkb21fY293LCBzbyBJIGRv
bid0IHRoaW5rIHdlIHdhbnQgaXQgdG8gYmUgTlVMTCBvbiBBcm0gdG8KPj4gYXZvaWQgd2VpcmQg
aXNzdWVzLgo+IAo+IEkgZGlkbid0IG1lYW4gaXQgdG8gcmVtYWluIE5VTEwuIENvbW1vbiBjb2Rl
IGRvZXNuJ3QgZGVyZWZlcmVuY2UgaXQKPiAoYW5kIGlzbid0IHN1cHBvc2VkIHRvKSwgc28gSSdk
IGNvbnNpZGVyIGluaXRpYWxpemluZyBpdCB0byBzb21lIGtub3duCj4gZmF1bHRpbmcgbm9uLU5V
TEwgYWRkcmVzcywgaWYgdGhlcmUgaXMgc3VjaCBvbiBBcm0uCgpQYXRjaGVzIGFyZSB3ZWxjb21l
ZCA7KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
