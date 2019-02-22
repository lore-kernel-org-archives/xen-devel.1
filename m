From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 3/5] p2m: change write_p2m_entry to
 return an error code
Date: Fri, 22 Feb 2019 09:36:40 -0700
Message-ID: <5C7025180200007800219537@prv1-mh.provo.novell.com>
References: <20190221165041.39394-1-roger.pau@citrix.com>
 <20190221165041.39394-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxDoc-0000yu-Cd
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 16:36:46 +0000
In-Reply-To: <20190221165041.39394-4-roger.pau@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDE3OjUwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC0yMDIsMTMgKzIwNCwxNCBAQCBwMm1fbmV4dF9sZXZlbChzdHJ1Y3QgcDJtX2RvbWFpbiAq
cDJtLCB2b2lkICoqdGFibGUsCj4gICAgICAgICAgbmV3X2VudHJ5ID0gbDFlX2Zyb21fbWZuKG1m
biwgUDJNX0JBU0VfRkxBR1MgfCBfUEFHRV9SVyk7Cj4gIAo+ICAgICAgICAgIHAybV9hZGRfaW9t
bXVfZmxhZ3MoJm5ld19lbnRyeSwgbGV2ZWwsIElPTU1VRl9yZWFkYWJsZXxJT01NVUZfd3JpdGFi
bGUpOwo+IC0gICAgICAgIHAybS0+d3JpdGVfcDJtX2VudHJ5KHAybSwgZ2ZuLCBwMm1fZW50cnks
IG5ld19lbnRyeSwgbGV2ZWwgKyAxKTsKPiArICAgICAgICByYyA9IHAybS0+d3JpdGVfcDJtX2Vu
dHJ5KHAybSwgZ2ZuLCBwMm1fZW50cnksIG5ld19lbnRyeSwgbGV2ZWwgKyAxKTsKPiArICAgICAg
ICBpZiAoIHJjICkKPiArICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CgpXaHkgbm90
IHNpbXBseSBBU1NFUlQoIXJjKT8gQWxzbyBmdXJ0aGVyIGRvd24gdGhlbi4KCj4gLS0tIGEveGVu
L2FyY2gveDg2L21tL3NoYWRvdy9ub25lLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L25vbmUuYwo+IEBAIC02MCwxMSArNjAsMTIgQEAgc3RhdGljIHZvaWQgX3VwZGF0ZV9wYWdpbmdf
bW9kZXMoc3RydWN0IHZjcHUgKnYpCj4gICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiAgfQo+
ICAKPiAtc3RhdGljIHZvaWQgX3dyaXRlX3AybV9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
LCB1bnNpZ25lZCBsb25nIGdmbiwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsMV9w
Z2VudHJ5X3QgKnAsIGwxX3BnZW50cnlfdCBuZXcsCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGxldmVsKQo+ICtzdGF0aWMgaW50IF93cml0ZV9wMm1fZW50cnko
c3RydWN0IHAybV9kb21haW4gKnAybSwgdW5zaWduZWQgbG9uZyBnZm4sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKnAsIGwxX3BnZW50cnlfdCBuZXcsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbGV2ZWwpCj4gIHsKPiAgICAg
IEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ICsgICAgcmV0dXJuIC1FTk9TWVM7CgotRU9QTk9UU1VQ
UCBvciBiYXNpY2FsbHkgYW55dGhpbmcgZWxzZSwgYnV0IG5vdCAtRU5PU1lTIHBsZWFzZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
