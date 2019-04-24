Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A07CC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:29:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C702089F
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4C702089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJpT-0007jg-Ar; Wed, 24 Apr 2019 15:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJJpS-0007jb-4Y
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:28:58 +0000
X-Inumbo-ID: acbc5d4c-66a5-11e9-8d8b-c3af5f43542a
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id acbc5d4c-66a5-11e9-8d8b-c3af5f43542a;
 Wed, 24 Apr 2019 15:28:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4309F374;
 Wed, 24 Apr 2019 08:28:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288DF3F557;
 Wed, 24 Apr 2019 08:28:53 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Wei Liu <wei.liu2@citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
 <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
 <20190418114627.GC30543@zion.uk.xensource.com>
 <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
Message-ID: <465a455c-d809-2dc1-8e28-ed0ddb3bc7f2@arm.com>
Date: Wed, 24 Apr 2019 16:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20539440-8014-cd4d-3c95-e88b53bcce32@arm.com>
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
Message-ID: <20190424152852.DqNABxO2m_PizmkfQ3mwwrszykSHkhPqzJDnr_JOLIM@z>

SGksCgpASWFuLCBAV2VpOiBHZW50bGUgcGluZy4KCk9uIDE4LzA0LzIwMTkgMTY6MDksIEp1bGll
biBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBPbiAxOC8wNC8yMDE5IDEyOjQ2LCBXZWkgTGl1IHdy
b3RlOgo+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAwNjo0Mjo0N1BNICswMTAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBAV2VpLCBASWFuOiBEbyB5b3UgaGF2ZSBhbnkg
aW5wdXQ/Cj4+Cj4+IFNvcnJ5IEkgaGF2ZW4ndCBiZWVuIGZvbGxvd2luZyB0aGlzIGNsb3NlbHks
IGJ1dCBzaG91bGRuJ3Qgd2UgZml4IHRoZQo+PiBpbnRlcmZhY2UgdG8gcmV0dXJuIGdmbiBpbnN0
ZWFkPyBBbmQgdGhlbiB0aGUgbWFwcGluZyBvZiBpdCBzaG91bGQKPj4gaW50ZXJwcmV0IHRoZSB2
YWx1ZSBwcm9wZXJseSBwZXIgZ3Vlc3QgdHlwZS4KPiAKPiBXZSBhbHJlYWR5IHJldHVybiBhIEdG
TiB0b2RheS4gVGhlIHByb2JsZW0gaXMgd2Ugb25seSBob2xkIGFuIE1GTiBhdCB0aGF0IHRpbWUu
Cj4gCj4gQXQgdGhlIG1vbWVudCwgd2UgcmVseSBvbiB0aGUgTTJQIHRvIGZpbmQgdGhlIGNvcnJl
c3BvbmRpbmcgR0ZOLiBBcyB3ZSBkb24ndCAKPiBoYXZlIGFuIE0yUCBvbiBBcm0sIHdlIHdvdWxk
IGhhdmUgdG8gc3RvcmUgdGhlIGFzc29jaWF0ZWQgR0ZOLgo+IAo+IEJ1dCBhbGwgdGhpcyBsb2dp
YyBpcyBhIGJpdCBicm9rZW4uIEl0IHJlbGllcyBvbiB0aGUgdG9vbHN0YWNrIChvciB0aGUgZ3Vl
c3QpIHRvIAo+IGhhdmUgbWFwcGVkIHRoZSBzaGFyZWQgaW5mbyBmcmFtZSBpbiB0aGUgUDJNIHVz
aW5nIHRoZSBwaHlzbWFwIGh5cGVydmlzb3Igd2l0aCAKPiBYRU5NQVBTUEFDRV9zaGFyZWRfaW5m
byBiZWZvcmVoYW5kLiBUaGlzIGlzIGFsc28gcmFjeSBhcyB5b3UgbWF5IHJldHVybiBhIEdGTiAK
PiB0aGF0IHdhcyB1bm1hcHBlZC9yZW1hcHBlZCB0byBzb21ldGhpbmcgZWxzZSBiZWZvcmUgdGhl
IHRvb2xzdGFjayBoYXMgYSBjaGFuY2UgCj4gdG8gbWFwIGluIGl0cyBhZGRyZXNzIHNwYWNlIHRo
ZSBwYWdlLgo+IAo+IFRoZSBjb3JyZWN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHBoYXNlIG91dCB0
aGUgZmllbGQgc2hhcmVkX2luZm9fZnJhbWUgYW5kIHVzZSAKPiBYRU5NRU1fYWNxdWlyZV9yZXNv
dXJjZSBpbnN0ZWFkLiBIb3dldmVyLCB0aGlzIHJlcXVpcmVzIHRoZSBhc3NvY2lhdGVkIGlvY3Rs
IHRvIAo+IGJlIGltcGxlbWVudGVkIGluIExpbnV4Lgo+IAo+Pgo+PiBJIGRvbid0IHNlZSBpbW1l
ZGlhdGVseSBob3cgdXNlciBzcGFjZSBwcm9ncmFtIHdpbGwgbmVlZCB0byBhY2Nlc3MgdGhpcwo+
PiBwYWdlIGZvciBhdXRvdHJhbnNsYXRlZCBndWVzdHMgdGhvdWdoLgo+IAo+IElmIHRoZXJlIGFy
ZSBubyB1c2UsIHRoZW4gSSBhbSBub3QgY29udmluY2VkIGl0IGlzIHdvcnRoIHRyeWluZyB0byBt
YWtlIAo+IHNoYXJlZF9pbmZvX2ZyYW1lIHdvcmtpbmcgb24gQXJtLgo+IAo+IENoZWVycywKPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
