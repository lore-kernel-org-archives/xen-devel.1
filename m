From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 11/34] xen/pt: io.c contains HVM only code
Date: Fri, 17 Aug 2018 16:12:29 +0100
Message-ID: <a027b56cd744901c0a45a904bae5a173c90a9ca5.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgg2-0001TM-1r
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:38 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2Ugc3RpbGwgbmVlZCB0byB0ZXN0IENPTkZJR19YODYgYmVjYXVzZSBBcm0gYWxzbyBkZWZpbmVz
IENPTkZJR19IVk0uCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlIHwgNCArKystCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9N
YWtlZmlsZQppbmRleCA2MDg3MzMzLi42YjJkMmUwIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9NYWtlZmlsZQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9NYWtlZmls
ZQpAQCAtNCw2ICs0LDggQEAgc3ViZGlyLSQoQ09ORklHX1g4NikgKz0geDg2CiBzdWJkaXItJChD
T05GSUdfQVJNKSArPSBhcm0KIAogb2JqLXkgKz0gaW9tbXUubwotb2JqLSQoQ09ORklHX1g4Nikg
Kz0gaW8ubworaWZlcSAoJChDT05GSUdfWDg2KSx5KQorb2JqLSQoQ09ORklHX0hWTSkgKz0gaW8u
bworZW5kaWYKIG9iai0kKENPTkZJR19IQVNfUENJKSArPSBwY2kubwogb2JqLSQoQ09ORklHX0hB
U19ERVZJQ0VfVFJFRSkgKz0gZGV2aWNlX3RyZWUubwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
