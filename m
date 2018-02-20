From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v5 0/5] clang improvements
Date: Tue, 20 Feb 2018 14:10:10 +0000
Message-ID: <20180220141015.30714-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo8cx-0006Hr-5T
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 14:10:39 +0000
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

CkhlbGxvLAoKVGhlIGZvbGxvd2luZyBzZXJpZXMgcmUtZW5hYmxlIHRoZSBpbnRlZ3JhdGVkIGNs
YW5nIGFzc2VtYmxlciB3aGVuIHRoZQpmZWF0dXJlcyByZXF1aXJlZCBpbiBvcmRlciB0byBidWls
ZCBYZW4gYXJlIGF2YWlsYWJsZS4KClRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIGNs
YW5nIDYsIGNsYW5nIDMuNSwgZ2NjIDYgYW5kIGdjYyA3CndpdGggaW5kaXJlY3QgYnJhbmNoIHN1
cHBvcnQuCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICg1KToKICBidWlsZDogZG8g
bm90IGhhcmRjb2RlIEFGTEFHUyBmb3IgYXMtaW5zbiB0ZXN0cwogIGJ1aWxkOiBmaWx0ZXIgb3V0
IGNvbW1hbmQgbGluZSBhc3NlbWJsZXIgYXJndW1lbnRzCiAgeDg2L2NsYW5nOiByZXN0b3JlIGlu
dGVncmF0ZWQgYXNzZW1ibGVyIHVzYWdlIHdpdGggaW5kaXJlY3QgdGh1bmtzCiAgeDg2OiBmaXgg
aW5kaXJlY3QgdGh1bmsgdXNhZ2Ugb2YgQ09ORklHX0lORElSRUNUX1RIVU5LCiAgYnVpbGQvY2xh
bmc6IGFkZCBhIGNoZWNrIHdoZXRoZXIgdGhlIGFzc2VtYmxlciBzdXBwb3J0cyAuc2tpcCB3aXRo
CiAgICBsYWJlbHMKCiBDb25maWcubWsgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysr
KystLS0tLS0tCiB4ZW4vUnVsZXMubWsgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysr
LS0tLS0KIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgfCAgNiArKystLS0KIHhlbi9h
cmNoL3g4Ni9SdWxlcy5tayAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKy0tLQogeGVuL2lu
Y2x1ZGUvTWFrZWZpbGUgICAgICAgICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2Fz
bV9kZWZucy5oIHwgIDMgKysrCiA2IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDE5
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
