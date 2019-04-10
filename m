From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 28/62] ts-host-install: Unconditionally
 mkdir -p /etc/udev/rules.d
Date: Wed, 10 Apr 2019 15:23:34 +0100
Message-ID: <20190410142408.22848-29-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEDe-0003b1-S0
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:28:54 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
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

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdGhpcyBkaXJlY3RvcnkgdG8gZXhpc3Qgc28gdGhhdCB3ZSBj
YW4gcHV0IGEKY2FuYXJ5IGluIDcwLXBlcnNpc3RlbnQtbmV0LnJ1bGVzLgoKSW4gdGhlIGNhc2Vz
IHdoZXJlIHRoZSBiZWhhdmlvdXIgb2Ygb3NzdGVzdCBjaGFuZ2VzLCB0aGUgZW1wdHkKZGlyZWN0
b3J5IGRvZXMgbm90IHJlc3VsdCBpbiBhbnkgb3ZlcmFsbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWlu
c3RhbGwgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3RzLWhvc3QtaW5zdGFsbCBiL3RzLWhvc3QtaW5zdGFsbAppbmRl
eCBmODBhMTUxYy4uNzQyM2ViOWIgMTAwNzU1Ci0tLSBhL3RzLWhvc3QtaW5zdGFsbAorKysgYi90
cy1ob3N0LWluc3RhbGwKQEAgLTE5OCw2ICsxOTgsOCBAQCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJz
dGJvb3QoJCkgewogICAgIG15ICRwZXJzaXN0ZW50X25ldF9ydWxlcyA9CiAJIiRpbml0cmRfb3Zl
cmxheS5kL2V0Yy91ZGV2L3J1bGVzLmQvNzAtcGVyc2lzdGVudC1uZXQucnVsZXMiOwogCisgICAg
c3lzdGVtX2NoZWNrZWQocXcobWtkaXIgLXAgLS0pLCAiJGluaXRyZF9vdmVybGF5LmQvZXRjL3Vk
ZXYvcnVsZXMuZCIpOworCiAgICAgbXkgJGlwYXBwZW5kID0gMjsKICAgICBteSAkd2FudHBoeXNp
Zj0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCdpbnRlcmZhY2UgZm9yY2UnLCdhdXRvJyk7CiAgICAg
bG9nbSgiRm9yY2luZyBpbnRlcmZhY2UgJHdhbnRwaHlzaWYiKTsKQEAgLTIwNSw3ICsyMDcsNiBA
QCBzdWIgc2V0dXBfbmV0Ym9vdF9maXJzdGJvb3QoJCkgewogCSRpcGFwcGVuZCA9IDA7CiAJZGll
ICJuZWVkIEV0aGVyIGZvciAkaG8tPntOYW1lfSAoJHdhbnRwaHlzaWYpIgogCSAgICB1bmxlc3Mg
ZGVmaW5lZCAkaG8tPntFdGhlcn07Ci0gICAgICAgIHN5c3RlbV9jaGVja2VkKHF3KG1rZGlyIC1w
IC0tKSwgIiRpbml0cmRfb3ZlcmxheS5kL2V0Yy91ZGV2L3J1bGVzLmQiKTsKIAkjIGlwKDgpIG1v
dmVkIHRvIC9zYmluIGluIEplc3NpZQogCW15ICRpcGNtZCA9ICRoby0+e1N1aXRlfSA9fiBtL3do
ZWV6eS8gPyAiL2Jpbi9pcCIgOiAiL3NiaW4vaXAiOwogICAgICAgICBmaWxlX3NpbXBsZV93cml0
ZV9jb250ZW50cwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
