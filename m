From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v1 7/8] PM / Hibernate: use
 pfn_to_online_page()
Date: Mon, 19 Nov 2018 13:13:06 +0100
Message-ID: <20181119121306.GI22247__14176.228727638$1542629517$gmane$org@dhcp22.suse.cz>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-8-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nLPM=N6=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gOiQR-0006sj-N0
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 12:13:11 +0000
Content-Disposition: inline
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
Cc: Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Machek <pavel@ucw.cz>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uIDE5LTExLTE4IDExOjE2OjE1LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPiBMZXQn
cyB1c2UgcGZuX3RvX29ubGluZV9wYWdlKCkgaW5zdGVhZCBvZiBwZm5fdG9fcGFnZSgpIHdoZW4g
Y2hlY2tpbmcKPiBmb3Igc2F2ZWFibGUgcGFnZXMgdG8gbm90IHNhdmUvcmVzdG9yZSBvZmZsaW5l
IG1lbW9yeSBzZWN0aW9ucy4KPiAKPiBDYzogIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmp3QHJqd3lz
b2NraS5uZXQ+Cj4gQ2M6IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pgo+IENjOiBMZW4gQnJv
d24gPGxlbi5icm93bkBpbnRlbC5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
Pgo+IENjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KPiBDYzogIk1pY2hhZWwgUy4g
VHNpcmtpbiIgPG1zdEByZWRoYXQuY29tPgo+IFN1Z2dlc3RlZC1ieTogTWljaGFsIEhvY2tvIDxt
aG9ja29Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4KCkkgaGF2ZSBvbmx5IGEgdmVyeSB2YWd1ZSB1bmRlcnN0YW5kaW5nIG9m
IHRoaXMgc3BlY2lmaWMgY29kZSBidXQgSSBkbwpub3QgcmVhbGx5IHNlZSBhbnkgcmVhbCByZWFz
b24gZm9yIGNoZWNraW5nIG9mZmxpbmVkIHJhbmdlcy4gQWxzbwpvZmZsaW5lIHBmbiByYW5nZXMg
bWlnaHQgaGF2ZSB1bmluaXRpYWxpemVkIHN0cnVjdCBwYWdlcyBzbyBtYWtpbmcKYW55IGRlY2lz
aW9ucyBvZiB0aGUgc3RydWN0IHBhZ2UgaXMgYmFzaWNhbGx5IHVuZGVmaW5lZCBiZWhhdmlvci4K
CkFja2VkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KCj4gLS0tCj4gIGtlcm5l
bC9wb3dlci9zbmFwc2hvdC5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9rZXJuZWwvcG93ZXIv
c25hcHNob3QuYyBiL2tlcm5lbC9wb3dlci9zbmFwc2hvdC5jCj4gaW5kZXggNjQwYjIwMzRlZGQ2
Li44N2U2ZGQ1NzgxOWYgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL3Bvd2VyL3NuYXBzaG90LmMKPiAr
KysgYi9rZXJuZWwvcG93ZXIvc25hcHNob3QuYwo+IEBAIC0xMjE1LDggKzEyMTUsOCBAQCBzdGF0
aWMgc3RydWN0IHBhZ2UgKnNhdmVhYmxlX2hpZ2htZW1fcGFnZShzdHJ1Y3Qgem9uZSAqem9uZSwg
dW5zaWduZWQgbG9uZyBwZm4pCj4gIAlpZiAoIXBmbl92YWxpZChwZm4pKQo+ICAJCXJldHVybiBO
VUxMOwo+ICAKPiAtCXBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwo+IC0JaWYgKHBhZ2Vfem9uZShw
YWdlKSAhPSB6b25lKQo+ICsJcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwo+ICsJaWYg
KCFwYWdlIHx8IHBhZ2Vfem9uZShwYWdlKSAhPSB6b25lKQo+ICAJCXJldHVybiBOVUxMOwo+ICAK
PiAgCUJVR19PTighUGFnZUhpZ2hNZW0ocGFnZSkpOwo+IEBAIC0xMjc3LDggKzEyNzcsOCBAQCBz
dGF0aWMgc3RydWN0IHBhZ2UgKnNhdmVhYmxlX3BhZ2Uoc3RydWN0IHpvbmUgKnpvbmUsIHVuc2ln
bmVkIGxvbmcgcGZuKQo+ICAJaWYgKCFwZm5fdmFsaWQocGZuKSkKPiAgCQlyZXR1cm4gTlVMTDsK
PiAgCj4gLQlwYWdlID0gcGZuX3RvX3BhZ2UocGZuKTsKPiAtCWlmIChwYWdlX3pvbmUocGFnZSkg
IT0gem9uZSkKPiArCXBhZ2UgPSBwZm5fdG9fb25saW5lX3BhZ2UocGZuKTsKPiArCWlmICghcGFn
ZSB8fCBwYWdlX3pvbmUocGFnZSkgIT0gem9uZSkKPiAgCQlyZXR1cm4gTlVMTDsKPiAgCj4gIAlC
VUdfT04oUGFnZUhpZ2hNZW0ocGFnZSkpOwo+IC0tIAo+IDIuMTcuMgoKLS0gCk1pY2hhbCBIb2Nr
bwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
