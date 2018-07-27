From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 04/32] libxl_json: fix build with DEBUG_ANSWER
Date: Fri, 27 Jul 2018 15:05:46 +0100
Message-ID: <20180727140614.13256-5-anthony.perard@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnga=kl=citrix.com=prvs=739d1796c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fj3Ns-0005RP-5n
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 14:06:20 +0000
In-Reply-To: <20180727140614.13256-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxzbyByZXBsYWNlIExJQlhMX19MT0dfREVCVUcgYnkgWFRMX0RFQlVHLCBiZWNhdXNlIGl0J3Mg
c2hvcnRlciBhbmQKbW9yZSBvZnRlbiB1c2VkIGluIGxpYnhsLgoKU2lnbmVkLW9mZi1ieTogQW50
aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHY0OgogICAg
ICAgIGV4cGxhaW4gcy9MSUJYTF9fTE9HX0RFQlVHL1hUTF9ERUJVRy8uCiAgICAgICAgYWNrZWQK
CiB0b29scy9saWJ4bC9saWJ4bF9qc29uLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGli
eGxfanNvbi5jIGIvdG9vbHMvbGlieGwvbGlieGxfanNvbi5jCmluZGV4IDA4MjNiOGNmZDIuLmRj
OTNhODhlZjEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2pzb24uYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF9qc29uLmMKQEAgLTU5LDggKzU5LDggQEAgc3RydWN0IGxpYnhsX195YWps
X2N0eCB7CiAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGNoYXIgKmJ1ZiA9IE5VTEw7IFwKICAgICAg
ICAgc2l6ZV90IGxlbiA9IDA7IFwKICAgICAgICAgeWFqbF9nZW5fZ2V0X2J1ZigoeWFqbF9jdHgp
LT5nLCAmYnVmLCAmbGVuKTsgXAotICAgICAgICBMSUJYTF9fTE9HKGxpYnhsX19nY19vd25lcigo
eWFqbF9jdHgpLT5nYyksIExJQlhMX19MT0dfREVCVUcsCi0JCSAgICJyZXNwb25zZTpcbiIsIGJ1
Zik7IFwKKyAgICAgICAgTElCWExfX0xPRyhsaWJ4bF9fZ2Nfb3duZXIoKHlhamxfY3R4KS0+Z2Mp
LCBYVExfREVCVUcsIFwKKwkJICAgInJlc3BvbnNlOiAlc1xuIiwgYnVmKTsgXAogICAgICAgICB5
YWpsX2dlbl9mcmVlKCh5YWpsX2N0eCktPmcpOyBcCiAgICAgICAgICh5YWpsX2N0eCktPmcgPSBO
VUxMOyBcCiAgICAgfSB3aGlsZSAoMCkKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
