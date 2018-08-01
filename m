From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/gdbsx: use inttypes.h instead of
 custom macros
Date: Wed, 1 Aug 2018 10:19:17 +0100
Message-ID: <20180801091917.r4wlgb33iusmmjco@citrix.com>
References: <20180731201905.23112-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pypw=kq=citrix.com=prvs=744347f87=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fknHt-0001uJ-ID
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:19:21 +0000
Content-Disposition: inline
In-Reply-To: <20180731201905.23112-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMTA6MTk6MDVQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1H
w7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiAtLS0KPiBUaGlzIGlz
IG9uIHRvcCBvZiAidG9vbHMvZ2Ric3g6IGZpeCAnZycgcGFja2V0IHJlc3BvbnNlIGZvciA2NGJp
dAo+IGd1ZXN0cyIgcGF0Y2guCj4gLS0tCj4gIHRvb2xzL2RlYnVnZ2VyL2dkYnN4L2d4L2d4X2xv
Y2FsLmMgIHwgMTcgKysrKystLS0tLQo+ICB0b29scy9kZWJ1Z2dlci9nZGJzeC9neC9neF9tYWlu
LmMgICB8ICA1ICstLQo+ICB0b29scy9kZWJ1Z2dlci9nZGJzeC94Zy94Z19wdWJsaWMuaCB8ICA4
IC0tLS0tCj4gIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlX2NsaWVudC5jICAgIHwgNTEgKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0KCkl0IHNlZW1zIHRoYXQgeW91IGFjY2lkZW50YWxseSBh
ZGRlZCBhIHhlbnN0b3JlIGZpbGUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
