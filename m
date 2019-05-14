From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 01/19] xen/const: Extend
 the existing macro BIT to take a suffix in parameter
Date: Tue, 14 May 2019 06:37:58 -0600
Message-ID: <5CDAB6A6020000780022EAF9@prv1-mh.provo.novell.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQWh5-0006iE-0q
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:38:07 +0000
In-Reply-To: <20190514122456.28559-2-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE5IGF0IDE0OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFybSBjdXJyZW50bHkgcHJvdmlkZXMgdHdvIG1hY3JvIEJJVCBhbmQgQklUX1VMTCB0aGF0IGFy
ZSBvbmx5IHVzYWJsZQo+IGluIEMgYW5kIHJldHVybiByZXNwZWN0aXZlbHkgdW5zaWduZWQgbG9u
ZyBhbmQgdW5zaWduZWQgbG9uZyBsb25nLgo+IAo+IEV4dGVuZGluZyB0aGUgbWFjcm9zIHRvIGRl
YWwgd2l0aCBhc3NlbWJseSB3b3VsZCBiZSBhIG5pY2UgYmVuZWZpdHMgYXMKPiBpdCBjb3VsZCBy
ZXBsYWNlIHRoZSBjb21tb24gcGF0dGVybiB0byBkZWZpbmUgZmllbGRzIChBQygxLCBzZngpIDw8
IFgpCj4gZWFzaWVyIHRvIHJlYWQuCj4gCj4gUmF0aGVyIHRoYW4gZXh0ZW5kaW5nIHRoZSB0d28g
bWFjcm9zLCBpdCB3YXMgZGVjaWRlZCB0byBkcm9wIEJJVF9VTEwoKQo+IGFuZCBleHRlbmQgdGhl
IG1hY3JvIEJJVCgpIHRvIHRha2UgYSBzdWZmaXggKGUuZyBVLCBVTCwgVUxMKSBpbgo+IHBhcmFt
ZXRlci4gVGhpcyB3b3VsZCBhbGxvdyB0byB1c2UgZGlmZmVyZW50IHN1ZmZpeCB3aXRob3V0IGhh
dmluZyB0bwo+IGRlZmluZSBuZXcgbWFjcm9zLgo+IAo+IFRoZSBuZXcgZXh0ZW5kIG1hY3JvIGlz
IG5vdyBtb3ZlZCBpbiBpbmNsdWRlL3hlbi9jb25zdC5oIHNvIGl0IGNhbiBiZQo+IHVzZWQgYnkg
YW55b25lIGluIFhlbiBhbmQgYWxzbyBhdm9pZCB0byBpbmNsdWRlIGJpdG9wcy5oIGluIGFzc2Vt
Ymx5Cj4gY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKVGhhbmtzIG11Y2ggZm9yIGdvaW5nIHRoaXMgcm91dGUhIEZvciB0aGUgc2lu
Z2xlIGxpbmUgYWRkaXRpb24gdG8KY29tbW9uIGNvZGUKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
