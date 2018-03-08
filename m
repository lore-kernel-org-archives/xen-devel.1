From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 21/57] ARM: GICv2: extend LR read/write
 functions to cover EOI and source
Date: Thu, 8 Mar 2018 16:59:16 +0000
Message-ID: <9db7712a-1ce3-7639-9cd7-55e3114bc784@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-22-andre.przywara@linaro.org>
 <d5832a3c-3178-564e-ffc9-5dbcdd86cb0a@arm.com>
 <9e412941-f2c3-c8cf-ef5f-39871ab2ea70@linaro.org>
 <903414f0-cfdc-e828-2eb0-a4e05df5655f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ui9k=f6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etyt6-0002Bj-0o
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 16:59:28 +0000
In-Reply-To: <903414f0-cfdc-e828-2eb0-a4e05df5655f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8wOC8yMDE4IDA0OjQxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4g
T24gMDgvMDMvMTggMTY6MjUsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBPbiAwNi8wMy8xOCAx
NjowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gT24gMDUvMDMvMTggMTY6MDMsIEFuZHJlIFBy
enl3YXJhIHdyb3RlOgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5o
IGIveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAo+Pj4+IGluZGV4IDhmYWI0NThkN2YuLjg5YTA3
YWU2YjQgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAo+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPj4+PiBAQCAtMjIzLDkgKzIyMywxMSBAQCBz
dHJ1Y3QgZ2ljX2xyIHsKPj4+PiDCoMKgwqDCoMKgIC8qIFZpcnR1YWwgSVJRICovCj4+Pj4gwqDC
oMKgwqDCoCB1aW50MzJfdCB2aXJxOwo+Pj4+IMKgwqDCoMKgwqAgdWludDhfdCBwcmlvcml0eTsK
Pj4+PiAtwqDCoCB1aW50OF90IHN0YXRlOwo+Pj4+IC3CoMKgIHVpbnQ4X3QgaHdfc3RhdHVzOwo+
Pj4+IC3CoMKgIHVpbnQ4X3QgZ3JwOwo+Pj4+ICvCoMKgIHVpbnQ4X3Qgc291cmNlOwo+Pj4+ICvC
oMKgIHVpbnQ4X3Qgc3RhdGU6MjsKPj4+PiArwqDCoCB1aW50OF90IGh3X3N0YXR1czoxOwo+Pj4+
ICvCoMKgIHVpbnQ4X3QgZ3JwOjE7Cj4+Pj4gK8KgwqAgdWludDhfdCBlb2k6MTsKPj4+Cj4+PiBJ
IHdvdWxkIG11Y2ggcHJlZmVyIHRvIGludHJvZHVjZSBhbiB1bmlvbiB3aXRoIHNwZWNpZmljIGlu
Zm9ybWF0aW9uIGZvcgo+Pj4gdGhlIHBoeXNpY2FsIGludGVycnVwdCAoaS5lIEdJQ0hfTFIuSFcg
PSAxKSBpbiBvbmUgc2lkZSBhbmQgcHVyZWx5Cj4+PiB2aXJ0dWFsIGluIHRoZSBvdGhlciBzaWRl
Lgo+Pgo+PiBGZWVsIGZyZWUgdG8gc2VuZCBhIHBhdGNoIDstKQo+IAo+IEZlZWwgZnJlZSB0byBm
aW5kIHNvbWVvbmUgZWxzZSBhY2tpbmcgeW91ciBwYXRjaCA7KS4KPiAKPj4gRm9yIG15IHBhcnQg
SSBqdXN0IHdhbnRlZCB0byBhZGQgdGhlIHR3byBiaXRzIEkgbmVlZCwgd2l0aG91dAo+PiBpbnRy
b2R1Y2luZyBhbnkgZnJhZ2lsZSBhc3N1bXB0aW9ucyBhbmQgY29kZSBjaGFuZ2VzIGFib3V0IHdo
aWNoIGZpZWxkcwo+PiBhcmUgdXNlZCBleGNsdXNpdmVseSB3aXRoIG90aGVycyBhbmQgd2hpY2gg
bm90Lgo+PiBJIGZpZ3VyZWQgdGhhdCBJIGNhbiBqdXN0IGJlIGEgKnVzZXIqIG9mIHRoaXMgZXhp
c3RpbmcgaW50ZXJmYWNlLAo+PiBleHRlbmRpbmcgaXQgYXMgbmVlZGVkLCBidXQgbm90IHRpbmtl
cmluZyB0b28gbXVjaC4gV2hpY2ggd2FzIHdoYXQKPj4gU3RlZmFubyBhc2tlZCBmb3IuCj4+IFRv
IHRoYXQgZXh0ZW50IG9uZSBjb3VsZCBhcmd1ZSB0byBqdXN0IHJldXNlIHRoZSBleGlzdGluZyBH
SUN2MyBMUgo+PiBmb3JtYXQgZGlyZWN0bHksIHdoaWNoIHNob3VsZCBiZSBhIHN1cGVyc2V0IG9m
IHRoZSBHSUN2MiBmb3JtYXQuIE5vdAo+PiBzdXJlIHRoYXQgdGhpcyBpcyB1c2VmdWwsIHRob3Vn
aC4KPiAKPiBXaGlsZSBJIGFncmVlIHRoYXQgaW50ZXJmYWNlIHNob3VsZCBub3QgYmUgY2hhbmdl
ZCB0b28gbXVjaCwgdGhpcyBuZXcgCj4gY2hhbmdlIGp1c3QgZG9lcyBub3QgbWFrZSBzZW5zZS4g
SXQgbWFrZXMgbW9yZSBjb21wbGljYXRlIGZvciBhIHJlYWRlciAKPiAoZXZlbiBhZnRlciBoYXZp
bmcgcmVhZCB0aGUgc3BlYy4uLikgdG8gdW5kZXJzdGFuZCB3aHkgc29tZSBmaWVsZHMgYXJlIAo+
IG9ubHkgc2V0IGluIGNlcnRhaW4gY2lyY3Vtc3RhbmNlLiBTbyBmcm9tIG15IHNpZGUsIHRoaXMg
aXMgYSBOYWNrLgoKRm9yIGNsYXJpdHk6CgpOYWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
