From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] timers: limit heap size
Date: Tue, 09 Apr 2019 09:08:03 -0600
Message-ID: <5CACB5530200007800225EFE@prv1-mh.provo.novell.com>
References: <5CAC97C30200007800225DED@prv1-mh.provo.novell.com>
 <20190409141855.GQ30543@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDsM5-0007jU-VZ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:08:09 +0000
In-Reply-To: <20190409141855.GQ30543@zion.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE5IGF0IDE2OjE4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMDc6MDE6NTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEBAIC01NDQsNyArNTQ5LDcgQEAgc3RhdGljIHZvaWQgZHVtcF90aW1lcnEodW5zaWdu
ZWQgY2hhciBrZQo+PiAgICAgIHN0cnVjdCB0aW1lcnMgKnRzOwo+PiAgICAgIHVuc2lnbmVkIGxv
bmcgIGZsYWdzOwo+PiAgICAgIHNfdGltZV90ICAgICAgIG5vdyA9IE5PVygpOwo+PiAtICAgIGlu
dCAgICAgICAgICAgIGksIGo7Cj4+ICsgICAgdW5zaWduZWQgaW50ICAgaSwgajsKPiAKPiBBIGZ1
cnRoZXIgcG9zc2libGUgaW1wcm92ZW1lbnQgaXMgdG8gbW92ZSBqIHdpdGhpbiB0aGUgc2NvcGUg
b2YKPiBmb3JfZWFjaF9vbmxpbmVfY3B1IHt9LgoKSW4gZmFjdCBJIGRpZCBjb25zaWRlciB0aGlz
LCBidXQgZGVjaWRlZCBhZ2FpbnN0OiBJdCdzICJqdXN0IiBhCmRlYnVnZ2luZyBmdW5jdGlvbiwg
YW5kIGogaXMgbm90IHRoZSBvbmx5IHZhcmlhYmxlIHRoYXQgd291bGQKYmV0dGVyIG1vdmUgaW50
byB0aGUgbW9yZSBuYXJyb3cgc2NvcGUuIE1vdmluZyB0aGVtIGFsbCBpcwpiZXlvbmQgdGhlIHNj
b3BlIG9mIHRoaXMgcGF0Y2gsIHRob3VnaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
