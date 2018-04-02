From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH v1] Xen-blkfront fixes to dynamically adjust
 ring.
Date: Mon,  2 Apr 2018 13:42:31 -0400
Message-ID: <20180402174232.28642-1-konrad.wilk@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, linux-kernel@vger.kernel.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CkhpIQoKVGhpcyBwYXRjaCBhbGxvd3MgZHluYW1pYyByZWNvbmZpZ3VyYXRpb24gb2YgdGhlIHRo
cmVlIGRpZmZlcmVudCBwYXJhbWV0ZXJzCnRoYXQgYW4gWGVuIGJsa2Zyb250IGRyaXZlciBpbml0
aWFsbHkgbmVnb3RpYXRlczoKCiAqIG1heF9pbmRpcmVjdF9zZWdzOiBNYXhpbXVtIGFtb3VudCBv
ZiBzZWdtZW50cy4KICogbWF4X3JpbmdfcGFnZV9vcmRlcjogTWF4aW11bSBvcmRlciBvZiBwYWdl
cyB0byBiZSB1c2VkIGZvciB0aGUgc2hhcmVkIHJpbmcuCiAqIG1heF9xdWV1ZXM6IE1heGltdW0g
b2YgcXVldWVzKHJpbmdzKSB0byBiZSB1c2VkLgoKQnV0IHRoZSBzdG9yYWdlIGJhY2tlbmQsIHdv
cmtsb2FkLCBhbmQgZ3Vlc3QgbWVtb3J5IHJlc3VsdCBpbiB2ZXJ5IGRpZmZlcmVudAp0dW5pbmcg
cmVxdWlyZW1lbnRzLiBJdCdzIGltcG9zc2libGUgdG8gY2VudHJhbGx5IHByZWRpY3QgYXBwbGlj
YXRpb24KY2hhcmFjdGVyaXN0aWNzIHNvIGl0J3MgYmVzdCB0byBsZWF2ZSBhbGxvdyB0aGUgc2V0
dGluZ3MgY2FuIGJlIGR5bmFtaWNsbHkKYWRqdXN0ZWQgYmFzZWQgb24gd29ya2xvYWQgaW5zaWRl
IHRoZSBndWVzdC4KCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIHwgMzIwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMDQg
aW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpCb2IgTGl1ICgxKToKICAgICAgeGVuLWJs
a2Zyb250OiBkeW5hbWljIGNvbmZpZ3VyYXRpb24gb2YgcGVyLXZiZCByZXNvdXJjZXMKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
