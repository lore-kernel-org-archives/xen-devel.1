From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
Date: Tue, 28 May 2019 18:29:22 +0100
Message-ID: <c168a492-8762-5604-0f80-83be4740089e@citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
 <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
 <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
 <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
 <423c2750-ca33-501f-cdc2-988bb58038b6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9env=T4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hVfuk-0005uw-J2
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 17:29:30 +0000
In-Reply-To: <423c2750-ca33-501f-cdc2-988bb58038b6@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8yMC8xOSA0OjEzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMTAv
MDUvMjAxOSAxNDoyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+Pgo+PiBPbiAxMC8wNS8yMDE5
IDE0OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjAyLCA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4KPj4+Pgo+Pj4+IE9uIDEwLzA1LzIwMTkg
MTI6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwNy4wNS4xOSBhdCAxNzoxNCwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS9zaGFkb3cvY29tbW9uLmMKPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29t
bW9uLmMKPj4+Pj4+IEBAIC00NzQsNyArNDc0LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNl
X3Jlc3luYyhpbnQgZXZlbnQsCj4+Pj4+PiBtZm5fdCBnbWZuKQo+Pj4+Pj4gwqDCoMKgwqDCoMKg
IGlmICggdGJfaW5pdF9kb25lICkKPj4+Pj4+IMKgwqDCoMKgwqDCoCB7Cj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKiBDb252ZXJ0IGdtZm4gdG8gZ2ZuICovCj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgdW5zaWduZWQgbG9uZyBnZm4gPSBtZm5fdG9fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwgZ21m
bik7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBnZm4gPSBnZm5feChtZm5f
dG9fZ2ZuKGN1cnJlbnQtPmRvbWFpbiwKPj4+Pj4+IGdtZm4pKTsKPj4+Pj4+ICsKPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIF9fdHJhY2VfdmFyKGV2ZW50LCAwLyohdHNjKi8sIHNpemVvZihn
Zm4pLCAmZ2ZuKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4+IENhbid0IHlvdSB1
c2UgZ2ZuX3QgaGVyZSwgYW5kIGhlbmNlIGF2b2lkIHRoZSBnZm5feCgpPyBTYW1lIGFnYWluCj4+
Pj4+IGZ1cnRoZXIKPj4+Pj4gZG93bi4KPj4+PiBCZWNhdXNlIF9fdHJhY2VfdmFyIHdpbGwgZXhw
b3J0IHRoZSB2YWx1ZSB0byB0aGUgZ3Vlc3QuIEkgd2Fzbid0IHN1cmUKPj4+PiB3aGV0aGVyIHdl
Cj4+Pj4gY2FuIHNhZmVseSBjb25zaWRlciB0aGF0IGdmbl90IGlzIGV4YWN0bHkgdGhlIHNhbWUg
YXMgdW5zaWduZWQgbG9uZyBpbgo+Pj4+IGRlYnVnLWJ1aWxkLgo+Pj4KPj4+IEhtbSwgd2VsbCAt
IHNlZSB0aGUgZGVmaW5pdGlvbiBvZiBnZm5fdC4gR2VvcmdlLCB3aGF0IGRvIHlvdSB0aGluaz8K
Pj4KPj4gSSBrbm93IHdoYXQncyB0aGUgY3VycmVudCBkZWZpbml0aW9uLiBNeSBwb2ludCBpcyB3
ZSBuZXZlciBtYWRlIHRoYXQKPj4gYXNzdW1wdGlvbiBiZWZvcmUuIEluIGFsbCBob25lc3R5LCBz
dXJlIGFzc3VtcHRpb24gd291bGQgZGVmaW5pdGVseQo+PiBoZWxwIGluIGEgZmV3IHBsYWNlcywg
YnV0IEkgdGhpbmsgd2Ugb3VnaHQgdG8gc2FmZWd1YXJkIHdpdGgKPj4gQlVJTERfQlVHKC4uLiku
Cj4gCj4gR2VvcmdlLCBkbyB5b3UgaGF2ZSBhbnkgb3BpbmlvbnM/CgpTb3JyeSwgbm90IHN1cmUg
aG93IEkgbWlzc2VkIHRoaXMgcXVlc3Rpb24gZWFybGllci4KClRoZSBfX3RyYWNlX3ZhcigpIGNh
bGwgaGVyZSBpcyBkZXNpZ25lZCB0byBiZSBnZW5lcmljOiB3aGF0ZXZlciB0eXBlIG9yCnNpemUg
Z2ZuIGlzLCBpdCB3aWxsIGNvcHkgdGhlIHdob2xlIHRoaW5nLiAgVHJhY2luZyBpcyBleHBsaWNp
dGx5IG5vdAptZWFudCB0byBiZSBhIHN0YWJsZSBpbnRlcmZhY2UgLS0gdGhlIHRvb2xzdGFjayBu
ZWVkcyB0byB0cmFjayB0aGUKaHlwZXJ2aXNvciBpbiB0ZXJtcyBvZiB3aGF0IGl0J3MgZ29pbmcg
dG8ga2ljayBvdXQuCgpTbywgaGF2aW5nIGdmbiBiZSBhIGdmbl90IGluIHRoaXMgY2FzZSBzaG91
bGQgYmUgZmluZTsgaW4gZmFjdCBpdCBzaG91bGQKYmUgX2JldHRlcl8gdGhhbiB1bnNpZ25lZCBs
b25nLCBzaW5jZSBpZiBnZm5fdCBldmVyIGRvZXMgY2hhbmdlIHNpemUsCnRoZSB0cmFjZSByZWNv
cmQgd2lsbCBjaGFuZ2Ugc2l6ZSBhcHByb3ByaWF0ZWx5LiAgSWYgdGhhdCBoYXBwZW5zLAp4ZW5h
bHl6ZSB3aWxsIG5lZWQgdG8gYmUgbW9kaWZpZWQgdG8gdW5kZXJzdGFuZCBob3cgdG8gZGVhbCB3
aXRoIHRoZSBuZXcKc2l6ZSwgYnV0IHRoYXQncyBleHBlY3RlZC4KCkFsbCB0aGF0IHRvIHNheTog
aXQgbG9va3MgbGlrZSBKYW4ncyBzdWdnZXN0aW9uIG9mIGhhdmluZyBnZm5fdCBoZXJlCndvdWxk
IGJlIGJldHRlci4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
