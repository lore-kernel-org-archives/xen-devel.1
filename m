From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v5 5/5] x86: expose CONFIG_HVM
Date: Fri, 21 Sep 2018 16:54:52 +0100
Message-ID: <0171971928c5b85efeb7544d0e9bd277c9438423.1537545258.git-series.wei.liu2@citrix.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4pl1=md=citrix.com=prvs=7953d62ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g3Nlf-0005Lh-RL
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 15:54:55 +0000
In-Reply-To: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCnY1OiBjaGFu
Z2UgZGVmYXVsdCB0byAhUFZfU0hJTV9FWENMVVNJVkUKdjQ6IHJlbW92ZSBhIGJsYW5rIGxpbmUK
djM6IGxvbmdlciB0ZXh0CnYyOiB1c2UgdGFiIHRvIGluZGVudAotLS0KIHhlbi9hcmNoL3g4Ni9L
Y29uZmlnIHwgMTIgKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVu
L2FyY2gveDg2L0tjb25maWcKaW5kZXggYWUxYjcwNy4uNTQ4Y2JmOSAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L0tjb25maWcKKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKQEAgLTU5LDcgKzU5
LDE3IEBAIGNvbmZpZyBQVl9MSU5FQVJfUFQKICAgICAgICAgIElmIHVuc3VyZSwgc2F5IFkuCiAK
IGNvbmZpZyBIVk0KLQlkZWZfYm9vbCB5CisJZGVmX2Jvb2wgIVBWX1NISU1fRVhDTFVTSVZFCisJ
cHJvbXB0ICJIVk0gc3VwcG9ydCIKKwktLS1oZWxwLS0tCisJICBJbnRlcmZhY2VzIHRvIHN1cHBv
cnQgSFZNIGd1ZXN0cyB3aGljaCByZXF1aXJlIGhhcmR3YXJlCisJICBzdXBwb3J0IGxpa2UgSW50
ZWwncyBWVC14IG9yIEFNRCdzIFNWTS4gTm90ZSB0aGUgaHlwZXJ2aXNvcgorCSAgZG9lc24ndCBk
aXN0aW5ndWlzaCBIVk0gb3IgUFZIIGd1ZXN0IHR5cGVzLiBQVkggZ3Vlc3QgdHlwZQorCSAgaXMg
b25seSBhIGNvbmNlcHQgZm9yIGVuZCB1c2Vycy4KKworCSAgVGhpcyBvcHRpb24gaXMgbmVlZGVk
IGlmIHlvdSB3YW50IHRvIHJ1biBIVk0gb3IgUFZIIGd1ZXN0cy4KKworCSAgSWYgdW5zdXJlLCBz
YXkgWS4KIAogY29uZmlnIFNIQURPV19QQUdJTkcKICAgICAgICAgYm9vbCAiU2hhZG93IFBhZ2lu
ZyIKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
