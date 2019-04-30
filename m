Return-Path: <SRS0=9ImI=TA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6579AC43219
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 08:44:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3884A21734
	for <xen-devel@archiver.kernel.org>; Tue, 30 Apr 2019 08:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3884A21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLONE-0001Jy-Vf; Tue, 30 Apr 2019 08:44:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLOND-0001Jt-I0
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 08:44:23 +0000
X-Inumbo-ID: 2640428b-6b24-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2640428b-6b24-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 08:44:22 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 02:44:21 -0600
Message-Id: <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 02:44:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
In-Reply-To: <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
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
Message-ID: <20190430084419.UnGj50IodnlLKMnTPwsYQTtaR8Or_rIzWp0o4hddVdQ@z>

Pj4+IE9uIDMwLjA0LjE5IGF0IDEwOjI4LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMToxNSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMjkuMDQuMTkgYXQgMTg6MzUsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPj4gPiBPbiBNb24sIEFwciAyOSwgMjAxOSBhdCA5OjE4IEFNIEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+ID4+ID4+PiBPbiAyNi4wNC4x
OSBhdCAxOToyMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiA+PiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS5jCj4+ID4+ID4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4gPj4gPiBA
QCAtMjAzMCwxMiArMjAzMCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgCj4gY3VycmVudF9sb2Nr
ZWRfcGFnZV9uZV9jaGVjayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKSB7Cj4+ID4+ID4gICNkZWZp
bmUgY3VycmVudF9sb2NrZWRfcGFnZV9uZV9jaGVjayh4KSB0cnVlCj4+ID4+ID4gICNlbmRpZgo+
PiA+PiA+Cj4+ID4+ID4gLWludCBwYWdlX2xvY2soc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKPj4g
Pj4gPiArI2lmIGRlZmluZWQoQ09ORklHX1BWKSB8fCBkZWZpbmVkKENPTkZJR19IQVNfTUVNX1NI
QVJJTkcpCj4+ID4+ID4gK3N0YXRpYyBpbnQgX3BhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpw
YWdlKQo+PiA+Pgo+PiA+PiBBcyBwZXIgYWJvdmUsIHBlcnNvbmFsbHkgSSdtIGFnYWluc3QgaW50
cm9kdWNpbmcKPj4gPj4gcGFnZV97LHVufWxvY2tfbWVtc2hyKCksIGFzIHRoYXQgbWFrZXMgdGhl
IGFidXNlIGV2ZW4gbW9yZQo+PiA+PiBsb29rIGxpa2UgcHJvcGVyIHVzZS4gQnV0IGlmIHRoaXMg
d2FzIHRvIGJlIGtlcHQgdGhpcyB3YXksIG1heSBJCj4+ID4+IGFzayB0aGF0IHlvdSBzd2l0Y2gg
aW50IC0+IGJvb2wgaW4gdGhlIHJldHVybiB0eXBlcyBhdCB0aGlzIG9jY2FzaW9uPwo+PiA+Cj4+
ID4gU3dpdGNoaW5nIHRoZW0gdG8gYm9vbCB3b3VsZCBiZSBmaW5lLiBSZXBsYWNpbmcgdGhlbSB3
aXRoIHNvbWV0aGluZwo+PiA+IHNhbmVyIGlzIHVuZm9ydHVuYXRlbHkgb3V0LW9mLXNjb3BlIGF0
IHRoZSBtb21lbnQuIFVubGVzcyBzb21lb25lIGhhcwo+PiA+IGEgc3BlY2lmaWMgc29sdXRpb24g
dGhhdCBjYW4gYmUgcHV0IGluIHBsYWNlLiBJIGRvbid0IGhhdmUgb25lLgo+Pgo+PiBJJ3ZlIG91
dGxpbmVkIGEgc29sdXRpb24gYWxyZWFkeTogTWFrZSBhIG1lbS1zaGFyaW5nIHByaXZhdGUgdmFy
aWFudAo+PiBvZiBwYWdlX3ssdW59bG9jaygpLCBkZXJpdmVkIGZyb20gdGhlIFBWIG9uZXMgKGJ1
dCB3aXRoIHBpZWNlcwo+PiBkcm9wcGVkIHlvdSBkb24ndCB3YW50L25lZWQpLgo+IAo+IFdlbGws
IHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBpbiB0aGlzIHBhdGNoLiBObz8KCk5vIC0g
eW91J3ZlIHJldGFpbmVkIGEgc2hhcmVkIF9wYWdlX3ssdW59bG9jaygpLCB3aGVyZWFzIG15CnN1
Z2dlc3Rpb24gd2FzIHRvIGhhdmUgYSBjb21wbGV0ZWx5IGluZGVwZW5kZW50IHBhaXIgb2YKZnVu
Y3Rpb25zIGluIG1lbV9zaGFyaW5nLmMuIFRoZSBvbmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBW
CmFuZCBIVk0gd291bGQgdGhlbiBiZSB0aGUgUEdUX2xvY2tlZCBmbGFnLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
