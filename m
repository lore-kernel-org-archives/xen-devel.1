From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] xen: fix pv domain on amd in 4.9 stable
 branch
Date: Wed, 30 May 2018 10:33:36 +0200
Message-ID: <20180530083336.GC9685__11528.2517312609$1527669162$gmane$org@kroah.com>
References: <20180529131136.15624-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cjyj=ir=linuxfoundation.org=gregkh@kernel.org>)
 id 1fNwYU-00037a-CX
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 08:34:02 +0000
Content-Disposition: inline
In-Reply-To: <20180529131136.15624-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjksIDIwMTggYXQgMDM6MTE6MzZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBDb21taXQgOTQ0ZTBmYzUxYTg5Yzk4MjdiOTg4MTNkNjVkYzA4MzI3NDc3N2M3ZiAo
Ing4Ni9hbWQ6IGRvbid0IHNldAo+IFg4Nl9CVUdfU1lTUkVUX1NTX0FUVFJTIHdoZW4gcnVubmlu
ZyB1bmRlciBYZW4iKSBicmVha3MgWGVuIHB2LWRvbWFpbnMKPiBvbiBBTUQgcHJvY2Vzc29ycywg
YXMgYSBwcmVyZXF1aXNpdGUgcGF0Y2ggZnJvbSB1cHN0cmVhbSB3YXNuJ3QgYWRkZWQKPiB0byA0
LjkuCgpXaGF0IGlzIHRoZSBwcmVyZXF1c2l0ZSBwYXRjaCdzIGdpdCBpZCBpbiBMaW51cydzIHRy
ZWU/Cgo+IEZpeCB0aGF0IGJ5IGFkZGluZyB0aGUgcHJlcmVxdWlzaXRlIHNldHRpbmcgb2YgWDg2
X0ZFQVRVUkVfWEVOUFYgdG8gdGhlCj4gWGVuIHB2IGVhcmx5IGJvb3QgcGF0aC4KPiAKPiBDYzog
RGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPiBDYzogQm9yaXMgT3N0cm92c2t5
IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW4uYyB8
IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYveGVuL2VubGlnaHRlbi5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbi5jCj4g
aW5kZXggMDgxNDM3YjVmMzgxLi42NzQ2NTZjZGI2OGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYv
eGVuL2VubGlnaHRlbi5jCj4gKysrIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbi5jCj4gQEAgLTE2
MzIsNiArMTYzMiw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IHhlbl9zdGFy
dF9rZXJuZWwodm9pZCkKPiAgCXhlbl9pbml0X2lycV9vcHMoKTsKPiAgCXhlbl9pbml0X2NwdWlk
X21hc2soKTsKPiAgCj4gKwkvKiBOZWVkZWQgZm9yIGluaXRfYW1kKCkuICovCj4gKwlzZXR1cF9m
b3JjZV9jcHVfY2FwKFg4Nl9GRUFUVVJFX1hFTlBWKTsKPiArCj4gICNpZmRlZiBDT05GSUdfWDg2
X0xPQ0FMX0FQSUMKPiAgCS8qCj4gIAkgKiBzZXQgdXAgdGhlIGJhc2ljIGFwaWMgb3BzLgo+IC0t
IAo+IDIuMTMuNgoKSSdkIHByZWZlciB0byB0YWtlIHdoYXRldmVyIGlzIGluIExpbnVzJ3MgdHJl
ZSBpZiBhdCBhbGwgcG9zc2libGUuCgp0aGFua3MsCgpncmVnIGstaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
