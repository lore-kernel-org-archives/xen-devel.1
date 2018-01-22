From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/shim: stash RSDP address for ACPI
	driver
Date: Mon, 22 Jan 2018 09:05:16 -0700
Message-ID: <5A6619CC02000078001A1331@prv-mh.provo.novell.com>
References: <20180122150252.20595-1-wei.liu2@citrix.com>
 <20180122153425.vbli5klb2bktcn2i@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edeb7-000372-Vz
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 16:05:26 +0000
In-Reply-To: <20180122153425.vbli5klb2bktcn2i@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDE2OjM0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDIyLCAyMDE4IGF0IDAzOjAyOjUyUE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL2FjcGkvb3NsLmMKPj4gKysrIGIveGVuL2RyaXZlcnMvYWNw
aS9vc2wuYwo+PiBAQCAtNjIsOCArNjIsMTMgQEAgdm9pZCBfX2luaXQgYWNwaV9vc192cHJpbnRm
KGNvbnN0IGNoYXIgKmZtdCwgdmFfbGlzdCBhcmdzKQo+PiAgCXByaW50aygiJXMiLCBidWZmZXIp
Owo+PiAgfQo+PiAgCj4+ICthY3BpX3BoeXNpY2FsX2FkZHJlc3MgcnNkcF9oaW50Owo+IAo+IFNp
bmNlIHRoaXMgaXMgb25seSB1c2VkIGJ5IGFjcGlfb3NfZ2V0X3Jvb3RfcG9pbnRlciBpdCBzaG91
bGQgYmUKPiBfX2luaXRkYXRhLiBJIGFsc28gcHJlZmVyIHRvIHBsYWNlIGdsb2JhbCB2YXJpYWJs
ZXMgYXQgdGhlIHRvcCBvZiB0aGUKPiBmaWxlIGFmdGVyIHRoZSBpbmNsdWRlcywgYnV0IHRoYXQn
cyBqdXN0IGEgbWF0dGVyIG9mIHRhc3RlIEkgZ3Vlc3MuCgpJIHRoaW5rIGtlZXBpbmcgc3VjaCBs
aW1pdGVkIHVzZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgLwpkZWZpbml0aW9ucyBjbG9zZSB0byB0
aGVpciB1c2Ugc2l0ZSBpcyBxdWl0ZSBva2F5LCBpZiBub3QKcHJlZmVyYWJsZS4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
