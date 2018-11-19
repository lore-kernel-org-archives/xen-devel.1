From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 8/8] PM / Hibernate: exclude all
 PageOffline() pages
Date: Mon, 19 Nov 2018 11:16:16 +0100
Message-ID: <20181119101616.8901-9-david__43241.0303889357$1542622568$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bx+7=n6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gOgcN-0006Ly-VN
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 10:17:23 +0000
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
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvbnRlbnQgb2YgcGFnZXMgdGhhdCBhcmUgbWFya2VkIFBHX29mZmxpbmUgaXMgbm90IG9m
IGludGVyZXN0CihlLmcuIGluZmxhdGVkIGJ5IGEgYmFsbG9vbiBkcml2ZXIpLCBsZXQncyBza2lw
IHRoZXNlIHBhZ2VzLgoKQ2M6ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJqd0Byand5c29ja2kubmV0
PgpDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+CkNjOiBMZW4gQnJvd24gPGxlbi5icm93
bkBpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3Jn
PgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBNaWNoYWwgSG9j
a28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0
LmNvbT4KQWNrZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6PgpTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KLS0tCiBrZXJuZWwvcG93ZXIv
c25hcHNob3QuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYyBiL2tlcm5l
bC9wb3dlci9zbmFwc2hvdC5jCmluZGV4IDg3ZTZkZDU3ODE5Zi4uOGQ3YjRkNDU4ODQyIDEwMDY0
NAotLS0gYS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYworKysgYi9rZXJuZWwvcG93ZXIvc25hcHNo
b3QuYwpAQCAtMTIyMiw3ICsxMjIyLDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpzYXZlYWJsZV9o
aWdobWVtX3BhZ2Uoc3RydWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGxvbmcgcGZuKQogCUJVR19P
TighUGFnZUhpZ2hNZW0ocGFnZSkpOwogCiAJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihw
YWdlKSB8fCAgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdlKSB8fAotCSAgICBQYWdlUmVzZXJ2ZWQo
cGFnZSkpCisJICAgIFBhZ2VSZXNlcnZlZChwYWdlKSB8fCBQYWdlT2ZmbGluZShwYWdlKSkKIAkJ
cmV0dXJuIE5VTEw7CiAKIAlpZiAocGFnZV9pc19ndWFyZChwYWdlKSkKQEAgLTEyODYsNiArMTI4
Niw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqc2F2ZWFibGVfcGFnZShzdHJ1Y3Qgem9uZSAqem9u
ZSwgdW5zaWduZWQgbG9uZyBwZm4pCiAJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRlbihwYWdl
KSB8fCBzd3N1c3BfcGFnZV9pc19mcmVlKHBhZ2UpKQogCQlyZXR1cm4gTlVMTDsKIAorCWlmIChQ
YWdlT2ZmbGluZShwYWdlKSkKKwkJcmV0dXJuIE5VTEw7CisKIAlpZiAoUGFnZVJlc2VydmVkKHBh
Z2UpCiAJICAgICYmICgha2VybmVsX3BhZ2VfcHJlc2VudChwYWdlKSB8fCBwZm5faXNfbm9zYXZl
KHBmbikpKQogCQlyZXR1cm4gTlVMTDsKLS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
