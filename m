From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/6] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Tue, 06 Mar 2018 00:58:24 -0700
Message-ID: <5A9E583002000078001AED3A@prv-mh.provo.novell.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-2-jgross@suse.com>
 <5A9D81DC02000078001AEB68@suse.com>
 <491a2039-d6ef-cad1-b8f3-191fddf73ccf@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c2h8=f4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1et7UZ-0002OS-QR
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 07:58:35 +0000
In-Reply-To: <491a2039-d6ef-cad1-b8f3-191fddf73ccf@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAzLjE4IGF0IDA4OjAxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
NS8wMy8xOCAxNzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDA5
OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5j
Cj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+Pj4gQEAgLTUwOSw2ICs1MDksOCBAQCB2b2lk
IG1ha2VfY3IzKHN0cnVjdCB2Y3B1ICp2LCBtZm5fdCBtZm4pCj4+PiAgCj4+PiAgdm9pZCB3cml0
ZV9wdGJhc2Uoc3RydWN0IHZjcHUgKnYpCj4+PiAgewo+Pj4gKyAgICBnZXRfY3B1X2luZm8oKS0+
cm9vdF9wZ3RfY2hhbmdlZCA9IHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYm
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIWlzX3B2XzMyYml0
X3ZjcHUodik7Cj4+IAo+PiBXaHkgaXNfcHZfdmNwdSgpIHdoZW4geW91IGFscmVhZHkgY2hlY2sg
aXNfcHZfMzJiaXRfdmNwdSgpPwo+IAo+IEkgY2hlY2sgIWlzX3B2XzMyYml0X3ZjcHUoKSB0byBj
YXRjaCA2NC1iaXQgcHYtZG9tYWlucyBvbmx5LgoKT2gsIEknbSBzb3JyeSAtIEZvciB3aGF0ZXZl
ciByZWFzb24gSSd2ZSBpZ25vcmVkIHRoZSAhIHRoZXJlLgoKPj4gQW5kIGRvbid0IHlvdSBuZWVk
IHRvIGRpc2FsbG93IHVwZGF0aW5nIEw0cyBvZiBydW5uaW5nIGd1ZXN0cyBub3cKPj4gKHdoaWNo
IGlzIGEgYmFkIGlkZWEgYW55d2F5KT8KPiAKPiBZZXMsIEkgc2hvdWxkIGRvIHRoYXQuCgpCdXQg
cGxlYXNlIGRvIHRoaXMgYXMgYSBzZXBhcmF0ZSBjaGFuZ2UsIGFzIHN0cmljdGx5IHNwZWFraW5n
IHRoaXMgaXMKYSBiZWhhdmlvcmFsIGNoYW5nZSB0aGF0IHdlIGNhbid0IGFsbG93LiBCdXQgSSB0
aGluayB3ZSBzaW1wbHkgbmVlZAp0byBhY2NlcHQgdGhpcyAoYW5kIHBlcmhhcHMgdW5pZm9ybWx5
IGZvciBhbGwgcGFnZSB0YWJsZSBsZXZlbHMpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
