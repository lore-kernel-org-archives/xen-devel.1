From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] xen/pvshim: fix GNTTABOP_query_size hypercall
	forwarding with SMAP
Date: Fri, 26 Jan 2018 15:29:10 +0000
Message-ID: <20180126152910.4320-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5n3w=ev=citrix.com=prvs=5573f66d7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ef5wa-0000UQ-Vi
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 15:29:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGlzYWJsZSBTTUFQIGluIHRoZSBzaGltIGJlZm9yZSBib3VuY2luZyB0aGUgaHlwZXJjYWxsLCBv
ciBlbHNlIEwwCndpbGwgZmFpbCB0byBnZXQgdGhlIGh5cGVyY2FsbCBidWZmZXIuCgpTaWduZWQt
b2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmVwb3J0ZWQt
Ynk6IEZhdGloIEFjYXIgPGZhdGloLmFjYXJAZ2FuZGkubmV0PgotLS0KQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpOZWVkcyB0byBiZSBiYWNrcG9ydGVk
IHRvIHRoZSA0LjEwLjAtc2hpbS1jb21ldCBicmFuY2guCi0tLQogeGVuL2FyY2gveDg2L3B2L3No
aW0uYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKaW5kZXgg
ZDUzODNkY2ZjNy4uZWIxZWU3ZDNjNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L3NoaW0u
YworKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCkBAIC03NDgsNyArNzQ4LDEwIEBAIHN0YXRp
YyBsb25nIHB2X3NoaW1fZ3JhbnRfdGFibGVfb3AodW5zaWduZWQgaW50IGNtZCwKICAgICB9CiAK
ICAgICBjYXNlIEdOVFRBQk9QX3F1ZXJ5X3NpemU6CisgICAgICAgIC8qIERpc2FibGUgU01BUCBz
byBMMCBjYW4gYWNjZXNzIHRoZSBidWZmZXIuICovCisgICAgICAgIHN0YWMoKTsKICAgICAgICAg
cmMgPSB4ZW5faHlwZXJjYWxsX2dyYW50X3RhYmxlX29wKEdOVFRBQk9QX3F1ZXJ5X3NpemUsIHVv
cC5wLCBjb3VudCk7CisgICAgICAgIGNsYWMoKTsKICAgICAgICAgYnJlYWs7CiAKICAgICBkZWZh
dWx0OgotLSAKMi4xNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
