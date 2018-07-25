From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v3 1/2] x86/efi: move the logic to detect PE
 build support
Date: Wed, 25 Jul 2018 14:48:28 +0200
Message-ID: <20180725124828.GH4642@olila.i.net-space.pl>
References: <20180718102733.15253-1-roger.pau@citrix.com>
 <20180718102733.15253-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mrrg=kj=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fiJDg-0006oV-Dr
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 12:48:44 +0000
Content-Disposition: inline
In-Reply-To: <20180718102733.15253-2-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMTI6Mjc6MzJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgYnkgb3RoZXIgY29tcG9uZW50cyBhcGFy
dCBmcm9tIHRoZSBlZmkgc3BlY2lmaWMKPiBjb2RlLiBCeSBtb3ZpbmcgdGhlIGRldGVjdGlvbiBj
b2RlIGNyZWF0aW5nIGEgZHVtbXkgZWZpL2Rpc2FibGVkIGZpbGUKPiBjYW4gYmUgYXZvaWRlZC4K
Pgo+IFRoaXMgaXMgcmVxdWlyZWQgc28gdGhhdCB0aGUgY29uZGl0aW9uYWwgdXNlZCB0byBkZWZp
bmUgdGhlIGVmaSBzeW1ib2wKPiBpbiB0aGUgbGlua2VyIHNjcmlwdCBjYW4gYmUgcmVtb3ZlZCBh
bmQgaW5zdGVhZCB0aGUgZGVmaW5pdGlvbiBvZiB0aGUKPiBlZmkgc3ltYm9sIGNhbiBiZSBndWFy
ZGVkIHVzaW5nIHRoZSBwcmVwcm9jZXNzb3IuCj4KPiBUaGUgbW90aXZhdGlvbiBiZWhpbmQgdGhp
cyBjaGFuZ2UgaXMgdG8gYmUgYWJsZSB0byBidWlsZCBYZW4gdXNpbmcgbGxkCj4gKHRoZSBMTFZN
IGxpbmtlciksIHRoYXQgYXQgbGVhc3Qgb24gdmVyc2lvbiA2LjAuMCBkb2Vzbid0IHdvcmsKPiBw
cm9wZXJseSB3aXRoIGEgREVGSU5FRCBiZWluZyB1c2VkIGluIGEgY29uZGl0aW9uYWwgZXhwcmVz
c2lvbjoKPgo+IGxkICAgIC1tZWxmX3g4Nl82NF9mYnNkICAtVCB4ZW4ubGRzIC1OIHByZWxpbmsu
byAtLWJ1aWxkLWlkPXNoYTEgXAo+ICAgICAvcm9vdC9zcmMveGVuL3hlbi9jb21tb24vc3ltYm9s
cy1kdW1teS5vIC1vIC9yb290L3NyYy94ZW4veGVuLy54ZW4tc3ltcy4wCj4gbGQ6IGVycm9yOiB4
ZW4ubGRzOjIzMzogc3ltYm9sIG5vdCBmb3VuZDogZWZpCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhpcyBwYXRjaCBkb2VzIG1vcmUgdGhhbiBzdWJq
ZWN0IHNheXMuIFNvLCBwbGVhc2Ugc3BsaXQgdGhpcyBwYXRjaCBpbnRvCjIgcGFydHMuIE9uZSB3
aGljaCByZWFsbHkgbW92ZXMgdGhlIGRldGVjdGlvbiBsb2dpYyBhbmQgdGhlIHNlY29uZCB3aGlj
aApyZXBsYWNlcyBERUZJTkVEKCkgd2l0aCAjaWZkZWYuCgpEYW5pZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
