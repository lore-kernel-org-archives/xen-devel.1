From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Fix VGA logdirty related display freezes with altp2m
Date: Fri, 19 Oct 2018 00:12:09 +0300
Message-ID: <d13f501e-4d43-2897-c995-badc276c7c68@bitdefender.com>
References: <1539857272-4660-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmTCUqUV264hEjQWABohR42ezHPWBhL0GVT4cKuiDjyGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jzrj=m6=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gDFaX-0002ze-IJ
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 21:12:13 +0000
In-Reply-To: <CABfawhmTCUqUV264hEjQWABohR42ezHPWBhL0GVT4cKuiDjyGg@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTgvMTggMTE6MDggUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBPbiBUaHUsIE9j
dCAxOCwgMjAxOCBhdCA0OjA5IEFNIFJhenZhbiBDb2pvY2FydQo+IDxyY29qb2NhcnVAYml0ZGVm
ZW5kZXIuY29tPiB3cm90ZToKPj4KPj4gSGVsbG8sCj4+Cj4+IFRoaXMgc2VyaWVzIGFpbXMgdG8g
cHJldmVudCB0aGUgZGlzcGxheSBmcm9tIGZyZWV6aW5nIHdoZW4KPj4gZW5hYmxpbmcgYWx0cDJt
IGFuZCBzd2l0Y2hpbmcgdG8gYSBuZXcgdmlldyAoYW5kIGFzc29ydGVkIHByb2JsZW1zCj4+IHdo
ZW4gcmVzaXppbmcgdGhlIGRpc3BsYXkpLgo+Pgo+PiBUaGUgZmlyc3QgcGF0Y2ggcHJvcGFnYXRl
cyBlcHQuYWQgY2hhbmdlcyB0byBhbGwgYWN0aXZlIGFsdHAybXMsCj4+IGFuZCB0aGUgc2Vjb25k
IG9uZSBhbGxvY2F0ZXMgYSBuZXcgbG9nZGlydHkgcmFuZ2VzZXQgZm9yIGVhY2gKPj4gbmV3IGFs
dHAybSwgYW5kIHByb3BhZ2F0ZXMgKHVuZGVyIGxvY2spIGNoYW5nZXMgdG8gYWxsIHAybXMuCj4+
Cj4+IFRoZSBmaXJzdCBwYXRjaCBpcyB0aGUgc2FtZSBhczoKPj4gW1BBVENIIFY0XSB4ODYvYWx0
cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFjdGl2ZSBhbHRwMm1zCj4+IGJ1
dCBhcyBpdCBpcyBub3cgcmVxdWlyZWQgZm9yIHRoZSBzZWNvbmQgb25lIHRvIGFwcGx5IGNsZWFu
bHksIGl0Cj4+IGhhcyBiZWVuIHJlc2VudCBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLgo+Pgo+PiBb
UEFUQ0ggMS8yXSB4ODYvYWx0cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFj
dGl2ZSBhbHRwMm1zCj4+IFtQQVRDSCAyLzJdIHg4Ni9hbHRwMm06IGZpeCBkaXNwbGF5IGZyb3pl
biB3aGVuIHN3aXRjaGluZyB0byBhIG5ldwo+IAo+IEhpIFJhenZhbiwKPiBJIHdvdWxkIGJlIGhh
cHB5IHRvIGdpdmUgdGhpcyBhIHNwaW4sIGNhbiB5b3UgcHVzaCBpdCBhcyBhIGdpdCBicmFuY2gg
c29tZXdoZXJlPwoKU3VyZSwgaGVyZSB5b3UgZ286CgpodHRwczovL2dpdGh1Yi5jb20vcmF6dmFu
LWNvam9jYXJ1L3hlbi90cmVlL2FsdHAybS1sb2dkaXJ0eS10YWtlMQoKClRoYW5rcywKUmF6dmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
