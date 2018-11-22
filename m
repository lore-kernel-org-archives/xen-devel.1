From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 8/8] PM / Hibernate: exclude all
 PageOffline() pages
Date: Thu, 22 Nov 2018 11:06:27 +0100
Message-ID: <20181122100627.5189-9-david__49055.1208415583$1542881173$gmane$org@redhat.com>
References: <20181122100627.5189-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uk8i=ob=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gPltT-0004wr-9W
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 10:07:31 +0000
In-Reply-To: <20181122100627.5189-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvbnRlbnQgb2YgcGFnZXMgdGhhdCBhcmUgbWFya2VkIFBHX29mZmxpbmUgaXMgbm90IG9m
IGludGVyZXN0CihlLmcuIGluZmxhdGVkIGJ5IGEgYmFsbG9vbiBkcml2ZXIpLCBsZXQncyBza2lw
IHRoZXNlIHBhZ2VzLgoKSW4gc2F2ZWFibGVfaGlnaG1lbV9wYWdlKCksIG1vdmUgdGhlIFBhZ2VS
ZXNlcnZlZCgpIGNoZWNrIHRvIGEgbmV3CmNoZWNrIGFsb25nIHdpdGggdGhlIFBhZ2VPZmZsaW5l
KCkgY2hlY2sgdG8gc2VwYXJhdGUgaXQgZnJvbSB0aGUKc3dzdXNwIGNoZWNrcy4KCkNjOiAiUmFm
YWVsIEouIFd5c29ja2kiIDxyandAcmp3eXNvY2tpLm5ldD4KQ2M6IFBhdmVsIE1hY2hlayA8cGF2
ZWxAdWN3LmN6PgpDYzogTGVuIEJyb3duIDxsZW4uYnJvd25AaW50ZWwuY29tPgpDYzogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1hdHRoZXcgV2lsY294IDx3
aWxseUBpbmZyYWRlYWQub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNj
OiAiTWljaGFlbCBTLiBUc2lya2luIiA8bXN0QHJlZGhhdC5jb20+CkFja2VkLWJ5OiBQYXZlbCBN
YWNoZWsgPHBhdmVsQHVjdy5jej4KQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwu
ai53eXNvY2tpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRh
dmlkQHJlZGhhdC5jb20+Ci0tLQoga2VybmVsL3Bvd2VyL3NuYXBzaG90LmMgfCA5ICsrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYyBiL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5j
CmluZGV4IDg3ZTZkZDU3ODE5Zi4uNDgwMmIwMzliODlmIDEwMDY0NAotLS0gYS9rZXJuZWwvcG93
ZXIvc25hcHNob3QuYworKysgYi9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwpAQCAtMTIyMSw4ICsx
MjIxLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqc2F2ZWFibGVfaGlnaG1lbV9wYWdlKHN0cnVj
dCB6b25lICp6b25lLCB1bnNpZ25lZCBsb25nIHBmbikKIAogCUJVR19PTighUGFnZUhpZ2hNZW0o
cGFnZSkpOwogCi0JaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihwYWdlKSB8fCAgc3dzdXNw
X3BhZ2VfaXNfZnJlZShwYWdlKSB8fAotCSAgICBQYWdlUmVzZXJ2ZWQocGFnZSkpCisJaWYgKHN3
c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihwYWdlKSB8fCAgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdl
KSkKKwkJcmV0dXJuIE5VTEw7CisKKwlpZiAoUGFnZVJlc2VydmVkKHBhZ2UpIHx8IFBhZ2VPZmZs
aW5lKHBhZ2UpKQogCQlyZXR1cm4gTlVMTDsKIAogCWlmIChwYWdlX2lzX2d1YXJkKHBhZ2UpKQpA
QCAtMTI4Niw2ICsxMjg4LDkgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpzYXZlYWJsZV9wYWdlKHN0
cnVjdCB6b25lICp6b25lLCB1bnNpZ25lZCBsb25nIHBmbikKIAlpZiAoc3dzdXNwX3BhZ2VfaXNf
Zm9yYmlkZGVuKHBhZ2UpIHx8IHN3c3VzcF9wYWdlX2lzX2ZyZWUocGFnZSkpCiAJCXJldHVybiBO
VUxMOwogCisJaWYgKFBhZ2VPZmZsaW5lKHBhZ2UpKQorCQlyZXR1cm4gTlVMTDsKKwogCWlmIChQ
YWdlUmVzZXJ2ZWQocGFnZSkKIAkgICAgJiYgKCFrZXJuZWxfcGFnZV9wcmVzZW50KHBhZ2UpIHx8
IHBmbl9pc19ub3NhdmUocGZuKSkpCiAJCXJldHVybiBOVUxMOwotLSAKMi4xNy4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
