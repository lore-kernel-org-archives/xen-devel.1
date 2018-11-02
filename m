From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 7/7] x86: update help string for CONFIG_HVM
Date: Fri, 2 Nov 2018 15:55:45 +0000
Message-ID: <4d892f7f59b5fef0dbb62ac5c96d2549faa3ba03.1541174103.git-series.wei.liu2@citrix.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIbng-0004XV-Re
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 15:55:56 +0000
In-Reply-To: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VXBkYXRlIHRleHQuIENoYW5nZSAiZ3Vlc3QiIHRvICJkb21haW4iIHdoZXJlIGFwcHJvcHJpYXRl
IGJlY2F1c2UKImd1ZXN0IiBkb2Vzbid0IGluY2x1ZGUgRG9tYWluIDAuCgpTaWduZWQtb2ZmLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KdjM6IHVwZGF0ZSB0ZXh0CnYyOiBu
ZXcKLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyB8ICA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDM3YWY3MjguLjVjMmQx
MDcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL3hlbi9hcmNoL3g4Ni9L
Y29uZmlnCkBAIC03MCwxMiArNzAsMTEgQEAgY29uZmlnIEhWTQogCWRlZl9ib29sICFQVl9TSElN
X0VYQ0xVU0lWRQogCXByb21wdCAiSFZNIHN1cHBvcnQiCiAJLS0taGVscC0tLQotCSAgSW50ZXJm
YWNlcyB0byBzdXBwb3J0IEhWTSBndWVzdHMgd2hpY2ggcmVxdWlyZSBoYXJkd2FyZQotCSAgc3Vw
cG9ydCBsaWtlIEludGVsJ3MgVlQteCBvciBBTUQncyBTVk0uIE5vdGUgdGhlIGh5cGVydmlzb3IK
LQkgIGRvZXNuJ3QgZGlzdGluZ3Vpc2ggSFZNIG9yIFBWSCBndWVzdCB0eXBlcy4gUFZIIGd1ZXN0
IHR5cGUKLQkgIGlzIG9ubHkgYSBjb25jZXB0IGZvciBlbmQgdXNlcnMuCisJICBJbnRlcmZhY2Vz
IHRvIHN1cHBvcnQgSFZNIGRvbWFpbnMuICBIVk0gZG9tYWlucyByZXF1aXJlIGhhcmR3YXJlCisJ
ICB2aXJ0dWFsaXNhdGlvbiBleHRlbnNpb25zIChlLmcuIEludGVsIFZULXgsIEFNRCBTVk0pLCBi
dXQgY2FuIGJvb3QKKwkgIGd1ZXN0cyB3aGljaCBoYXZlIG5vIHNwZWNpZmljIFhlbiBrbm93bGVk
Z2UuCiAKLQkgIFRoaXMgb3B0aW9uIGlzIG5lZWRlZCBpZiB5b3Ugd2FudCB0byBydW4gSFZNIG9y
IFBWSCBndWVzdHMuCisJICBUaGlzIG9wdGlvbiBpcyBuZWVkZWQgaWYgeW91IHdhbnQgdG8gcnVu
IEhWTSBvciBQVkggZG9tYWlucy4KIAogCSAgSWYgdW5zdXJlLCBzYXkgWS4KIAotLSAKZ2l0LXNl
cmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
