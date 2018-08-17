From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] libxc: copy back the result of
 XEN_DOMCTL_createdomain
Date: Fri, 17 Aug 2018 11:50:53 +0200
Message-ID: <20180817095053.97904-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqbPI-0001ym-OZ
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:51:00 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rml4ZXMgdGhlIEFSTSBidWlsZCBicmVha2FnZSBpbnRyb2R1Y2VkIGJ5IDU0ZWQyNTFkYzcuCgpT
aWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0t
CkkndmUgb25seSBidWlsZC10ZXN0ZWQgdGhpcyBvbiB4ODYuCi0tLQpDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHRvb2xzL2xpYnhjL3hjX2RvbWFpbi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19kb21haW4uYyBiL3Rv
b2xzL2xpYnhjL3hjX2RvbWFpbi5jCmluZGV4IDJiYzY5NWM1OTcuLmY1ZGZhZGQ3MDAgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX2RvbWFpbi5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX2RvbWFp
bi5jCkBAIC00MCw2ICs0MCw3IEBAIGludCB4Y19kb21haW5fY3JlYXRlKHhjX2ludGVyZmFjZSAq
eGNoLCB1aW50MzJfdCAqcGRvbWlkLAogICAgICAgICByZXR1cm4gZXJyOwogCiAgICAgKnBkb21p
ZCA9ICh1aW50MTZfdClkb21jdGwuZG9tYWluOworICAgICpjb25maWcgPSBkb21jdGwudS5jcmVh
dGVkb21haW47CiAKICAgICByZXR1cm4gMDsKIH0KLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
