From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 4/8] xen/balloon: mark inflated pages
 PG_offline
Date: Mon, 19 Nov 2018 11:16:12 +0100
Message-ID: <20181119101616.8901-5-david__47454.6061749153$1542622539$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bx+7=n6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gOgby-00064f-4z
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 10:16:58 +0000
In-Reply-To: <20181119101616.8901-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, David Hildenbrand <david@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

TWFyayBpbmZsYXRlZCBhbmQgbmV2ZXIgb25saW5lZCBwYWdlcyBQR19vZmZsaW5lLCB0byB0ZWxs
IHRoZSB3b3JsZCB0aGF0CnRoZSBjb250ZW50IGlzIHN0YWxlIGFuZCBzaG91bGQgbm90IGJlIGR1
bXBlZC4KCkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpD
YzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1m
b3VuZGF0aW9uLm9yZz4KQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3JnPgpD
YzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWljaGFlbCBTLiBUc2lya2lu
IiA8bXN0QHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMveGVuL2JhbGxvb24uYyB8IDMgKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmFsbG9v
bi5jIGIvZHJpdmVycy94ZW4vYmFsbG9vbi5jCmluZGV4IDEyMTQ4Mjg5ZGViZC4uMTRkZDZiODE0
ZGIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMKKysrIGIvZHJpdmVycy94ZW4v
YmFsbG9vbi5jCkBAIC00MjUsNiArNDI1LDcgQEAgc3RhdGljIGludCB4ZW5fYnJpbmdfcGdzX29u
bGluZShzdHJ1Y3QgcGFnZSAqcGcsIHVuc2lnbmVkIGludCBvcmRlcikKIAlmb3IgKGkgPSAwOyBp
IDwgc2l6ZTsgaSsrKSB7CiAJCXAgPSBwZm5fdG9fcGFnZShzdGFydF9wZm4gKyBpKTsKIAkJX19v
bmxpbmVfcGFnZV9zZXRfbGltaXRzKHApOworCQlfX1NldFBhZ2VPZmZsaW5lKHApOwogCQlfX2Jh
bGxvb25fYXBwZW5kKHApOwogCX0KIAltdXRleF91bmxvY2soJmJhbGxvb25fbXV0ZXgpOwpAQCAt
NDkzLDYgKzQ5NCw3IEBAIHN0YXRpYyBlbnVtIGJwX3N0YXRlIGluY3JlYXNlX3Jlc2VydmF0aW9u
KHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMpCiAJCXhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5n
X3VwZGF0ZSgxLCAmcGFnZSwgJmZyYW1lX2xpc3RbaV0pOwogCiAJCS8qIFJlbGlucXVpc2ggdGhl
IHBhZ2UgYmFjayB0byB0aGUgYWxsb2NhdG9yLiAqLworCQlfX0NsZWFyUGFnZU9mZmxpbmUocGFn
ZSk7CiAJCWZyZWVfcmVzZXJ2ZWRfcGFnZShwYWdlKTsKIAl9CiAKQEAgLTUxOSw2ICs1MjEsNyBA
QCBzdGF0aWMgZW51bSBicF9zdGF0ZSBkZWNyZWFzZV9yZXNlcnZhdGlvbih1bnNpZ25lZCBsb25n
IG5yX3BhZ2VzLCBnZnBfdCBnZnApCiAJCQlzdGF0ZSA9IEJQX0VBR0FJTjsKIAkJCWJyZWFrOwog
CQl9CisJCV9fU2V0UGFnZU9mZmxpbmUocGFnZSk7CiAJCWFkanVzdF9tYW5hZ2VkX3BhZ2VfY291
bnQocGFnZSwgLTEpOwogCQl4ZW5tZW1fcmVzZXJ2YXRpb25fc2NydWJfcGFnZShwYWdlKTsKIAkJ
bGlzdF9hZGQoJnBhZ2UtPmxydSwgJnBhZ2VzKTsKLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
