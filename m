From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/3] Python 3 compatibility followup patches
Date: Wed, 13 Mar 2019 13:54:45 +0000
Message-ID: <20190313135448.2417-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o/uH=RQ=citrix.com=prvs=96821ebfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h44LO-0004RA-0F
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 13:54:54 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMyk6CiAgYXV0b21hdGlvbjogdXNlIHB5dGhvbi1kZXYgcHl0aG9uMi43LWRldiBp
biBEZWJpYW4gYW5kIFVidW50dQogIHRyYXZpczogdXNlIHB5dGhvbi1kZXYgaW5zdGVhZCBvZiBw
eXRob24yLjctZGV2CiAgYnVpbGQvbTQ6IGZpeCBweXRob24gbGlicmFyeSBkZXRlY3Rpb24gb24g
VWJ1bnR1IHN5c3RlbXMKCiAudHJhdmlzLnltbCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9qZXNzaWUtaTM4Ni5k
b2NrZXJmaWxlICAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9qZXNzaWUuZG9j
a2VyZmlsZSAgICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJldGNo
LWkzODYuZG9ja2VyZmlsZSAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi9zdHJl
dGNoLmRvY2tlcmZpbGUgICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlhbi91
bnN0YWJsZS1hcm02NHY4LmRvY2tlcmZpbGUgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2RlYmlh
bi91bnN0YWJsZS1pMzg2LmRvY2tlcmZpbGUgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxkL2Rl
Ymlhbi91bnN0YWJsZS5kb2NrZXJmaWxlICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1aWxk
L3VidW50dS9iaW9uaWMuZG9ja2VyZmlsZSAgICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9uL2J1
aWxkL3VidW50dS90cnVzdHkuZG9ja2VyZmlsZSAgICAgICAgICAgfCAyICstCiBhdXRvbWF0aW9u
L2J1aWxkL3VidW50dS94ZW5pYWwuZG9ja2VyZmlsZSAgICAgICAgICAgfCAyICstCiBtNC9weXRo
b25fZGV2ZWwubTQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysK
IHRvb2xzL2NvbmZpZ3VyZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDcg
KysrKysrKwogMTMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
