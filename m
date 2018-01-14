From: Michael Young <m.a.young@durham.ac.uk>
Subject: [PATCH] -xen-attach is needed for pvh boot with qemu-xen
Date: Sun, 14 Jan 2018 21:12:51 +0000 (GMT)
Message-ID: <alpine.LFD.2.21.1801142103030.6069@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=t6cw=ej=durham.ac.uk=m.a.young@srs-us1.protection.inumbo.net>)
 id 1eapaU-000220-6k
 for xen-devel@lists.xenproject.org; Sun, 14 Jan 2018 21:13:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IHRoZSBib290IG9mIGEgcHZoIGd1ZXN0IHVzaW5nIHRoZSBxZW11LXhlbiBkZXZp
Y2UgbW9kZWwgZmFpbHMKd2l0aCB0aGUgZXJyb3IKeGVuIGVtdWxhdGlvbiBub3QgaW1wbGVtZW50
ZWQgKHlldCkKaW4gdGhlIHFlbXUtZG0gbG9nIGZpbGUuIFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWlz
c2luZyAteGVuLWF0dGFjaAphcmd1bWVudC4KClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgWW91bmcg
PG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+Ci0tLQogIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgfCAz
ICsrLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0u
YwppbmRleCBhMmVhOTVhOWJlLi4zYTgzOWQ1YzFlIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9kbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTEwMjEsNyArMTAyMSw4
IEBAIHN0YXRpYyBpbnQgbGlieGxfX2J1aWxkX2RldmljZV9tb2RlbF9hcmdzX25ldyhsaWJ4bF9f
Z2MgKmdjLAogICAgICAgKi8KICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLW5vLXVz
ZXItY29uZmlnIik7CgotICAgIGlmIChiX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVf
UFYpIHsKKyAgICBpZiAoKGJfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QVikgfHwK
KyAgICAgICAgKGJfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5fVFlQRV9QVkgpKSB7CiAgICAg
ICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsICIteGVuLWF0dGFjaCIpOwogICAgICB9Cgot
LSAKMi4xNC4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
