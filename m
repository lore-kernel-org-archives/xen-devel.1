Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A105C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:36:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7552084B
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF7552084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbk7-0008VO-8n; Thu, 25 Apr 2019 10:36:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbk6-0008VJ-KC
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:36:38 +0000
X-Inumbo-ID: fee6001e-6745-11e9-9c7a-ffaf7024b31c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fee6001e-6745-11e9-9c7a-ffaf7024b31c;
 Thu, 25 Apr 2019 10:36:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 04:36:33 -0600
Message-Id: <5CC18DAE0200007800228F9E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 04:36:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <942c2ec5-69dc-634b-0935-b8713506d32e@arm.com>
 <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
 <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
 <5CAB5ACC0200007800225693@prv1-mh.provo.novell.com>
 <303adcc7-de60-f264-67f2-7bd05b2c4bec@arm.com>
 <5CAC8E2C0200007800225CDC@prv1-mh.provo.novell.com>
 <1638ff52-b6f0-35c8-0e97-7d480c77d700@arm.com>
In-Reply-To: <1638ff52-b6f0-35c8-0e97-7d480c77d700@arm.com>
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
Message-ID: <20190425103630.1mTu8VRgJyRG3tCooZCOHECQ7mZ3AGBQ0R8az7Fwksc@z>

Pj4+IE9uIDE0LjA0LjE5IGF0IDE4OjMzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpLAo+IAo+IE9uIDQvOS8xOSAxOjIxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MDkuMDQuMTkgYXQgMTE6NTAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBPbiAw
OC8wNC8yMDE5IDE1OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAwOC4wNC4xOSBh
dCAxMzo0NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4gZGUtYWxsb2NhdGlv
biBzdGVwIGFzaWRlLCBJIGFtIG5vdCByZWFsbHkgY29udmluY2VkIHlvdSBjYW4gcmV1c2UKPj4+
Pj4gZ3Vlc3RfcmVtb3ZlX3BhZ2UoKSBoZXJlLiBPbiB4ODYsIHRoZSBmdW5jdGlvbiB3aWxsIG5v
dCB3b3JrIG9uIGNlcnRhaW4KPj4+Pj4gcDJtIHR5cGVzLiBJcyBpdCB3aGF0IHdlIHJlYWxseSB3
YW50Pwo+Pj4+Cj4+Pj4gSG1tLCBJJ20gY29uZnVzZWQuIEFmYWljcyB0aGUgb25seSB0d28gdHlw
ZXMgaXQgcmVmdXNlcyBhIHJlcXVlc3QKPj4+PiBmb3IgYXJlIHAybV9pbnZhbGlkIGFuZCBwMm1f
bW1pb19kbS4gVGhlc2UgcmVwcmVzZW50IGNhc2VzCj4+Pj4gd2hlcmUgdGhlcmUncyBubyBwMm0g
ZW50cnkgYW55d2F5LCBpLmUuIG5vdGhpbmcgdG8gcmVtb3ZlLiBBbQo+Pj4+IEkgcGVyaGFwcyBv
dmVybG9va2luZyBzb21ldGhpbmcgeW91IHNlZT8KPj4+Pgo+Pj4+IE9yIGFyZSB5b3UgcmVmZXJy
aW5nIHRvIHRoZSBtZm5faW52YWxpZCgpIGNoZWNrICh3aGljaCBpc24ndCB4ODYtCj4+Pj4gc3Bl
Y2lmaWMpPyBUaGlzIG91Z2h0IHRvIGJlIGNvdmVyZWQgYnkgdGhlIHAybV9pc19wYWdpbmcoKSBh
bmQKPj4+PiBwMm1fbW1pb19kaXJlY3Qgc3BlY2lhbCBjYXNlcyBhIGZldyBsaW5lcyB1cCBmcm9t
IHRoZXJlLiBPdGhlcgo+Pj4+IGNhc2VzIHdpdGggaW52YWxpZCBNRk5zIHdvdWxkIGluZGVlZCBy
ZXByZXNlbnQgYW4gZXJyb3IgY29uZGl0aW9uCj4+Pj4gaW1vLgo+Pj4KPj4+IEkgYW0gcmVmZXJy
aW5nIHRvIGdldF9wYWdlKC4uLikgd2hpY2ggd291bGQgbm90IHdvcmsgZm9yIGZvcmVpZ24gcGFn
ZXMuCj4+IAo+PiBBaCwgdGhhdCdzIHBhcnQgb2YgdGhlIGRlLWFsbG9jYXRpb24gcG9ydGlvbiBv
ZiB0aGUgY29kZSwgd2hpY2ggSSd2ZQo+PiBwcmV2aW91c2x5IGluZGljYXRlZCB3b3VsZCBuZWVk
IHRvIGJlIHNraXBwZWQgaW4gdGhlIGNhc2UgaGVyZS4KPj4gCj4+Pj4gSW4gdGhlIGVuZCBpdCdz
IGFjdHVhbGx5IHF1aXRlIHRoZSBvcHBvc2l0ZSB0aGF0IEknbSB0aGlua2luZzogRm9yCj4+Pj4g
dGhlIGNhbGxlciBpdCBzaG91bGRuJ3QsIGZvciBleGFtcGxlLCBtYXR0ZXIgd2hldGhlciB0aGUK
Pj4+PiByZXF1ZXN0ZWQgcGFnZSB3YXMgcGFnZWQgb3V0LiBXZSB3b3VsZG4ndCBldmVuIGNhbGwK
Pj4+PiBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlKCkgaW4gdGhhdCBjYXNlLCB3aGlsZQo+Pj4+
IGd1ZXN0X3JlbW92ZV9wYWdlKCkgd291bGQgdGFrZSBjYXJlIG9mIGl0Lgo+Pj4KPj4+IEJ1dCB0
aG9zZSBwYWdlcyBzaG91bGQgbmV2ZXIgYmUgcmVtb3ZlZCB2aWEgcGh5c21hcCwgSSBhbSBjb3Jy
ZWN0Pwo+PiAKPj4gVGhlIGd1ZXN0IGlzIHVuYXdhcmUgb2YgcGFnaW5nLCBzbyBhcyBsb25nIGFz
IGl0J3MgcGVybWl0dGVkIHRvCj4+IHVzZSB0aGlzIGh5cGVyY2FsbCwgaXQgc2hvdWxkIG1ha2Ug
bm8gZGlmZmVyZW5jZSB0byBpdCB3aGV0aGVyIGEKPj4gcGFnZSBpcyBhY3R1YWxseSBpbiBtZW1v
cnkgYXQgdGhlIHRpbWUgaXQgaXNzdWVzIHRoaXMgaHlwZXJjYWxsLgo+IAo+IFdlbGwsIEkgb25s
eSBhZ3JlZSB3aXRoIHRoYXQgc3RhdGVtZW50IGlmIGl0IGlzIHBvc3NpYmxlIHRvIG1hcCBwYWdl
IAo+IHRoYXQgY2FuIGJlIHBhZ2Ugb3V0IHdpdGggb25lIG9mIHRoZSBwaHlzbWFwIGh5cGVyY2Fs
bC4KPiAKPiBJZiBpdCBpcyBub3QgcG9zc2libGUsIHRoZW4gSSBkb24ndCB0aGluayB3ZSBzaG91
bGQgYWxsb3cgdGhlIGd1ZXN0IHRvIAo+IHJlbW92ZSB0aG9zZSBwYWdlcy4KCkZyb20gdGhlIGxv
b2tzIG9mIGl0IFhFTk1BUFNQQUNFX2dtZm4gbWFwcGluZyB3b3VsZCBzaW1wbHkKZmFpbCBmb3Ig
cGFnZWQtb3V0IHBhZ2VzLiBIZW5jZSBvbiBvbmUgaGFuZCBJIGFncmVlIHdpdGggeW91CnRoYXQg
ImFkZCIgYW5kICJyZW1vdmUiIHNob3VsZCBhY3Qgc2ltaWxhcmx5LiBPdG9oIHRob3VnaCBJCnRo
aW5rIHdlJ2Qgd2lkZW4gYSBwcm9ibGVtIGhlcmUsIGJlY2F1c2UgdG8gbWUgaXQgbG9va3MgbGlr
ZQpwYXNzaW5nIGEgR0ZOIG9mIGEgcGFnZWQgb3V0IHBhZ2UgdG8gYWRkLXRvLXBoeXNtYXAgc2hv
dWxkCndvcmsgKGFuZCB0cmFuc3BhcmVudGx5IHRvIHRoZSBndWVzdCkuCgo+IE9uZSBvZiBteSBt
YWluIGNvbmNlcm4gaXMgYSBndWVzdCB0cnlpbmcgdG8gbWlzdGFrZW5seSB1c2UgCj4gWEVOTUVN
X3JlbW92ZV9mcm9tX3BoeXNtYXAgcmF0aGVyIFhFTk1FTV9kZWNyZWFzZV9yZXNlcnZhdGlvbi4g
SUlVQyB5b3VyIAo+IHBvaW50IGFib3ZlLCB0aGUgZm9ybWVyIHdvdWxkIG5vdCBkbyBkZS1hbGxv
Y2F0aW9uLiBTbyB5b3Ugd291bGQgZW5kIHVwIAo+IGxvc2luZyB0aGUgcGFnZSBmb3JldmVyICh0
aGVyZSBhcmUgbm8gd2F5IHRvIGdldCB0aGUgcGFnZSBiYWNrIGZvciAKPiBhdXRvLXRyYW5zbGF0
ZWQgZ3Vlc3QpLgoKQ29ycmVjdCAtIHRvIG1lIHRoYXQncyBpbXBsaWVkIGZyb20gdGhlIHN1Yi1m
dW5jdGlvbiBuYW1lLgpKdXN0IGxpa2UgYWRkLXRvLXBoeXNtYXAgZG9lc24ndCBhbGxvY2F0ZSBh
bnl0aGluZywgcmVtb3ZlLQpmcm9tLXBoeXNtYXAgZG9lc24ndCBmcmVlLgoKPiBJIHJlYWxpemUg
dGhlIGlzc3VlIGlzIGFscmVhZHkgcHJlc2VudCAoYXQgbGVhc3Qgb24gQXJtKSB0b2RheS4gQnV0
IGlmIAo+IHdlIHdlcmUgZ29pbmcgdG8gbW9kaWZ5IFhFTk1FX3JlbW92ZV9mcm9tX3BoeXNtYXAs
IHRoZW4gYSBiaXQgbW9yZSAKPiBzYWZldHkgY2hlY2sgdG8gYXZvaWQgYSBndWVzdCBzaG9vdGlu
ZyBpdHMgb3duIGZvb3Qgd291bGQgYmUgdXNlZnVsLgoKSSdtIG5vdCBzdXJlIEkgc2VlIHdheXMg
b2YgcHJvcGVybHkgY2hlY2tpbmcgZm9yIHN1Y2gKc2l0dWF0aW9ucyAtIHJpZ2h0IGFmdGVyIGFu
eSBzdWNoIGNoZWNrIHRoZSBpbmZvcm1hdGlvbiBnYXRoZXJlZAptaWdodCBhbHJlYWR5IGJlIHN0
YWxlLiBBbmQgSSBkb24ndCB0aGluayB3ZSBnbyB0byBncmVhdCBsZW5ndGhzCnRvIHByZXZlbnQg
Z3Vlc3RzIHNob290aW5nIHRoZW1zZWx2ZXMgaW4gdGhlIGZvb3QgYnkgb3RoZXIKbWVhbnMuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
