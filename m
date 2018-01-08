From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 47/74] x86/guest: fix upcall vector
 setup
Date: Mon, 08 Jan 2018 04:08:47 -0700
Message-ID: <5A535F4F020000780019C147@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-48-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYVIS-000443-AP
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:08:52 +0000
In-Reply-To: <20180104130625.28605-48-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBJbnN0ZWFk
IG9mIGZvcmNpbmcgbm8gcGVuZGluZyBldmVudCBvbiB0aGUgdkNQVSwganVzdCBtYXNrIGFsbCBl
dmVudAo+IGNoYW5uZWxzIHdoZW4gc2V0dGluZyB1cCB0aGUgQlNQIGFuZCBmdXJ0aGVyIHBhdGNo
ZXMgd2lsbCB1bm1hc2sgdGhlbQo+IGFzIGV2ZW50IGNoYW5uZWxzIGFyZSBiZWluZyBzZXR1cC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPiAtLS0KPiBUbyBiZSBzcXVhc2hlZCB3aXRoICJ4ODYvZ3Vlc3Q6IGVuYWJsZSBldmVudCBj
aGFubmVscyB1cGNhbGxzIgoKWWVzIHBsZWFzZS4KCj4gQEAgLTk1LDYgKzk1LDEwIEBAIHN0YXRp
YyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lkKQo+ICAgICAgICAgIHBhbmljKCJGYWlsZWQgdG8g
bWFwIHNoYXJlZF9pbmZvIHBhZ2UiKTsKPiAgCj4gICAgICBzZXRfZml4bWFwKEZJWF9YRU5fU0hB
UkVEX0lORk8sIG1mbl94KG1mbikgPDwgUEFHRV9TSElGVCk7Cj4gKwo+ICsgICAgLyogTWFzayBh
bGwgdXBjYWxscyAqLwo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKFhFTl9zaGFy
ZWRfaW5mby0+ZXZ0Y2huX21hc2spOyBpKysgKQo+ICsgICAgICAgIHhjaGcoJlhFTl9zaGFyZWRf
aW5mby0+ZXZ0Y2huX21hc2tbaV0sIH4wdWwpOwoKSnVzdCBsaWtlIHRoZXJlLCB3cml0ZV9hdG9t
aWMoKSB3b3VsZCBsaWtlbHkgYmUgYmV0dGVyIHRoYW4geGNoZygpLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
