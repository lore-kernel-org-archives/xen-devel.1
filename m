From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v1.1 for-4.11 0/3] vpci bugfixes
Date: Mon, 26 Mar 2018 12:28:23 +0100
Message-ID: <20180326112826.80443-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0QJQ-0006oj-S3
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 11:29:16 +0000
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
bWVyZ2VkIGxhc3Qgd2Vlay4gVGhleQp3aGVyZSBzcG90dGVkIGJ5IENvdmVyaXR5LgoKVmVyc2lv
biB2MS4xIGlzIGR1ZSB0byB0aGUgZmFjdCB0aGF0IEkndmUgZmFpbGVkIHRvIENjIHRoZSBtYWlu
dGFpbmVycwppbiB2MSwgc29ycnkgZm9yIHRoZSBzcGFtLgoKVGhhbmtzLCBSb2dlci4KClJvZ2Vy
IFBhdSBNb25uZSAoMyk6CiAgdnBjaS9iYXJzOiBmaXggZXJyb3IgbWVzc2FnZQogIHZwY2kvbXNp
eDogZml4IGluY29ycmVjdCB1c2FnZSBvZiBiaXRtYXNrCiAgdnBjaS9tc2k6IGZpeCBzaXplIG9m
IHRoZSB2ZWN0b3JzIGZpZWxkcwoKIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCAyICstCiB4
ZW4vZHJpdmVycy92cGNpL21zaXguYyAgIHwgMiArLQogeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAg
ICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCgotLSAKMi4xNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
