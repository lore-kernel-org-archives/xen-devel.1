From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Fri, 7 Sep 2018 19:14:59 +0200
Message-ID: <20180907171459.GO26705__28373.7250407741$1536340431$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905162756.GA26705@gavran.carpriv.carnet.hr>
 <20180907120337.GB11834@soda.linbit>
 <20180907121348.GM26705@gavran.carpriv.carnet.hr>
 <20180907132828.GC11834@soda.linbit>
 <20180907164500.GN26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hzco=lv=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fyKLa-0008ME-Au
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 17:15:06 +0000
Content-Disposition: inline
In-Reply-To: <20180907164500.GN26705@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: drbd-user@lists.linbit.com
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDY6NDU6MDBQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gQWRkaW5nIGEgZHVtcF9zdGFjayBpbiBkcmJkX3JlbGVhc2UgZ2l2ZXMgdHdvIHBv
c3NpYmxlIGNvZGUgcGF0aHMsCj4gYm90aCBmcm9tIHhlbl9ibGtiYWNrIGFuZCB0aGUgZmlyc3Qg
b25lIGZyb20gd29ya3F1ZXVlIGJlaW5nIHRoZQo+IHByb2JsZW1hdGljIG9uZToKCkluIGZhY3Qg
dGhlIGZpcnN0IG9uZSBpcyB0aGUgb3JpZ2luYWwgY29kZSBwYXRoIGJlZm9yZSBJIG1vZGlmaWVk
CmJsa2JhY2suICBUaGUgcHJvYmxlbSBpcyBpdCBnZXRzIGV4ZWN1dGVkIGFzeW5jIGZyb20gd29y
a3F1ZXVlIHNvCml0IG1pZ2h0IG5vdCBhbHdheXMgcnVuIGJlZm9yZSB0aGUgY2FsbCB0byBkcmJk
YWRtIHNlY29uZGFyeS4KCj4gWyAgNTMwLjY5ODc4Ml0gQ1BVOiAwIFBJRDogNCBDb21tOiBrd29y
a2VyLzA6MCBUYWludGVkOiBHICAgICAgICAgICBPICAgIDQuOS4wLTgtYW1kNjQgIzEgRGViaWFu
IDQuOS4xMTAtMytkZWI5dTQKPiBbICA1MzAuNjk4NzgzXSBIYXJkd2FyZSBuYW1lOiBIUCBQcm9M
aWFudCBCTDQ2MGMgR2VuOSwgQklPUyBJMzYgMDkvMTIvMjAxNgo+IFsgIDUzMC42OTg3ODRdIFdv
cmtxdWV1ZTogZXZlbnRzIHhlbl9ibGtpZl9kZWZlcnJlZF9mcmVlIFt4ZW5fYmxrYmFja10KPiBb
ICA1MzAuNjk4Nzg1XSAgMDAwMDAwMDAwMDAwMDAwMCBmZmZmZmZmZjgxMzMxZTU0IGZmZmY4ODNm
ODIxNDM4MDAgZmZmZjg4M2Y3NDFiNTY2MAo+IFsgIDUzMC42OTg3ODddICBmZmZmZmZmZmMwM2Ez
MDllIGZmZmY4ODNmNzQxYjU1ODAgZmZmZmZmZmY4MTI0NWNhOCAwMDAwMDAwMjgxYTE4NmI1Cj4g
WyAgNTMwLjY5ODc4OV0gIDAwMDAwMDAwODkzNWYxMDAgODQxMmZmYTMxYTY0Y2M0YyAwMDAwMDAw
MDAwMDAwMjBhIGZmZmY4ODNmYTYyMTgyODAKPiBbICA1MzAuNjk4NzkxXSBDYWxsIFRyYWNlOgo+
IFsgIDUzMC42OTg3OTJdICBbPGZmZmZmZmZmODEzMzFlNTQ+XSA/IGR1bXBfc3RhY2srMHg1Yy8w
eDc4Cj4gWyAgNTMwLjY5ODgwNV0gIFs8ZmZmZmZmZmZjMDNhMzA5ZT5dID8gZHJiZF9yZWxlYXNl
KzB4MWUvMHg0MCBbZHJiZF0KPiBbICA1MzAuNjk4ODEwXSAgWzxmZmZmZmZmZjgxMjQ1Y2E4Pl0g
PyBfX2Jsa2Rldl9wdXQrMHgxZTgvMHgyYTAKPiBbICA1MzAuNjk4ODEzXSAgWzxmZmZmZmZmZmMw
NTVkNmI4Pl0gPyB4ZW5fdmJkX2ZyZWUuaXNyYS45KzB4NDgvMHg2MCBbeGVuX2Jsa2JhY2tdCj4g
WyAgNTMwLjY5ODgxNF0gIFs8ZmZmZmZmZmZjMDU1ZDZmNz5dID8geGVuX2Jsa2lmX2RlZmVycmVk
X2ZyZWUrMHgyNy8weDcwIFt4ZW5fYmxrYmFja10KPiBbICA1MzAuNjk4ODE2XSAgWzxmZmZmZmZm
ZjgxMDkyZmVhPl0gPyBwcm9jZXNzX29uZV93b3JrKzB4MThhLzB4NDIwCj4gWyAgNTMwLjY5ODgx
N10gIFs8ZmZmZmZmZmY4MTA5MzJjZD5dID8gd29ya2VyX3RocmVhZCsweDRkLzB4NDkwCj4gWyAg
NTMwLjY5ODgxOF0gIFs8ZmZmZmZmZmY4MTA5MzI4MD5dID8gcHJvY2Vzc19vbmVfd29yaysweDQy
MC8weDQyMAo+IFsgIDUzMC42OTg4MjBdICBbPGZmZmZmZmZmODEwOTkzMjk+XSA/IGt0aHJlYWQr
MHhkOS8weGYwCj4gWyAgNTMwLjY5ODgyMl0gIFs8ZmZmZmZmZmY4MTA5OTI1MD5dID8ga3RocmVh
ZF9wYXJrKzB4NjAvMHg2MAo+IFsgIDUzMC42OTg4MjNdICBbPGZmZmZmZmZmODE2MTVkZjc+XSA/
IHJldF9mcm9tX2ZvcmsrMHg1Ny8weDcwCgotLSAKVmFsZW50aW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
