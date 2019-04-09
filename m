From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] timers: limit heap size
Date: Tue, 9 Apr 2019 15:18:55 +0100
Message-ID: <20190409141855.GQ30543@zion.uk.xensource.com>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDraV-0003AE-KK
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:18:59 +0000
Content-Disposition: inline
In-Reply-To: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDc6MDE6NTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQEAgLTU0NCw3ICs1NDksNyBAQCBzdGF0aWMgdm9pZCBkdW1wX3RpbWVycSh1bnNpZ25l
ZCBjaGFyIGtlCj4gICAgICBzdHJ1Y3QgdGltZXJzICp0czsKPiAgICAgIHVuc2lnbmVkIGxvbmcg
IGZsYWdzOwo+ICAgICAgc190aW1lX3QgICAgICAgbm93ID0gTk9XKCk7Cj4gLSAgICBpbnQgICAg
ICAgICAgICBpLCBqOwo+ICsgICAgdW5zaWduZWQgaW50ICAgaSwgajsKCkEgZnVydGhlciBwb3Nz
aWJsZSBpbXByb3ZlbWVudCBpcyB0byBtb3ZlIGogd2l0aGluIHRoZSBzY29wZSBvZgpmb3JfZWFj
aF9vbmxpbmVfY3B1IHt9LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
