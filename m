From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 31/62] persistent-net: Set net.ifnames=0
 in di_installcmdline_core
Date: Wed, 10 Apr 2019 15:23:37 +0100
Message-ID: <20190410142408.22848-32-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEE9-0003tA-Bz
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:29:25 +0000
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0
L0RlYmlhbi5wbSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDYz
MDliMjQ2Li5hZmY1YWNkNSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3Nz
dGVzdC9EZWJpYW4ucG0KQEAgLTgxLDYgKzgxLDExIEBAIHN1YiBkZWJpYW5fYm9vdF9zZXR1cCAo
JCQkJCQ7JCkgewogICAgICAgICAka29wdCAuPSAnICcuJHRhcmdrb3B0OwogICAgIH0KIAorICAg
ICMgaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kvU29mdHdhcmUvc3lzdGVtZC9QcmVk
aWN0YWJsZU5ldHdvcmtJbnRlcmZhY2VOYW1lcy8KKyAgICAjIEluIGZhY3QgdGhlc2UgYXJlIGFu
eXRoaW5nIGJ1dCBwcmVkaWN0YWJsZS4gIFdlIHVzZSB0aGUgc2NoZW1lCisgICAgIyBmcm9tIERl
YmlhbiBqZXNzaWUgYW5kIGVhcmxpZXIsIHBlcnNpc3RlbnQtbmV0LWdlbmVyYXRvciBldGMuCisg
ICAgJGtvcHQgLj0gJyBuZXQuaWZuYW1lcz0wJzsKKwogICAgIGZvcmVhY2ggbXkgJGhvb2sgKCRo
b29rcyA/IEAkaG9va3MgOiAoKSkgewogICAgICAgICBteSAkYm9faG9vaz0gJGhvb2stPntFZGl0
Qm9vdE9wdGlvbnN9OwogICAgICAgICAkYm9faG9vay0+KCRobywgXCR4ZW5ob3B0LCBcJGtvcHQp
IGlmICRib19ob29rOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
