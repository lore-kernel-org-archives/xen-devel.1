From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Wed, 18 Jul 2018 03:15:41 -0600
Message-ID: <5B4F053D02000078001D54BA@prv1-mh.provo.novell.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <8ac9748a-258c-a9e4-6d0d-b838b58466b5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rjtn=kc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffiYj-0001qf-8J
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:15:45 +0000
In-Reply-To: <8ac9748a-258c-a9e4-6d0d-b838b58466b5@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDE4OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDcvMTggMTc6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBGb3IgYSByZWFz
b24gdGhhdCBJIGNhbid0IGV4cGxhaW4sIGl0IGlzIG9ubHkgdGhlIHNoaW0gYnVpbGQgdGhhdCBm
YWlscwo+PiBmb3IgbWUgd2l0aCBhbiBvbGRlciBnY2MgZHVlIHRvIHRoZSBjb21waWxlciBub3Qg
cmVjb2duaXppbmcgdGhhdAo+PiBhcHBhcmVudGx5IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIGFy
ZW4ndCByZWFsbHkgdW5pbml0aWFsaXplZC4KPiAKPiBUaGUgb25seSB0aGluZyB0aGF0IGNvbWVz
IHRvIG1pbmQgaXMgc29tZSBkaWZmZXJlbmNlcyBpbiBDRkxBR1MgZXQgYWwuIAo+IFRoZXJlIGlz
IG5vdGhpbmcgaW4ga2NvbmZpZyB3aGljaCB3b3VsZCBwbGF1c2libHkgaW1wYWN0IHRoYXQgY29k
ZS4KCkluZGVlZCAtIEkgd2FzIHVuZGVyIHRoZSB3cm9uZyBpbXByZXNzaW9uIHRoYXQgb25lIG9m
IG15IGNvbmZpZ3MKb24gdGhhdCBib3ggaGFkIENPTkZJR19ERUJVRz1uLCBidXQgdGhhdCB3YXMg
d3JvbmcuIFN3aXRjaGluZwp0aGUgc3VwcG9zZWQgY29uZmlnIGJhY2sgaW50byB0aGF0IG1vZGUg
bWFrZXMgdGhlIGlzc3VlIHN1cmZhY2UgaW4KYSBub24tc2hpbSBidWlsZCBhcyB3ZWxsLiBUaGUg
ZGlmZmVyZW5jZSBpcyAtTzEgdnMgLU8yOyB0aGUgbGF0dGVyCmFsbG93cyB0aGUgY29tcGlsZXIg
dG8ga2luZCBvZiBzZWUgImRlZXBlciIgdGhyb3VnaCBleHByZXNzaW9ucy4gU28KSSB0aGluayB0
aGUgcGF0Y2ggc2hvdWxkIGJlIGNvbnNpZGVyZWQgYXMgaXMsIHBlcmhhcHMgd2l0aCB0aGUgZXh0
cmEKcXVlc3Rpb24gd2hldGhlciB0byBtYWtlIHZteF9hZGRfbXNyKCkgbWF0Y2ggdGhlIHR3byBj
aGFuZ2VkCmZ1bmN0aW9ucywgZXZlbiBpZiB0aGUgcHJvYmxlbSBkb2Vzbid0IHN1cmZhY2UgdGhl
cmUgKHByZXN1bWFibHkKZHVlIHRvIHRoZSAicmV0dXJuIiBpbiB0aGUgaW5pdGlhbCBzd2l0Y2gg
c3RhdGVtZW50KS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
