From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 1/3] vpci/bars: fix error message
Date: Mon, 26 Mar 2018 12:21:02 +0100
Message-ID: <20180326112104.80041-2-roger.pau@citrix.com>
References: <20180326112104.80041-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QBm-0005x6-2i
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:21:22 +0000
In-Reply-To: <20180326112104.80041-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RXJyb3IgbWVzc2FnZSBpcyBpbmNvcnJlY3RseSB1c2luZyBtYXAgd2hlbiBpdCBzaG91bGQgYmUg
dXNpbmcKbWFwLT5tYXAgaW5zdGVhZC4KClJlcG9ydGVkLWJ5OiBDb3Zlcml0eQpTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBi
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKaW5kZXggOTFhNzFjYTY2ZS4uMGVjNGMwODJhNiAx
MDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYworKysgYi94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jCkBAIC02Myw3ICs2Myw3IEBAIHN0YXRpYyBpbnQgbWFwX3JhbmdlKHVuc2ln
bmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB2b2lkICpkYXRhLAogICAgICAgICB7CiAgICAg
ICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FSTklORwogICAgICAgICAgICAgICAgICAgICJGYWls
ZWQgdG8gaWRlbnRpdHkgJXNtYXAgWyVseCwgJWx4XSBmb3IgZCVkOiAlZFxuIiwKLSAgICAgICAg
ICAgICAgICAgICBtYXAgPyAiIiA6ICJ1biIsIHMsIGUsIG1hcC0+ZC0+ZG9tYWluX2lkLCByYyk7
CisgICAgICAgICAgICAgICAgICAgbWFwLT5tYXAgPyAiIiA6ICJ1biIsIHMsIGUsIG1hcC0+ZC0+
ZG9tYWluX2lkLCByYyk7CiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgfQogICAgICAgICBB
U1NFUlQocmMgPCBzaXplKTsKLS0gCjIuMTYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
