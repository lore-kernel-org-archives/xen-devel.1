From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 13/17] x86/boot: Calculate the most
 appropriate BTI mitigation to use
Date: Tue, 16 Jan 2018 14:13:27 +0000
Message-ID: <aea3d46f-2577-eada-efd9-a131518187d8@citrix.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-14-git-send-email-andrew.cooper3@citrix.com>
 <9b0f7bd2-ff44-43ec-5f5d-9eff1cd7a32c@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9b0f7bd2-ff44-43ec-5f5d-9eff1cd7a32c@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMTggMTQ6MTAsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiAwMS8xMi8yMDE4
IDAxOjAxIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiAgCj4+ICsgICAgaWYgKCBib290X2Nw
dV9oYXMoWDg2X0ZFQVRVUkVfSUJSU0IpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIC8qCj4+ICsg
ICAgICAgICAqIEV2ZW4gaWYgd2UndmUgY2hvc2VuIHRvIG5vdCBoYXZlIElCUlMgc2V0IGluIFhl
biBjb250ZXh0LCB3ZSBzdGlsbAo+PiArICAgICAgICAgKiBuZWVkIHRoZSBJQlJTIGVudHJ5L2V4
aXQgbG9naWMgdG8gdmlydHVhbGlzZSBJQlJTIHN1cHBvcnQgZm9yCj4+ICsgICAgICAgICAqIGd1
ZXN0cy4KPj4gKyAgICAgICAgICovCj4+ICsgICAgICAgIGlmICggaWJycyApCj4+ICsgICAgICAg
ICAgICBzZXR1cF9mb3JjZV9jcHVfY2FwKFg4Nl9GRUFUVVJFX1hFTl9JQlJTX1NFVCk7Cj4+ICsg
ICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRV
UkVfWEVOX0lCUlNfQ0xFQVIpOwo+PiArICAgIH0KPj4KPiBBcmUgeW91IGdvaW5nIHRvIGFkZCBz
dXBwb3J0IGZvciBJbnRlbCdzICJFbmhhbmNlZCBJQlJTIiAoSSB0aGluayB0aGF0J3MKPiB3aGF0
IHRoZXkgY2FsbCB0aGUgImFsd2F5cyBvbiIgbW9kZSIpPwoKSSdtIG5vdCBnb2luZyB0byB0b3Vj
aCBJQlJTX0FUVCBtb2RlIHVudGlsIEkndmUgZ290IGFuIFNEUCB0byBkZXZlbG9wCmFnYWluc3Qu
CgpHaXZlbiBob3cgbWFueSB0aW1lcyB0aGUgSUJSU19BVFQgc3BlYyBoYXMgY2hhbmdlZCBhbHJl
YWR5LCBJIGhhdmUKbGl0dGxlIGNvbmZpZGVuY2UgdGhhdCBpdCB3aWxsIHJlbWFpbiB1bmNoYW5n
ZWQgcmlnaHQgdG8gdGhlIGV2ZW50dWFsCmhhcmR3YXJlIGFycml2ZXMuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
