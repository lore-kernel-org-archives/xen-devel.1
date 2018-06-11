From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Mon, 11 Jun 2018 12:13:49 +0200
Message-ID: <20180611101349.GA6216@mail.soc.lip6.fr>
References: <5AE71AB002000078001BF978@prv1-mh.provo.novell.com>
 <20180501202211.GA902@antioche.eu.org>
 <5AFAA8A902000078001C2CE6@prv1-mh.provo.novell.com>
 <20180522110101.GA25181@mail.soc.lip6.fr>
 <5B1CF56502000078001326FB@prv1-mh.provo.novell.com>
 <20180610105728.GA3492@antioche.eu.org>
 <5B1D45E90200007800132734@prv1-mh.provo.novell.com>
 <20180610163200.GA3153@antioche.eu.org>
 <5B1D528F020000C104A2FF49@prv1-mh.provo.novell.com>
 <5B1E47A902000078001C9EE2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e6us=i5=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fSJpk-0004QL-HC
 for xen-devel@lists.xenproject.org; Mon, 11 Jun 2018 10:13:56 +0000
Content-Disposition: inline
In-Reply-To: <5B1E47A902000078001C9EE2@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMTEsIDIwMTggYXQgMDM6NTg6MDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA2LjE4IGF0IDE4OjMyLCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4g
d3JvdGU6Cj4gPiBPbiBTdW4sIEp1biAxMCwgMjAxOCBhdCAwOTozODoxN0FNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+PiBXaGF0IGFib3V0IEwyIHRhYmxlcyB0byBiZSB1c2VkIGluIHNs
b3QgMyBvZiBhbiBMMyB0YWJsZT8gQWl1aSBYZW4gd29uJ3QgYWxsb3cKPiA+PiB0aGVtIHRvIGJl
IHBpbm5lZCwgaGVuY2UgSSdkIGV4cGVjdCB0aGVyZSB0byBiZSBzb21lIHNwZWNpYWwgY2FzaW5n
IGluIHlvdXIKPiA+PiBjb2RlLiBDb25zaWRlcmluZyBubyBzaW1pbGFyIGlzc3VlcyBoYXZlIGJl
ZW4gb2JzZXJ2ZWQgd2l0aCA2NC1iaXQgZ3Vlc3RzLAo+ID4+IHRoaXMgb25lIHNwZWNpYWwgY2Fz
ZSBsb29rcyB0byBtZSB0byBiZSB0aGUgcHJpbWUgc3VzcGVjdCBmb3Igc29tZXRoaW5nIGdvaW5n
Cj4gPj4gd3JvbmcgKGluIFhlbikuCj4gPiAKPiA+IEFGQUlLIHRoaXMgTDIgaXMgYWxsb2NhdGVk
IGF0IGJvb3QsIGFuZCBzaG91bGQgbmV2ZXIgYmUgZnJlZWQuIEl0J3MKPiA+IHNoYXJlZCBieSBh
bGwgQ1BVcy4KPiAKPiBJIGd1ZXNzIHRoYXQncyB3aGF0IGdvZXMgaW50byBMMyBzbG90IDMgYW5k
IC4uLgoKWWVzCgo+IAo+ID4gVGhlcmUgaXMgb25lIHNwZWNpYWwgTDIgY2FzZTogaXQncyBwaW5u
ZWQgYXMgTDIgYnV0IHVzZWQgYXMgTDEgaW4gdGhlICJrZXJuZWwiCj4gPiBMMiAodGhlIG9uZSBp
biBzbG90IDMgb2YgdGhlIEwzIHRhYmxlcykuIFRoaXMgaXMgZm9yIHJlY3Vyc2l2ZSBtYXBwaW5n
cwo+ID4gb2YgdGhlIGtlcm5lbCBtYXAuIFRoaXMgb25lIHdpbGwgYmUgYWxsb2NhdGVkL2ZyZWVk
IChhbmQgc28gcGlubmVkL3VucGlubmVkKQo+ID4gZm9yIGVhY2ggY29udGV4dC4KPiAKPiAuLi4g
aGVyZSB5b3UgbWVhbiBMMyBzbG90IDIgKGFsbCBhc3N1bWluZyAwLWJhc2VkIHNsb3QgbnVtYmVy
aW5nKT8KPiBPdGhlcndpc2UgSSdtIGFmcmFpZCBJJ20gY29uZnVzZWQgbm93LCBhcyB0aGUgc2hh
cmluZyBieSBhbGwgQ1BVcyBvZgo+IHRoZSBmb3JtZXIgc2VlbXMgdG8gY29udHJhZGljdCB0aGUg
cGVyLWNvbnRleHQgbmF0dXJlIG9mIHRoZSBsYXR0ZXIuCgp5ZXMsIHNvcnJ5LCBpdCdzIHJlZmVy
ZWNlbmVkIGluIHRoZSBsYXN0IGVudHJ5IG9mIHRoZSAiTDMgc2xvdCAyIiBMMiBwYWdlLgoKLS0g
Ck1hbnVlbCBCb3V5ZXIgPGJvdXllckBhbnRpb2NoZS5ldS5vcmc+CiAgICAgTmV0QlNEOiAyNiBh
bnMgZCdleHBlcmllbmNlIGZlcm9udCB0b3Vqb3VycyBsYSBkaWZmZXJlbmNlCi0tCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
