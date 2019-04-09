Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108B2C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:22:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6E420857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6E420857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDplz-0008AF-Ay; Tue, 09 Apr 2019 12:22:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDplx-00089Q-8z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:41 +0000
X-Inumbo-ID: 2ab111e6-5ac2-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ab111e6-5ac2-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:22:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100258"
Date: Tue, 9 Apr 2019 13:22:03 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190409122203.GN1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-5-wei.liu2@citrix.com>
 <5C8BC685020000780021F5E5@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5C8BC685020000780021F5E5@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 04/55] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122203.EESftWFrkiWmHyHgEFaIa5y05VgONRSCM3I95hyh-GI@z>

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6MzY6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUaGUgcGwyZSBhbmQgcGwxZSB2YXJpYWJsZXMgYXJlIGhlYXZpbHkgKGFiKXVzZWQg
aW4gdGhhdCBmdW5jdGlvbi4gSXQKPiA+IGlzIGZpbmUgYXQgdGhlIG1vbWVudCBiZWNhdXNlIGFs
bCBwYWdlIHRhYmxlcyBhcmUgYWx3YXlzIG1hcHBlZCBzbwo+ID4gdGhlcmUgaXMgbm8gbmVlZCB0
byB0cmFjayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFibGUuCj4gPiAKPiA+IFdlIHdpbGwg
c29vbiBoYXZlIHRoZSByZXF1aXJlbWVudCB0byBtYXAgYW5kIHVubWFwIHBhZ2UgdGFibGVzLiBX
ZQo+ID4gbmVlZCB0byB0cmFjayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFibGUgdG8gYXZv
aWQgbGVha2FnZS4KPiA+IAo+ID4gSW50cm9kdWNlIHNvbWUgbHsxLDJ9dCB2YXJpYWJsZXMgd2l0
aCBsaW1pdGVkIHNjb3BlIHNvIHRoYXQgd2UgY2FuCj4gPiB0cmFjayBsaWZlIHRpbWUgb2YgcG9p
bnRlcnMgdG8geGVuIHBhZ2UgdGFibGVzIG1vcmUgZWFzaWx5Lgo+IAo+IEJ1dCB5b3UgcmV0YWlu
IHNvbWUgdXNlcyBvZiB0aGUgb2xkIHZhcmlhYmxlcywgYW5kIHRvIGJlIGhvbmVzdCBpdCdzCj4g
bm90IHJlYWxseSBjbGVhciB0byBtZSBieSB3aGF0IGNyaXRlcmlhIChhbmQgaGF2aW5nIG11bHRp
cGxlIGluc3RhbmNlcwo+IG9mIGEgdmFyaWFibGUgbmFtZSBpbiBhIHNpbmdsZSBmdW5jdGlvbiBp
c24ndCBuZWNlc3NhcmlseSBsZXNzIGNvbmZ1c2luZykuCj4gSSB0aGluayB3ZSBlaXRoZXIgc3Rp
Y2sgdG8gd2hhdCdzIHRoZXJlIChkb2Vzbid0IGxvb2sgdG9vIGJhZCB0byBtZSksCj4gb3IgeW91
IHN3aXRjaCB0byBzY29wZSByZXN0cmljdGVkIHBhZ2UgdGFibGUgcG9pbnRlcnMgdGhyb3VnaG91
dCB0aGUKPiBmdW5jdGlvbiwgc3VjaCB0aGF0IHRoZSBmdW5jdGlvbiBzY29wZSBzeW1ib2xzIGNh
biBnbyBhd2F5Cj4gYWx0b2dldGhlcikuCgpJIHRob3VnaHQgbXkgY29tbWl0IG1lc3NhZ2Ugd2Fz
IGNsZWFyIGVub3VnaDogaXQgaGVscGVkIHRyYWNraW5nIHRoZQpsaWZldGltZSBvZiBwb2ludGVy
cyBtb3JlIGVhc2lseS4gVGhlcmUgaXMgbm90aGluZyBuZXcgaW4gdGhpcyB0cmljazoKdGhlIGxl
c3MgdmFyaWFibGVzIG9mIHRoZSBzYW1lIG5hbWUgdGhlIGJldHRlci4KCkluIHRoaXMgcGF0Y2gs
IHBsYWNlcyB3aGVyZSBpdCBpcyBjbGVhciB0aGF0IHVzaW5nIGxvY2FsIHNjb3BlIHZhcmlhYmxl
cwpzdWZmaWNlcyBhcmUgY2hhbmdlZCB0byB1c2UgbG9jYWwgdmFyaWFibGVzLgoKSW4gdGhlIGVu
ZCwgcGwqZSBhcmUgb25seSB1c2VkIHRvIHBvaW50IHRvIGVudHJpZXMgd2hpY2ggcG9pbnQgdG8g
dGhlCnBhZ2UgdGFibGVzIHJlbGF0ZWQgdG8gdGhlIGxpbmVhciBhZGRyZXNzIGJlaW5nIG1hcHBl
ZC4gVGhleSB3b24ndCBiZQp1c2VkIHRvIHBvaW50IHRvIGFueSBpbnRlcm1lZGlhdGUgcG9pbnRl
cnMgd2hpY2ggYXJlIHVzZWQgdG8gbWFuaXB1bGF0ZQpwYWdlIHRhYmxlcy4KCldlIGNhbid0IGVs
aW1pbmF0ZSBmdW5jdGlvbiBzY29wZSB2YXJpYWJsZXMgYmVjYXVzZSB0aGV5IG5lZWQgdG8gc3Rh
eQpmdW5jdGlvbiBzY29wZSAtLSBzZWUgbGF0ZXIgcGF0Y2hlcyB3aGVyZSB0aGV5IGFyZSB1bm1h
cHBlZCBpbiB0aGUgb3V0CnBhdGguCgpXZWkuCgo+IAo+IEphbgo+IAo+IAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
