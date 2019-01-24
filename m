From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/26] power: ipmi_try: Use `use parent'
 instead of Exporter
Date: Thu, 24 Jan 2019 18:45:50 +0000
Message-ID: <20190124184613.2720-4-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1C-0003fu-Aj
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:26 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtb2R1bGUgYWxyZWFkeSBoYXMgYSBzdXBlcmNsYXNzLCBgaXBtaScuICBJbXBvcnQgaXQg
d2l0aCBgdXNlCnBhcmVudCcgaW5zdGVhZCBvZiBFeHBvcnRlci4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvUERVL2lw
bWlfdHJ5LnBtIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9QRFUvaXBtaV90cnku
cG0gYi9Pc3N0ZXN0L1BEVS9pcG1pX3RyeS5wbQppbmRleCA2NGI0M2RkMi4uY2Y4NTFkMjEgMTAw
NjQ0Ci0tLSBhL09zc3Rlc3QvUERVL2lwbWlfdHJ5LnBtCisrKyBiL09zc3Rlc3QvUERVL2lwbWlf
dHJ5LnBtCkBAIC0yMiwyMCArMjIsOCBAQCB1c2Ugd2FybmluZ3M7CiB1c2UgT3NzdGVzdDsKIHVz
ZSBPc3N0ZXN0OjpUZXN0U3VwcG9ydDsKIHVzZSBJTzo6RmlsZTsKLXVzZSBPc3N0ZXN0OjpQRFU6
OmlwbWk7CiAKLXVzZSBwYXJlbnQgT3NzdGVzdDo6UERVOjp1bnN1cHBvcnRlZDsKLQotQkVHSU4g
ewotICAgIHVzZSBFeHBvcnRlciAoKTsKLSAgICBvdXIgKCRWRVJTSU9OLCBASVNBLCBARVhQT1JU
LCBARVhQT1JUX09LLCAlRVhQT1JUX1RBR1MpOwotICAgICRWRVJTSU9OICAgICA9IDEuMDA7Ci0g
ICAgQElTQSAgICAgICAgID0gcXcoRXhwb3J0ZXIgT3NzdGVzdDo6UERVOjppcG1pKTsKLSAgICBA
RVhQT1JUICAgICAgPSBxdygpOwotICAgICVFWFBPUlRfVEFHUyA9ICggKTsKLQotICAgIEBFWFBP
UlRfT0sgICA9IHF3KCk7Ci19Cit1c2UgcGFyZW50IHF3KE9zc3Rlc3Q6OlBEVTo6aXBtaSk7CiAK
IHN1YiBwZHVfcG93ZXJfc3RhdGUgewogICAgIG15ICgkbW8sICRvbikgPSBAXzsKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
