From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 29/62] ts-host-install: Put canary in
 70-persistent-net.rules
Date: Wed, 10 Apr 2019 15:23:35 +0100
Message-ID: <20190410142408.22848-30-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAK-0006R4-7v
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:28 +0000
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

VGhpcyB3aWxsIGFsbG93IHVzIHRvIHNlZSBpZiB0aGUgaW5pdHJhbWZzJ3MgbmV0d29yayBuYW1l
cyBhcmUgYmVpbmcKcHJvcGVybHkgY29waWVkIHRvIHRoZSBpbnN0YWxsZWQgc3lzdGVtLiAgSWUs
IHRoaXMgaXMganVzdCBhIGRlYnVnZ2luZwphaWQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy1ob3N0
LWluc3RhbGwgYi90cy1ob3N0LWluc3RhbGwKaW5kZXggNzQyM2ViOWIuLmVhMDg3YTI1IDEwMDc1
NQotLS0gYS90cy1ob3N0LWluc3RhbGwKKysrIGIvdHMtaG9zdC1pbnN0YWxsCkBAIC0yMTgsNiAr
MjE4LDEwIEBAIFNVQlNZU1RFTT09Im5ldCIsIEFDVElPTj09ImFkZCIsIERSSVZFUlM9PSI/KiIs
IEFUVFJ7YWRkcmVzc309PSIkaG8tPntFdGhlcn0iLCBBCiBFTkQKICAgICB9CiAKKyAgICBvcGVu
IENBTkFSWSwgJz4+JywgIiRwZXJzaXN0ZW50X25ldF9ydWxlcyIgb3IgZGllICQhOworICAgIHBy
aW50IENBTkFSWSAiXG4jIC0gY2FuYXJ5IC0gY2FtZSB2aWEgaW5pdHJhbWZzXG4iIG9yIGRpZSAk
ITsKKyAgICBjbG9zZSBDQU5BUlkgb3IgZGllICQhOworCiAgICAgbXkgJXhvcHRzOwogCiAgICAg
ZGlfc3BlY2lhbF9rZXJuZWwoJGhvLCBzdWIgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
