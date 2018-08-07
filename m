From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/9] x86/hvm: provide stubs for HVM guest
 accessors
Date: Tue, 07 Aug 2018 04:45:49 -0600
Message-ID: <5B69785D02000078001DB7DA@prv1-mh.provo.novell.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
 <99029322a404f9ac7b14c5b310573b791e87560e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hjto=kw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fmzUw-0000yQ-8j
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:45:54 +0000
In-Reply-To: <99029322a404f9ac7b14c5b310573b791e87560e.1533636027.git-series.wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDEyOjAwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZ3Vlc3RfYWNjZXNzLmgKPiArKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9ndWVzdF9hY2Nlc3MuaAo+IEBAIC0xLDggKzEsMzIgQEAKPiAg
I2lmbmRlZiBfX0FTTV9YODZfSFZNX0dVRVNUX0FDQ0VTU19IX18KPiAgI2RlZmluZSBfX0FTTV9Y
ODZfSFZNX0dVRVNUX0FDQ0VTU19IX18KPiAgCj4gKyNpZiBDT05GSUdfSFZNCj4gKwo+ICB1bnNp
Z25lZCBsb25nIGNvcHlfdG9fdXNlcl9odm0odm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVu
c2lnbmVkIGxlbik7Cj4gIHVuc2lnbmVkIGxvbmcgY2xlYXJfdXNlcl9odm0odm9pZCAqdG8sIHVu
c2lnbmVkIGludCBsZW4pOwo+ICB1bnNpZ25lZCBsb25nIGNvcHlfZnJvbV91c2VyX2h2bSh2b2lk
ICp0bywgY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbGVuKTsKPiAgCj4gKyNlbHNlCj4gKwo+
ICtzdGF0aWMgaW5saW5lCj4gK3Vuc2lnbmVkIGxvbmcgY29weV90b191c2VyX2h2bSh2b2lkICp0
bywgY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbGVuKQo+ICt7Cj4gKyAgICByZXR1cm4gbGVu
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lCj4gK3Vuc2lnbmVkIGxvbmcgY2xlYXJfdXNlcl9o
dm0odm9pZCAqdG8sIHVuc2lnbmVkIGludCBsZW4pCj4gK3sKPiArICAgIHJldHVybiBsZW47Cj4g
K30KPiArCj4gK3N0YXRpYyBpbmxpbmUKPiArdW5zaWduZWQgbG9uZyBjb3B5X2Zyb21fdXNlcl9o
dm0odm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxlbikKPiArewo+ICsgICAg
cmV0dXJuIGxlbjsKPiArfQo+ICsKPiArI2VuZGlmCgpXaXRoIEJVRygpIG9yIGF0IGxlYXN0IEFT
U0VSVF9VTlJFQUNIQUJMRSgpIHB1dCBpbnRvIGFsbCBvZiB0aGVtCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
