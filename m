From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 18:41:52 +0000
Message-ID: <12975b45-8df4-e140-84d9-e7fcc2cbf763@citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
 <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
 <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
 <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
 <bb89269c-5b4d-98d1-40b6-03f772e2d7b3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tilE=RQ=citrix.com=prvs=968d75336=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h48pG-0006QG-P5
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 18:42:02 +0000
In-Reply-To: <bb89269c-5b4d-98d1-40b6-03f772e2d7b3@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMjAxOSAxNzo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDEzLzAzLzIwMTkgMTc6MzQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDEzLzAzLzIw
MTkgMTU6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTMuMDMuMTkgYXQgMTY6NDgs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAxMy8w
My8yMDE5IDE1OjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4gT24gMTMuMDMuMTkgYXQg
MTY6MjQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+PiBPbiAxMy8wMy8yMDE5
IDE1OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAxMjoz
NiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oCj4+Pj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+
Pj4+Pj4+PiBAQCAtMzIxLDEwICszMjEsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9m
cm9tX2d2YShzdHJ1Y3QKPj4+Pj4+Pj4gdmNwdSAqdiwKPj4+PiB2YWRkcl90IHZhLAo+Pj4+Pj4+
PiDCoMKgwqAgI2RlZmluZSBTSEFSRURfTTJQX0VOVFJZwqDCoMKgwqDCoMKgwqDCoCAofjBVTCAt
IDFVTCkKPj4+Pj4+Pj4gwqDCoMKgICNkZWZpbmUgU0hBUkVEX00yUChfZSnCoMKgwqDCoMKgwqDC
oMKgwqDCoCAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQo+Pj4+Pj4+PiDCoMKgwqAgLS8qIFhl
biBhbHdheXMgb3ducyBQMk0gb24gQVJNICovCj4+Pj4+Pj4+ICsvKiBXZSBkb24ndCBoYXZlIGEg
TTJQIG9uIEFybSAqLwo+Pj4+Pj4+PiDCoMKgwqAgI2RlZmluZSBzZXRfZ3Bmbl9mcm9tX21mbiht
Zm4sIHBmbikgZG8geyAodm9pZCkgKG1mbiksCj4+Pj4+Pj4+ICh2b2lkKShwZm4pOyB9Cj4+Pj4g
d2hpbGUgKDApCj4+Pj4+Pj4+IC0jZGVmaW5lIG1mbl90b19nbWZuKF9kLCBtZm4pwqAgKG1mbikK
Pj4+Pj4+PiBTbyBpcyB0aGUgcGxhbiB0byByZW1vdmUgdGhlIG90aGVyIG1hY3JvIGZyb20gQXJt
IHRoZW4gYXMgd2VsbD8KPj4+Pj4+IERvIHlvdSBtZWFuIG1mbl90b19nZm4/IElmIHNvIGl0IGRv
ZXMgbm90IGV4aXN0IG9uIEFybS4KPj4+Pj4gTm8sIEkgbWVhbiB0aGUgb25lIGluIGNvbnRleHQg
YWJvdmUgLSBzZXRfZ3Bmbl9mcm9tX21mbigpLgo+Pj4+IEl0IGlzIHVzZWQgaW4gY29tbW9uIGNv
ZGUsIHNvIHdlIHdvdWxkIG5lZWQgdG8gI2lkZWYgdGhlIGNhbGxlci4KPj4+IEhtbSwgcmlnaHQs
IHN1Y2ggI2lmZGVmLWFyeSB3b3VsZCBiZSB1bmRlc2lyYWJsZSAoYW5kIHR3byBvdXQgb2YKPj4+
IHRoZSB0aHJlZSBjb21tb24gY29kZSBjYWxsZXJzIHdvdWxkIG5lZWQgaXQuCj4+Pgo+Pj4+IEkg
dGhpbmsgaXQgaXMgYmV0dGVyIHRvIHByb3ZpZGUgYSBOT1AgaW1wbGVtZW50YXRpb24uIENvdWxk
IGJlCj4+Pj4gbW92ZWQgc29tZXdoZXJlCj4+Pj4gaW4gdGhlIGNvbW1vbiBoZWFkZXIgdGhvdWdo
LiBBbnkgb3BpbmlvbnM/Cj4+PiBUaGlzIHdvdWxkIHBlcmhhcHMgYmUgYmV0dGVyLCBub3cgdGhh
dCB5b3UgaGF2ZSBIQVZFX00yUC4KPj4KPj4gR2l2ZW4gdGhhdCAiaGF2aW5nIGFuIE0yUCIgaXMg
bm93IGFuIHg4Ni1zcGVjaWZpYyBjb25jZXB0LCBJIHRoaW5rCj4+IHBoYXNpbmcgc2V0X2dwZm5f
ZnJvbV9tZm4oKSdzIHVzZSBvdXQgb2YgY29tbW9uIGNvZGUgaXMgdGhlIHdheSB0byBnby4KPgo+
IFNvIHlvdSBuZXZlciBleHBlY3Qgb3RoZXIgYXJjaGl0ZWN0dXJlIHRvIHVzZSB0aGUgTTJQPwoK
SSBndWVzcyB0aGF0IGRlcGVuZHMgb24gaG93IGxpa2VseSBpdCBpcyBnb2luZyB0byBiZSB0aGF0
IFhlbiBnYWlucyBhCm5ldyBub24tSFZNLWxpa2UgdmlydHVhbGlzYXRpb24gbW9kZSBvbiBhIG5l
dyBhcmNoaXRlY3R1cmUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
