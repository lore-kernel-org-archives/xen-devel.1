From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 15/34] x86/nestedhvm: make it build with
 !CONFIG_HVM
Date: Mon, 20 Aug 2018 06:57:43 -0600
Message-ID: <5B7ABAC702000078001E00D8@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <59bd520f550bc6eac92ed7746b3a31fbf9b76352.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frjkj-0008WR-GE
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 12:57:49 +0000
In-Reply-To: <59bd520f550bc6eac92ed7746b3a31fbf9b76352.1534518694.git-series.wei.liu2@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6CgpU
aGUgdGl0bGUgaXNuJ3QgdmVyeSBjb25zaXN0ZW50IHdpdGhpbiBpdHNlbGY6IE5lc3RlZC1IVk0g
Y29kZSBpcyBjZXJ0YWlubHkKbm90IHRvIGJlIGJ1aWx0IHdpdGhvdXQgQ09ORklHX0hWTS4KCj4g
QEAgLTcwLDcgKzc0LDE4IEBAIHVuc2lnbmVkIGxvbmcgKm5lc3RlZGh2bV92Y3B1X2lvbWFwX2dl
dChib29sX3QgaW9wb3J0XzgwLCBib29sX3QgaW9wb3J0X2VkKTsKPiAgCj4gIHZvaWQgbmVzdGVk
aHZtX3ZtY3hfZmx1c2h0bGIoc3RydWN0IHAybV9kb21haW4gKnAybSk7Cj4gIAo+IC1ib29sX3Qg
bmVzdGVkaHZtX2lzX24yKHN0cnVjdCB2Y3B1ICp2KTsKPiArc3RhdGljIGlubGluZSBib29sIG5l
c3RlZGh2bV9pc19uMihzdHJ1Y3QgdmNwdSAqdikKCkknbSB0ZW1wdGVkIHRvIHN1Z2dlc3QgdGhl
IHBhcmFtZXRlciBjb3VsZCBiZSBjb25zdGlmaWVkLCBidXQgaXQKbG9va3MgbGlrZSB0aGlzIHdv
dWxkIHJlcXVpcmUgc29tZSBjb25zdCBhZGRpdGlvbnMgZWxzZXdoZXJlIGZpcnN0LgoKPiArewo+
ICsgICAgaWYgKCAhbmVzdGVkaHZtX2VuYWJsZWQodi0+ZG9tYWluKSB8fAo+ICsgICAgICAgIG5l
c3RlZGh2bV92bXN3aXRjaF9pbl9wcm9ncmVzcyh2KSB8fAo+ICsgICAgICAgICFuZXN0ZWRodm1f
cGFnaW5nX21vZGVfaGFwKHYpICkKPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAg
aWYgKCBuZXN0ZWRodm1fdmNwdV9pbl9ndWVzdG1vZGUodikgKQo+ICsgICAgICAgIHJldHVybiB0
cnVlOwo+ICsKPiArICAgIHJldHVybiBmYWxzZTsKCkNhbiB0aGUgbGFzdCBmb3VyIGxpbmVzIGJl
IGEgc2luZ2xlIHJldHVybiBzdGF0ZW1lbnQgcGxlYXNlPyBXaXRoCnRoYXQKQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
