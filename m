From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Wed, 13 Mar 2019 17:42:16 +0000
Message-ID: <bb89269c-5b4d-98d1-40b6-03f772e2d7b3@arm.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
 <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
 <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
 <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ZEN=RQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h47tT-0001Tu-Ph
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 17:42:19 +0000
In-Reply-To: <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTMvMDMvMjAxOSAxNzozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAxMy8wMy8yMDE5IDE1OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMuMDMuMTkg
YXQgMTY6NDgsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBP
biAxMy8wMy8yMDE5IDE1OjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAxMy4wMy4x
OSBhdCAxNjoyNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4gT24gMTMvMDMv
MjAxOSAxNToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxOC4wMi4xOSBhdCAx
MjozNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4+PiAtLS0gYS94ZW4vaW5j
bHVkZS9hc20tYXJtL21tLmgKPj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgK
Pj4+Pj4+PiBAQCAtMzIxLDEwICszMjEsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9m
cm9tX2d2YShzdHJ1Y3QgdmNwdSAqdiwKPj4+IHZhZGRyX3QgdmEsCj4+Pj4+Pj4gICAgICNkZWZp
bmUgU0hBUkVEX00yUF9FTlRSWSAgICAgICAgICh+MFVMIC0gMVVMKQo+Pj4+Pj4+ICAgICAjZGVm
aW5lIFNIQVJFRF9NMlAoX2UpICAgICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQo+
Pj4+Pj4+ICAgICAKPj4+Pj4+PiAtLyogWGVuIGFsd2F5cyBvd25zIFAyTSBvbiBBUk0gKi8KPj4+
Pj4+PiArLyogV2UgZG9uJ3QgaGF2ZSBhIE0yUCBvbiBBcm0gKi8KPj4+Pj4+PiAgICAgI2RlZmlu
ZSBzZXRfZ3Bmbl9mcm9tX21mbihtZm4sIHBmbikgZG8geyAodm9pZCkgKG1mbiksICh2b2lkKShw
Zm4pOyB9Cj4+PiB3aGlsZSAoMCkKPj4+Pj4+PiAtI2RlZmluZSBtZm5fdG9fZ21mbihfZCwgbWZu
KSAgKG1mbikKPj4+Pj4+IFNvIGlzIHRoZSBwbGFuIHRvIHJlbW92ZSB0aGUgb3RoZXIgbWFjcm8g
ZnJvbSBBcm0gdGhlbiBhcyB3ZWxsPwo+Pj4+PiBEbyB5b3UgbWVhbiBtZm5fdG9fZ2ZuPyBJZiBz
byBpdCBkb2VzIG5vdCBleGlzdCBvbiBBcm0uCj4+Pj4gTm8sIEkgbWVhbiB0aGUgb25lIGluIGNv
bnRleHQgYWJvdmUgLSBzZXRfZ3Bmbl9mcm9tX21mbigpLgo+Pj4gSXQgaXMgdXNlZCBpbiBjb21t
b24gY29kZSwgc28gd2Ugd291bGQgbmVlZCB0byAjaWRlZiB0aGUgY2FsbGVyLgo+PiBIbW0sIHJp
Z2h0LCBzdWNoICNpZmRlZi1hcnkgd291bGQgYmUgdW5kZXNpcmFibGUgKGFuZCB0d28gb3V0IG9m
Cj4+IHRoZSB0aHJlZSBjb21tb24gY29kZSBjYWxsZXJzIHdvdWxkIG5lZWQgaXQuCj4+Cj4+PiBJ
IHRoaW5rIGl0IGlzIGJldHRlciB0byBwcm92aWRlIGEgTk9QIGltcGxlbWVudGF0aW9uLiBDb3Vs
ZCBiZSBtb3ZlZCBzb21ld2hlcmUKPj4+IGluIHRoZSBjb21tb24gaGVhZGVyIHRob3VnaC4gQW55
IG9waW5pb25zPwo+PiBUaGlzIHdvdWxkIHBlcmhhcHMgYmUgYmV0dGVyLCBub3cgdGhhdCB5b3Ug
aGF2ZSBIQVZFX00yUC4KPiAKPiBHaXZlbiB0aGF0ICJoYXZpbmcgYW4gTTJQIiBpcyBub3cgYW4g
eDg2LXNwZWNpZmljIGNvbmNlcHQsIEkgdGhpbmsKPiBwaGFzaW5nIHNldF9ncGZuX2Zyb21fbWZu
KCkncyB1c2Ugb3V0IG9mIGNvbW1vbiBjb2RlIGlzIHRoZSB3YXkgdG8gZ28uCgpTbyB5b3UgbmV2
ZXIgZXhwZWN0IG90aGVyIGFyY2hpdGVjdHVyZSB0byB1c2UgdGhlIE0yUD8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
