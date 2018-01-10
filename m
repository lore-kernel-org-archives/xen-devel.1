From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v1 61/74] xen/pvshim: support vCPU
	hotplug
Date: Wed, 10 Jan 2018 14:40:53 +0000
Message-ID: <20180110144053.eydqm6c5ilsygklm@MacBook-Pro-de-Roger.local>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-62-wei.liu2@citrix.com>
 <5A54A496020000780019C9B5@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8asd=ef=citrix.com=prvs=541767f32=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eZHYw-0005IX-T1
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 14:41:06 +0000
Content-Disposition: inline
In-Reply-To: <5A54A496020000780019C9B5@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDM6MTY6MzhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjAxLjE4IGF0IDE0OjA2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtMTMwMywyMiArMTMyMCwyMCBAQCBsb25nIGRvX3ZjcHVfb3AoaW50IGNtZCwg
dW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCj4g
PiAgCj4gPiAgICAgICAgICBicmVhazsKPiA+ICAKPiA+IC0gICAgY2FzZSBWQ1BVT1BfdXA6IHsK
PiA+IC0gICAgICAgIGJvb2xfdCB3YWtlID0gMDsKPiA+IC0gICAgICAgIGRvbWFpbl9sb2NrKGQp
Owo+ID4gLSAgICAgICAgaWYgKCAhdi0+aXNfaW5pdGlhbGlzZWQgKQo+ID4gLSAgICAgICAgICAg
IHJjID0gLUVJTlZBTDsKPiAKPiBTaG91bGRuJ3QgdGhpcyBjaGVjayByZW1haW4gaGVyZT8gSSBy
ZWFsaXplIHRoaXMgd2lsbCBjb21wbGljYXRlCj4gbG9ja2luZyAobHVja2lseSB0aGUgZG9tYWlu
IGxvY2sgaXMgYSByZWN1cnNpdmUgb25lLCBzbyBpdCBzaG91bGRuJ3QKPiBiZSB0b28gYmFkKSwg
YnV0IEkgZG9uJ3QgdGhpbmsgcHZfc2hpbV9jcHVfdXAoKSBjYW4gdG9sZXJhdGUgZmFpbGluZwo+
IGJlY2F1c2Ugb2YgdmNwdV91cCgpIGZhaWxpbmcuCgpJIGd1ZXNzIHlvdSBtZWFuIHRoYXQgaXQn
cyB1bmZvcnR1bmF0ZSB0byBmYWlsIGluIHB2X3NoaW1fY3B1X3VwIGFmdGVyCmhhdmluZyBicm91
Z2h0IHVwIHRoZSBwaHlzaWNhbCBDUFUgaWYgaXQgdHVybnMgb3V0IHRoYXQKIXYtPmlzX2luaXRp
YWxpc2VkLiBJIGNhbiBhZGQgYSBjaGVjayBhdCB0aGUgdG9wIG9mIHB2X3NoaW1fY3B1X3VwIGZv
cgohdi0+aXNfaW5pdGlhbGlzZWQgYW5kIGNoYW5nZSB2Y3B1X3VwIHNsaWdodGx5LgoKUmVnYXJk
aW5nIHRoZSB1c2FnZSBvZiBsb25nLCBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1IHJlcXVpcmVz
IGEKZnVuY3Rpb24gdGhhdCByZXR1cm5zIGxvbmcsIHNvIEkgd291bGQgcmF0aGVyIGtlZXAgdGhp
bmdzIGFzIHRoZXkgYXJlCm5vdyBmb3Igc2ltcGxpY2l0eS4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
