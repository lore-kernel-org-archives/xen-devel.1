Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B19C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:43:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2DF2073F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2DF2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGoaD-0002wO-Q4; Wed, 17 Apr 2019 17:42:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGoaC-0002wJ-67
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:42:52 +0000
X-Inumbo-ID: 38d3430e-6138-11e9-89a9-1ff9a092cb45
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 38d3430e-6138-11e9-89a9-1ff9a092cb45;
 Wed, 17 Apr 2019 17:42:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF43615AB;
 Wed, 17 Apr 2019 10:42:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D35CD3F59C;
 Wed, 17 Apr 2019 10:42:48 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
Date: Wed, 17 Apr 2019 18:42:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417174247.qUHaR0izRKF5sShl0eVfoWTqzH4SJjmdMQZDIGfzmZs@z>

SGksCgpAV2VpLCBASWFuOiBEbyB5b3UgaGF2ZSBhbnkgaW5wdXQ/CgpPbiAxNC8wMy8yMDE5IDA3
OjU1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMy4wMy4xOSBhdCAxODozMCwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTMvMDMvMjAxOSAxNToyMCwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAxMjozNSwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCj4+Pj4gKysrIGIveGVu
L2NvbW1vbi9kb21jdGwuYwo+Pj4+IEBAIC0yMDUsNyArMjA1LDcgQEAgdm9pZCBnZXRkb21haW5p
bmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdAo+PiB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8g
KmluZm8pCj4+Pj4gICAgICAgIGluZm8tPm91dHN0YW5kaW5nX3BhZ2VzID0gZC0+b3V0c3RhbmRp
bmdfcGFnZXM7Cj4+Pj4gICAgICAgIGluZm8tPnNocl9wYWdlcyAgICAgICAgID0gYXRvbWljX3Jl
YWQoJmQtPnNocl9wYWdlcyk7Cj4+Pj4gICAgICAgIGluZm8tPnBhZ2VkX3BhZ2VzICAgICAgID0g
YXRvbWljX3JlYWQoJmQtPnBhZ2VkX3BhZ2VzKTsKPj4+PiAtICAgIGluZm8tPnNoYXJlZF9pbmZv
X2ZyYW1lID0gbWZuX3RvX2dtZm4oZCwgdmlydF90b19tZm4oZC0+c2hhcmVkX2luZm8pKTsKPj4+
PiArICAgIGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1lID0gZ2ZuX3goZG9tYWluX3NoYXJlZF9pbmZv
X2dmbihkKSk7Cj4+Pgo+Pj4gSSB0aGluayB0aGlzIGNoYW5nZSB3YW50cyB0byBiZSBhY2NvbXBh
bmllZCBieSBhIHdhcm5pbmcgYXR0YWNoZWQKPj4+IHRvIHRoZSBmaWVsZCBkZWNsYXJhdGlvbiBp
biB0aGUgcHVibGljIGhlYWRlci4KPj4KPj4gTWFrZSBzZW5zZS4KPj4KPj4+Cj4+PiBCdXQgSSdk
IGFsc28gbGlrZSB0byBoYXZlIHRoZSB0b29sIHN0YWNrIG1haW50YWluZXJzJyB2aWV3IG9uIG1h
a2luZwo+Pj4gdGhpcyBmaWVsZCBlZmZlY3RpdmVseSB1bnVzYWJsZSBmb3IgQXJtLgo+Pgo+PiBU
aGUgdmFsdWUgaW4gc2hhcmVkX2luZm9fZnJhbWUgd2FzIHBsYWluIHdyb25nIHNpbmNlIHRoZSBj
cmVhdGlvbiBvZiBYZW4gQXJtLiBTbwo+PiB0aGlzIGlzIGp1c3QgbWFraW5nIHRoZSBlcnJvciBt
b3JlIG9idmlvdXMuIEkgZG9uJ3QgZXhwZWN0IGFueSB1c2VyIG9mIGl0IG9uIEFybS4KPiAKPiBX
ZWxsLCBteSByZXF1ZXN0IGZvciB0b29sIHN0YWNrIG1haW50YWluZXIgaW5wdXQgd2Fzbid0IHRv
IHB1dCB1bmRlcgo+IHF1ZXN0aW9uIHRoYXQgdGhlIGZpZWxkIGNhbid0IGN1cnJlbnRseSBiZSB1
c2VkIHNlbnNpYmx5IG9uIEFybS4KPiBJbnN0ZWFkIEknbSBtZWFuaW5nIHRvIGtub3cgd2hldGhl
ciBpdCBjYW4gYmUgc2Vuc2libHkgZXhwZWN0ZWQKPiBmb3IgdGhlIHRvb2wgc3RhY2sgdG8gd2Fu
dCB0byB1c2UgdGhlIGZpZWxkIHVuaWZvcm1seSwgaW4gd2hpY2ggY2FzZQo+IHJhdGhlciB0aGFu
IG1ha2luZyBpdCBtb3JlIG9idmlvdXNseSBub3Qgd29yayBpdCBzaG91bGQgYmUgZml4ZWQKPiBp
bnN0ZWFkLgo+IAo+IEphbgo+IAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
