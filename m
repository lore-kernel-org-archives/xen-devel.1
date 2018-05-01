From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Tue, 1 May 2018 22:22:11 +0200
Message-ID: <20180501202211.GA902@antioche.eu.org>
References: <20180424160631.GA7526@mail.soc.lip6.fr>
 <5AE0272702000078001BE3B3@prv1-mh.provo.novell.com>
 <20180425104242.GA24012@mail.soc.lip6.fr>
 <20180425144246.GA27422@mail.soc.lip6.fr>
 <5AE71AB002000078001BF978@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rjxq=hu=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1fDcLt-0000vm-A7
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 20:58:21 +0000
Content-Disposition: inline
In-Reply-To: <5AE71AB002000078001BF978@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, julien.grall@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDc6MzE6MjhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI1LjA0LjE4IGF0IDE2OjQyLCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4g
d3JvdGU6Cj4gPiBPbiBXZWQsIEFwciAyNSwgMjAxOCBhdCAxMjo0Mjo0MlBNICswMjAwLCBNYW51
ZWwgQm91eWVyIHdyb3RlOgo+ID4+ID4gV2l0aG91dCBsaW5lIG51bWJlcnMgYXNzb2NpYXRlZCB3
aXRoIGF0IGxlYXN0IHRoZSB0b3Agc3RhY2sgdHJhY2UgZW50cnkKPiA+PiA+IEkgY2FuIG9ubHkg
Z3Vlc3Mgd2hhdCBpdCBtaWdodCBiZSAtIGNvdWxkIHlvdSBnaXZlIHRoZSBwYXRjaCBiZWxvdyBh
IHRyeT8KPiA+PiA+IChUaGlzIG1heSBub3QgYmUgdGhlIGZpbmFsIHBhdGNoLCBhcyBJJ20gYWZy
YWlkIHRoZXJlIG1heSBiZSBzb21lIHJhY2UKPiA+PiA+IGhlcmUsIGJ1dCBJJ2QgaGF2ZSB0byB3
b3JrIHRoaXMgb3V0IGxhdGVyLikKPiA+PiAKPiA+PiBZZXMsIHRoaXMgd29ya3MuIHRoYW5rcyAh
Cj4gPj4gSSdsbCBub3cgcHV0IHRoaXMgdmVyc2lvbiBvbiB0aGUgTmV0QlNEIHRlc3RiZWQgSSdt
IHJ1bm5pbmcuCj4gPj4gVGhpcyBzaG91bGQgcHV0IHNvbWUgcHJlc3N1cmUgb24gaXQuCj4gPiAK
PiA+IFJ1bm5pbmcgTmV0QlNEIHRlc3RzIGluIHNldmVyYWwgZ3Vlc3RzIEkgZ290Ogo+ID4gKFhF
TikgCj4gPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4g
PiAoWEVOKSBQYW5pYyBvbiBDUFUgMToKPiA+IChYRU4pIEFzc2VydGlvbiAnb2MgPiAwJyBmYWls
ZWQgYXQgbW0uYzo2MjgKPiA+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioKPiA+IChzZWUgYXR0YWNoZWQgZmlsZSBmb3IgY29tcGxldGUgcmVwb3J0KS4KPiAK
PiBTbyBpbiBjb21iaW5hdGlvbiB3aXRoIHlvdXIgbGF0ZXIgcmVwbHkgSSdtIGNvbmZ1c2VkOiBB
cmUgeW91IG9ic2VydmluZwo+IHRoaXMgd2l0aCA2NC1iaXQgZ3Vlc3RzIGFzIHdlbGwgKHlvdXIg
bGF0ZXIgcmVwbHkgYXBwZWFycyB0byBoaW50IHRvd2FyZHMKPiA2NC1iaXQtbmVzcyksIG9yIChh
cyB0aGUgc3RhY2sgdHJhY2Ugc3VnZ2VzdHMpIG9ubHkgMzItYml0IG9uZXM/IEtub3dpbmcKPiB0
aGlzIG1heSBhbHJlYWR5IG5hcnJvdyBhcmVhcyB3aGVyZSB0byBsb29rLgoKSSd2ZSBzZWVuIGl0
IGEgc2VydmVyIHdoZXJlLCBJIHRoaW5rLCBvbmx5IDMyYml0cyBkb21VcyBhcmUgcnVubmluZy4K
QnV0IHRoZSBkb20wIGlzIGEgNjRiaXRzIE5ldEJTRCBhbnl3YXkuCgoKLS0gCk1hbnVlbCBCb3V5
ZXIgPGJvdXllckBhbnRpb2NoZS5ldS5vcmc+CiAgICAgTmV0QlNEOiAyNiBhbnMgZCdleHBlcmll
bmNlIGZlcm9udCB0b3Vqb3VycyBsYSBkaWZmZXJlbmNlCi0tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
