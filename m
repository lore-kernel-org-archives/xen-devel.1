Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E51C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:49:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19E020855
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19E020855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqC4-00036x-T9; Tue, 09 Apr 2019 12:49:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDqC3-00036s-DO
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:49:39 +0000
X-Inumbo-ID: ef49238c-5ac5-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef49238c-5ac5-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:49:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 06:49:37 -0600
Message-Id: <5CAC94DE0200007800225DA3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 06:49:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-5-wei.liu2@citrix.com>
 <5C8BC685020000780021F5E5@prv1-mh.provo.novell.com>
 <20190409122203.GN1986@zion.uk.xensource.com>
In-Reply-To: <20190409122203.GN1986@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409124934.i6mGxVOqC5kqWu2hSncKsbdHs2iBGGi9SfkNGQL4maI@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE0OjIyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6MzY6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNy4wMi4xOSBhdCAxNzo0NCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IFRoZSBwbDJlIGFuZCBwbDFlIHZhcmlhYmxlcyBhcmUgaGVhdmlseSAoYWIpdXNl
ZCBpbiB0aGF0IGZ1bmN0aW9uLiBJdAo+PiA+IGlzIGZpbmUgYXQgdGhlIG1vbWVudCBiZWNhdXNl
IGFsbCBwYWdlIHRhYmxlcyBhcmUgYWx3YXlzIG1hcHBlZCBzbwo+PiA+IHRoZXJlIGlzIG5vIG5l
ZWQgdG8gdHJhY2sgdGhlIGxpZmUgdGltZSBvZiBlYWNoIHZhcmlhYmxlLgo+PiA+IAo+PiA+IFdl
IHdpbGwgc29vbiBoYXZlIHRoZSByZXF1aXJlbWVudCB0byBtYXAgYW5kIHVubWFwIHBhZ2UgdGFi
bGVzLiBXZQo+PiA+IG5lZWQgdG8gdHJhY2sgdGhlIGxpZmUgdGltZSBvZiBlYWNoIHZhcmlhYmxl
IHRvIGF2b2lkIGxlYWthZ2UuCj4+ID4gCj4+ID4gSW50cm9kdWNlIHNvbWUgbHsxLDJ9dCB2YXJp
YWJsZXMgd2l0aCBsaW1pdGVkIHNjb3BlIHNvIHRoYXQgd2UgY2FuCj4+ID4gdHJhY2sgbGlmZSB0
aW1lIG9mIHBvaW50ZXJzIHRvIHhlbiBwYWdlIHRhYmxlcyBtb3JlIGVhc2lseS4KPj4gCj4+IEJ1
dCB5b3UgcmV0YWluIHNvbWUgdXNlcyBvZiB0aGUgb2xkIHZhcmlhYmxlcywgYW5kIHRvIGJlIGhv
bmVzdCBpdCdzCj4+IG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgYnkgd2hhdCBjcml0ZXJpYSAoYW5k
IGhhdmluZyBtdWx0aXBsZSBpbnN0YW5jZXMKPj4gb2YgYSB2YXJpYWJsZSBuYW1lIGluIGEgc2lu
Z2xlIGZ1bmN0aW9uIGlzbid0IG5lY2Vzc2FyaWx5IGxlc3MgY29uZnVzaW5nKS4KPj4gSSB0aGlu
ayB3ZSBlaXRoZXIgc3RpY2sgdG8gd2hhdCdzIHRoZXJlIChkb2Vzbid0IGxvb2sgdG9vIGJhZCB0
byBtZSksCj4+IG9yIHlvdSBzd2l0Y2ggdG8gc2NvcGUgcmVzdHJpY3RlZCBwYWdlIHRhYmxlIHBv
aW50ZXJzIHRocm91Z2hvdXQgdGhlCj4+IGZ1bmN0aW9uLCBzdWNoIHRoYXQgdGhlIGZ1bmN0aW9u
IHNjb3BlIHN5bWJvbHMgY2FuIGdvIGF3YXkKPj4gYWx0b2dldGhlcikuCj4gCj4gSSB0aG91Z2h0
IG15IGNvbW1pdCBtZXNzYWdlIHdhcyBjbGVhciBlbm91Z2g6IGl0IGhlbHBlZCB0cmFja2luZyB0
aGUKPiBsaWZldGltZSBvZiBwb2ludGVycyBtb3JlIGVhc2lseS4gVGhlcmUgaXMgbm90aGluZyBu
ZXcgaW4gdGhpcyB0cmljazoKPiB0aGUgbGVzcyB2YXJpYWJsZXMgb2YgdGhlIHNhbWUgbmFtZSB0
aGUgYmV0dGVyLgo+IAo+IEluIHRoaXMgcGF0Y2gsIHBsYWNlcyB3aGVyZSBpdCBpcyBjbGVhciB0
aGF0IHVzaW5nIGxvY2FsIHNjb3BlIHZhcmlhYmxlcwo+IHN1ZmZpY2VzIGFyZSBjaGFuZ2VkIHRv
IHVzZSBsb2NhbCB2YXJpYWJsZXMuCj4gCj4gSW4gdGhlIGVuZCwgcGwqZSBhcmUgb25seSB1c2Vk
IHRvIHBvaW50IHRvIGVudHJpZXMgd2hpY2ggcG9pbnQgdG8gdGhlCj4gcGFnZSB0YWJsZXMgcmVs
YXRlZCB0byB0aGUgbGluZWFyIGFkZHJlc3MgYmVpbmcgbWFwcGVkLiBUaGV5IHdvbid0IGJlCj4g
dXNlZCB0byBwb2ludCB0byBhbnkgaW50ZXJtZWRpYXRlIHBvaW50ZXJzIHdoaWNoIGFyZSB1c2Vk
IHRvIG1hbmlwdWxhdGUKPiBwYWdlIHRhYmxlcy4KPiAKPiBXZSBjYW4ndCBlbGltaW5hdGUgZnVu
Y3Rpb24gc2NvcGUgdmFyaWFibGVzIGJlY2F1c2UgdGhleSBuZWVkIHRvIHN0YXkKPiBmdW5jdGlv
biBzY29wZSAtLSBzZWUgbGF0ZXIgcGF0Y2hlcyB3aGVyZSB0aGV5IGFyZSB1bm1hcHBlZCBpbiB0
aGUgb3V0Cj4gcGF0aC4KCkV4Y2VwdCB0aGF0IEknbSBub3QgcmVhbGx5IGhhcHB5IHdpdGggdGhh
dCBhcHByb2FjaCBlaXRoZXIgKG5vdApvbmx5IGJ1dCBhbHNvIGJlY2F1c2Ugb2YgdGhlIHByb2xp
ZmVyYXRpb24gb2YgZ290by1zKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
