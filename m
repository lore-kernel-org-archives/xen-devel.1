From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 3/3] x86/mm: subsume set_gpfn_from_mfn()
 into guest_physmap_add_page()
Date: Mon, 13 May 2019 17:23:27 +0100
Message-ID: <fa350a55-264a-f5c6-3d9d-eca6644a3001@citrix.com>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
 <5CD42EFC020000780022D335@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fllF=TN=citrix.com=prvs=029ba87d2=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hQDjj-0006Su-Ig
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 16:23:35 +0000
In-Reply-To: <5CD42EFC020000780022D335@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS85LzE5IDI6NDUgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSB0d28gY2FsbGVycyBp
biBjb21tb24vbWVtb3J5LmMgY3VycmVudGx5IGNhbGwgc2V0X2dwZm5fZnJvbV9tZm4oKQo+IHRo
ZW1zZWx2ZXMsIHNvIG1vdmluZyB0aGUgY2FsbCBpbnRvIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2Uo
KSBoZWxwcwo+IHRpZHkgdGhlaXIgY29kZS4KPiAKPiBUaGUgdHdvIGNhbGxlcnMgaW4gY29tbW9u
L2dyYW50X3RhYmxlLmMgZmFpbCB0byBtYWtlIHRoYXQgY2FsbCBhbG9uZ3NpZGUKPiB0aGUgb25l
IHRvIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSwgc28gd2lsbCBhY3R1YWxseSBnZXQgZml4ZWQg
YnkgdGhlCj4gY2hhbmdlLgo+IAo+IE90aGVyICh4ODYpIGNhbGxlcnMgYXJlIEhWTSBvbmx5IGFu
ZCBhcmUgaGVuY2UgdW5hZmZlY3RlZCBieSBhIGNoYW5nZQo+IHRvIHRoZSBmdW5jdGlvbidzICFw
YWdpbmdfbW9kZV90cmFuc2xhdGUoKSBwYXJ0Lgo+IAo+IFNhZGx5IHRoaXMgaXNuJ3QgZW5vdWdo
IHlldCB0byBkcm9wIEFybSdzIGR1bW15IG1hY3JvLCBhcyB0aGVyZSdzIG9uZQo+IG1vcmUgdXNl
IGluIHBhZ2VfYWxsb2MuYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gLS0tCj4gdjI6IFJlLWJhc2Ugb3ZlciBhZGRlZCBlYXJsaWVyIHBhdGNoLiBSZS13cml0
ZSBkZXNjcmlwdGlvbi4KClRoYW5rczoKClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
