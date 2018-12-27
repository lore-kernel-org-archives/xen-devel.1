From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/5] x86/dom0: add missing flag to printf format
 for PVH
Date: Thu, 27 Dec 2018 16:26:36 +0100
Message-ID: <20181227152638.41648-4-roger.pau@citrix.com>
References: <20181227152638.41648-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wa+V=PE=citrix.com=prvs=8928ed1c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcXYr-0003Xm-H0
 for xen-devel@lists.xenproject.org; Thu, 27 Dec 2018 15:27:01 +0000
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
eDg2L2h2bS9kb20wX2J1aWxkLmMKaW5kZXggMjRjYzE1ZjI4Yi4uYzBlYjljYjk1MyAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2h2
bS9kb20wX2J1aWxkLmMKQEAgLTEyNCw3ICsxMjQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhf
cG9wdWxhdGVfbWVtb3J5X3JhbmdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvcmRlcik7CiAgICAgICAgIGlmICggcmMgIT0gMCApCiAgICAg
ICAgIHsKLSAgICAgICAgICAgIHByaW50aygiRmFpbGVkIHRvIHBvcHVsYXRlIG1lbW9yeTogWyUj
bHgsJWx4KTogJWRcbiIsCisgICAgICAgICAgICBwcmludGsoIkZhaWxlZCB0byBwb3B1bGF0ZSBt
ZW1vcnk6IFslI2x4LCUjbHgpOiAlZFxuIiwKICAgICAgICAgICAgICAgICAgICBzdGFydCwgc3Rh
cnQgKyAoMVVMIDw8IG9yZGVyKSwgcmMpOwogICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAg
ICAgICAgIH0KLS0gCjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
