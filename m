From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 12/16] x86: stub out PV only code in do_debug
Date: Fri, 19 Oct 2018 15:28:38 +0100
Message-ID: <50c9cf36d206282e0b6b1496020c72aacf025701.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDWEc-0006G5-3j
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:58:42 +0000
In-Reply-To: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBQViBpcyBkaXNhYmxlZCB0aG9zZSBzeW1ib2xzIHdvbid0IGJlIGF2YWlsYWJsZS4gSXQg
aXMgaW1wb3NzaWJsZQpmb3IgWGVuIHRvIGhpdCAjREIgdGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KdjI6IG5ldwotLS0KIHhlbi9hcmNoL3g4
Ni90cmFwcy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKaW5kZXgg
MDAyZTk4Zi4uN2NjYTA3MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKKysrIGIv
eGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTE4NDEsNiArMTg0MSw3IEBAIHZvaWQgZG9fZGVidWco
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAKICAgICAgICAgaWYgKCByZWdzLT5lZmxhZ3Mg
JiBYODZfRUZMQUdTX1RGICkKICAgICAgICAgeworI2lmZGVmIENPTkZJR19QVgogICAgICAgICAg
ICAgLyogSW4gU1lTRU5URVIgZW50cnkgcGF0aCB3ZSBjYW4ndCB6YXAgVEYgdW50aWwgRUZMQUdT
IGlzIHNhdmVkLiAqLwogICAgICAgICAgICAgaWYgKCAocmVncy0+cmlwID49ICh1bnNpZ25lZCBs
b25nKXN5c2VudGVyX2VudHJ5KSAmJgogICAgICAgICAgICAgICAgICAocmVncy0+cmlwIDw9ICh1
bnNpZ25lZCBsb25nKXN5c2VudGVyX2VmbGFnc19zYXZlZCkgKQpAQCAtMTg0OSw2ICsxODUwLDcg
QEAgdm9pZCBkb19kZWJ1ZyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICAgICAgICAg
ICAgICAgICAgcmVncy0+ZWZsYWdzICY9IH5YODZfRUZMQUdTX1RGOwogICAgICAgICAgICAgICAg
IHJldHVybjsKICAgICAgICAgICAgIH0KKyNlbmRpZgogICAgICAgICAgICAgaWYgKCAhZGVidWdn
ZXJfdHJhcF9mYXRhbChUUkFQX2RlYnVnLCByZWdzKSApCiAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgV0FSTigpOwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
