From: Jim Fehlig <jfehlig@suse.com>
Subject: [PATCH 0/5] libxl: various migration V3 improvements
Date: Wed,  5 Sep 2018 15:27:59 -0600
Message-ID: <20180905212804.10587-1-jfehlig__29956.2532957227$1536182835$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ayz8=lt=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1fxfLX-0006H7-7w
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 21:28:19 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: libvir-list@redhat.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggNSBmaXhlcyBhIGxvbmcgc3RhbmRpbmcgcHJvYmxlbSBmb3VuZCBieSBzb21lIHZlcnkg
c2xvdyBob3N0cyBpbgp4ZW4ncyBvc3N0ZXN0CgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDgvbXNnMDE5NDUuaHRtbAoKV2hpbGUgd29y
a2luZyBvbiB0aGUgZml4LCBJIGRpc2NvdmVyZWQgb3RoZXIgcHJvYmxlbXMgaW4gbGlieGwncyBW
MwptaWdyYXRpb24gcHJvdG9jb2wuIEUuZy4gYSBtb2RpZnkgam9iIG9uIHRoZSBtaWdyYXRpbmcg
Vk0gd2FzIG5vdApoYW5kbGVkIHByb3Blcmx5IGFjcm9zcyB0aGUgcGhhc2VzIG9uIGVpdGhlciBz
cmMgb3IgZHN0IGhvc3QuIFBhdGNoZXMKMS00IGZpeCB0aGlzIGFuZCBvdGhlciBwcm9ibGVtcyBm
b3VuZCBhbG9uZyB0aGUgd2F5LgoKSmltIEZlaGxpZyAoNSk6CiAgbGlieGw6IG1pZ3JhdGlvbjog
ZGVmZXIgcmVtb3ZpbmcgVk0gdW50aWwgZmluaXNoIHBoYXNlCiAgbGlieGw6IGZpeCBsb2dpYyBp
biBQMlAgbWlncmF0aW9uCiAgbGlieGw6IGZpeCBqb2IgaGFuZGxpbmcgYWNyb3NzIG1pZ3JhdGlv
biBwaGFzZXMgb24gc3JjCiAgbGlieGw6IGZpeCBqb2IgaGFuZGxpbmcgYWNyb3NzIG1pZ3JhdGlv
biBwaGFzZXMgb24gZHN0CiAgbGlieGw6IGpvaW4gd2l0aCB0aHJlYWQgcmVjZWl2aW5nIG1pZ3Jh
dGlvbiBkYXRhCgogc3JjL2xpYnhsL2xpYnhsX2RvbWFpbi5oICAgIHwgICAxICsKIHNyYy9saWJ4
bC9saWJ4bF9kcml2ZXIuYyAgICB8ICAgNyAtLQogc3JjL2xpYnhsL2xpYnhsX21pZ3JhdGlvbi5j
IHwgMTY4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFu
Z2VkLCAxMTQgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
