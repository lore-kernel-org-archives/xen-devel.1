From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: 4.11.0 RC1 panic
Date: Wed, 13 Jun 2018 00:54:24 -0600
Message-ID: <5B20BFA002000078001CAB58@prv1-mh.provo.novell.com>
References: <5AE71AB002000078001BF978@prv1-mh.provo.novell.com>
 <20180501202211.GA902@antioche.eu.org>
 <5AFAA8A902000078001C2CE6@prv1-mh.provo.novell.com>
 <20180522110101.GA25181@mail.soc.lip6.fr>
 <5B1CF56502000078001326FB@prv1-mh.provo.novell.com>
 <20180610105728.GA3492@antioche.eu.org>
 <5B1F7CEF02000078001CA402@prv1-mh.provo.novell.com>
 <20180612113905.GA25889@mail.soc.lip6.fr>
 <20180612153844.GB17270@mail.soc.lip6.fr>
 <233e98d0-5a4b-a55c-dd2a-e0ad196ffb09@citrix.com>
 <20180612160022.GA9677@mail.soc.lip6.fr>
 <98c031bf-3edb-65d4-fde6-e08c3a45e2d8@citrix.com>
 <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B1FECBE0200005C04A5F773@prv1-mh.provo.novell.com>
 <5B1FEE270200008403B2CB9D@prv1-mh.provo.novell.com>
 <5B1FF4E60200007D03B2D421@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bhoq=i7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fSzfn-0000Pv-KL
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 06:54:27 +0000
In-Reply-To: <5B1FF4E60200007D03B2D421@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manuel Bouyer <bouyer@antioche.eu.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA2LjE4IGF0IDE4OjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTIvMDYvMTggMTc6MDAsIE1hbnVlbCBCb3V5ZXIgd3JvdGU6Cj4+IE9uIFR1ZSwg
SnVuIDEyLCAyMDE4IGF0IDA0OjU0OjMwUE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+
PiBPbiAxMi8wNi8xOCAxNjozOCwgTWFudWVsIEJvdXllciB3cm90ZToKPj4+PiBPbiBUdWUsIEp1
biAxMiwgMjAxOCBhdCAwMTozOTowNVBNICswMjAwLCBNYW51ZWwgQm91eWVyIHdyb3RlOgo+Pj4+
PiBJIGFwcGxpZWQgdGhpcyBwYXRjaCB0byA0LjExcmM0IChsZXQncyBub3QgY2hhbmdlIHRvbyBt
dWNoIHRoaW5ncyBhdCB0aGUKPj4+Pj4gc2FtZSB0aW1lKSBhbmQgcmVib290ZWQgbXkgdGVzdCBo
b3N0LiBIb3BlZnVsbHkgSSdsbCBoYXZlIHNvbWUgZGF0YSB0byByZXBvcnQKPj4+Pj4gc29vbgo+
Pj4+IEdvdCB0aGUgZmlyc3QgcGFuaWMgKHN0aWxsIGZyb20gYSBpMzg2IGRvbVUpOgo+Pj4+IGxv
Z2luOiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAK
Pj4+PiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAK
Pj4+PiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAK
Pj4+PiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAK
Pj4+PiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAK
Pj4+PiAoWEVOKSBkNHYyIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMDc3Zjc4LCBkcjYgZmZmZjBmZjAK
Pj4+IEkgcHJlc3VtZSB5b3UncmUgcnVubmluZyBhIFhTQS0yNjMgKE1vdlNTKSBleHBsb2l0IGlu
IHRlc3Rpbmc/Cj4+IE5vdCBpbnRlbnRpb25hbGx5LCB0aGVzZSBhcmUgdGhlIE5ldEJTRCB0ZXN0
IHN1aXRlIGFuZCBJIGRvbid0IHRoaW5rIGFueQo+PiBzcGVjaWZpY2FsbHkgdGFyZ2V0cyB0aGlz
ICh0aGVyZSBhcmUgNzU5IHRlc3RzIGF0IHRoaXMgdGltZSkuCj4+IEJ1dCB0aGVzZSBpbmNsdWRl
cyBuZXR3b3JrIHRlc3RzLCBzbyB0aGVyZSBpcyBwcm9iYWJseSBpbiBrZXJuZWwgYnBmIGNvZGUg
dGVzdHMuCj4gCj4gVGhpcyBzcGVjaWZpYyBtZXNzYWdlIGNhbiBvbmx5IGJlIHRyaWdnZXJlZCAo
c28gZmFyIGFzIHdlIGtub3cpIGJ5IGEKPiBNb3ZTUy1kZWZlcnJlZCAjREIsIGluIHRoaXMgY2Fz
ZSBvdmVyIGFuIGBpbnRvYCBpbnN0cnVjdGlvbi4KPiAKPiBJZiB0aGlzIGlzbid0IGEgZGVkaWNh
dGVkIHRlc3QsIHRoZW4gd2hhdGV2ZXIgeW91J3ZlIGdvdCBpbiB5b3VyIHRlc3QKPiBzdWl0ZSBj
YW1lIGRhbmdlcm91c2x5IGNsb3NlIHRvIGRpc2NvdmVyaW5nIHRoZSBNb3ZTUyBpc3N1ZS4KClNv
IG1heWJlLCBpbnN0ZWFkIG9mIGxvZ2dpbmcgQ1MgYW5kIFNTIGluIHRoZSBhYm92ZSBtZXNzYWdl
LCBpdCB3b3VsZApiZSBtb3JlIGhlbHBmdWwgdG8gbG9nIHRoZSBndWVzdCBtb2RlIFJJUCBoZXJl
LCB0byBoZWxwIHVuZGVyc3RhbmQgdGhlCm9yaWdpbj8KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
