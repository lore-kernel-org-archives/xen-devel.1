From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Tue, 18 Sep 2018 07:20:15 -0600
Message-ID: <5BA0FB8F02000078001E9785@prv1-mh.provo.novell.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2FvP-0001U7-Kv
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 13:20:19 +0000
In-Reply-To: <20180913152128.6114-9-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE3OjIxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC0xNzksOSArMTgxLDE3IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+ICAjZW5kaWYgLyog
SEFTX1BDSSAqLwo+ICAKPiAgICAgIHZvaWQgKCp0ZWFyZG93bikoc3RydWN0IGRvbWFpbiAqZCk7
Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFRoaXMgYmxvY2sgb2Ygb3BlcmF0aW9ucyBtdXN0IGJl
IGFwcHJvcHJpYXRlbHkgbG9ja2VkIGFnYWluc3QgZWFjaAo+ICsgICAgICogb3RoZXIgdG8gaGF2
ZSBtZWFuaW5nZnVsIHJlc3VsdHMuCj4gKyAgICAgKi8KPiAgICAgIGludCBfX211c3RfY2hlY2sg
KCptYXBfcGFnZSkoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5fdCBtZm4sCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncyk7Cj4gICAg
ICBpbnQgX19tdXN0X2NoZWNrICgqdW5tYXBfcGFnZSkoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3Qg
ZGZuKTsKPiArICAgIGludCBfX211c3RfY2hlY2sgKCpsb29rdXBfcGFnZSkoc3RydWN0IGRvbWFp
biAqZCwgZGZuX3QgZGZuLCBtZm5fdCAqbWZuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsYWdzKTsKCkknbSBhZnJhaWQgdGhlIGNvbW1lbnQg
aXMgYW1iaWd1b3VzOiBJdCBtYXkgbWVhbiB0aGUgaW1wbGVtZW50YXRpb25zCm9mIHRoZSBob29r
cyBoYXZlIHRvIGhhdmUgc3VpdGFibGUgbG9ja2luZyBpbiBwbGFjZSwgb3IgY2FsbGVycyBoYXZl
IHRvCnRha2UgY2FyZSBvZiBsb2NraW5nLiBJIHRoaW5rIHRoZSBsYXR0ZXIgaXMgbWVhbnQsIHdo
aWNoIEkgdGhpbmsgbmVlZHMgdG8KYmUgbWFkZSBleHBsaWNpdC4gV2l0aCB0aGF0ClJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
