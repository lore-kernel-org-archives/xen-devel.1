Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F67FC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:07:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B9C206BA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9B9C206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJe5r-0004lU-2k; Thu, 25 Apr 2019 13:07:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJe5p-0004lP-9i
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:07:13 +0000
X-Inumbo-ID: 084c206a-675b-11e9-8b84-2b7900e5618b
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 084c206a-675b-11e9-8b84-2b7900e5618b;
 Thu, 25 Apr 2019 13:07:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549929600"; d="scan'208";a="89282271"
To: <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
 <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
 <5CC186320200007800228F32@prv1-mh.provo.novell.com>
 <5cfd3ea1-b25d-ec0b-1278-d4fdb28486be@bitdefender.com>
 <b91bc68b-85fc-a5b8-7b40-126a0c6e463f@citrix.com>
 <5CC1AF130200007800229100@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0254d10c-0208-33a1-1dcb-1084c6626cf5@citrix.com>
Date: Thu, 25 Apr 2019 14:05:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1AF130200007800229100@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425130536.8xANqiLp8AXMaS9GMLDs8b8vVqAo6wYyzEjgDv0FZzU@z>

T24gMjUvMDQvMjAxOSAxMzo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDQuMTkg
YXQgMTQ6NTMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjUvMDQv
MjAxOSAxMzoxNywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+Pj4gT24gNC8yNS8xOSAxOjA0IFBN
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAxNS4wNC4xOSBhdCAxNjoxMCwgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4+PiBPbiA0LzE1LzE5IDU6MDQgUE0sIE1h
dHQgTGVpbmhvcyB3cm90ZToKPj4+Pj4+IFlvdSBhcmUgY29ycmVjdCAtLSBjaGVycnkgcGlja2lu
ZyB0aGF0IGNvbW1pdCBpbnRvIFJFTEVBU0UtNC4xMS4xIAo+Pj4+Pj4gYWRkcmVzc2VzIHRoZSBj
cmFzaC4gVGhlIHByb2JsZW0gY2Fubm90IGJlIHJlcHJvZHVjZWQgb24gNC4xMi4KPj4+Pj4+Cj4+
Pj4+PiBJIGhvcGUgdGhpcyBoZWxwcy4KPj4+Pj4gVGhhbmsgeW91IGZvciBjb25maXJtaW5nIHRo
ZSBmaXghCj4+Pj4+Cj4+Pj4+IFRvIHRoZSBkZWNpZGVyczogd291bGQgaXQgYmUgcmVhc29uYWJs
ZSB0byBhc2sgcGF0Y2hlcyBsaWtlIHRoaXMgdG8gYmUgCj4+Pj4+IGJhY2twb3J0ZWQgdG8gdGhl
IGZ1dHVyZSA0LjExIHJlbGVhc2U/Cj4+Pj4gV2VsbCwgZmlyc3Qgb2YgYWxsIHlvdSBjYW4gYWx3
YXlzIHNlbmQgYSByZXF1ZXN0LiBBbmQgeWVzLCBpbiBnZW5lcmFsCj4+Pj4gSSdkIGNvbnNpZGVy
IHRoaXMgcmVhc29uYWJsZSwgYnV0IEkgc2F5IHNvIHdpdGhvdXQgaGF2aW5nIGxvb2tlZCBhdAo+
Pj4+IHRoZSBhY3R1YWwgY29tbWl0KHMpIGluIHF1ZXN0aW9uLgo+Pj4gVGhhbmsgeW91IGZvciB0
aGUgYW5zd2VyLiBUaGlzIGlzIHRoZSBjb21taXQgaW4gcXVlc3Rpb246Cj4+Pgo+Pj4KPj4gaHR0
cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD0xZGRk
ZmZmNGMzOWQzZGIxN2RmYTcgCj4+IDA5YjFjNTdmNDRlM2VkMzUyZTM7aHA9Njg0NjU5NDRjODFm
YTJmYmM0MGJmMjllYzYwODQwNzJhZjVlNDhlYwo+Pj4gQUZBSUNUIHRoZXJlJ3Mgbm90aGluZyBj
b250cm92ZXJzaWFsIGFib3V0IGl0LCBhbmQgaXQgc2hvdWxkIGVhc2lseQo+Pj4gYXBwbHkgdG8g
NC4xMSwgc28gaWYgcG9zc2libGUgSSBwcm9wb3NlIHRoYXQgd2UgY29uc2lkZXIgYmFja3BvcnRp
bmcgaXQKPj4+IHRvIHRoZSBuZXh0IDQuMTEgcmVsZWFzZS4KPj4gSSBoYXZlIGEgcmF0aGVyIGxh
cmdlIG51bWJlciBvZiBhbHRwMm0gYmFja3BvcnRzIHRvIFhlbiA0LjExIGluIHRoZQo+PiBYZW5T
ZXJ2ZXIgcGF0Y2hxdWV1ZSwgd2hpY2ggaW4gcHJhY3RpY2UKPiAuLi4gPz8/CgpPb3BzIHNvcnJ5
ICJpbiBwcmFjdGljZSBicmluZ3MgaXQgaW4gbGluZSB3aXRoIFhlbiA0LjEyLiIKCj4KPj4gSXQg
d291bGQgY2VydGFpbmx5IG1ha2UgbXkgbGlmZSBlYXNpZXIgaWYgdGhleSB3ZXJlIHRvIGdvIHVw
c3RyZWFtLiAgSQo+PiBjYW4gcHV0IHRvZ2V0aGVyIGEgYnJhbmNoIGlmIHRoYXQgd291bGQgYmUg
aGVscGZ1bC4KPiBXaGF0IHZvbHVtZSAvIGNvdW50IGFyZSB3ZSB0YWxraW5nIGFib3V0PyBBbnl3
YXksIGlmIGl0J3MgcmVhbGx5Cj4gbW9zdGx5IGFsdHAybSBjb2RlIHRoYXQgZ2V0cyB0b3VjaGVk
LCBJIGRvbid0IG1pbmQsIGFuZCBoYXZpbmcgYQo+IGJyYW5jaCB0byBwdWxsIGZyb20gd291bGQg
YmUgaGVscGZ1bC4KCkxvb2tzIGxpa2UgMjAgZml4ZXMgb3Igc28uCgo+IDQuMTEuMiBpcyBnb2lu
ZyB0byBiZSBkZWxheWVkCj4gYW55d2F5IGF0IGxlYXN0IHVudGlsIHRoZSBtYXN0ZXIgYnJhbmNo
IGFkdmFuY2VzIGFnYWluLCBhcyBJJ3ZlCj4gbWVhbndoaWxlIHF1ZXVlZCB1cCBxdWl0ZSBhIGZl
dyBidWcgZml4ZXMgd2hpY2ggYWxsIHNpdCBiZWhpbmQgdGhlCj4gcHVzaCBnYXRlIHRoZXJlLgoK
TG9va2luZyB0aHJvdWdoIHRoZSBwYXRjaHF1ZXVlLCB0aGVyZSBhcmUgYWxzbyBzb21lIG90aGVy
IGZpeGVzIHdoaWNoCmRlZmluaXRlbHkgcXVhbGlmeS7CoCBHaXZlbiB0aGUgY3VycmVudCBibG9j
a2FnZXMsIEknbGwgd2FpdCB1bnRpbCB0aGluZ3MKYXJlIG9wZW4gYW5kIGZsb3dpbmcgYWdhaW4s
IGFuZCBoaWdobGlnaHQgYW55IGZ1cnRoZXIgZml4ZXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
