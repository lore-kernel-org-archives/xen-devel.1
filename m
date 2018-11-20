From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v1 7/8] PM / Hibernate: use
 pfn_to_online_page()
Date: Tue, 20 Nov 2018 22:23:35 +0100
Message-ID: <1709060.evyxFHMqmg__38006.2790042304$1542748943$gmane$org@aspire.rjw.lan>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-8-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=T19v=N7=rjwysocki.net=rjw@srs-us1.protection.inumbo.net>)
 id 1gPDUe-0000nf-Aw
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 21:23:36 +0000
In-Reply-To: <20181119101616.8901-8-david@redhat.com>
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

T24gTW9uZGF5LCBOb3ZlbWJlciAxOSwgMjAxOCAxMToxNjoxNSBBTSBDRVQgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6Cj4gTGV0J3MgdXNlIHBmbl90b19vbmxpbmVfcGFnZSgpIGluc3RlYWQgb2Yg
cGZuX3RvX3BhZ2UoKSB3aGVuIGNoZWNraW5nCj4gZm9yIHNhdmVhYmxlIHBhZ2VzIHRvIG5vdCBz
YXZlL3Jlc3RvcmUgb2ZmbGluZSBtZW1vcnkgc2VjdGlvbnMuCj4gCj4gQ2M6ICJSYWZhZWwgSi4g
V3lzb2NraSIgPHJqd0Byand5c29ja2kubmV0Pgo+IENjOiBQYXZlbCBNYWNoZWsgPHBhdmVsQHVj
dy5jej4KPiBDYzogTGVuIEJyb3duIDxsZW4uYnJvd25AaW50ZWwuY29tPgo+IENjOiBBbmRyZXcg
TW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBNYXR0aGV3IFdpbGNveCA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+
Cj4gQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4KPiBTdWdnZXN0ZWQt
Ynk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRGF2
aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+CgpBY2tlZC1ieTogUmFmYWVsIEouIFd5
c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgoKPiAtLS0KPiAga2VybmVsL3Bvd2Vy
L3NuYXBzaG90LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9wb3dlci9zbmFwc2hv
dC5jIGIva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKPiBpbmRleCA2NDBiMjAzNGVkZDYuLjg3ZTZk
ZDU3ODE5ZiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwo+ICsrKyBiL2tl
cm5lbC9wb3dlci9zbmFwc2hvdC5jCj4gQEAgLTEyMTUsOCArMTIxNSw4IEBAIHN0YXRpYyBzdHJ1
Y3QgcGFnZSAqc2F2ZWFibGVfaGlnaG1lbV9wYWdlKHN0cnVjdCB6b25lICp6b25lLCB1bnNpZ25l
ZCBsb25nIHBmbikKPiAgCWlmICghcGZuX3ZhbGlkKHBmbikpCj4gIAkJcmV0dXJuIE5VTEw7Cj4g
IAo+IC0JcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Cj4gLQlpZiAocGFnZV96b25lKHBhZ2UpICE9
IHpvbmUpCj4gKwlwYWdlID0gcGZuX3RvX29ubGluZV9wYWdlKHBmbik7Cj4gKwlpZiAoIXBhZ2Ug
fHwgcGFnZV96b25lKHBhZ2UpICE9IHpvbmUpCj4gIAkJcmV0dXJuIE5VTEw7Cj4gIAo+ICAJQlVH
X09OKCFQYWdlSGlnaE1lbShwYWdlKSk7Cj4gQEAgLTEyNzcsOCArMTI3Nyw4IEBAIHN0YXRpYyBz
dHJ1Y3QgcGFnZSAqc2F2ZWFibGVfcGFnZShzdHJ1Y3Qgem9uZSAqem9uZSwgdW5zaWduZWQgbG9u
ZyBwZm4pCj4gIAlpZiAoIXBmbl92YWxpZChwZm4pKQo+ICAJCXJldHVybiBOVUxMOwo+ICAKPiAt
CXBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwo+IC0JaWYgKHBhZ2Vfem9uZShwYWdlKSAhPSB6b25l
KQo+ICsJcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwo+ICsJaWYgKCFwYWdlIHx8IHBh
Z2Vfem9uZShwYWdlKSAhPSB6b25lKQo+ICAJCXJldHVybiBOVUxMOwo+ICAKPiAgCUJVR19PTihQ
YWdlSGlnaE1lbShwYWdlKSk7Cj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
