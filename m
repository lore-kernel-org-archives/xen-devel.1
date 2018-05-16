From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/3] vpci/msi: fix unbind loop
Date: Wed, 16 May 2018 06:46:13 -0600
Message-ID: <5AFC281502000078001C336B@prv1-mh.provo.novell.com>
References: <20180515141008.69320-1-roger.pau@citrix.com>
 <20180515141008.69320-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iqfx=id=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIvoy-0005e3-73
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 12:46:20 +0000
In-Reply-To: <20180515141008.69320-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjA1LjE4IGF0IDE2OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBjdXJyZW50IHVuYmluZCBsb29wIG9uIGZhaWx1cmUgaW4gdnBjaV9tc2lfZW5hYmxlIGlz
IHdyb25nIGFuZAo+IHdpbGwgb25seSB3b3JrIGNvcnJlY3RseSBpZiB0aGUgaW5pdGlhbCBwaXJx
IGlzIDAuIEZpeCB0aGlzIGJ5IGFkZGluZwo+IGEgcHJvcGVyIGJvdW5kLgo+IAo+IFJlcG9ydGVk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSsO8cmdlbiwKCmFueSB0aG91Z2h0cyBvbiB0YWtp
bmcgdGhpcyBvbmUgZm9yIDQuMTE/CgpKYW4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXNp
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYwo+IEBAIC03MTAsNyArNzEwLDcgQEAg
c3RhdGljIGludCB2cGNpX21zaV9lbmFibGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIAo+
IHVpbnQzMl90IGRhdGEsCj4gICAgICAgICAgICAgICAgICAgICAgICIlMDR4OiUwMng6JTAyeC4l
dTogZmFpbGVkIHRvIGJpbmQgUElSUSAldTogJWRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAg
IHBkZXYtPnNlZywgcGRldi0+YnVzLCBQQ0lfU0xPVChwZGV2LT5kZXZmbiksCj4gICAgICAgICAg
ICAgICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgcGlycSArIGksIHJjKTsKPiAtICAg
ICAgICAgICAgd2hpbGUgKCBiaW5kLm1hY2hpbmVfaXJxLS0gKQo+ICsgICAgICAgICAgICB3aGls
ZSAoIGJpbmQubWFjaGluZV9pcnEtLSA+IHBpcnEgKQo+ICAgICAgICAgICAgICAgICAgcHRfaXJx
X2Rlc3Ryb3lfYmluZChwZGV2LT5kb21haW4sICZiaW5kKTsKPiAgICAgICAgICAgICAgc3Bpbl9s
b2NrKCZwZGV2LT5kb21haW4tPmV2ZW50X2xvY2spOwo+ICAgICAgICAgICAgICB1bm1hcF9kb21h
aW5fcGlycShwZGV2LT5kb21haW4sIHBpcnEpOwo+IC0tIAo+IDIuMTcuMAoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
