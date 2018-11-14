From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RFC 6/6] PM / Hibernate: exclude all
 PageOffline() pages
Date: Wed, 14 Nov 2018 22:17:04 +0100
Message-ID: <20181114211704.6381-7-david__26832.5484976687$1542230223$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCq3=NZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gN2YG-0003Q3-5W
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 21:18:20 +0000
In-Reply-To: <20181114211704.6381-1-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvbnRlbnQgb2YgcGFnZXMgdGhhdCBhcmUgbWFya2VkIFBHX29mZmxpbmUgaXMgbm90IG9m
IGludGVyZXN0CihlLmcuIGluZmxhdGVkIGJ5IGEgYmFsbG9vbiBkcml2ZXIpLCBsZXQncyBza2lw
IHRoZXNlIHBhZ2VzLgoKQ2M6ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJqd0Byand5c29ja2kubmV0
PgpDYzogUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+CkNjOiBMZW4gQnJvd24gPGxlbi5icm93
bkBpbnRlbC5jb20+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3Jn
PgpDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBNaWNoYWwgSG9j
a28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0
LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+
Ci0tLQoga2VybmVsL3Bvd2VyL3NuYXBzaG90LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL3Bvd2Vy
L3NuYXBzaG90LmMgYi9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwppbmRleCBiMDMwOGEyYzYwMDAu
LjAxZGIxZDEzNDgxYSAxMDA2NDQKLS0tIGEva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKKysrIGIv
a2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKQEAgLTEyMjIsNyArMTIyMiw3IEBAIHN0YXRpYyBzdHJ1
Y3QgcGFnZSAqc2F2ZWFibGVfaGlnaG1lbV9wYWdlKHN0cnVjdCB6b25lICp6b25lLCB1bnNpZ25l
ZCBsb25nIHBmbikKIAlCVUdfT04oIVBhZ2VIaWdoTWVtKHBhZ2UpKTsKIAogCWlmIChzd3N1c3Bf
cGFnZV9pc19mb3JiaWRkZW4ocGFnZSkgfHwgIHN3c3VzcF9wYWdlX2lzX2ZyZWUocGFnZSkgfHwK
LQkgICAgUGFnZVJlc2VydmVkKHBhZ2UpKQorCSAgICBQYWdlUmVzZXJ2ZWQocGFnZSkgfHwgUGFn
ZU9mZmxpbmUocGFnZSkpCiAJCXJldHVybiBOVUxMOwogCiAJaWYgKHBhZ2VfaXNfZ3VhcmQocGFn
ZSkpCkBAIC0xMjg2LDYgKzEyODYsOSBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKnNhdmVhYmxlX3Bh
Z2Uoc3RydWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGxvbmcgcGZuKQogCWlmIChzd3N1c3BfcGFn
ZV9pc19mb3JiaWRkZW4ocGFnZSkgfHwgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdlKSkKIAkJcmV0
dXJuIE5VTEw7CiAKKwlpZiAoUGFnZU9mZmxpbmUocGFnZSkpCisJCXJldHVybiBOVUxMOworCiAJ
aWYgKFBhZ2VSZXNlcnZlZChwYWdlKQogCSAgICAmJiAoIWtlcm5lbF9wYWdlX3ByZXNlbnQocGFn
ZSkgfHwgcGZuX2lzX25vc2F2ZShwZm4pKSkKIAkJcmV0dXJuIE5VTEw7Ci0tIAoyLjE3LjIKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
