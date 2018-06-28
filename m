From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/2] osstest: move install of FreeBSD build deps
 to build-prep
Date: Thu, 28 Jun 2018 17:40:37 +0200
Message-ID: <20180628154037.50366-2-roger.pau@citrix.com>
References: <20180628154037.50366-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gr/a=jo=citrix.com=prvs=7102bc0aa=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fYZ2u-0007m0-7I
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 15:41:20 +0000
In-Reply-To: <20180628154037.50366-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQogdHMtYnVpbGQtcHJlcC1mcmVlYnNkIHwgNiArKysrKysKIHRzLWZyZWVic2QtYnVpbGQgICAg
ICB8IDUgLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3RzLWJ1aWxkLXByZXAtZnJlZWJzZCBiL3RzLWJ1aWxkLXByZXAt
ZnJlZWJzZAppbmRleCAxZDc4YTNlMS4uMzk5OWVkNzkgMTAwNzU1Ci0tLSBhL3RzLWJ1aWxkLXBy
ZXAtZnJlZWJzZAorKysgYi90cy1idWlsZC1wcmVwLWZyZWVic2QKQEAgLTMwLDYgKzMwLDEyIEBA
ICR3aGhvc3QgfHw9ICdob3N0JzsKIG91ciAkaG89IHNlbGVjdGhvc3QoJHdoaG9zdCk7CiBleGl0
IDAgaWYgJGhvLT57U2hhcmVkUmVhZHl9OwogCitzdWIgaW5zdGFsbF9kZXBzICgpIHsKKyAgICB0
YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sIHF3KGdpdCkpOworfQorCitpbnN0YWxsX2RlcHMo
KTsKKwogb3VyICRwYXRoX3ByZWZpeCA9ICRyeyJmcmVlYnNkX2Rpc3RwYXRoIn0gfHwKICAgICAg
ICAgICAgICAgICAgICBnZXRfc3Rhc2hlZCgicGF0aF9mcmVlYnNkZGlzdCIsICRyeyJmcmVlYnNk
YnVpbGRqb2IifSk7CiAKZGlmZiAtLWdpdCBhL3RzLWZyZWVic2QtYnVpbGQgYi90cy1mcmVlYnNk
LWJ1aWxkCmluZGV4IDVkODJkODA5Li5iZGY2NjZlYiAxMDA3NTUKLS0tIGEvdHMtZnJlZWJzZC1i
dWlsZAorKysgYi90cy1mcmVlYnNkLWJ1aWxkCkBAIC00NiwxMCArNDYsNiBAQCB0c3JlYWRjb25m
aWcoKTsKIHNlbGVjdGJ1aWxkaG9zdChcQEFSR1YpOwogYnVpbGRkaXJzcHJvcHMoKTsKIAotc3Vi
IGluc3RhbGxfZGVwcyAoKSB7Ci0gICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhn
aXQpKTsKLX0KLQogc3ViIGNoZWNrb3V0ICgpIHsKICAgICBwcmVwYnVpbGRkaXJzKCk7CiAKQEAg
LTIzMSw3ICsyMjcsNiBAQCBFTkQKICAgICBzdG9yZV9ydW52YXIoInBhdGhfZnJlZWJzZGRpc3Qi
LCAiYnVpbGQvIik7CiB9CiAKLWluc3RhbGxfZGVwcygpOwogY2hlY2tvdXQoKTsKIGJ1aWxkKCk7
CiBzdGFzaCgpOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
