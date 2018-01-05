From: Eduardo Otubo <otubo@redhat.com>
Subject: [PATCH] xen-netfront: enable device after manual module
	load
Date: Fri,  5 Jan 2018 09:42:16 +0100
Message-ID: <20180105084216.21719-1-otubo__10216.371381148$1515141699$gmane$org@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vojz=ea=redhat.com=otubo@srs-us1.protection.inumbo.net>)
 id 1eXNaO-0007VN-69
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 08:42:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com, netdev@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, mgamal@redhat.com, cavery@redhat.com, vkuznets@redhat.com
List-Id: xen-devel@lists.xenproject.org

V2hlbiBsb2FkaW5nIHRoZSBtb2R1bGUgYWZ0ZXIgdW5sb2FkaW5nIGl0LCB0aGUgbmV0d29yayBp
bnRlcmZhY2Ugd291bGQKbm90IGJlIGVuYWJsZWQgYW5kIHRodXMgd291bGRuJ3QgaGF2ZSBhIGJh
Y2tlbmQgY291bnRlcnBhcnQgYW5kIHVuYWJsZQp0byBiZSB1c2VkIGJ5IHRoZSBndWVzdC4KClRo
ZSBndWVzdCB3b3VsZCBmYWNlIGVycm9ycyBsaWtlOgoKICBbcm9vdEBndWVzdCB+XSMgZXRodG9v
bCAtaSBldGgwCiAgQ2Fubm90IGdldCBkcml2ZXIgaW5mb3JtYXRpb246IE5vIHN1Y2ggZGV2aWNl
CgogIFtyb290QGd1ZXN0IH5dIyBpZmNvbmZpZyBldGgwCiAgZXRoMDogZXJyb3IgZmV0Y2hpbmcg
aW50ZXJmYWNlIGluZm9ybWF0aW9uOiBEZXZpY2Ugbm90IGZvdW5kCgpUaGlzIHBhdGNoIGluaXRp
YWxpemVzIHRoZSBzdGF0ZSBvZiB0aGUgbmV0ZnJvbnQgZGV2aWNlIHdoZW5ldmVyIGl0IGlzCmxv
YWRlZCBtYW51YWxseSwgdGhpcyBzdGF0ZSB3b3VsZCBjb21tdW5pY2F0ZSB0aGUgbmV0YmFjayB0
byBjcmVhdGUgaXRzCmRldmljZSBhbmQgZXN0YWJsaXNoIHRoZSBjb25uZWN0aW9uIGJldHdlZW4g
dGhlbS4KClNpZ25lZC1vZmYtYnk6IEVkdWFyZG8gT3R1Ym8gPG90dWJvQHJlZGhhdC5jb20+Ci0t
LQogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIGIvZHJp
dmVycy9uZXQveGVuLW5ldGZyb250LmMKaW5kZXggYzVhMzQ2NzFhYmRhLi45YmQ3ZGRlZWI2YTUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCisrKyBiL2RyaXZlcnMvbmV0
L3hlbi1uZXRmcm9udC5jCkBAIC0xMzI2LDYgKzEzMjYsNyBAQCBzdGF0aWMgc3RydWN0IG5ldF9k
ZXZpY2UgKnhlbm5ldF9jcmVhdGVfZGV2KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCiAKIAlu
ZXRpZl9jYXJyaWVyX29mZihuZXRkZXYpOwogCisJeGVuYnVzX3N3aXRjaF9zdGF0ZShkZXYsIFhl
bmJ1c1N0YXRlSW5pdGlhbGlzaW5nKTsKIAlyZXR1cm4gbmV0ZGV2OwogCiAgZXhpdDoKLS0gCjIu
MTQuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
