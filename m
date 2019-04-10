From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 06/62] Debian.pm: use sysvinit-core
 instead of systemd
Date: Wed, 10 Apr 2019 15:23:12 +0100
Message-ID: <20190410142408.22848-7-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAB-0006C5-Nh
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:19 +0000
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
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkluc3RhbGwgdGhhdCBwYWNrYWdl
cyBmb3Igc3VpdGVzID53aGVlenksIGJlY2F1c2UgdGhleSB1c2Ugc3lzdGVtZCBhcwp0aGUgZGVm
YXVsdCBpbml0LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
QWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9z
c3Rlc3QvRGViaWFuLnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0Rl
Ymlhbi5wbQppbmRleCA1OWM2MGQ0MC4uODJiNWZiNDAgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvRGVi
aWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC04MTIsNyArODEyLDcgQEAgc3ViIHBy
ZXNlZWRfYmFzZSAoJCQkO0ApIHsKIAogICAgICMgU3lzdGVtZCBkb2Vzbid0IGhvbm9yIG9zc3Rl
c3QtY29uZmlybS1ib290ZWQgc2VydmljZSwgd2hpY2gKICAgICAjIGJyZWFrcyB0cy1sZWFrLWNo
ZWNrLiAgRmFsbCBiYWNrIHRvIFN5c1YgaW5pdCBmb3Igbm93LgotICAgIGlmICggJHN1aXRlID1+
IC9qZXNzaWUvICkgeworICAgIGlmICggJHN1aXRlICF+IC9zcXVlZXplfHdoZWV6eS8gKSB7CiAg
ICAgICAgcHJlc2VlZF9ob29rX2NvbW1hbmQoJGhvLCAnbGF0ZV9jb21tYW5kJywgJHNmeCwgPDxF
TkQpCiBpbi10YXJnZXQgYXB0LWdldCBpbnN0YWxsIC15IHN5c3Zpbml0LWNvcmUKIEVORAotLSAK
Mi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
