From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/6] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Tue, 06 Mar 2018 01:17:45 -0700
Message-ID: <5A9E5CB902000078001AED5D@prv-mh.provo.novell.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-2-jgross@suse.com>
 <5A9D81DC02000078001AEB68@suse.com>
 <491a2039-d6ef-cad1-b8f3-191fddf73ccf@suse.com>
 <5A9E583002000078001AED3A@suse.com>
 <7d252d4e-36ea-b6fa-23c4-2e9d620277e4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=c2h8=f4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1et7nG-0004o9-8h
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 08:17:54 +0000
In-Reply-To: <7d252d4e-36ea-b6fa-23c4-2e9d620277e4@suse.com>
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

Pj4+IE9uIDA2LjAzLjE4IGF0IDA5OjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ni8wMy8xOCAwODo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA2LjAzLjE4IGF0IDA4
OjAxLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDA1LzAzLzE4IDE3OjQzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAwMi4wMy4xOCBhdCAwOToxMywgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+Pj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS5jCj4+Pj4+IEBAIC01MDksNiArNTA5LDggQEAgdm9pZCBtYWtlX2NyMyhz
dHJ1Y3QgdmNwdSAqdiwgbWZuX3QgbWZuKQo+Pj4+PiAgCj4+Pj4+ICB2b2lkIHdyaXRlX3B0YmFz
ZShzdHJ1Y3QgdmNwdSAqdikKPj4+Pj4gIHsKPj4+Pj4gKyAgICBnZXRfY3B1X2luZm8oKS0+cm9v
dF9wZ3RfY2hhbmdlZCA9IHRoaXNfY3B1KHJvb3RfcGd0KSAmJiBpc19wdl92Y3B1KHYpICYmCj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhaXNfcHZfMzJiaXRf
dmNwdSh2KTsKPj4+Pgo+Pj4+IFdoeSBpc19wdl92Y3B1KCkgd2hlbiB5b3UgYWxyZWFkeSBjaGVj
ayBpc19wdl8zMmJpdF92Y3B1KCk/Cj4+Pgo+Pj4gSSBjaGVjayAhaXNfcHZfMzJiaXRfdmNwdSgp
IHRvIGNhdGNoIDY0LWJpdCBwdi1kb21haW5zIG9ubHkuCj4+IAo+PiBPaCwgSSdtIHNvcnJ5IC0g
Rm9yIHdoYXRldmVyIHJlYXNvbiBJJ3ZlIGlnbm9yZWQgdGhlICEgdGhlcmUuCj4+IAo+Pj4+IEFu
ZCBkb24ndCB5b3UgbmVlZCB0byBkaXNhbGxvdyB1cGRhdGluZyBMNHMgb2YgcnVubmluZyBndWVz
dHMgbm93Cj4+Pj4gKHdoaWNoIGlzIGEgYmFkIGlkZWEgYW55d2F5KT8KPj4+Cj4+PiBZZXMsIEkg
c2hvdWxkIGRvIHRoYXQuCj4+IAo+PiBCdXQgcGxlYXNlIGRvIHRoaXMgYXMgYSBzZXBhcmF0ZSBj
aGFuZ2UsIGFzIHN0cmljdGx5IHNwZWFraW5nIHRoaXMgaXMKPj4gYSBiZWhhdmlvcmFsIGNoYW5n
ZSB0aGF0IHdlIGNhbid0IGFsbG93LiBCdXQgSSB0aGluayB3ZSBzaW1wbHkgbmVlZAo+PiB0byBh
Y2NlcHQgdGhpcyAoYW5kIHBlcmhhcHMgdW5pZm9ybWx5IGZvciBhbGwgcGFnZSB0YWJsZSBsZXZl
bHMpLgo+IAo+IEhtbSwgdGhpbmtpbmcgbW9yZSBhYm91dCBpdDogd291bGRuJ3QgaXQgYmUgZW5v
dWdoIHRvIGRvIHRoZSBjaGFuZ2UgYW5kCj4gdGhlbiBzZW5kaW5nIGEgRkxVU0hfUk9PVF9QR1RC
TCB0byB0aGUgdmNwdShzKSB0aGUgYWZmZWN0ZWQgZ3Vlc3QgaXMKPiBydW5uaW5nIG9uPyBUaGlz
IHdvdWxkIGNhdXNlIGEgY3ljbGUgdGhyb3VnaCB0aGUgaHlwZXJ2aXNvciByZXN1bHRpbmcgaW4K
PiBhbiB1cGRhdGVkIHJvb3QgcGFnZSB0YWJsZSBvZiB0aGF0IGd1ZXN0LgoKQWgsIHllcywgb2Yg
Y291cnNlLiBUaGF0IHdhcyB0aGUgaWRlYSBiZWhpbmQgdGhlIG9yaWdpbmFsIGFkZGl0aW9uCm9m
IHRoZSBmbHVzaCBpbnZvY2F0aW9uIGFmdGVyIGFsbC4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
