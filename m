Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8ACC282CE
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148222084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 148222084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hExLR-0004TC-7U; Fri, 12 Apr 2019 14:39:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hExLP-0004T7-JC
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:39:55 +0000
X-Inumbo-ID: d597d6f0-5d30-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d597d6f0-5d30-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 14:39:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 08:39:53 -0600
Message-Id: <5CB0A3380200007800226ED5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 08:39:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <20190412042930.2867-2-tamas@tklengyel.com>
 <5CB07E1D0200007800226E14@prv1-mh.provo.novell.com>
 <CABfawh=z3HWGfF8apTg0Gj7sTixVR8H5j08VKcJWiyqv6H0oSQ@mail.gmail.com>
In-Reply-To: <CABfawh=z3HWGfF8apTg0Gj7sTixVR8H5j08VKcJWiyqv6H0oSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] RFC: x86/mm: conditionally check
 page_lock/page_unlock ownership
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412143952.82kNy95HwbWAQiGK-u9LH65nHxbEMmI5RIoP4vHk-xQ@z>

Pj4+IE9uIDEyLjA0LjE5IGF0IDE1OjU1LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgNjowMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiA+Pj4gT24gMTIuMDQuMTkgYXQgMDY6MjksIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPj4gPiBQYXRjaCBjZjRiMzBkY2EwYSAiQWRkIGRlYnVnIGNvZGUgdG8g
ZGV0ZWN0IGlsbGVnYWwgcGFnZV9sb2NrIGFuZCBwdXRfcGFnZV90eXBlCj4+ID4gb3JkZXJpbmci
IGFkZGVkIGV4dHJhIHNhbml0eSBjaGVja2luZyB0byBwYWdlX2xvY2svcGFnZV91bmxvY2sgZm9y
IGRlYnVnIGJ1aWxkcwo+PiA+IHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBubyBoeXBlcnZpc29y
IHBhdGggZXZlciBsb2NrcyB0d28gcGFnZXMgYXQgb25jZS4KPj4gPgo+PiA+IFRoaXMgYXNzdW1w
dGlvbiBkb2Vzbid0IGhvbGQgZHVyaW5nIG1lbW9yeSBzaGFyaW5nLgo+Pgo+PiBBIGZ1bmRhbWVu
dGFsIHF1ZXN0aW9uIGlzIC0gZG9lc24ndCBtZW0tc2hhcmluZyBhYnVzZSBwYWdlX2xvY2soKT8K
Pj4gSSd2ZSBuZXZlciB1bmRlcnN0b29kIHdoeSBpdCB1c2VzIGl0LCBhbmQgYmFjayB3aGVuIGl0
IHdhcyBpbnRyb2R1Y2VkCj4+IHRoZSBmdW5jdGlvbiBjbGVhcmx5IHdhc24ndCBtZWFudCB0byBi
ZSB1c2VkIG91dHNpZGUgb2YgUFYgbWVtb3J5Cj4+IG1hbmFnZW1lbnQgY29kZS4KPiAKPiBJIGhh
dmUgbGltaXRlZCB1bmRlcnN0YW5kaW5nIG9mIHdoYXQgdGhlIGxpbWl0YXRpb25zIGFyZSBvZiBw
YWdlX2xvY2sKPiBidXQgaGVyZSBpcyB0aGUgcmVhc29uaW5nIGZvciB0YWtpbmcgdGhlIGxvY2sg
Zm9yIHR3byBwYWdlcy4KPiBNZW1fc2hhcmluZyB0YWtlcyB0aGUgcGFnZXMgaXQgd2FudHMgdG8g
YmUgc2hhcmFibGUgYW5kIGFzc2lnbnMgdGhlbQo+IHRvIGRvbV9jb3cgYXQgbGVhc3Qgd2l0aCBv
bmUgcmVmZXJlbmNlIGJlaW5nIGhlbGQgKHNpbmNlIHdlIGp1c3QgdG9vawo+IHRoZXNlIHBhZ2Vz
IGZyb20gYSBsaXZlIGRvbWFpbikuIFRob3NlIHBhZ2VzIG1heSB0aGVuIGJlIGFzc2lnbmVkIHRv
Cj4gc2V2ZXJhbCBhY3R1YWwgZG9tYWlucyBhdCB0aGUgc2FtZSB0aW1lLCBhbmQgZWFjaCBkb21h
aW4gY291bGQgYmUKPiBkZXN0cm95ZWQgYXQgYW55IGdpdmVuIHBvaW50LiBUaGVyZSBpcyBubyBy
ZXF1aXJlbWVudCB0aGF0IHRoZQo+IG9yaWdpbmFsIGRvbWFpbiBzdGlsbCBiZSBhbGl2ZSBzaW5j
ZSB0aGUgb3duZXIgb2YgdGhlc2UgcGFnZXMgaXMgbm93Cj4gZG9tX2Nvdy4gVGhlIGJhY2tpbmcg
cGFnZXMgb3duZWQgYnkgZG9tX2NvdyBvbmx5IGdldCBkcm9wcGVkIHdoZW4gdGhlCj4gcmVmZXJl
bmNlIGNvdW50IGhpdHMgemVybywgaWUuIG5vIGFjdHVhbCBkb21haW4gYWN0dWFsbHkgdXNlcyB0
aG9zZQo+IHBhZ2VzIGFueW1vcmUuIFRoaXMgY291bGQgaGFwcGVuIGlmIGFsbCBkb21haW5zIHVu
c2hhcmUgdGhlIGdmbidzIHRoYXQKPiB1c2UgdGhpcyBwYWdlIGFzIHRoZSBiYWNraW5nIG9yIGlm
IGFsbCBkb21haW5zIHRoYXQgdXNlIHRoZW0gZm9yCj4gbWVtX3NoYXJpbmcgZ2V0IGRlc3Ryb3ll
ZC4gV2hlbiB3ZSBzaGFyZSBwYWdlcywgd2Ugd2FudCB0byBtYWtlIHN1cmUKPiB0aG9zZSBkb24n
dCBnZXQgZHJvcHBlZCB1bmRlciBvdXIgZmVldCB3aGlsZSB3ZSBhcmUgaW4gdGhlIG1pZGRsZSBv
Zgo+IHRoaXMgZnVuY3Rpb24uIFNvIHdlIGxvY2sgYm90aCBwYWdlcy4KClRoYW5rcyBmb3IgdGhl
IGV4cGxhbmF0aW9uLCBidXQgSSdtIGFmcmFpZCB0aGlzIGRvZXNuJ3QgYWRkcmVzcwpteSByZW1h
cms6IFlvdSBuZWVkIF9zb21lXyBraW5kIG9mIGxvY2sgZm9yIHRoaXMsIGJ1dCBJIHdhcwpxdWVz
dGlvbmluZyB3aGV0aGVyIHVzaW5nIHBhZ2VfbG9jaygpIGlzIHRoZSByaWdodCBjaG9pY2UuIEZy
b20Kd2hhdCB5b3Ugc2F5LCBvYnRhaW5pbmcgcHJvcGVyIHJlZmVyZW5jZXMgdG8gdGhlIHBhZ2Ug
d291bGQKc2VlbSB3aGF0IHlvdSBhY3R1YWxseSB3YW50IHRvIGF2b2lkIHRoZW0gZGlzYXBwZWFy
aW5nCmJlaGluZCB5b3VyIGJhY2suCgpwYWdlX2xvY2soKSBpcyB1c2VkIG9uIFBWIHBhZ2UgdGFi
bGUgcGFnZXMgdG8gZXhjbHVkZSBtdWx0aXBsZQp1cGRhdGVzIHRvIHRoZSBzYW1lIHBhZ2UgdGFi
bGUgaGFwcGVuaW5nIGF0IHRoZSBzYW1lIHRpbWUuCkluIGEgIVBWIGJ1aWxkIGl0IHNob3VsZG4n
dCBldmVuIGJlIGF2YWlsYWJsZS4KCj4gQWxzbywgSSBkb24ndCBzZWUgd2h5IGl0IHdvdWxkIGJl
IGZ1bmRhbWVudGFsbHkgd3JvbmcgdG8gaG9sZCB0aGUKPiBsb2NrcyB0byB0d28gcGFnZXMgYXQg
b25jZS4gSXMgdGhpcyBhIHByb2JsZW0gd2l0aCB0aGUgbG9jawo+IGltcGxlbWVudGF0aW9uIGl0
c2VsZj8KCk5vLCB0aGUgaW1wbGVtZW50YXRpb24gaXRzZWxmIHNob3VsZCBiZSBmaW5lIChidXQg
SSBhbHNvIGRpZG4ndCBzYXkKdGhlcmUncyBhIHByb2JsZW0gbG9ja2luZyB0d28gcGFnZXMpLiBM
b2NrIG9yZGVyIG1pZ2h0IGJlIGFuIGlzc3VlLApidXQgc2VlbSB0byBiZSBkZWFsaW5nIHdpdGgg
dGhhdCBmaW5lIChjb25zaWRlcmluZyBtZW1fc2hhcmluZy5jCmFsb25lKS4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
