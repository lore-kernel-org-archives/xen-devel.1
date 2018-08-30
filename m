From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Thu, 30 Aug 2018 01:33:18 -0600
Message-ID: <5B879DBE02000078001E3591@prv1-mh.provo.novell.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
 <d0531953-521f-9a0f-8e1b-8709b69da3b3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvHSE-0001rj-6U
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 07:33:22 +0000
In-Reply-To: <d0531953-521f-9a0f-8e1b-8709b69da3b3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDE5OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDcvMTggMTQ6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBEb24ndCBjaGFu
Y2UgaGF2aW5nIFNwZWN0cmUgdjEgKGluY2x1ZGluZyBCQ0JTKSBnYWRnZXRzLiBJbiBzb21lIG9m
IHRoZQo+PiBjYXNlcyB0aGUgaW5zZXJ0aW9ucyBhcmUgbW9yZSBvZiBwcmVjYXV0aW9uYXJ5IG5h
dHVyZSByYXRoZXIgdGhhbiB0aGVyZQo+PiBwcm92YWJseSBiZWluZyBhIGdhZGdldCwgYnV0IEkg
dGhpbmsgd2Ugc2hvdWxkIGVyciBvbiB0aGUgc2FmZSAoc2VjdXJlKQo+PiBzaWRlIGhlcmUuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJ
J20gc3RpbGwgbm90IGNvbnZpbmNlZCBieSB0aGUgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKCkg
Y2hhbmdlLiAgSXQgaXMKPiBhIEJDQlMgZ2FkZ2V0LCBidXQgaXMgcmVzdHJpY3RlZCB0byB0aGUg
dG9vbHN0YWNrIG9ubHkgd2hpY2ggY2FuIGdldCBhdAo+IGFsbCB0aGUgaW50ZXJlc3RpbmcgZGF0
YSB2aWEgbGVnaXRpbWF0ZSBtZWFucywgYW5kIGFsc28gbm90IGxvbmcgZm9yCj4gdGhpcyB3b3Js
ZC4KCldlbGwsIHRoaXMgZ29lcyBiYWNrIHRvIG91ciBiZWxvdmVkIFhTQS03NywgaS5lLiBoaWdo
bHkgZGlzYWdncmVnYXRlZCB0b29sCnN0YWNrcy4KCj4gRXZlcnl0aGluZyBlbHNlIExHVE0uICBS
ZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
UGxlYXNlIGNsYXJpZnkgd2hldGhlciB5b3UnZCBwcmVmZXIgbWUgdG8gZHJvcCB0aGUgZG9tY3Rs
LmMgcGFydCBvZiB0aGUKY2hhbmdlIC0gSSdtIGZpbmUgZWl0aGVyIHdheSwgd2l0aCBqdXN0IGEg
c2xpZ2h0IHByZWZlcmVuY2UgdG93YXJkcwpwcmVjYXV0aW9ucyBhbHNvIGZvciB0b29sIHN0YWNr
IG9ubHkgaW50ZXJmYWNlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
