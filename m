Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2FDC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:51:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948FF20830
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 09:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948FF20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDnOy-00085x-2Y; Tue, 09 Apr 2019 09:50:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDnOx-00085s-8z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:50:47 +0000
X-Inumbo-ID: f291339d-5aac-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f291339d-5aac-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 09:50:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0801680D;
 Tue,  9 Apr 2019 02:50:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D7123F59C;
 Tue,  9 Apr 2019 02:50:44 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <942c2ec5-69dc-634b-0935-b8713506d32e@arm.com>
 <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
 <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
 <5CAB5ACC0200007800225693@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <303adcc7-de60-f264-67f2-7bd05b2c4bec@arm.com>
Date: Tue, 9 Apr 2019 10:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CAB5ACC0200007800225693@prv1-mh.provo.novell.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409095042.ZdLXQ26WDd2TTvpmDqd25YFCzilNR1Eim8bpd-9kSlY@z>

SGksCgpPbiAwOC8wNC8yMDE5IDE1OjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwOC4w
NC4xOSBhdCAxMzo0NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gNC8yLzE5
IDU6MTAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDIuMDQuMTkgYXQgMTI6MjYs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMDUvMDMvMjAxOSAxMzoyOCwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IFRoZSBjb21taXQgcmUtaW50cm9kdWNpbmcgaXQgKDE0
ZWIzYjQxZDAgWyJ4ZW46IHJlaW5zdGF0ZSBwcmV2aW91c2x5Cj4+Pj4+IHVudXNlZCBYRU5NRU1f
cmVtb3ZlX2Zyb21fcGh5c21hcCBoeXBlcmNhbGwiXSkgYXMgd2VsbCBhcyB0aGUgb25lIGhhdmlu
Zwo+Pj4+PiBvcmlnaW5hbGx5IGludHJvZHVjZWQgaXQgKGQ4MThmM2NiN2MgWyJodm06IFVzZSBt
YWluIG1lbW9yeSBmb3IgdmlkZW8KPj4+Pj4gbWVtb3J5Il0pIGFuZCB0aGUgb25lIHRoZW4gcHVy
Z2luZyBpdCBhZ2FpbiAoNzhjMzA5N2U0ZiBbIlJlbW92ZSB1bnVzZWQKPj4+Pj4gWEVOTUVNX3Jl
bW92ZV9mcm9tX3BoeXNtYXAiXSkgbWFrZSBjbGVhciB0aGF0IHRoaXMgb3BlcmF0aW9uIGlzIGlu
dGVuZGVkCj4+Pj4+IGZvciB1c2Ugb24gSFZNIChpLmUuIHRyYW5zbGF0ZWQpIGd1ZXN0cyBvbmx5
LiBSZXN0cmljdCBpdCBhdCBsZWFzdCBhcwo+Pj4+PiBtdWNoLCBiZWNhdXNlIGZvciBQViBndWVz
dHMgZG9jdW1lbnRhdGlvbiAoaW4gdGhlIHB1YmxpYyBoZWFkZXIpIGRvZXMKPj4+Pj4gbm90IGV2
ZW4gbWF0Y2ggdGhlIGltcGxlbWVudGF0aW9uOiBJdCB0YWxrcyBhYm91dCBHUEZOIGFzIGlucHV0
LCBidXQKPj4+Pj4gZ2V0X3BhZ2VfZnJvbV9nZm4oKSBhc3N1bWVzIGEgR01GTiBpbiB0aGUgbm9u
LXRyYW5zbGF0ZWQgY2FzZSAoYW5kIGhhbmRzCj4+Pj4+IGJhY2sgdGhlIHZhbHVlIHBhc3NlZCBp
bikuCj4+Pj4+Cj4+Pj4+IEFsc28gbGlmdCB0aGUgY2hlY2sgaW4gWEVOTUVNX2FkZF90b19waHlz
bWFweyxfYmF0Y2h9IGhhbmRsaW5nIHVwCj4+Pj4+IGRpcmVjdGx5IGludG8gdG9wIGxldmVsIGh5
cGVyY2FsbCBoYW5kbGluZywgYW5kIGNsYXJpZnkgdGhpbmdzIGluIHRoZQo+Pj4+PiBwdWJsaWMg
aGVhZGVyIGFjY29yZGluZ2x5Lgo+Pj4+Pgo+Pj4+PiBUYWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNv
IHJlcGxhY2UgYSBwb2ludGxlc3MgdXNlIG9mICJjdXJyZW50IiB3aXRoIGEKPj4+Pj4gbW9yZSBl
ZmZpY2llbnQgdXNlIG9mIGFuIGV4aXN0aW5nIGxvY2FsIHZhcmlhYmxlIChvciBmdW5jdGlvbiBw
YXJhbWV0ZXIKPj4+Pj4gdG8gYmUgcHJlY2lzZSkuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IFRCRDogSXQg
Y291bGQgYmUgZnVydGhlciByZXN0cmljdGVkLCBkaXNhbGxvd2luZyBpdHMgdXNlIGJ5IGEgSFZN
IGd1ZXN0Cj4+Pj4+ICAgICAgICAgb24gaXRzZWxmLgo+Pj4+Cj4+Pj4gQnkgSFZNIGd1ZXN0LCBk
byB5b3UgcmVmZXIgdG8gYW55IGF1dG8tdHJhbnNsYXRlZCBndWVzdD8KPj4+Cj4+PiBZZXMgLSBz
b3JyeSBmb3IgdXNpbmcgYW4geDg2IHRlcm0uCj4+Pgo+Pj4+IFRoZSBpbnRlcmZhY2UgWEVOTUVf
cmVtb3ZlX2Zyb21fcGh5c21hcCBpcyB1c2VkIGJ5IEFybSB0byByZW1vdmUgZm9yZWlnbgo+Pj4+
IG1hcHBpbmdzIGZyb20gaXRzIHAybS4gVGhlcmUgYXJlIHBvdGVudGlhbGx5IG90aGVyIHNwYWNl
IHdpdGggc2ltaWxhciBjYXNlCj4+Pj4gKGUuZyBncmFudC10YWJsZS4uLikuCj4+Pgo+Pj4gT2gs
IEkgc2VlIC0gdGhpcyBvcHRpb24gZ29lcyBhd2F5IHRoZW4uCj4+Pgo+Pj4+PiBUQkQ6IElzIHVz
aW5nIFAyTV9BTExPQyBoZXJlIHJlYWxseSBhcHByb3ByaWF0ZT8gSXQgbWVhbnMgZS5nLgo+Pj4+
PiAgICAgICAgIHBvaW50bGVzc2x5IHBvcHVsYXRpbmcgYSBQb0Qgc2xvdCBqdXN0IHRvIHVucG9w
dWxhdGUgaXQgYWdhaW4gcmlnaHQKPj4+Pj4gICAgICAgICBhd2F5LCB3aXRoIHRoZSBwYWdlIHRo
ZW4gZnJlZSBmbG9hdGluZywgaS5lLiBubyBsb25nZXIgYXZhaWxhYmxlCj4+Pj4+ICAgICAgICAg
Zm9yIHVzZSB0byByZXBsYWNlIGFub3RoZXIgUG9EIHNsb3QsIGFuZCAoYWZhaWN0KSBubyBsb25n
ZXIKPj4+Pj4gICAgICAgICBhY2Nlc3NpYmxlIGJ5IHRoZSBndWVzdCBpbiBhbnkgd2F5Lgo+Pj4+
PiBUQkQ6IElzIHVzaW5nIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKSBoZXJlIHJlYWxseSBh
cHByb3ByaWF0ZT8gSXQKPj4+Pj4gICAgICAgICBtZWFucyB0aGF0IGUuZy4gTU1JTyBwYWdlcyB3
b3VsZG4ndCBiZSByZW1vdmVkLiBHb2luZyB0aHJvdWdoCj4+Pj4+ICAgICAgICAgZ3Vlc3RfcmVt
b3ZlX3BhZ2UoKSAod2hpbGUgc2tpcHBpbmcgdGhlIGRlLWFsbG9jYXRpb24gc3RlcCkgd291bGQK
Pj4+Pj4gICAgICAgICBzZWVtIG1vcmUgYXBwcm9wcmlhdGUgdG8gbWUsIHdoaWNoIHdvdWxkIGFk
ZHJlc3MgdGhlIFAyTV9BTExPQwo+Pj4+PiAgICAgICAgIGFzcGVjdCBhYm92ZSBhcyB3ZWxsLgo+
Pj4+Cj4+Pj4gSG93IGlzIHRoYXQgYW4gaXNzdWU/IERvZXMgWEVOTUVNX2FkZF90b19waHlzbWFw
IGFsbG93cyB5b3UgdG8gbWFwIE1NSU8KPj4+PiBwYWdlcz8KPj4+Cj4+PiBXZWxsLCB0aGVyZSdz
IFhFTk1BUFNQQUNFX2Rldl9tbWlvIHdoaWNoIHhhdHAgaGFuZGxlcy4gQnV0Cj4+PiBwZXJoYXBz
IHRoZSBNTUlPIGV4YW1wbGUgaXMgbW9yZSBjb25mdXNpbmcgdGhhbiBoZWxwZnVsLiBUaGUKPj4+
IHF1ZXN0aW9uIHJlYWxseSBqdXN0IGlzIHdoZXRoZXIgZ3Vlc3RfcmVtb3ZlX3BhZ2UoKSBzaG91
bGRuJ3QKPj4+IGJlIHVzZWQgaGVyZSBpbnN0ZWFkIG9mIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3Bh
Z2UoKQo+PiBkZS1hbGxvY2F0aW9uIHN0ZXAgYXNpZGUsIEkgYW0gbm90IHJlYWxseSBjb252aW5j
ZWQgeW91IGNhbiByZXVzZQo+PiBndWVzdF9yZW1vdmVfcGFnZSgpIGhlcmUuIE9uIHg4NiwgdGhl
IGZ1bmN0aW9uIHdpbGwgbm90IHdvcmsgb24gY2VydGFpbgo+PiBwMm0gdHlwZXMuIElzIGl0IHdo
YXQgd2UgcmVhbGx5IHdhbnQ/Cj4gCj4gSG1tLCBJJ20gY29uZnVzZWQuIEFmYWljcyB0aGUgb25s
eSB0d28gdHlwZXMgaXQgcmVmdXNlcyBhIHJlcXVlc3QKPiBmb3IgYXJlIHAybV9pbnZhbGlkIGFu
ZCBwMm1fbW1pb19kbS4gVGhlc2UgcmVwcmVzZW50IGNhc2VzCj4gd2hlcmUgdGhlcmUncyBubyBw
Mm0gZW50cnkgYW55d2F5LCBpLmUuIG5vdGhpbmcgdG8gcmVtb3ZlLiBBbQo+IEkgcGVyaGFwcyBv
dmVybG9va2luZyBzb21ldGhpbmcgeW91IHNlZT8KPiAKPiBPciBhcmUgeW91IHJlZmVycmluZyB0
byB0aGUgbWZuX2ludmFsaWQoKSBjaGVjayAod2hpY2ggaXNuJ3QgeDg2LQo+IHNwZWNpZmljKT8g
VGhpcyBvdWdodCB0byBiZSBjb3ZlcmVkIGJ5IHRoZSBwMm1faXNfcGFnaW5nKCkgYW5kCj4gcDJt
X21taW9fZGlyZWN0IHNwZWNpYWwgY2FzZXMgYSBmZXcgbGluZXMgdXAgZnJvbSB0aGVyZS4gT3Ro
ZXIKPiBjYXNlcyB3aXRoIGludmFsaWQgTUZOcyB3b3VsZCBpbmRlZWQgcmVwcmVzZW50IGFuIGVy
cm9yIGNvbmRpdGlvbgo+IGltby4KCkkgYW0gcmVmZXJyaW5nIHRvIGdldF9wYWdlKC4uLikgd2hp
Y2ggd291bGQgbm90IHdvcmsgZm9yIGZvcmVpZ24gcGFnZXMuCgo+IAo+IEluIHRoZSBlbmQgaXQn
cyBhY3R1YWxseSBxdWl0ZSB0aGUgb3Bwb3NpdGUgdGhhdCBJJ20gdGhpbmtpbmc6IEZvcgo+IHRo
ZSBjYWxsZXIgaXQgc2hvdWxkbid0LCBmb3IgZXhhbXBsZSwgbWF0dGVyIHdoZXRoZXIgdGhlCj4g
cmVxdWVzdGVkIHBhZ2Ugd2FzIHBhZ2VkIG91dC4gV2Ugd291bGRuJ3QgZXZlbiBjYWxsCj4gZ3Vl
c3RfcGh5c21hcF9yZW1vdmVfcGFnZSgpIGluIHRoYXQgY2FzZSwgd2hpbGUKPiBndWVzdF9yZW1v
dmVfcGFnZSgpIHdvdWxkIHRha2UgY2FyZSBvZiBpdC4KCkJ1dCB0aG9zZSBwYWdlcyBzaG91bGQg
bmV2ZXIgYmUgcmVtb3ZlZCB2aWEgcGh5c21hcCwgSSBhbSBjb3JyZWN0PwoKQW55d2F5LCBndWVz
dF9waHlzbWFwX3JlbW92ZV9wYWdlKCkgd291bGQgbmVlZCBzb21lIHJld29yayB0byBkbyB0aGUg
Y29ycmVjdCAKdGhpbmdzIGZvciBwaHlzbWFwLiBJIHdpbGwgd2FpdCBhbiBzZWUgeW91ciBwYXRj
aCB0byBjb21tZW50LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
