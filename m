From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/2] pvcalls-front improvements
Date: Wed, 14 Feb 2018 10:26:13 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802141023400.5392__5472.87464510209$1518632723$gmane$org@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gnfp=fi=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1em1l2-0002E0-LD
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2018 18:26:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKdGhpcyBzbWFsbCBzZXJpZXMgaW50cm9kdWNlcyBhIHBlciBzb2NrZXQgcmVmY291
bnQgdG8gaW5jcmVhc2UgdGhlCmVmZmljaWVuY3kgb24gc29ja2V0IHJlbGVhc2Ugb3BlcmF0aW9u
cywgYW5kIG1ha2VzIHJlbGVhc2luZyBwYXNzaXZlCnNvY2tldHMgc2FmZS4KCkNoZWVycywKClN0
ZWZhbm8KCgpDaGFuZ2VzIGluIHYzOgotIHJlbW92ZSBwb2ludGxlc3MgaW5pdGlhbGl6ZXJzCi0g
cmVvcmRlciBwdmNhbGxzX2VudGVyX3NvY2sKCkNoYW5nZXMgaW4gdjI6Ci0gYWRkIGFja2VkLWJ5
Ci0gZml4IGNoZWNrIGluIHB2Y2FsbHNfZW50ZXJfc29jCi0gZml4IGNvZGUgc3R5bGUKLSBuaWNl
ciBjaGVja3MgaW4gcHZjYWxsc19mcm9udF9yZWxlYXNlCgoKU3RlZmFubyBTdGFiZWxsaW5pICgy
KToKICAgICAgcHZjYWxscy1mcm9udDogaW50cm9kdWNlIGEgcGVyIHNvY2tfbWFwcGluZyByZWZj
b3VudAogICAgICBwdmNhbGxzLWZyb250OiB3YWl0IGZvciBvdGhlciBvcGVyYXRpb25zIHRvIHJl
dHVybiB3aGVuIHJlbGVhc2UgcGFzc2l2ZSBzb2NrZXRzCgogZHJpdmVycy94ZW4vcHZjYWxscy1m
cm9udC5jIHwgMTk3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgMTEyIGRlbGV0aW9ucygtKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
