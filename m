From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1.1 for-4.11 3/3] vpci/msi: fix size of the
 vectors fields
Date: Mon, 26 Mar 2018 06:32:39 -0600
Message-ID: <5AB9048702000078001B6173@prv1-mh.provo.novell.com>
References: <20180326112826.80443-1-roger.pau@citrix.com>
 <20180326112826.80443-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zopv=gq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0RIs-0004Rc-Ek
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 12:32:46 +0000
In-Reply-To: <20180326112826.80443-4-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDEzOjI4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBjdXJyZW50IHNpemUgKDViaXRzKSBpcyBub3QgZW5vdWdoIHRvIHN0b3JlIHRoZSBtYXhp
bXVtIG51bWJlciBvZgo+IHZlY3RvcnMgKDMyKSwgYnVtcCBpdCBieSBvbmUgYml0Lgo+IAo+IE5v
dGUgdGhhdCB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0IGlzIHN0aWxsIHRoZSBzYW1lLgoKQ292ZXJp
dHkgSUQ6IDE0MzA4MTAKCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaAo+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi92cGNpLmgKPiBAQCAtMTAwLDcgKzEwMCw3IEBAIHN0cnVjdCB2cGNpIHsK
PiAgICAgICAgICAvKiBEYXRhLiAqLwo+ICAgICAgICAgIHVpbnQxNl90IGRhdGE7Cj4gICAgICAg
ICAgLyogTWF4aW11bSBudW1iZXIgb2YgdmVjdG9ycyBzdXBwb3J0ZWQgYnkgdGhlIGRldmljZS4g
Ki8KPiAtICAgICAgICB1aW50OF90IG1heF92ZWN0b3JzIDogNTsKPiArICAgICAgICB1aW50OF90
IG1heF92ZWN0b3JzIDogNjsKPiAgICAgICAgICAvKiBFbmFibGVkPyAqLwo+ICAgICAgICAgIGJv
b2wgZW5hYmxlZCAgICAgICAgOiAxOwo+ICAgICAgICAgIC8qIFN1cHBvcnRzIHBlci12ZWN0b3Ig
bWFza2luZz8gKi8KClRvIGFpZCBzaW1wbGljaXR5IG9mIGdlbmVyYXRlZCBjb2RlLCBJIGhhZCBz
cGVjaWZpY2FsbHkgYXNrZWQgZm9yIHRoZQpjdXJyZW50IDUtMS0xLTEtNSBhcnJhbmdlbWVudCBv
ZiBiaXQgZmllbGQgbWVtYmVycy4gTm93IHRoYXQgdGhlCjVzIG5lZWQgYnVtcGluZyB0byA2LCB3
ZSdsbCB3YW50IDYtMS0xLTYtMSwgc28gcGxlYXNlIG1vdmUKImVuYWJsZWQiIGRvd24gKGFsc28g
cmVzdWx0aW5nIGluIGFsbCBmZWF0dXJlIGZsYWdzIGNvbWluZyBiZWZvcmUKYWxsIHN0YXRlIG9u
ZXMpLiBXaXRoIHRoYXQKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
