From: Petre Eftime <epetre@amazon.com>
Subject: [PATCH] python: xc: fix max_cpu_index sign error
Date: Thu, 5 Apr 2018 12:49:23 +0000
Message-ID: <1522932563-89973-1-git-send-email-epetre@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pg2a=g2=amazon.com=prvs=62674eea5=epetre@srs-us1.protection.inumbo.net>)
 id 1f44LE-0004cM-IA
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 12:50:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id w35Co3AV071823
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <xen-devel@lists.xenproject.org>; Thu, 5 Apr 2018 12:50:04 GMT
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: epetre@amazon.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiAwLWluZGV4aW5nLCBtYXhpbXVtIGluZGV4IGlzIG51bV9lbnRyaWVzIC0gMS4gVGhlIHB5
dGhvbiB4YyBsaWJyYXJ5IGhhZCBhCnNpZ24gZXJyb3Igd2hlcmUgdGhlIG1pbnVzIHdhcyByZXBs
YWNlZCBieSBhIHBsdXMsIG1ha2luZyB0b29scyB0aGF0IGRlcGVuZGVkCm9uIGl0IHRvIGxvb2sg
Zm9yIENQVXMgdGhhdCBkaWQgbm90IGV4aXN0LgoKU2lnbmVkLW9mZi1ieTogUGV0cmUgRWZ0aW1l
IDxlcGV0cmVAYW1hem9uLmNvbT4KLS0tCiB0b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hj
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMgYi90b29scy9w
eXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMKaW5kZXggZjUwMTc2NC4uNjk0YmZhMCAxMDA2NDQK
LS0tIGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jCisrKyBiL3Rvb2xzL3B5dGhv
bi94ZW4vbG93bGV2ZWwveGMveGMuYwpAQCAtMTA3OSw3ICsxMDc5LDcgQEAgc3RhdGljIFB5T2Jq
ZWN0ICpweXhjX3RvcG9sb2d5aW5mbyhYY09iamVjdCAqc2VsZikKICAgICAgICAgfQogICAgIH0K
IAotICAgIHJldF9vYmogPSBQeV9CdWlsZFZhbHVlKCJ7czppfSIsICJtYXhfY3B1X2luZGV4Iiwg
bnVtX2NwdXMgKyAxKTsKKyAgICByZXRfb2JqID0gUHlfQnVpbGRWYWx1ZSgie3M6aX0iLCAibWF4
X2NwdV9pbmRleCIsIG51bV9jcHVzIC0gMSk7CiAKICAgICBQeURpY3RfU2V0SXRlbVN0cmluZyhy
ZXRfb2JqLCAiY3B1X3RvX2NvcmUiLCBjcHVfdG9fY29yZV9vYmopOwogICAgIFB5X0RFQ1JFRihj
cHVfdG9fY29yZV9vYmopOwotLSAKMi43LjMuQU1aTgoKCgoKQW1hem9uIERldmVsb3BtZW50IENl
bnRlciAoUm9tYW5pYSkgUy5SLkwuIHJlZ2lzdGVyZWQgb2ZmaWNlOiAyN0EgU2YuIExhemFyIFN0
cmVldCwgVUJDNSwgZmxvb3IgMiwgSWFzaSwgSWFzaSBDb3VudHksIDcwMDA0NSwgUm9tYW5pYS4g
UmVnaXN0ZXJlZCBpbiBSb21hbmlhLiBSZWdpc3RyYXRpb24gbnVtYmVyIEoyMi8yNjIxLzIwMDUu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
