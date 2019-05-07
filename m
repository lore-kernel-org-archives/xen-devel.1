From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] x86/mm: subsume set_gpfn_from_mfn() into
 guest_physmap_add_entry()
Date: Tue, 7 May 2019 17:09:34 +0100
Message-ID: <04b7cb34-23aa-cda6-a072-9f7f959be3b7@arm.com>
References: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO2ex-0006Dq-JE
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:09:39 +0000
In-Reply-To: <5CCA94F9020000780022B02A@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gNS8yLzE5IDc6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXMg
d2hhdCBib3RoIGNhbGxlcnMgb2YgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSgpIGluIG1lbW9yeS5j
IHdhbnQKPiAoZm9yIHRoZSAhcGFnaW5nX21vZGVfdHJhbnNsYXRlKCkgY2FzZSksIGFuZCBpdCBp
cyBhbHNvIHdoYXQgYm90aAo+IGNhbGxlcnMgaW4gZ250dGFiX3RyYW5zZmVyKCkgbmVlZCAoYnV0
IGhhdmUgYmVlbiBsYWNraW5nKS4gVGhlIG90aGVyCj4gKHg4Ni1zcGVjaWZpYykgY2FsbGVycyBh
cmUgYWxsIEhWTS1vbmx5LCBhbmQgaGVuY2UgdW5hZmZlY3RlZCBieSB0aGlzCj4gY2hhbmdlLgo+
IAo+IFNhZGx5IHRoaXMgaXNuJ3QgZW5vdWdoIHlldCB0byBkcm9wIEFybSdzIGR1bW15IG1hY3Jv
LCBhcyB0aGVyZSdzIG9uZQo+IG1vcmUgdXNlIGluIHBhZ2VfYWxsb2MuYy4KCkkgdGhpbmsgd2Ug
Y2FuIGxpdmUgd2l0aCB0aGF0LiBJIGhhdmUgbm93IHNlbnQgYSBwYXRjaCB0byBtb3ZlIHRoZSBk
dW1teSAKaW1wbGVtZW50YXRpb24gaW4gY29tbW9uIGNvZGUgKHNlZSAKPDIwMTkwNTA3MTUxNDU4
LjI5MzUwLTE1LWp1bGllbi5ncmFsbEBhcm0uY29tPikuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoZSBjb21tb24gY29kZSBsb29rcyBmaW5l
IHRvIG1lLiBJIHdpbGwgbGVhdmUgQW5kcmV3IGNvbW1lbnRpbmcgZm9yIHRoZSAKeDg2IHBhcnRz
OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
