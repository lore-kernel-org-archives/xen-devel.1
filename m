Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F95EC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:59:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 753102084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 753102084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDqLO-0004DZ-Oj; Tue, 09 Apr 2019 12:59:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDqLN-0004DU-V1
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:59:17 +0000
X-Inumbo-ID: 46b97668-5ac7-11e9-abde-b3d549923497
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46b97668-5ac7-11e9-abde-b3d549923497;
 Tue, 09 Apr 2019 12:59:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83103283"
Date: Tue, 9 Apr 2019 13:59:12 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190409125912.GO30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-5-wei.liu2@citrix.com>
 <5C8BC685020000780021F5E5@prv1-mh.provo.novell.com>
 <20190409122203.GN1986@zion.uk.xensource.com>
 <5CAC94DE0200007800225DA3@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CAC94DE0200007800225DA3@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409125912.7HHN_22UeyVPDQmLDcYWmP_6Ijmo6n7ih7Zn-jdyWA0@z>

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDY6NDk6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA5LjA0LjE5IGF0IDE0OjIyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIE1hciAxNSwgMjAxOSBhdCAwOTozNjozN0FNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDcuMDIuMTkgYXQgMTc6NDQsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IFRoZSBwbDJlIGFuZCBwbDFlIHZhcmlhYmxlcyBhcmUgaGVh
dmlseSAoYWIpdXNlZCBpbiB0aGF0IGZ1bmN0aW9uLiBJdAo+ID4+ID4gaXMgZmluZSBhdCB0aGUg
bW9tZW50IGJlY2F1c2UgYWxsIHBhZ2UgdGFibGVzIGFyZSBhbHdheXMgbWFwcGVkIHNvCj4gPj4g
PiB0aGVyZSBpcyBubyBuZWVkIHRvIHRyYWNrIHRoZSBsaWZlIHRpbWUgb2YgZWFjaCB2YXJpYWJs
ZS4KPiA+PiA+IAo+ID4+ID4gV2Ugd2lsbCBzb29uIGhhdmUgdGhlIHJlcXVpcmVtZW50IHRvIG1h
cCBhbmQgdW5tYXAgcGFnZSB0YWJsZXMuIFdlCj4gPj4gPiBuZWVkIHRvIHRyYWNrIHRoZSBsaWZl
IHRpbWUgb2YgZWFjaCB2YXJpYWJsZSB0byBhdm9pZCBsZWFrYWdlLgo+ID4+ID4gCj4gPj4gPiBJ
bnRyb2R1Y2Ugc29tZSBsezEsMn10IHZhcmlhYmxlcyB3aXRoIGxpbWl0ZWQgc2NvcGUgc28gdGhh
dCB3ZSBjYW4KPiA+PiA+IHRyYWNrIGxpZmUgdGltZSBvZiBwb2ludGVycyB0byB4ZW4gcGFnZSB0
YWJsZXMgbW9yZSBlYXNpbHkuCj4gPj4gCj4gPj4gQnV0IHlvdSByZXRhaW4gc29tZSB1c2VzIG9m
IHRoZSBvbGQgdmFyaWFibGVzLCBhbmQgdG8gYmUgaG9uZXN0IGl0J3MKPiA+PiBub3QgcmVhbGx5
IGNsZWFyIHRvIG1lIGJ5IHdoYXQgY3JpdGVyaWEgKGFuZCBoYXZpbmcgbXVsdGlwbGUgaW5zdGFu
Y2VzCj4gPj4gb2YgYSB2YXJpYWJsZSBuYW1lIGluIGEgc2luZ2xlIGZ1bmN0aW9uIGlzbid0IG5l
Y2Vzc2FyaWx5IGxlc3MgY29uZnVzaW5nKS4KPiA+PiBJIHRoaW5rIHdlIGVpdGhlciBzdGljayB0
byB3aGF0J3MgdGhlcmUgKGRvZXNuJ3QgbG9vayB0b28gYmFkIHRvIG1lKSwKPiA+PiBvciB5b3Ug
c3dpdGNoIHRvIHNjb3BlIHJlc3RyaWN0ZWQgcGFnZSB0YWJsZSBwb2ludGVycyB0aHJvdWdob3V0
IHRoZQo+ID4+IGZ1bmN0aW9uLCBzdWNoIHRoYXQgdGhlIGZ1bmN0aW9uIHNjb3BlIHN5bWJvbHMg
Y2FuIGdvIGF3YXkKPiA+PiBhbHRvZ2V0aGVyKS4KPiA+IAo+ID4gSSB0aG91Z2h0IG15IGNvbW1p
dCBtZXNzYWdlIHdhcyBjbGVhciBlbm91Z2g6IGl0IGhlbHBlZCB0cmFja2luZyB0aGUKPiA+IGxp
ZmV0aW1lIG9mIHBvaW50ZXJzIG1vcmUgZWFzaWx5LiBUaGVyZSBpcyBub3RoaW5nIG5ldyBpbiB0
aGlzIHRyaWNrOgo+ID4gdGhlIGxlc3MgdmFyaWFibGVzIG9mIHRoZSBzYW1lIG5hbWUgdGhlIGJl
dHRlci4KPiA+IAo+ID4gSW4gdGhpcyBwYXRjaCwgcGxhY2VzIHdoZXJlIGl0IGlzIGNsZWFyIHRo
YXQgdXNpbmcgbG9jYWwgc2NvcGUgdmFyaWFibGVzCj4gPiBzdWZmaWNlcyBhcmUgY2hhbmdlZCB0
byB1c2UgbG9jYWwgdmFyaWFibGVzLgo+ID4gCj4gPiBJbiB0aGUgZW5kLCBwbCplIGFyZSBvbmx5
IHVzZWQgdG8gcG9pbnQgdG8gZW50cmllcyB3aGljaCBwb2ludCB0byB0aGUKPiA+IHBhZ2UgdGFi
bGVzIHJlbGF0ZWQgdG8gdGhlIGxpbmVhciBhZGRyZXNzIGJlaW5nIG1hcHBlZC4gVGhleSB3b24n
dCBiZQo+ID4gdXNlZCB0byBwb2ludCB0byBhbnkgaW50ZXJtZWRpYXRlIHBvaW50ZXJzIHdoaWNo
IGFyZSB1c2VkIHRvIG1hbmlwdWxhdGUKPiA+IHBhZ2UgdGFibGVzLgo+ID4gCj4gPiBXZSBjYW4n
dCBlbGltaW5hdGUgZnVuY3Rpb24gc2NvcGUgdmFyaWFibGVzIGJlY2F1c2UgdGhleSBuZWVkIHRv
IHN0YXkKPiA+IGZ1bmN0aW9uIHNjb3BlIC0tIHNlZSBsYXRlciBwYXRjaGVzIHdoZXJlIHRoZXkg
YXJlIHVubWFwcGVkIGluIHRoZSBvdXQKPiA+IHBhdGguCj4gCj4gRXhjZXB0IHRoYXQgSSdtIG5v
dCByZWFsbHkgaGFwcHkgd2l0aCB0aGF0IGFwcHJvYWNoIGVpdGhlciAobm90Cj4gb25seSBidXQg
YWxzbyBiZWNhdXNlIG9mIHRoZSBwcm9saWZlcmF0aW9uIG9mIGdvdG8tcykuCgpUaGUgcm9vdCBj
YXVzZSBpcyB0aGVyZSBhcmUgZmFyIHRvbyBtYW55IGV4aXQgcGF0aHMgaW4gdGhpcyBmdW5jdGlv
bi4KUHJldmlvdXNseSBpdCB3YXMgb2theSBiZWNhdXNlIHdlIGRpZG4ndCBuZWVkIHRvIGNsZWFu
IHVwLiBJdCB3b24ndCBiZQpva2F5IG9uY2Ugd2UgaGF2ZSB0by4KCkkgcGlja2VkIHRoZSBvcHRp
b24gdG8gdW5pZnkgdGhlbSBpbnRvIG9uZSBvciB0d28gcGxhY2VzLgoKT25lIG9wdGlvbiBpcyB0
byBkdXBsaWNhdGUgY2xlYW51cCBjb2RlIGluIGVhY2ggZXhpdCBwYXRoLiBUaGF0J3MKcmVwZXRp
dGl2ZSBhbmQgZXJyb3ItcHJvbmUgSU1ITy4KCk9uZSBvcHRpb24gaXMgdG8gYnJlYWsgdXAgbWFw
X3BhZ2VzX3RvX3hlbiBpbnRvIHNtYWxsZXIgZnVuY3Rpb25zIHdoaWNoCmRvbid0IHJlcXVpcmUg
Z290b3MgYnV0IHJlcXVpcmUgbW9yZSBtYXBwaW5nIC8gdW5tYXBwaW5nLiBJIHRob3VnaHQKYWJv
dXQgdGhhdCBidXQgaXQgd2FzIHRvbyBtdWNoIGZhZmYgd2l0aG91dCBnZXR0aW5nIHVzIHRvIHdo
ZXJlIHdlCndhbnRlZCB0byBiZS4KClBpY2sgeW91ciBwb2lzb24uIFRoZXJlIGlzbid0IGFuIGVh
c3kgc29sdXRpb24gdG8gdGhpcy4uLgoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
