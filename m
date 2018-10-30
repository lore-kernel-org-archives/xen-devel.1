From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5] arch/x86: Add registers to vm_event
Date: Tue, 30 Oct 2018 14:26:12 +0200
Message-ID: <c3323148-9cfb-3b69-59cc-aaaa012be1ff@bitdefender.com>
References: <20181030100651.19975-1-aisaila@bitdefender.com>
 <5BD8418902000078001F644F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2zng=nk=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gHT6A-00037o-K2
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 12:26:18 +0000
In-Reply-To: <5BD8418902000078001F644F@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, aisaila@bitdefender.com, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMzAvMTggMTozMyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzAuMTAuMTgg
YXQgMTE6MDcsIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9l
dmVudC5oCj4+IEBAIC0yOSw3ICsyOSw3IEBACj4+ICAKPj4gICNpbmNsdWRlICJ4ZW4uaCIKPj4g
IAo+PiAtI2RlZmluZSBWTV9FVkVOVF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDAzCj4+ICsj
ZGVmaW5lIFZNX0VWRU5UX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMDQKPj4gIAo+PiAgI2lm
IGRlZmluZWQoX19YRU5fXykgfHwgZGVmaW5lZChfX1hFTl9UT09MU19fKQo+PiAgCj4+IEBAIC0x
NTcsNiArMTU3LDEyIEBACj4+ICAjZGVmaW5lIFZNX0VWRU5UX1g4Nl9DUjQgICAgMgo+PiAgI2Rl
ZmluZSBWTV9FVkVOVF9YODZfWENSMCAgIDMKPj4gIAo+PiArLyogVGhlIGxpbWl0IGZpZWxkIGlz
IHJpZ2h0LXNoaWZ0ZWQgYnkgMTIgYml0cyBpZiAuYXIuZyBpcyBzZXQuICovCj4+ICtzdHJ1Y3Qg
eDg2X3NlbGVjdG9yX3JlZyB7Cj4gCj4gSSdtIHNvcnJ5IGZvciBub3QgaGF2aW5nIG5vdGljZWQg
dGhpcyBlYXJsaWVyLCBidXQgdGhpcyBuZWVkcyBwcm9wZXIKPiBwcmVmaXhpbmc6IE1hdGNoaW5n
IHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiwgaXQgc2hvdWxkIGF0IGxlYXN0Cj4gYmUgcHJlZml4
ZWQgYnkgdm1fZXZlbnRfLiBTdHJpY3RseSBzcGVha2luZyB4ZW5fIGFzIHRoZSB2ZXJ5Cj4gZmly
c3QgdGhpbmcgd291bGQgYWxzbyBiZSByZXF1aXJlZCwgYnV0IEknbGwgbGVhdmUgdGhhdCB0byB0
aGUgVk0KPiBldmVudCBtYWludGFpbmVycyB0byBkZWNpZGUuIFdpdGggdGhpcwo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJIGFtIGZpbmUgd2l0aCBlaXRo
ZXIgYXBwcm9hY2ggKHNvIGxlYXZpbmcgaXQgYXMgaXQgaXMgbm90IGEgcHJvYmxlbSksCnNvIHdl
J2xsIGdvIHdpdGggVGFtYXMnIHByZWZlcmVuY2UuIFRhbWFzLCB3aGF0J3MgeW91ciBvcGluaW9u
PwoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
