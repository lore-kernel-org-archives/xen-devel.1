From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 7/8] PM / Hibernate: use pfn_to_online_page()
Date: Thu, 22 Nov 2018 11:06:26 +0100
Message-ID: <20181122100627.5189-8-david__36296.0684848533$1542881168$gmane$org@redhat.com>
References: <20181122100627.5189-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uk8i=OB=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gPltM-0004sW-9j
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 10:07:24 +0000
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

TGV0J3MgdXNlIHBmbl90b19vbmxpbmVfcGFnZSgpIGluc3RlYWQgb2YgcGZuX3RvX3BhZ2UoKSB3
aGVuIGNoZWNraW5nCmZvciBzYXZlYWJsZSBwYWdlcyB0byBub3Qgc2F2ZS9yZXN0b3JlIG9mZmxp
bmUgbWVtb3J5IHNlY3Rpb25zLgoKQ2M6ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJqd0Byand5c29j
a2kubmV0PgpDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+CkNjOiBMZW4gQnJvd24gPGxl
bi5icm93bkBpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRp
b24ub3JnPgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBNaWNo
YWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RA
cmVkaGF0LmNvbT4KU3VnZ2VzdGVkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJuZWwub3Jn
PgpBY2tlZC1ieTogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkFja2VkLWJ5OiBQYXZl
bCBNYWNoZWsgPHBhdmVsQHVjdy5jej4KQWNrZWQtYnk6IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZh
ZWwuai53eXNvY2tpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQg
PGRhdmlkQHJlZGhhdC5jb20+Ci0tLQoga2VybmVsL3Bvd2VyL3NuYXBzaG90LmMgfCA4ICsrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jIGIva2VybmVsL3Bvd2VyL3NuYXBzaG90
LmMKaW5kZXggNjQwYjIwMzRlZGQ2Li44N2U2ZGQ1NzgxOWYgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9w
b3dlci9zbmFwc2hvdC5jCisrKyBiL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jCkBAIC0xMjE1LDgg
KzEyMTUsOCBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKnNhdmVhYmxlX2hpZ2htZW1fcGFnZShzdHJ1
Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgbG9uZyBwZm4pCiAJaWYgKCFwZm5fdmFsaWQocGZuKSkK
IAkJcmV0dXJuIE5VTEw7CiAKLQlwYWdlID0gcGZuX3RvX3BhZ2UocGZuKTsKLQlpZiAocGFnZV96
b25lKHBhZ2UpICE9IHpvbmUpCisJcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOworCWlm
ICghcGFnZSB8fCBwYWdlX3pvbmUocGFnZSkgIT0gem9uZSkKIAkJcmV0dXJuIE5VTEw7CiAKIAlC
VUdfT04oIVBhZ2VIaWdoTWVtKHBhZ2UpKTsKQEAgLTEyNzcsOCArMTI3Nyw4IEBAIHN0YXRpYyBz
dHJ1Y3QgcGFnZSAqc2F2ZWFibGVfcGFnZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgbG9u
ZyBwZm4pCiAJaWYgKCFwZm5fdmFsaWQocGZuKSkKIAkJcmV0dXJuIE5VTEw7CiAKLQlwYWdlID0g
cGZuX3RvX3BhZ2UocGZuKTsKLQlpZiAocGFnZV96b25lKHBhZ2UpICE9IHpvbmUpCisJcGFnZSA9
IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOworCWlmICghcGFnZSB8fCBwYWdlX3pvbmUocGFnZSkg
IT0gem9uZSkKIAkJcmV0dXJuIE5VTEw7CiAKIAlCVUdfT04oUGFnZUhpZ2hNZW0ocGFnZSkpOwot
LSAKMi4xNy4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
