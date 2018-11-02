From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 6/7] x86: expose CONFIG_PV
Date: Fri, 2 Nov 2018 15:55:44 +0000
Message-ID: <2e9eda4bdb70a50f011e8347941c8d5f0165dec4.1541174103.git-series.wei.liu2@citrix.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIbnf-0004X5-Km
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 15:55:55 +0000
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQp2MzogdXBkYXRl
IHRleHQKdjI6IGd1ZXN0IC0+IGRvbWFpbgotLS0KIHhlbi9hcmNoL3g4Ni9LY29uZmlnIHwgOCAr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggNTQ4Y2JmOS4u
MzdhZjcyOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKKysrIGIveGVuL2FyY2gv
eDg2L0tjb25maWcKQEAgLTM3LDYgKzM3LDE0IEBAIHNvdXJjZSAiYXJjaC9LY29uZmlnIgogCiBj
b25maWcgUFYKIAlkZWZfYm9vbCB5CisJcHJvbXB0ICJQViBzdXBwb3J0IgorCS0tLWhlbHAtLS0K
KwkgIEludGVyZmFjZXMgdG8gc3VwcG9ydCBQViBkb21haW5zLiBUaGVzZSByZXF1aXJlIGd1ZXN0
IGtlcm5lbCBzdXBwb3J0CisJICB0byBydW4gYXMgYSBQViBndWVzdCwgYnV0IGRvbid0IHJlcXVp
cmUgYW55IHNwZWNpZmljIGhhcmR3YXJlIHN1cHBvcnQuCisKKwkgIFRoaXMgb3B0aW9uIGlzIG5l
ZWRlZCBpZiB5b3Ugd2FudCB0byBydW4gUFYgZG9tYWlucy4KKworCSAgSWYgdW5zdXJlLCBzYXkg
WS4KIAogY29uZmlnIFBWX0xJTkVBUl9QVAogICAgICAgIGJvb2wgIlN1cHBvcnQgZm9yIFBWIGxp
bmVhciBwYWdldGFibGVzIgotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
