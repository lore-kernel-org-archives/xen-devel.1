From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 5/8] x86/iommu: switch the hwdom mapping
 function to use page_get_type
Date: Fri, 17 Aug 2018 04:39:27 -0600
Message-ID: <5B76A5DF02000078001DF5BD@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqcAF-0007Hn-CA
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:39:31 +0000
In-Reply-To: <20180814134336.75539-6-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
ICtzdGF0aWMgYm9vbCBfX2h3ZG9tX2luaXQgaHdkb21faW9tbXVfbWFwKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQsCgpVbnVzZWQgZnVuY3Rpb24gcGFyYW1ldGVyPwoKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHBmbiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1heF9wZm4pCj4g
K3sKPiArICAgIC8qCj4gKyAgICAgKiBTZXQgdXAgMToxIG1hcHBpbmcgZm9yIGRvbTAuIERlZmF1
bHQgdG8gaW5jbHVkZSBvbmx5IGNvbnZlbnRpb25hbCBSQU0KPiArICAgICAqIGFyZWFzIGFuZCBs
ZXQgUk1SUnMgaW5jbHVkZSBuZWVkZWQgcmVzZXJ2ZWQgcmVnaW9ucy4gV2hlbiBzZXQsIHRoZQo+
ICsgICAgICogaW5jbHVzaXZlIG1hcHBpbmcgYWRkaXRpb25hbGx5IG1hcHMgaW4gZXZlcnkgcGZu
IHVwIHRvIDRHQiBleGNlcHQgdGhvc2UKPiArICAgICAqIHRoYXQgZmFsbCBpbiB1bnVzYWJsZSBy
YW5nZXMuCj4gKyAgICAgKi8KPiArICAgIGlmICggKHBmbiA+IG1heF9wZm4gJiYgIW1mbl92YWxp
ZChfbWZuKHBmbikpKSB8fCB4ZW5faW5fcmFuZ2UocGZuKSApCj4gKyAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ICsKPiArICAgIHN3aXRjaCAoIHBhZ2VfZ2V0X3R5cGUocGZuKSApCj4gKyAgICB7Cj4g
KyAgICBjYXNlIFJBTV9UWVBFX1VOVVNBQkxFOgo+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPiAr
Cj4gKyAgICBjYXNlIFJBTV9UWVBFX0NPTlZFTlRJT05BTDoKPiArICAgICAgICBpZiAoIGlvbW11
X2h3ZG9tX3N0cmljdCApCj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgICAgICBi
cmVhazsKClNpbXBseSAicmV0dXJuICFpb21tdV9od2RvbV9zdHJpY3QiLCB0byBtYWtlIGl0IHll
dCBlYXNpZXIgdG8gZm9sbG93CndoYXQgaGFwcGVucyBpbiB3aGljaCBjYXNlPyBCdXQgZGVwZW5k
aW5nIG9uIHlvdXIgdGhvdWdodHMgb24KbXkgcmVtYXJrcyBvbiB0aGUgcHJldmlvdXMgcGF0Y2gs
IHRoaXMgbWF5IGNoYW5nZSBhbGwgb3ZlciBhZ2Fpbgphbnl3YXkuCgo+ICsgICAgZGVmYXVsdDoK
PiArICAgICAgICBpZiAoICFpb21tdV9od2RvbV9pbmNsdXNpdmUgfHwgcGZuID4gbWF4X3BmbiAp
Cj4gKyAgICAgICAgICAgIHJldHVybiBmYWxzZTsKCkFuZCB0aGVuIGEgcGxhaW4gcmV0dXJuIHN0
YXRlbWVudCBoZXJlIHRvbz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
