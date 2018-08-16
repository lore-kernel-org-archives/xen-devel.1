From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86/HVM: correct an inverted check in
 hvm_load()
Date: Thu, 16 Aug 2018 02:05:02 -0600
Message-ID: <5B75302E02000078001DEBE3@prv1-mh.provo.novell.com>
References: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x9l4=k7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqDHG-0007vt-29
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 08:05:06 +0000
In-Reply-To: <5B61D38002000078001DA043@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDE3OjM2LCAgd3JvdGU6Cj4gQ2xlYXJseSB3ZSB3YW50IHRvIHB1
dCBhIHZDUFUgdG8gc2xlZXAgaWYgaXQgaXMgX25vdF8gYWxyZWFkeSBkb3duLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBUQkQ6IFNp
bmNlIHRoZSBmbGF3IGFwcGFyZW50bHkgbmV2ZXIgbWF0dGVyZWQsIEkgaW1wbHkgdGhhdCB0aGUg
ZnVuY3Rpb24KPiAgICAgIGlzIG5ldmVyIGNhbGxlZCB3aXRoIGFueSB2Q1BVIHVwLiBIZW5jZSBh
biBhbHRlcm5hdGl2ZSBtaWdodCBiZSB0bwo+ICAgICAgc2ltcGx5IHJldHVybiBhbiBlcnJvciBp
ZiBhIHZDUFUgZG9lc24ndCBoYXZlIFZQRl9kb3duIHNldC4KCldoaWxlIGluIGFuIGVhcmxpZXIg
cmVwbHkgeW91J3ZlIGluZGljYXRlZCB0aGF0IHRoZSBzdWdnZXN0ZWQKYWx0ZXJuYXRpdmUgaXMg
bm90IGFuIG9wdGlvbiwgSSd2ZSBub3QgaGFkIGNsZWFyIGZlZWRiYWNrIG9uIHRoZQpjaGFuZ2Ug
YmVsb3cuCgpKYW4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zYXZlLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvaHZtL3NhdmUuYwo+IEBAIC0yNjgsNyArMjY4LDcgQEAgaW50IGh2bV9sb2FkKHN0
cnVjdCBkb21haW4gKmQsIGh2bV9kb21haQo+ICAKPiAgICAgIC8qIERvd24gYWxsIHRoZSB2Y3B1
czogd2Ugb25seSByZS1lbmFibGUgdGhlIG9uZXMgdGhhdCBoYWQgc3RhdGUgc2F2ZWQuICovCj4g
ICAgICBmb3JfZWFjaF92Y3B1KGQsIHYpCj4gLSAgICAgICAgaWYgKCB0ZXN0X2FuZF9zZXRfYml0
KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKSApCj4gKyAgICAgICAgaWYgKCAhdGVzdF9hbmRf
c2V0X2JpdChfVlBGX2Rvd24sICZ2LT5wYXVzZV9mbGFncykgKQo+ICAgICAgICAgICAgICB2Y3B1
X3NsZWVwX25vc3luYyh2KTsKPiAgCj4gICAgICBmb3IgKCA7IDsgKQo+IAo+IAoKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
