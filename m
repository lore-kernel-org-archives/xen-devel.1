From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 0/3] vpci bugfixes
Date: Mon, 26 Mar 2018 12:21:01 +0100
Message-ID: <20180326112104.80041-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QBl-0005x4-U4
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:21:21 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHRyZWUgcGF0Y2hlcyBhcmUgYnVnZml4ZXMgZm9yIHRoZSB2UENJIGNvZGUg
bWVyZ2VkIGxhc3Qgd2Vlay4gVGhleQp3aGVyZSBzcG90dGVkIGJ5IENvdmVyaXR5LgoKVGhhbmtz
LCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoMyk6CiAgdnBjaS9iYXJzOiBmaXggZXJyb3IgbWVz
c2FnZQogIHZwY2kvbXNpeDogZml4IGluY29ycmVjdCB1c2FnZSBvZiBiaXRtYXNrCiAgdnBjaS9t
c2k6IGZpeCBzaXplIG9mIHRoZSB2ZWN0b3JzIGZpZWxkcwoKIHhlbi9kcml2ZXJzL3ZwY2kvaGVh
ZGVyLmMgfCAyICstCiB4ZW4vZHJpdmVycy92cGNpL21zaXguYyAgIHwgMiArLQogeGVuL2luY2x1
ZGUveGVuL3ZwY2kuaCAgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCgotLSAKMi4xNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
