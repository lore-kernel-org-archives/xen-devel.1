From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 45/74] x86/guest: use unpopulated
 memory to map the shared_info page
Date: Mon, 08 Jan 2018 04:03:50 -0700
Message-ID: <5A535E26020000780019C126@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-46-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYVDq-0003YT-N7
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:04:06 +0000
In-Reply-To: <20180104130625.28605-46-wei.liu2@citrix.com>
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
VGhpcyBwcmV2ZW50cyBoYXJkY29kaW5nIGEga25vd24gdW5wb3B1bGF0ZWQgbWVtb3J5IHBhZ2Ug
dG8gbWFwCj4gdGhlIHNoYXJlZCBpbmZvIHBhZ2UuIFRoaXMgZml4ZXMgYSBUT0RPIGl0ZW0gaW4g
YSBwcmV2aW91cyBwYXRjaC4KPiAKPiBSZW1vdmUgaHlwZXJ2aXNvcl9lYXJseV9zZXR1cCBhcyBu
b3cgaXQgaXMgbm90IHJlcXVpcmVkIGFueW1vcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKTG9va3MgZ29vZCwgYnV0IG9uZSBxdWVzdGlvbjoKCj4g
QEAgLTE4NywxNSArMTg2LDEyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X21lbW1hcCh2b2lk
KQo+ICAgICAgfQo+ICB9Cj4gIAo+IC12b2lkIF9faW5pdCBoeXBlcnZpc29yX2Vhcmx5X3NldHVw
KHN0cnVjdCBlODIwbWFwICplODIwKQo+IC17Cj4gLSAgICBtYXBfc2hhcmVkX2luZm8oZTgyMCk7
Cj4gLX0KPiAtCj4gIHZvaWQgX19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKPiAgewo+ICAg
ICAgaW5pdF9tZW1tYXAoKTsKPiAgCj4gKyAgICBtYXBfc2hhcmVkX2luZm8oKTsKPiArCj4gICAg
ICBpbml0X2V2dGNobigpOwo+ICB9CgpJZiB0aGUgc2hhcmVkIGluZm8gcGFnZSBpc24ndCBuZWVk
ZWQgYXMgZWFybHksIHdoeSB3YXMgaXQgc2V0IHVwCnRoYXQgZWFybHkgb3JpZ2luYWxseT8KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
