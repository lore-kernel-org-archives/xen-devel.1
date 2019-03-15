From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 04/55] x86/mm: introduce l{1,
 2}t local variables to map_pages_to_xen
Date: Fri, 15 Mar 2019 09:36:37 -0600
Message-ID: <5C8BC685020000780021F5E5@prv1-mh.provo.novell.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-5-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4ot1-0002de-Pa
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 15:36:43 +0000
In-Reply-To: <20190207164456.9260-5-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhlIHBsMmUgYW5kIHBsMWUgdmFyaWFibGVzIGFyZSBoZWF2aWx5IChhYil1c2VkIGluIHRoYXQg
ZnVuY3Rpb24uIEl0Cj4gaXMgZmluZSBhdCB0aGUgbW9tZW50IGJlY2F1c2UgYWxsIHBhZ2UgdGFi
bGVzIGFyZSBhbHdheXMgbWFwcGVkIHNvCj4gdGhlcmUgaXMgbm8gbmVlZCB0byB0cmFjayB0aGUg
bGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFibGUuCj4gCj4gV2Ugd2lsbCBzb29uIGhhdmUgdGhlIHJl
cXVpcmVtZW50IHRvIG1hcCBhbmQgdW5tYXAgcGFnZSB0YWJsZXMuIFdlCj4gbmVlZCB0byB0cmFj
ayB0aGUgbGlmZSB0aW1lIG9mIGVhY2ggdmFyaWFibGUgdG8gYXZvaWQgbGVha2FnZS4KPiAKPiBJ
bnRyb2R1Y2Ugc29tZSBsezEsMn10IHZhcmlhYmxlcyB3aXRoIGxpbWl0ZWQgc2NvcGUgc28gdGhh
dCB3ZSBjYW4KPiB0cmFjayBsaWZlIHRpbWUgb2YgcG9pbnRlcnMgdG8geGVuIHBhZ2UgdGFibGVz
IG1vcmUgZWFzaWx5LgoKQnV0IHlvdSByZXRhaW4gc29tZSB1c2VzIG9mIHRoZSBvbGQgdmFyaWFi
bGVzLCBhbmQgdG8gYmUgaG9uZXN0IGl0J3MKbm90IHJlYWxseSBjbGVhciB0byBtZSBieSB3aGF0
IGNyaXRlcmlhIChhbmQgaGF2aW5nIG11bHRpcGxlIGluc3RhbmNlcwpvZiBhIHZhcmlhYmxlIG5h
bWUgaW4gYSBzaW5nbGUgZnVuY3Rpb24gaXNuJ3QgbmVjZXNzYXJpbHkgbGVzcyBjb25mdXNpbmcp
LgpJIHRoaW5rIHdlIGVpdGhlciBzdGljayB0byB3aGF0J3MgdGhlcmUgKGRvZXNuJ3QgbG9vayB0
b28gYmFkIHRvIG1lKSwKb3IgeW91IHN3aXRjaCB0byBzY29wZSByZXN0cmljdGVkIHBhZ2UgdGFi
bGUgcG9pbnRlcnMgdGhyb3VnaG91dCB0aGUKZnVuY3Rpb24sIHN1Y2ggdGhhdCB0aGUgZnVuY3Rp
b24gc2NvcGUgc3ltYm9scyBjYW4gZ28gYXdheQphbHRvZ2V0aGVyKS4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
