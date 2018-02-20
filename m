From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 11:22:31 +0000
Message-ID: <20180220112231.o56tu5issvljuxxn@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
 <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
 <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
 <5A8C10F602000078001A9895@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo60V-0001Zu-1r
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:22:47 +0000
Content-Disposition: inline
In-Reply-To: <5A8C10F602000078001A9895@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDQ6MTM6NDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjAyLjE4IGF0IDEyOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+ID4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+ID4gQEAgLTE1LDYgKzE1LDkgQEAKPiA+
ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4gPiAKPiA+ICAjaWZkZWYgX19BU1NFTUJM
WV9fCj4gPiArI2lmbmRlZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKPiA+ICsuZXF1IENPTkZJR19J
TkRJUkVDVF9USFVOSywgMAo+ID4gKyNlbmRpZgo+ID4gICMgaW5jbHVkZSA8YXNtL2luZGlyZWN0
X3RodW5rX2FzbS5oPgo+ID4gICNlbHNlCj4gPiAgYXNtICggIlx0LmVxdSBDT05GSUdfSU5ESVJF
Q1RfVEhVTkssICIKPiA+IAo+ID4gSXQncyBmYWlybHkgc2ltaWxhciB0byBteSBmaXJzdCBhcHBy
b2FjaCwgYnV0IGF0IGxlYXN0ICIjaWZkZWYKPiA+IENPTkZJR19JTkRJUkVDVF9USFVOSyIgd2ls
bCBzdGlsbCB3b3JrIGFzIGV4cGVjdGVkIGFmdGVyIHRoaXMgZml4Lgo+IAo+IEkndmUgdXNlZCBz
b21ldGhpbmcgc2ltaWxhciBpbiBiYWNrcG9ydHMgdG8gb2xkIHZlcnNpb25zLCBzbyBJCj4gd29u
ZGVyIHdoZXRoZXIgd2hhdCB5b3UgcXVvdGUgYWJvdmUgaXMgcmlnaHQ6IEFzc2VtYmx5IGZpbGVz
Cj4gZG9uJ3QgZ2V0IGhhbmRlZCB0byBjbGFuZyBhbnl3YXkgaWlyYywgc28gdGhlIGNoYW5nZSB3
b3VsZAo+IHNlZW0gdG8gYmUgbmVlZGVkIGluIHRoZSAjZWxzZSBwYXJ0IG9mIHRoZSBjb25kaXRp
b25hbC4KCkFzc2VtYmx5IGZpbGVzIGRvIGdldCBoYW5kZWQgdG8gY2xhbmcsIGZyb20geGVuL1J1
bGVzLm1rOgoKJS5vOiAlLlMgTWFrZWZpbGUKCSQoQ0MpICQoQUZMQUdTKSAtYyAkPCAtbyAkQAoK
WGVuIGRvZXNuJ3QgY2FsbCBhcyBkaXJlY3RseSB0byBjb21waWxlIHRob3NlLCBvciBhbSBJIG1p
c3NpbmcKc29tZXRoaW5nPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
