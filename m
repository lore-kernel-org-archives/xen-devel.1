Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39B5C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:29:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899AF206C0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899AF206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDVHJ-0003sB-2m; Mon, 08 Apr 2019 14:29:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDVHH-0003qa-Gi
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:29:39 +0000
X-Inumbo-ID: bc92778b-5a0a-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bc92778b-5a0a-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 14:29:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 08:29:36 -0600
Message-Id: <5CAB5ACC0200007800225693@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 08:29:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <942c2ec5-69dc-634b-0935-b8713506d32e@arm.com>
 <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
 <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
In-Reply-To: <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408142932.rtfxBcMfjwjIHIpU2rkMOTiOm61Fcc6Yb9IEzLZBUqw@z>

Pj4+IE9uIDA4LjA0LjE5IGF0IDEzOjQ3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDQvMi8xOSA1OjEwIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDIuMDQuMTkg
YXQgMTI6MjYsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBPbiAwNS8wMy8yMDE5
IDEzOjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBUaGUgY29tbWl0IHJlLWludHJvZHVjaW5n
IGl0ICgxNGViM2I0MWQwIFsieGVuOiByZWluc3RhdGUgcHJldmlvdXNseQo+Pj4+IHVudXNlZCBY
RU5NRU1fcmVtb3ZlX2Zyb21fcGh5c21hcCBoeXBlcmNhbGwiXSkgYXMgd2VsbCBhcyB0aGUgb25l
IGhhdmluZwo+Pj4+IG9yaWdpbmFsbHkgaW50cm9kdWNlZCBpdCAoZDgxOGYzY2I3YyBbImh2bTog
VXNlIG1haW4gbWVtb3J5IGZvciB2aWRlbwo+Pj4+IG1lbW9yeSJdKSBhbmQgdGhlIG9uZSB0aGVu
IHB1cmdpbmcgaXQgYWdhaW4gKDc4YzMwOTdlNGYgWyJSZW1vdmUgdW51c2VkCj4+Pj4gWEVOTUVN
X3JlbW92ZV9mcm9tX3BoeXNtYXAiXSkgbWFrZSBjbGVhciB0aGF0IHRoaXMgb3BlcmF0aW9uIGlz
IGludGVuZGVkCj4+Pj4gZm9yIHVzZSBvbiBIVk0gKGkuZS4gdHJhbnNsYXRlZCkgZ3Vlc3RzIG9u
bHkuIFJlc3RyaWN0IGl0IGF0IGxlYXN0IGFzCj4+Pj4gbXVjaCwgYmVjYXVzZSBmb3IgUFYgZ3Vl
c3RzIGRvY3VtZW50YXRpb24gKGluIHRoZSBwdWJsaWMgaGVhZGVyKSBkb2VzCj4+Pj4gbm90IGV2
ZW4gbWF0Y2ggdGhlIGltcGxlbWVudGF0aW9uOiBJdCB0YWxrcyBhYm91dCBHUEZOIGFzIGlucHV0
LCBidXQKPj4+PiBnZXRfcGFnZV9mcm9tX2dmbigpIGFzc3VtZXMgYSBHTUZOIGluIHRoZSBub24t
dHJhbnNsYXRlZCBjYXNlIChhbmQgaGFuZHMKPj4+PiBiYWNrIHRoZSB2YWx1ZSBwYXNzZWQgaW4p
Lgo+Pj4+Cj4+Pj4gQWxzbyBsaWZ0IHRoZSBjaGVjayBpbiBYRU5NRU1fYWRkX3RvX3BoeXNtYXB7
LF9iYXRjaH0gaGFuZGxpbmcgdXAKPj4+PiBkaXJlY3RseSBpbnRvIHRvcCBsZXZlbCBoeXBlcmNh
bGwgaGFuZGxpbmcsIGFuZCBjbGFyaWZ5IHRoaW5ncyBpbiB0aGUKPj4+PiBwdWJsaWMgaGVhZGVy
IGFjY29yZGluZ2x5Lgo+Pj4+Cj4+Pj4gVGFrZSB0aGUgbGliZXJ0eSBhbmQgYWxzbyByZXBsYWNl
IGEgcG9pbnRsZXNzIHVzZSBvZiAiY3VycmVudCIgd2l0aCBhCj4+Pj4gbW9yZSBlZmZpY2llbnQg
dXNlIG9mIGFuIGV4aXN0aW5nIGxvY2FsIHZhcmlhYmxlIChvciBmdW5jdGlvbiBwYXJhbWV0ZXIK
Pj4+PiB0byBiZSBwcmVjaXNlKS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+PiAtLS0KPj4+PiBUQkQ6IEl0IGNvdWxkIGJlIGZ1cnRo
ZXIgcmVzdHJpY3RlZCwgZGlzYWxsb3dpbmcgaXRzIHVzZSBieSBhIEhWTSBndWVzdAo+Pj4+ICAg
ICAgICBvbiBpdHNlbGYuCj4+Pgo+Pj4gQnkgSFZNIGd1ZXN0LCBkbyB5b3UgcmVmZXIgdG8gYW55
IGF1dG8tdHJhbnNsYXRlZCBndWVzdD8KPj4gCj4+IFllcyAtIHNvcnJ5IGZvciB1c2luZyBhbiB4
ODYgdGVybS4KPj4gCj4+PiBUaGUgaW50ZXJmYWNlIFhFTk1FX3JlbW92ZV9mcm9tX3BoeXNtYXAg
aXMgdXNlZCBieSBBcm0gdG8gcmVtb3ZlIGZvcmVpZ24KPj4+IG1hcHBpbmdzIGZyb20gaXRzIHAy
bS4gVGhlcmUgYXJlIHBvdGVudGlhbGx5IG90aGVyIHNwYWNlIHdpdGggc2ltaWxhciBjYXNlCj4+
PiAoZS5nIGdyYW50LXRhYmxlLi4uKS4KPj4gCj4+IE9oLCBJIHNlZSAtIHRoaXMgb3B0aW9uIGdv
ZXMgYXdheSB0aGVuLgo+PiAKPj4+PiBUQkQ6IElzIHVzaW5nIFAyTV9BTExPQyBoZXJlIHJlYWxs
eSBhcHByb3ByaWF0ZT8gSXQgbWVhbnMgZS5nLgo+Pj4+ICAgICAgICBwb2ludGxlc3NseSBwb3B1
bGF0aW5nIGEgUG9EIHNsb3QganVzdCB0byB1bnBvcHVsYXRlIGl0IGFnYWluIHJpZ2h0Cj4+Pj4g
ICAgICAgIGF3YXksIHdpdGggdGhlIHBhZ2UgdGhlbiBmcmVlIGZsb2F0aW5nLCBpLmUuIG5vIGxv
bmdlciBhdmFpbGFibGUKPj4+PiAgICAgICAgZm9yIHVzZSB0byByZXBsYWNlIGFub3RoZXIgUG9E
IHNsb3QsIGFuZCAoYWZhaWN0KSBubyBsb25nZXIKPj4+PiAgICAgICAgYWNjZXNzaWJsZSBieSB0
aGUgZ3Vlc3QgaW4gYW55IHdheS4KPj4+PiBUQkQ6IElzIHVzaW5nIGd1ZXN0X3BoeXNtYXBfcmVt
b3ZlX3BhZ2UoKSBoZXJlIHJlYWxseSBhcHByb3ByaWF0ZT8gSXQKPj4+PiAgICAgICAgbWVhbnMg
dGhhdCBlLmcuIE1NSU8gcGFnZXMgd291bGRuJ3QgYmUgcmVtb3ZlZC4gR29pbmcgdGhyb3VnaAo+
Pj4+ICAgICAgICBndWVzdF9yZW1vdmVfcGFnZSgpICh3aGlsZSBza2lwcGluZyB0aGUgZGUtYWxs
b2NhdGlvbiBzdGVwKSB3b3VsZAo+Pj4+ICAgICAgICBzZWVtIG1vcmUgYXBwcm9wcmlhdGUgdG8g
bWUsIHdoaWNoIHdvdWxkIGFkZHJlc3MgdGhlIFAyTV9BTExPQwo+Pj4+ICAgICAgICBhc3BlY3Qg
YWJvdmUgYXMgd2VsbC4KPj4+Cj4+PiBIb3cgaXMgdGhhdCBhbiBpc3N1ZT8gRG9lcyBYRU5NRU1f
YWRkX3RvX3BoeXNtYXAgYWxsb3dzIHlvdSB0byBtYXAgTU1JTwo+Pj4gcGFnZXM/Cj4+IAo+PiBX
ZWxsLCB0aGVyZSdzIFhFTk1BUFNQQUNFX2Rldl9tbWlvIHdoaWNoIHhhdHAgaGFuZGxlcy4gQnV0
Cj4+IHBlcmhhcHMgdGhlIE1NSU8gZXhhbXBsZSBpcyBtb3JlIGNvbmZ1c2luZyB0aGFuIGhlbHBm
dWwuIFRoZQo+PiBxdWVzdGlvbiByZWFsbHkganVzdCBpcyB3aGV0aGVyIGd1ZXN0X3JlbW92ZV9w
YWdlKCkgc2hvdWxkbid0Cj4+IGJlIHVzZWQgaGVyZSBpbnN0ZWFkIG9mIGd1ZXN0X3BoeXNtYXBf
cmVtb3ZlX3BhZ2UoKQo+IGRlLWFsbG9jYXRpb24gc3RlcCBhc2lkZSwgSSBhbSBub3QgcmVhbGx5
IGNvbnZpbmNlZCB5b3UgY2FuIHJldXNlIAo+IGd1ZXN0X3JlbW92ZV9wYWdlKCkgaGVyZS4gT24g
eDg2LCB0aGUgZnVuY3Rpb24gd2lsbCBub3Qgd29yayBvbiBjZXJ0YWluIAo+IHAybSB0eXBlcy4g
SXMgaXQgd2hhdCB3ZSByZWFsbHkgd2FudD8KCkhtbSwgSSdtIGNvbmZ1c2VkLiBBZmFpY3MgdGhl
IG9ubHkgdHdvIHR5cGVzIGl0IHJlZnVzZXMgYSByZXF1ZXN0CmZvciBhcmUgcDJtX2ludmFsaWQg
YW5kIHAybV9tbWlvX2RtLiBUaGVzZSByZXByZXNlbnQgY2FzZXMKd2hlcmUgdGhlcmUncyBubyBw
Mm0gZW50cnkgYW55d2F5LCBpLmUuIG5vdGhpbmcgdG8gcmVtb3ZlLiBBbQpJIHBlcmhhcHMgb3Zl
cmxvb2tpbmcgc29tZXRoaW5nIHlvdSBzZWU/CgpPciBhcmUgeW91IHJlZmVycmluZyB0byB0aGUg
bWZuX2ludmFsaWQoKSBjaGVjayAod2hpY2ggaXNuJ3QgeDg2LQpzcGVjaWZpYyk/IFRoaXMgb3Vn
aHQgdG8gYmUgY292ZXJlZCBieSB0aGUgcDJtX2lzX3BhZ2luZygpIGFuZApwMm1fbW1pb19kaXJl
Y3Qgc3BlY2lhbCBjYXNlcyBhIGZldyBsaW5lcyB1cCBmcm9tIHRoZXJlLiBPdGhlcgpjYXNlcyB3
aXRoIGludmFsaWQgTUZOcyB3b3VsZCBpbmRlZWQgcmVwcmVzZW50IGFuIGVycm9yIGNvbmRpdGlv
bgppbW8uCgpJbiB0aGUgZW5kIGl0J3MgYWN0dWFsbHkgcXVpdGUgdGhlIG9wcG9zaXRlIHRoYXQg
SSdtIHRoaW5raW5nOiBGb3IKdGhlIGNhbGxlciBpdCBzaG91bGRuJ3QsIGZvciBleGFtcGxlLCBt
YXR0ZXIgd2hldGhlciB0aGUKcmVxdWVzdGVkIHBhZ2Ugd2FzIHBhZ2VkIG91dC4gV2Ugd291bGRu
J3QgZXZlbiBjYWxsCmd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKSBpbiB0aGF0IGNhc2UsIHdo
aWxlCmd1ZXN0X3JlbW92ZV9wYWdlKCkgd291bGQgdGFrZSBjYXJlIG9mIGl0LgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
