From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 9/9] viridian: add implementation of the
 HvSendSyntheticClusterIpi hypercall
Date: Mon, 25 Feb 2019 08:00:13 -0700
Message-ID: <5C7402FD0200007800219EFB@prv1-mh.provo.novell.com>
References: <20190131104730.2085-1-paul.durrant@citrix.com>
 <20190131104730.2085-10-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyHjz-0006oA-DT
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 15:00:23 +0000
In-Reply-To: <20190131104730.2085-10-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDExOjQ3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC02NTksNyArNjYzLDY0IEBAIGludCB2aXJpZGlhbl9oeXBlcmNhbGwoc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MpCj4gICAgICAgICAgc3RhdHVzID0gSFZfU1RBVFVTX1NVQ0NFU1M7
Cj4gICAgICAgICAgYnJlYWs7Cj4gICAgICB9Cj4gKyAgICBjYXNlIEh2U2VuZFN5bnRoZXRpY0Ns
dXN0ZXJJcGk6CgpNaXNzaW5nIGJsYW5rIGxpbmUgYWdhaW4sIGFuZCBvbmUgbW9yZSBhdCB0aGUg
ZW5kIG9mIHRoaXMgY2FzZSBibG9jay4KCj4gKyAgICB7Cj4gKyAgICAgICAgc3RydWN0IHZjcHUg
KnY7Cj4gKyAgICAgICAgdWludDMyX3QgdmVjdG9yOwo+ICsgICAgICAgIHVpbnQ2NF90IHZjcHVf
bWFzazsKPiArCj4gKyAgICAgICAgc3RhdHVzID0gSFZfU1RBVFVTX0lOVkFMSURfUEFSQU1FVEVS
Owo+ICsKPiArICAgICAgICAvKiBHZXQgaW5wdXQgcGFyYW1ldGVycy4gKi8KPiArICAgICAgICBp
ZiAoIGlucHV0LmZhc3QgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgaWYgKCBpbnB1dF9w
YXJhbXNfZ3BhID4+IDMyICE9IDAgKQoKUGxlYXNlIHBhcmVudGhlc2l6ZSB0aGUgc2hpZnQgZXhw
cmVzc2lvbiAob3Igb21pdCB0aGUgIT0gMCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
