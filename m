From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86: silence false log messages for plain
 "xpti" / "pv-l1tf"
Date: Wed, 26 Sep 2018 01:40:16 -0600
Message-ID: <5BAB37E002000078001EBFD6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g54Ql-0001Y3-MY
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 07:40:19 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgY29tbWl0IDJhM2IzNGVjNDcgKCJ4ODYvc3BlYy1jdHJsOiBZZXQgbW9yZSBmaXhlcyBm
b3IgeHB0aT0KcGFyc2luZyIpICBjbGFpbWVkIHRvIGhhdmUgZ290IHJpZCBvZiB0aGUgJ3BhcmFt
ZXRlciAieHB0aSIgaGFzIGludmFsaWQKdmFsdWUgIiIsIHJjPS0yMiEnIGxvZyBtZXNzYWdlIGZv
ciAieHB0aSIgYWxvbmUgb24gdGhlIGNvbW1hbmQgbGluZSwKdGhpcyB3YXNuJ3QgdGhlIGNhc2Ug
KHRoZSBvcHRpb24gdG9vayBlZmZlY3QgbmV2ZXJ0aGVsZXNzKS4KCkZpeCB0aGlzIHRoZXJlIGFz
IHdlbGwgYXMgZm9yIHBsYWluICJwdi1sMXRmIi4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClNwbGl0IG9mZiBmcm9tICJ4ODY6IGZpeCAieHB0aT0i
IGFuZCAicHYtbDF0Zj0iIHlldCBhZ2FpbiIuCgotLS0gYS94ZW4vYXJjaC94ODYvc3BlY19jdHJs
LmMKKysrIGIveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCkBAIC0yNTcsNyArMjU3LDcgQEAgc3Rh
dGljIF9faW5pdCBpbnQgcGFyc2VfcHZfbDF0Zihjb25zdCBjaAogICAgICAgICAgICAgZWxzZSBp
ZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb211Iiwgcywgc3MpKSA+PSAwICkKICAgICAgICAg
ICAgICAgICBvcHRfcHZfbDF0ZiA9ICgob3B0X3B2X2wxdGYgJiB+T1BUX1BWX0wxVEZfRE9NVSkg
fAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2YWwgPyBPUFRfUFZfTDFURl9ET01V
IDogMCkpOwotICAgICAgICAgICAgZWxzZQorICAgICAgICAgICAgZWxzZSBpZiAoICpzICkKICAg
ICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgICAgICAgICBicmVhazsKICAgICAgICAg
fQpAQCAtNzE1LDcgKzcxNSw3IEBAIHN0YXRpYyBfX2luaXQgaW50IHBhcnNlX3hwdGkoY29uc3Qg
Y2hhcgogICAgICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb211Iiwg
cywgc3MpKSA+PSAwICkKICAgICAgICAgICAgICAgICBvcHRfeHB0aSA9IChvcHRfeHB0aSAmIH5P
UFRfWFBUSV9ET01VKSB8CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAodmFsID8gT1BUX1hQ
VElfRE9NVSA6IDApOwotICAgICAgICAgICAgZWxzZQorICAgICAgICAgICAgZWxzZSBpZiAoICpz
ICkKICAgICAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAgICAgICAgICAgICBicmVhazsKICAg
ICAgICAgfQoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
