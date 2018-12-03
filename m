From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 4/4] x86/mm/p2m: stop checking for IOMMU
 shared page tables in mmio_order()
Date: Mon, 3 Dec 2018 17:40:17 +0000
Message-ID: <20181203174017.11956-5-paul.durrant@citrix.com>
References: <20181203174017.11956-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fpmc=om=citrix.com=prvs=868f8ab54=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gTsCl-0004Z9-Sw
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 17:40:23 +0000
In-Reply-To: <20181203174017.11956-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHRoYXQgdGhlIGlvbW11X21hcCgpIGFuZCBpb21tdV91bm1hcCgpIG9wZXJhdGlvbnMgdGFr
ZSBhbiBvcmRlcgpwYXJhbWV0ZXIgYW5kIGVsaWRlIGZsdXNoaW5nIHRoZXJlJ3Mgbm8gc3Ryb25n
IHJlYXNvbiB3aHkgbW9kaWZ5aW5nIE1NSU8KcmFuZ2VzIGluIHRoZSBwMm0gc2hvdWxkIGJlIHJl
c3RyaWN0ZWQgdG8gYSA0ayBncmFudWxhcml0eSBzaW1wbHkgYmVjYXVzZQp0aGUgSU9NTVUgaXMg
ZW5hYmxlZCBidXQgc2hhcmVkIHBhZ2UgdGFibGVzIGFyZSBub3QgaW4gb3BlcmF0aW9uLgoKU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNj
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ2M6ICJSb2dl
ciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKIC0gTmV3IGluIHYyLiAo
QWRhcHRlZCBmcm9tIGEgcHJldmlvdXNseSBpbmRlcGVuZGVudCBwYXRjaCkuCi0tLQogeGVuL2Fy
Y2gveDg2L21tL3AybS5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5kZXggZWQ3NmU5NmQzMy4uYTljZmQxYjJlNCAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpA
QCAtMjA1OSwxMyArMjA1OSwxMiBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG1taW9fb3JkZXIoY29u
c3Qgc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHN0YXJ0X2ZuLCB1bnNpZ25lZCBsb25nIG5yKQogewogICAgIC8qCi0gICAgICog
Tm90ZSB0aGF0IHRoZSAhaW9tbXVfdXNlX2hhcF9wdCgpIGhlcmUgaGFzIHRocmVlIGVmZmVjdHM6
Ci0gICAgICogLSBjb3ZlciBpb21tdV97LHVufW1hcF9wYWdlKCkgbm90IGhhdmluZyBhbiAib3Jk
ZXIiIGlucHV0IHlldCwKKyAgICAgKiBOb3RlIHRoYXQgdGhlICFoYXBfZW5hYmxlZCgpIGhlcmUg
aGFzIHR3byBlZmZlY3RzOgogICAgICAqIC0gZXhjbHVkZSBzaGFkb3cgbW9kZSAod2hpY2ggZG9l
c24ndCBzdXBwb3J0IGxhcmdlIE1NSU8gbWFwcGluZ3MpLAogICAgICAqIC0gZXhjbHVkZSBQViBn
dWVzdHMsIHNob3VsZCBleGVjdXRpb24gcmVhY2ggdGhpcyBjb2RlIGZvciBzdWNoLgogICAgICAq
IFNvIGJlIGNhcmVmdWwgd2hlbiBhbHRlcmluZyB0aGlzLgogICAgICAqLwotICAgIGlmICggIWlv
bW11X3VzZV9oYXBfcHQoZCkgfHwKKyAgICBpZiAoICFoYXBfZW5hYmxlZChkKSB8fAogICAgICAg
ICAgKHN0YXJ0X2ZuICYgKCgxVUwgPDwgUEFHRV9PUkRFUl8yTSkgLSAxKSkgfHwgIShuciA+PiBQ
QUdFX09SREVSXzJNKSApCiAgICAgICAgIHJldHVybiBQQUdFX09SREVSXzRLOwogCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
