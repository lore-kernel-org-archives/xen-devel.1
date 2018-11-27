From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1] Increase framebuffer size to todays
 standards
Date: Tue, 27 Nov 2018 09:26:59 +0000
Message-ID: <ce1163a4-35fb-c0a2-4deb-97fa2f348692@arm.com>
References: <20181125191405.3028-1-olaf@aepfle.de>
 <5BFBCB7F02000078001FFD9B@prv1-mh.provo.novell.com>
 <20181126170335.01a6ac58.olaf@aepfle.de>
 <5BFC1C3A02000078002001EA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=by1u=og=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gRZe6-0001qc-3V
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 09:27:06 +0000
In-Reply-To: <5BFC1C3A02000078002001EA@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTEvMjYvMTggNDoxNSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjYuMTEuMTggYXQgMTc6MDMsIDxvbGFmQGFlcGZsZS5kZT4gd3JvdGU6Cj4+IEFtIE1vbiwgMjYg
Tm92IDIwMTggMDM6MzE6MjcgLTA3MDAKPj4gc2NocmllYiAiSmFuIEJldWxpY2giIDxKQmV1bGlj
aEBzdXNlLmNvbT46Cj4+Cj4+PiBBbmQgSSB0aGluayBhIGNoYW5nZSBsaWtlIHRoaXMgc2hvdWxk
IChhKSBhZGRyZXNzIHRoZSBtb3JlIGdlbmVyYWwKPj4+IGNhc2UgcmF0aGVyIHRoYW4ganVzdCB5
b3VyIGxhcHRvcCAob3IgbGFwdG9wcyBpbiBnZW5lcmFsKSBhbmQgKGIpCj4+PiBhY3R1YWxseSBh
ZGQgc29tZSBoZWFkcm9vbS4gSGVuY2UgYXQgdGhlIHZlcnkgbGVhc3QgSSdkIHNlZSB1cwo+Pj4g
Z28gdG8gNDA5NngzMDcyLiBXSFVYR0Egd291bGQgZXZlbiBjYWxsIGZvciA3NjgweDQ4MDAuCj4+
Cj4+IFNvIHNob3VsZCBJIHJlc2VuZCB0aGlzIHBhdGNoIHdpdGggaGlnaGVyIHZhbHVlcywgb3Ig
c2hvdWxkIEkgcmVtb3ZlCj4+IHRoZSBib3VuZHMgY2hlY2sgZW50aXJlbHk/IE5vdCBzdXJlIHdo
YXQgaXQgaXMgdHJ5aW5nIHRvIGFjaGlldmUsIHRoZQo+PiBmcmFtZWJ1ZmZlciBtYXkgZmFpbCBl
aXRoZXIgd2F5IGlmIHRoZSBCSU9TIHByb3ZpZGVzIGJvZ3VzIHZhbHVlcy4KPiAKPiBJIGhhdmUg
dG8gZm9yd2FyZCB0aGlzIHF1ZXN0aW9uOiBTdGVmYW5vIGludHJvZHVjZWQgYWxsIGZpdmUgTUFY
XyoKPiB2YWx1ZXMgaGVyZSB3aGVuIHNwbGl0dGluZyBvdXQgdGhlIExGQiBjb2RlIGluIGNvbW1p
dCBlN2NiMzVlOGIxCj4gKCJ4ZW46IGludHJvZHVjZSBhIGdlbmVyaWMgZnJhbWVidWZmZXIgZHJp
dmVyIikuIEkgYXBwYXJlbnRseSBkaWRuJ3QKPiBldmVuIG5vdGljZSBiYWNrIHRoZW4gdGhhdCB0
aHJlZSBvZiB0aGVtIGFyZSBlbnRpcmVseSB1bnVzZWQsIGFuZAo+IHRoZSB0d28gZGltZW5zaW9u
IG9uZXMgaGFkIG5vIHVwcGVyIGJvdW5kIGJlZm9yZS4KPiAKPiBTdGVmYW5vOiBXaHkgd2VyZSBh
bGwgb2YgdGhlc2UgaW50cm9kdWNlZCAodGhlcmUncyBubyBleHBsYW5hdGlvbgo+IGluIHRoZSBk
ZXNjcmlwdGlvbikgYW5kIHdoYXQgd2VyZSB0aGUgdmFsdWVzIGRlcml2ZWQgZnJvbT8gV2lsbAo+
IGFueXRoaW5nIGJyZWFrIGlmIHdlIHJlbW92ZSB0aGVtPwoKRldJVywgbG9va2luZyBhdCB0aGUg
bG9ncywgdGhpcyB3YXMgaW50cm9kdWNlZCB0byBjYXRlciBhcm0gZnJhbWVidWZmZXIgCmRyaXZl
ci4gSG93ZXZlciwgd2UgZHJvcHBlZCB0aGUgb25seSBkcml2ZXIgYSBmZXcgbW9udGhzIGFnbyBh
cyBpdCB3YXMgCm5vdCBtYWludGFpbmVkLiBTbyB4ODYgaXMgdGhlIG9ubHkgdXNlciBvZiB0aGF0
IGNvZGUgdG9kYXkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
