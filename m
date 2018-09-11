From: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [libvirt] [PATCH 0/5] libxl: various migration V3
 improvements
Date: Tue, 11 Sep 2018 09:29:56 +0200
Message-ID: <9d63a256-4041-8205-a070-6da90714e346__18382.5929336765$1536650929$gmane$org@redhat.com>
References: <20180905212804.10587-1-jfehlig@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ggc3=lz=redhat.com=mprivozn@srs-us1.protection.inumbo.net>)
 id 1fzd7a-0000Be-1e
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 07:30:02 +0000
In-Reply-To: <20180905212804.10587-1-jfehlig@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jim Fehlig <jfehlig@suse.com>, libvir-list@redhat.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMjAxOCAxMToyNyBQTSwgSmltIEZlaGxpZyB3cm90ZToKPiBQYXRjaCA1IGZpeGVz
IGEgbG9uZyBzdGFuZGluZyBwcm9ibGVtIGZvdW5kIGJ5IHNvbWUgdmVyeSBzbG93IGhvc3RzIGlu
Cj4geGVuJ3Mgb3NzdGVzdAo+IAo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wOC9tc2cwMTk0NS5odG1sCj4gCj4gV2hpbGUgd29ya2lu
ZyBvbiB0aGUgZml4LCBJIGRpc2NvdmVyZWQgb3RoZXIgcHJvYmxlbXMgaW4gbGlieGwncyBWMwo+
IG1pZ3JhdGlvbiBwcm90b2NvbC4gRS5nLiBhIG1vZGlmeSBqb2Igb24gdGhlIG1pZ3JhdGluZyBW
TSB3YXMgbm90Cj4gaGFuZGxlZCBwcm9wZXJseSBhY3Jvc3MgdGhlIHBoYXNlcyBvbiBlaXRoZXIg
c3JjIG9yIGRzdCBob3N0LiBQYXRjaGVzCj4gMS00IGZpeCB0aGlzIGFuZCBvdGhlciBwcm9ibGVt
cyBmb3VuZCBhbG9uZyB0aGUgd2F5Lgo+IAo+IEppbSBGZWhsaWcgKDUpOgo+ICAgbGlieGw6IG1p
Z3JhdGlvbjogZGVmZXIgcmVtb3ZpbmcgVk0gdW50aWwgZmluaXNoIHBoYXNlCj4gICBsaWJ4bDog
Zml4IGxvZ2ljIGluIFAyUCBtaWdyYXRpb24KPiAgIGxpYnhsOiBmaXggam9iIGhhbmRsaW5nIGFj
cm9zcyBtaWdyYXRpb24gcGhhc2VzIG9uIHNyYwo+ICAgbGlieGw6IGZpeCBqb2IgaGFuZGxpbmcg
YWNyb3NzIG1pZ3JhdGlvbiBwaGFzZXMgb24gZHN0Cj4gICBsaWJ4bDogam9pbiB3aXRoIHRocmVh
ZCByZWNlaXZpbmcgbWlncmF0aW9uIGRhdGEKPiAKPiAgc3JjL2xpYnhsL2xpYnhsX2RvbWFpbi5o
ICAgIHwgICAxICsKPiAgc3JjL2xpYnhsL2xpYnhsX2RyaXZlci5jICAgIHwgICA3IC0tCj4gIHNy
Yy9saWJ4bC9saWJ4bF9taWdyYXRpb24uYyB8IDE2OCArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygrKSwgNjIgZGVs
ZXRpb25zKC0pCj4gCgpBQ0sgc2VyaWVzLgoKTWljaGFsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
