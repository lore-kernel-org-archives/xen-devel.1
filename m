From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 2 Apr 2019 14:46:25 +0800
Message-ID: <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tiqP=SE=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBDGw-0005Ng-Bf
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 06:51:50 +0000
In-Reply-To: <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzEgMTY6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjAzLjE5IGF0IDEx
OjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBUaGVyZSBpcyBubyBNU1JfSU5URUxfUExB
VEZPUk1fSU5GTyBmb3IgQU1EIGFuZCBIeWdvbiBmYW1pbGllcy4gU28gZGlyZWN0bHkKPj4gcmV0
dXJuIGZhbHNlIGluIHRoZSBmdW5jdGlvbiBwcm9iZV9jcHVpZF9mYXVsdGluZygpIGlmICFjcHVf
aGFzX2h5cGVydmlzb3IuCj4gCj4gSSB0aGluayBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB5
b3UgaGFkIG1lbnRpb25lZCB0aGUgcmVhbAo+IHJlYXNvbiB3aHkgeW91IHdhbnQgdG8gYnlwYXNz
IHRoZSBNU1IgYWNjZXNzZXMuIFRoaXMgd2F5IGl0Cj4gc291bmRzIGFzIGlmIHRoZSBjaGFuZ2Ug
d2FzIG9ubHkgY29zbWV0aWMsIGFuZCBoZW5jZSBjb3VsZCBiZQo+IGxlZnQgb3V0LgoKT2theSwg
aG93IGFib3V0IHRoZSBuZXcgZGVzY3JpcHRpb246ClRoZXJlIGlzIG5vIE1TUl9JTlRFTF9QTEFU
Rk9STV9JTkZPIGZvciBBTUQgYW5kIEh5Z29uIGZhbWlsaWVzLiBSZWFkCnRoaXMgTVNSIHdpbGwg
c3RvcCB0aGUgWGVuIGluaXRpYWxpemF0aW9uIHByb2Nlc3Mgb3IgcHJvZHVjZSBHUEYoMCkuClNv
IGRpcmVjdGx5IHJldHVybiBmYWxzZSBpbiB0aGUgZnVuY3Rpb24gcHJvYmVfY3B1aWRfZmF1bHRp
bmcoKSBpZgohY3B1X2hhc19oeXBlcnZpc29yLgoKLS0gClJlZ2FyZHMsClB1IFdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
