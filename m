From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/13] libx86: Introduce libx86/cpuid.h
Date: Fri, 06 Jul 2018 02:07:24 -0600
Message-ID: <5B3F233C02000078001D1C2F@prv1-mh.provo.novell.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-2-git-send-email-andrew.cooper3@citrix.com>
 <5B3C838C02000078001D0E0E@prv1-mh.provo.novell.com>
 <12cff264-ae47-75b6-602c-6b867aea49ad@citrix.com>
 <5B3CD24A02000078001D1156@prv1-mh.provo.novell.com>
 <20180706013512.v2y524cqcmoaelrh@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180706013512.v2y524cqcmoaelrh@doug-macbook.localdomain>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA3LjE4IGF0IDAzOjM1LCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+IE9u
IFdlZCwgSnVsIDA0LCAyMDE4IGF0IDA3OjU3OjMwQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+PiA+Pj4gT24gMDQuMDcuMTggYXQgMTQ6MDMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PiB3cm90ZToKPj4gPiBPbiAwNC8wNy8xOCAwOToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+
Pj4+IE9uIDAzLjA3LjE4IGF0IDIyOjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4+ID4+PiAtLS0gYS90b29scy9pbmNsdWRlL01ha2VmaWxlCj4+ID4+PiArKysgYi90b29s
cy9pbmNsdWRlL01ha2VmaWxlCj4+ID4+PiBAQCAtMjEsNiArMjEsOSBAQCB4ZW4vLmRpcjoKPj4g
Pj4+ICAJbG4gLXNmICQoYWRkcHJlZml4ICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi8sbGli
ZWxmLmggZWxmc3RydWN0cy5oKSAKPiB4ZW4vbGliZWxmLwo+PiA+Pj4gIAlsbiAtcyAuLi94ZW4t
Zm9yZWlnbiB4ZW4vZm9yZWlnbgo+PiA+Pj4gIAlsbiAtc2YgJChYRU5fUk9PVCkveGVuL2luY2x1
ZGUvYWNwaSBhY3BpCj4+ID4+PiAraWZlcSAoJChDT05GSUdfWDg2KSx5KQo+PiA+Pj4gKwlsbiAt
c2YgJChYRU5fUk9PVCkveGVuL2luY2x1ZGUveGVuL2xpYng4NiB4ZW4vbGlieDg2Cj4+ID4+PiAr
ZW5kaWYKPj4gPj4gV2h5IG5vdCBzZXQgdGhlIGluY2x1ZGUgcGF0aCBzdWl0YWJseT8KPj4gPiAK
Pj4gPiBCZWNhdXNlIHRoaXMgaXMgaG93IGV2ZXJ5dGhpbmcgZWxzZSBpcyBjdXJyZW50bHkgZG9u
ZS4gIElmIHdlIHdhbnQgdG8KPj4gPiBjaGFuZ2UgaG93IHRvb2xzIGdldCB0aGVpciBoeXBlcnZp
c29yIGhlYWRlciBmaWxlcywgdGhhdCBzaG91bGQgYmUKPj4gPiBpbmRlcGVuZGVudCB3b3JrLgo+
PiAKPj4gSG93IHRoaXMgZ2V0cyBkb25lIGhlcmUgaGFzIG5vIGRpcmVjdCBpbXBsaWNhdGlvbnMg
b24gcHJlLWV4aXN0aW5nCj4+IG1lY2hhbmlzbXMuCj4gCj4gV2hpbGUgbm90IHdyb25nIHJlZmFj
dG9yaW5nIHRoZSBidWlsZCBzeXN0ZW0gYXBwZWFycyB0byBiZSBvcnRob2dvbmFsIHRvCj4gdGhl
IGVudGlyZSBzZXJpZXMuIFRoaXMgaGFkIGJlZW4gcHJvcG9zZWQgYmVmb3JlIHdoZW4gSSB0cmll
ZCB0bwo+IHNlcGFyYXRlIHRoZSB4ZW4gYW5kIHRvb2xzIGJ1aWxkIHN5c3RlbXMgYXBhcnQgYmVm
b3JlIGFuZCBJIGRvIG5vdAo+IHJlY2FsbCB3aHkgaXQgd2Fzbid0IGRvbmUuCgpJIGRvbid0IHVu
ZGVyc3RhbmQ6IEkndmUgbm90IHNhaWQgdGhlIGN1cnJlbnQgbW9kZWwgbmVlZHMgcmVmYWN0b3Jp
bmcKX2luIHRoaXMgc2VyaWVzXyAoaXQncyBsaWtlbHkgd29ydGh3aGlsZSBhcyBhbiBpbmRlcGVu
ZGVudCB0YXNrKS4gTGVhdmUgYXMKaXMgd2hhdCBpcyB0aGVyZSwgYnV0IGRvbid0IHRpZSB5b3Vy
c2VsZiB0byBkb2luZyBuZXcgdGhpbmdzIHRoZSBzYW1lIHdheS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
