From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Tue, 17 Jul 2018 00:57:13 -0600
Message-ID: <5B4D934902000078001D4AE9@prv1-mh.provo.novell.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <8ac9748a-258c-a9e4-6d0d-b838b58466b5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=enkq=kb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffJvC-0003og-8P
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 06:57:18 +0000
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
ZS4KCk9oLCByaWdodCAtIGxvb2tzIGxpa2UgdGhlIHNoaW0gYnVpbGQgaW5oZXJpdHMgdGhlIHRv
b2wgc3RhY2sncyBDRkxBR1MsCndoaWNoIHNwZWNpZnkgLU8wIGluIGRlYnVnIGJ1aWxkcy4gT3Rv
aCBJJ20gc3VycHJpc2VkIHRoZSBoeXBlcnZpc29yCmJ1aWxkcyBhdCBhbGwgd2l0aCAtTzAsIHNv
IEkgZ3Vlc3MgSSdsbCBoYXZlIHRvIGxvb2sgYXQgdGhhdCBpbiBzb21lCm1vcmUgZGV0YWlsLCBu
b3QgdGhlIGxlYXN0IGJlY2F1c2UgeGVuL1J1bGVzLm1rIHVzZXMgKz0gdG8gaW5zZXJ0Cml0cyBv
d24gLU88bj4uIEluIGFueSBldmVudCwgY29tcGFyaW5nIHRoZSB0d28gb2JqZWN0IGZpbGVzIGNs
ZWFybHkKc3VnZ2VzdHMgYSBkaWZmZXJlbmNlIGluIG9wdGltaXphdGlvbiBsZXZlbC4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
