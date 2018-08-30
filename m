From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/HVM: drop
 hvm_fetch_from_guest_linear()
Date: Thu, 30 Aug 2018 06:02:39 -0600
Message-ID: <5B87DCDF02000078001E37E8@prv1-mh.provo.novell.com>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B87D04F02000078001E37B5@prv1-mh.provo.novell.com>
 <a103cabc-b562-f519-8d48-4eeca8ab25f3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvLet-0004hu-SI
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 12:02:43 +0000
In-Reply-To: <a103cabc-b562-f519-8d48-4eeca8ab25f3@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDEzOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMDgvMTggMTI6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAtMjUxMiw5
ICsyNTEyLDEwIEBAIHZvaWQgaHZtX2VtdWxhdGVfaW5pdF9wZXJfaW5zbigKPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm1fYWNjZXNzX2luc25fZmV0Y2gsCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmh2bWVtdWxfY3R4dC0+
c2VnX3JlZ1t4ODZfc2VnX2NzXSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAmYWRkcikgJiYKPj4gLSAgICAgICAgICAgICBodm1fZmV0Y2hfZnJvbV9ndWVzdF9s
aW5lYXIoaHZtZW11bF9jdHh0LT5pbnNuX2J1ZiwgYWRkciwKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYpLAo+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZmVjLCBOVUxMKSA9
PSBIVk1UUkFOU19va2F5KSA/Cj4+ICsgICAgICAgICAgICAgaHZtX2NvcHlfZnJvbV9ndWVzdF9s
aW5lYXIoaHZtZW11bF9jdHh0LT5pbnNuX2J1ZiwgYWRkciwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoaHZtZW11bF9jdHh0LT5pbnNuX2J1ZiksCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGZlYyB8IFBGRUNfaW5z
bl9mZXRjaCwgTlVMTCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOVUxMKSA9PSBIVk1UUkFOU19va2F5KSA/Cj4gCj4gRG9lcyB0aGlzIGV2ZW4gY29tcGlsZT8g
IFlvdSBzZWVtIHRvIGhhdmUgYW4gZXh0cmEgTlVMTCBoZXJlIGFuZCBzZXZlcmFsCj4gbGF0ZXIg
cGxhY2VzLgoKSXQgZG9lcyAtIHdpdGggIng4Ni9IVk06IGltcGxlbWVudCBtZW1vcnkgcmVhZCBj
YWNoaW5nIiBhbHNvCmFwcGxpZWQuIElPVyAtIEknbSBzb3JyeSwgaW5zdWZmaWNpZW50IHJlLW9y
ZGVyaW5nIHdvcmsgZG9uZQp3aGVuIG1vdmluZyB0aGVzZSB0d28gYWhlYWQuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
