From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC 6/6] PM / Hibernate: exclude all
 PageOffline() pages
Date: Thu, 15 Nov 2018 13:23:02 +0100
Message-ID: <20181115122302.GR23831__30947.2878733233$1542284515$gmane$org@dhcp22.suse.cz>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-7-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q/3E=N2=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gNGfs-00068M-E6
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:23:08 +0000
Content-Disposition: inline
In-Reply-To: <20181114211704.6381-7-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDE0LTExLTE4IDIyOjE3OjA0LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKWy4uLl0K
PiBkaWZmIC0tZ2l0IGEva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMgYi9rZXJuZWwvcG93ZXIvc25h
cHNob3QuYwo+IGluZGV4IGIwMzA4YTJjNjAwMC4uMDFkYjFkMTM0ODFhIDEwMDY0NAo+IC0tLSBh
L2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jCj4gKysrIGIva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMK
PiBAQCAtMTIyMiw3ICsxMjIyLDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpzYXZlYWJsZV9oaWdo
bWVtX3BhZ2Uoc3RydWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGxvbmcgcGZuKQo+ICAJQlVHX09O
KCFQYWdlSGlnaE1lbShwYWdlKSk7Cj4gIAo+ICAJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJpZGRl
bihwYWdlKSB8fCAgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdlKSB8fAo+IC0JICAgIFBhZ2VSZXNl
cnZlZChwYWdlKSkKPiArCSAgICBQYWdlUmVzZXJ2ZWQocGFnZSkgfHwgUGFnZU9mZmxpbmUocGFn
ZSkpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gIAo+ICAJaWYgKHBhZ2VfaXNfZ3VhcmQocGFnZSkpCj4g
QEAgLTEyODYsNiArMTI4Niw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqc2F2ZWFibGVfcGFnZShz
dHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgbG9uZyBwZm4pCj4gIAlpZiAoc3dzdXNwX3BhZ2Vf
aXNfZm9yYmlkZGVuKHBhZ2UpIHx8IHN3c3VzcF9wYWdlX2lzX2ZyZWUocGFnZSkpCj4gIAkJcmV0
dXJuIE5VTEw7Cj4gIAo+ICsJaWYgKFBhZ2VPZmZsaW5lKHBhZ2UpKQo+ICsJCXJldHVybiBOVUxM
Owo+ICsKPiAgCWlmIChQYWdlUmVzZXJ2ZWQocGFnZSkKPiAgCSAgICAmJiAoIWtlcm5lbF9wYWdl
X3ByZXNlbnQocGFnZSkgfHwgcGZuX2lzX25vc2F2ZShwZm4pKSkKPiAgCQlyZXR1cm4gTlVMTDsK
CkJ0dy4gbm93IHRoYXQgeW91IGFyZSB0b3VjaGluZyB0aGlzIGZpbGUgY291bGQgeW91IGFsc28g
bWFrZQpzQHBmbl90b19wYWdlQHBmbl90b19vbmxpbmVfcGFnZUAgcGxlYXNlPyBXZSByZWFsbHkg
ZG8gbm90IHdhbnQgdG8gdG91Y2gKb2ZmbGluZSBwZm4gcmFuZ2VzIGluIGdlbmVyYWwuIEEgc2Vw
YXJhdGUgcGF0Y2ggZm9yIHRoYXQgb2YgY291cnNlLgoKVGhhbmtzIQotLSAKTWljaGFsIEhvY2tv
ClNVU0UgTGFicwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
