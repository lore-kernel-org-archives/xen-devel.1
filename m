From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 for-4.11 2/2] vpci: make sure handlers can
 deal with size == 0
Date: Mon, 26 Mar 2018 17:32:44 +0100
Message-ID: <20180326163244.84056-2-roger.pau@citrix.com>
References: <20180326163244.84056-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mjw3=gq=citrix.com=prvs=616e7aceb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1f0V3N-0007x5-69
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 16:33:01 +0000
In-Reply-To: <20180326163244.84056-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvZGUgaXMgbm90IHByZXBhcmVkIHRvIGhhbmRsZSBzdWNoIGNhc2UsIHNvIGp1c3QgcmV0
dXJuIGVhcmx5LiBJbgp0aGUgZGVidWcgY2FzZSBhZGQgYW4gYXNzZXJ0LgoKUmVwb3J0ZWQtYnk6
IENvdmVyaXR5CkNvdmVyaXR5IElEOiAxNDMwODA5ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCAxMiArKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvdnBjaS92cGNpLmMgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwppbmRleCAyOTEzYjU2NTAw
Li44MjYwN2JkYjlhIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYworKysgYi94
ZW4vZHJpdmVycy92cGNpL3ZwY2kuYwpAQCAtMzIwLDYgKzMyMCwxMiBAQCB1aW50MzJfdCB2cGNp
X3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6
ZSkKICAgICB1bnNpZ25lZCBpbnQgZGF0YV9vZmZzZXQgPSAwOwogICAgIHVpbnQzMl90IGRhdGEg
PSB+KHVpbnQzMl90KTA7CiAKKyAgICBpZiAoICFzaXplICkKKyAgICB7CisgICAgICAgIEFTU0VS
VF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gZGF0YTsKKyAgICB9CisKICAgICAvKiBG
aW5kIHRoZSBQQ0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLiAqLwogICAgIHBkZXYgPSBwY2lf
Z2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5leHRmdW5jKTsK
ICAgICBpZiAoICFwZGV2ICkKQEAgLTQxNiw2ICs0MjIsMTIgQEAgdm9pZCB2cGNpX3dyaXRlKHBj
aV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsCiAgICAg
Y29uc3Qgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnI7CiAgICAgdW5zaWduZWQgaW50IGRhdGFfb2Zm
c2V0ID0gMDsKIAorICAgIGlmICggIXNpemUgKQorICAgIHsKKyAgICAgICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7CisgICAgICAgIHJldHVybjsKKyAgICB9CisKICAgICAvKgogICAgICAqIEZpbmQg
dGhlIFBDSSBkZXYgbWF0Y2hpbmcgdGhlIGFkZHJlc3MuCiAgICAgICogUGFzc3Rocm91Z2ggZXZl
cnl0aGluZyB0aGF0J3Mgbm90IHRyYXBwZWQuCi0tIAoyLjE2LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
