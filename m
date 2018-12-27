From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/5] x86/dom0: fix wording of PVH Dom0 error
 message
Date: Thu, 27 Dec 2018 16:26:34 +0100
Message-ID: <20181227152638.41648-2-roger.pau@citrix.com>
References: <20181227152638.41648-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wa+V=PE=citrix.com=prvs=8928ed1c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcXYn-0003X5-Fp
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 15:26:57 +0000
In-Reply-To: <20181227152638.41648-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVp
bGQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jIGIveGVuL2FyY2gv
eDg2L2h2bS9kb20wX2J1aWxkLmMKaW5kZXggMTJjMjBhNGI2Ni4uOTFkYzI3ZGMzZSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2
bS9kb20wX2J1aWxkLmMKQEAgLTczOSw3ICs3MzksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhf
c2V0dXBfYWNwaV9tYWR0KHN0cnVjdCBkb21haW4gKmQsIHBhZGRyX3QgKmFkZHIpCiAgICAgLyog
UGxhY2UgdGhlIG5ldyBNQURUIGluIGd1ZXN0IG1lbW9yeSBzcGFjZS4gKi8KICAgICBpZiAoIHB2
aF9zdGVhbF9yYW0oZCwgc2l6ZSwgMCwgR0IoNCksIGFkZHIpICkKICAgICB7Ci0gICAgICAgIHBy
aW50aygiVW5hYmxlIHRvIGZpbmQgYWxsb2NhdGUgZ3Vlc3QgUkFNIGZvciBNQURUXG4iKTsKKyAg
ICAgICAgcHJpbnRrKCJVbmFibGUgdG8gc3RlYWwgZ3Vlc3QgUkFNIGZvciBNQURUXG4iKTsKICAg
ICAgICAgcmMgPSAtRU5PTUVNOwogICAgICAgICBnb3RvIG91dDsKICAgICB9Ci0tIAoyLjE3LjIg
KEFwcGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
