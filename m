From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v3] arch/x86: Add registers to vm_event
Date: Thu, 25 Oct 2018 16:33:29 +0300
Message-ID: <0bd1661d-26a9-a256-2e32-d6a85c8cf322@bitdefender.com>
References: <20181018090157.30186-1-aisaila@bitdefender.com>
 <5BD1AF2B02000078001F49F2@prv1-mh.provo.novell.com>
 <a2d6bd10-ca33-ad1c-2988-b85853e9a613@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i4aa=nf=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gFflX-0001ZX-Ve
 for xen-devel@lists.xenproject.org; Thu, 25 Oct 2018 13:33:36 +0000
In-Reply-To: <a2d6bd10-ca33-ad1c-2988-b85853e9a613@bitdefender.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjUvMTggNDoxMCBQTSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MjUuMTAuMjAxOCAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4LjEwLjE4IGF0
IDExOjAyLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Pj4gK3N0cnVjdCB4ODZf
c2VsZWN0b3JfcmVnIHsKPj4+ICsgICAgdW5pb24KPj4+ICsgICAgewo+Pj4gKyAgICAgICAgdWlu
dDY0X3QgYnl0ZXM7Cj4+PiArICAgICAgICBzdHJ1Y3QKPj4+ICsgICAgICAgIHsKPj4+ICsgICAg
ICAgICAgICB1aW50MzJfdCBiYXNlOwo+Pj4gKyAgICAgICAgICAgIHVpbnQzMl90IGxpbWl0ICA6
ICAgIDIwOwo+Pj4gKyAgICAgICAgICAgIHVpbnQzMl90IGFyICAgICA6ICAgIDEyOwo+Pj4gKyAg
ICAgICAgfSBmaWVsZHM7Cj4+PiArICAgIH07Cj4+PiArfTsKPj4KPj4gSSBkb24ndCB1bmRlcnN0
YW5kIHdoeSBzZWwgd2FzIG1vdmVkIG91dC4gQXJlIHlvdSB0aWdodCBvbgo+PiBzcGFjZSBoZXJl
LCBzdWNoIHRoYXQgeW91IGNhbid0IHRvbGVyYXRlIHRoZSBwYWRkaW5nIGJ5dGVzPwo+IAo+IEl0
IHdhcyBkcm9wcGVkIG9uIEFuZHJldydzIHN1Z2dlc3Rpb24uIFdlIGFyZSBvayB3aXRoIGl0IGlu
IHRoZSAKPiBzdHJ1Y3R1cmUgc28gaWYgaXMgb2sgYnkgeW91IEkgY2FuIGFkZCBpdCBiYWNrLgoK
V2UgYXJlIHRpZ2h0IG9uIHNwYWNlLiBUaGUgcmluZyBidWZmZXIgaXMgb25seSA0SywgYW5kIGl0
IGFscmVhZHkgY2FuCm9ubHkgZml0IGFib3V0IDEwIHN5bmMgdm1fZXZlbnRzIGJlZm9yZSBWQ1BV
cyBuZWVkIHRvIGJlIGJsb2NrZWQgd2FpdGluZwpmb3IgYSBwbGFjZSBpbiB0aGUgYnVmZmVyLiBU
aGF0J3Mgd2h5IHdlJ3ZlIGF0dGVtcHRlZCB0aGUgcGFja2luZy4KCj4+IEZpbmFsbHkgLSB3aGF0
IG1lYW5pbmcgdG8gdGhlIGxvdyAob3IgaGlnaCkgNCBiaXRzIG9mICJhciIKPj4gY2Fycnk/Cj4g
Cj4gSWYgSSBjb3JyZWN0bHkgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24sIHdlIHVzZSBhciBiaXRz
IHRvICBkZXRlcm1pbmUgdGhlIAo+IHJ1bm5pbmcgbW9kZSBvZiB0aGUgZ3Vlc3QuCgpUaGF0J3Mg
d2hhdCB3ZSBuZWVkIHRoZSBDUyAuYXIgZm9yOiBsb29raW5nIGF0IENTX0FSX0JZVEVTX0QgYW5k
CkNTX0FSX0JZVEVTX0wsIHRoZSByZXN0IHdlIHBhc3MgYWxvbmcgdG8gdGhlIGludHJvc3BlY3Rp
b24gZW5naW5lIC0gSSdkCmhhdmUgdG8gY2hlY2sgd2l0aCB0aGVtIGZvciBtb3JlIGRldGFpbHMg
aWYgcmVxdWVzdGVkLgoKQnV0IEkgdGhpbmsgd2UndmUgcHJvYmFibHkgbWlzdW5kZXJzdG9vZCB0
aGUgcXVlc3Rpb24uCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
