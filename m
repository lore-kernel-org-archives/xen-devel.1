From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/2] xen/pvh: set xen_domain_type to HVM
 in xen_pvh_init
Date: Tue, 23 Apr 2019 09:37:51 -0400
Message-ID: <c2e1612e-d6c2-ba46-b49e-4e0fe95a1d7e__46141.5459097893$1556026402$gmane$org@oracle.com>
References: <20190423130416.68935-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMkX=SZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hIvX5-0004lc-0M
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 13:32:23 +0000
In-Reply-To: <20190423130416.68935-1-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8xOSA5OjA0IEFNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gT3IgZWxzZSB4ZW5f
ZG9tYWluKCkgcmV0dXJucyBmYWxzZSBkZXNwaXRlIHhlbl9wdmggYmVpbmcgc2V0LgoKSXMgdGhp
cyBuZXcgeGVuX2RvbWFpbigpIGludm9jYXRpb24gc29tZXdoZXJlIGluIEVGSSBpbml0aWFsaXph
dGlvbiB0aGF0CnlvdSBhZGQgaW4gdGhlIHNlY29uZCBwYXRjaD8KCkFza2luZyBiZWNhdXNlIEkg
YW0gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hldGhlciB0aGlzIG5lZWRzIHRvIGdvIHRvCnN0YWJs
ZSB0cmVlLgoKLWJvcmlzCgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gLS0tCj4gIGFyY2gveDg2L3hl
bi9lbmxpZ2h0ZW5fcHZoLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdmguYyBiL2FyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHZoLmMKPiBpbmRleCAzNWI3NTk5ZDJkMGIuLmJiZmZhNDA5ZTBlOCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2aC5jCj4gKysrIGIvYXJjaC94
ODYveGVuL2VubGlnaHRlbl9wdmguYwo+IEBAIC0yNyw2ICsyNyw3IEBAIHZvaWQgX19pbml0IHhl
bl9wdmhfaW5pdCh2b2lkKQo+ICAJdTY0IHBmbjsKPiAgCj4gIAl4ZW5fcHZoID0gMTsKPiArCXhl
bl9kb21haW5fdHlwZSA9IFhFTl9IVk1fRE9NQUlOOwo+ICAJeGVuX3N0YXJ0X2ZsYWdzID0gcHZo
X3N0YXJ0X2luZm8uZmxhZ3M7Cj4gIAo+ICAJbXNyID0gY3B1aWRfZWJ4KHhlbl9jcHVpZF9iYXNl
KCkgKyAyKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
