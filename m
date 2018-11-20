From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v1 8/8] PM / Hibernate: exclude all
 PageOffline() pages
Date: Tue, 20 Nov 2018 22:22:21 +0100
Message-ID: <2319019.tUtE8Aovqd__38055.1048824147$1542748878$gmane$org@aspire.rjw.lan>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-9-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t19v=n7=rjwysocki.net=rjw@srs-us1.protection.inumbo.net>)
 id 1gPDTS-0000j4-3I
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 21:22:22 +0000
In-Reply-To: <20181119101616.8901-9-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uZGF5LCBOb3ZlbWJlciAxOSwgMjAxOCAxMToxNjoxNiBBTSBDRVQgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6Cj4gVGhlIGNvbnRlbnQgb2YgcGFnZXMgdGhhdCBhcmUgbWFya2VkIFBHX29m
ZmxpbmUgaXMgbm90IG9mIGludGVyZXN0Cj4gKGUuZy4gaW5mbGF0ZWQgYnkgYSBiYWxsb29uIGRy
aXZlciksIGxldCdzIHNraXAgdGhlc2UgcGFnZXMuCj4gCj4gQ2M6ICJSYWZhZWwgSi4gV3lzb2Nr
aSIgPHJqd0Byand5c29ja2kubmV0Pgo+IENjOiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4K
PiBDYzogTGVuIEJyb3duIDxsZW4uYnJvd25AaW50ZWwuY29tPgo+IENjOiBBbmRyZXcgTW9ydG9u
IDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBNYXR0aGV3IFdpbGNveCA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+Cj4gQ2M6
ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KPiBBY2tlZC1ieTogUGF2ZWwg
TWFjaGVrIDxwYXZlbEB1Y3cuY3o+Cj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQg
PGRhdmlkQHJlZGhhdC5jb20+CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5q
Lnd5c29ja2lAaW50ZWwuY29tPgoKPiAtLS0KPiAga2VybmVsL3Bvd2VyL3NuYXBzaG90LmMgfCA1
ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMgYi9rZXJuZWwvcG93ZXIv
c25hcHNob3QuYwo+IGluZGV4IDg3ZTZkZDU3ODE5Zi4uOGQ3YjRkNDU4ODQyIDEwMDY0NAo+IC0t
LSBhL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jCj4gKysrIGIva2VybmVsL3Bvd2VyL3NuYXBzaG90
LmMKPiBAQCAtMTIyMiw3ICsxMjIyLDcgQEAgc3RhdGljIHN0cnVjdCBwYWdlICpzYXZlYWJsZV9o
aWdobWVtX3BhZ2Uoc3RydWN0IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGxvbmcgcGZuKQo+ICAJQlVH
X09OKCFQYWdlSGlnaE1lbShwYWdlKSk7Cj4gIAo+ICAJaWYgKHN3c3VzcF9wYWdlX2lzX2ZvcmJp
ZGRlbihwYWdlKSB8fCAgc3dzdXNwX3BhZ2VfaXNfZnJlZShwYWdlKSB8fAo+IC0JICAgIFBhZ2VS
ZXNlcnZlZChwYWdlKSkKPiArCSAgICBQYWdlUmVzZXJ2ZWQocGFnZSkgfHwgUGFnZU9mZmxpbmUo
cGFnZSkpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gIAo+ICAJaWYgKHBhZ2VfaXNfZ3VhcmQocGFnZSkp
Cj4gQEAgLTEyODYsNiArMTI4Niw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqc2F2ZWFibGVfcGFn
ZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgbG9uZyBwZm4pCj4gIAlpZiAoc3dzdXNwX3Bh
Z2VfaXNfZm9yYmlkZGVuKHBhZ2UpIHx8IHN3c3VzcF9wYWdlX2lzX2ZyZWUocGFnZSkpCj4gIAkJ
cmV0dXJuIE5VTEw7Cj4gIAo+ICsJaWYgKFBhZ2VPZmZsaW5lKHBhZ2UpKQo+ICsJCXJldHVybiBO
VUxMOwo+ICsKPiAgCWlmIChQYWdlUmVzZXJ2ZWQocGFnZSkKPiAgCSAgICAmJiAoIWtlcm5lbF9w
YWdlX3ByZXNlbnQocGFnZSkgfHwgcGZuX2lzX25vc2F2ZShwZm4pKSkKPiAgCQlyZXR1cm4gTlVM
TDsKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
