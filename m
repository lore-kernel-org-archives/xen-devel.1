From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/dom0: add verbose mode and print
 memory allocation stats
Date: Mon, 07 Jan 2019 03:01:54 -0700
Message-ID: <5C332392020000780020ABC9@prv1-mh.provo.novell.com>
References: <20181228111857.49444-1-roger.pau@citrix.com>
 <20181228111857.49444-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggRjO-0001yI-2Q
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 10:02:02 +0000
In-Reply-To: <20181228111857.49444-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjEyLjE4IGF0IDEyOjE4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L2h2bS9kb20wX2J1aWxkLmMKPiBAQCAtNjAsNiArNjAsMTggQEAgc3RhdGljIHN0cnVjdCBhY3Bp
X21hZHRfaW50ZXJydXB0X292ZXJyaWRlIF9faW5pdGRhdGEgKmludHNyY292cjsKPiAgc3RhdGlj
IHVuc2lnbmVkIGludCBfX2luaXRkYXRhIGFjcGlfbm1pX3NvdXJjZXM7Cj4gIHN0YXRpYyBzdHJ1
Y3QgYWNwaV9tYWR0X25taV9zb3VyY2UgX19pbml0ZGF0YSAqbm1pc3JjOwo+ICAKPiArc3RhdGlj
IHVuc2lnbmVkIGludCBfX2luaXRkYXRhIG9yZGVyX3N0YXRzW01BWF9PUkRFUiArIDFdID0geyB9
OwoKUG9pbnRsZXNzIGluaXRpYWxpemVyLgoKPiArc3RhdGljIHZvaWQgX19pbml0IHByaW50X29y
ZGVyX3N0YXRzKHZvaWQpCj4gK3sKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgIHBy
aW50aygiTWVtb3J5IGFsbG9jYXRpb24gc3RhdHM6XG4iKTsKCkkgdGhpbmsgdGhpcyB3YW50cyBw
cmVmaXhpbmcgd2l0aCAiRG9tMCIuCgo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KG9yZGVyX3N0YXRzKTsgaSsrICkKPiArICAgICAgICBpZiAoIG9yZGVyX3N0YXRzW2ldICkKPiAr
ICAgICAgICAgICAgcHJpbnRrKCJvcmRlcjogJTJ1IGFsbG9jYXRpb25zOiAldVxuIiwgaSwgb3Jk
ZXJfc3RhdHNbaV0pOwoKV2h5IHRoZSBmaXJzdCBvZiB0aGUgdHdvIGNvbG9ucz8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
