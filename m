From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/3] ts-livepatch-run: Treat (just)
 falseish from OutputCheck as fail
Date: Wed, 16 Jan 2019 11:36:35 +0000
Message-ID: <20190116113637.10819-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2owm=PY=citrix.com=prvs=912d934db=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gjjVB-0002j4-Rb
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 11:36:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBtb3JlIGlkaW9tYXRpYy4gIEFsbCBleGlzdGluZyBPdXRwdXRDaGVja3MgcmV0dXJu
IGJvb2xlYW5zLCBzbwpubyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgotLS0KIHRzLWxpdmVwYXRjaC1ydW4gfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdHMtbGl2ZXBhdGNoLXJ1biBiL3RzLWxpdmVwYXRjaC1ydW4KaW5kZXggZjExOTQ1
ODYuLjhmZGI4MDA0IDEwMDc1NQotLS0gYS90cy1saXZlcGF0Y2gtcnVuCisrKyBiL3RzLWxpdmVw
YXRjaC1ydW4KQEAgLTE0Nyw4ICsxNDcsOCBAQCBzdWIgbGl2ZXBhdGNoX3Rlc3QgKCkgewogICAg
ICAgICB9CiAgICAgICAgIGlmIChkZWZpbmVkKCR0ZXN0LT57T3V0cHV0Q2hlY2t9KSkgewogICAg
ICAgICAgICAgJF8gPSAkb3V0cHV0OwotICAgICAgICAgICAgJHJjPSR0ZXN0LT57T3V0cHV0Q2hl
Y2t9LT4oKTsKLSAgICAgICAgICAgIGlmICgkcmMgbmUgMSkgeworICAgICAgICAgICAgbXkgJG9r
ID0gJHRlc3QtPntPdXRwdXRDaGVja30tPigpOworICAgICAgICAgICAgaWYgKCEkb2spIHsKICAg
ICAgICAgICAgICAgICBkaWUgIkZBSUxFRCEgT3V0cHV0Q2hlY2s9JHRlc3QtPntPdXRwdXRDaGVj
a30sIGlucHV0PSRvdXRwdXRcbiI7CiAgICAgICAgICAgICB9CiAgICAgICAgIH0KLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
