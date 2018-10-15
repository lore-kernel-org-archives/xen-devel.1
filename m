From: Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: Re: [PATCH] xen/blkfront: avoid NULL blkfront_info
 dereference on device removal
Date: Mon, 15 Oct 2018 10:55:54 +0200
Message-ID: <886d0f79d59d2d35ca75f9d2d79cdb45c1628c78.camel__18565.6717083932$1539593709$gmane$org@suse.com>
References: <20181011162000.19191-1-vliaskovitis@suse.com>
 <20181011163427.ilpsl4hxb2y3hcfp@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ieol=m3=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1gByfb-0005j6-Je
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 08:56:11 +0000
In-Reply-To: <20181011163427.ilpsl4hxb2y3hcfp@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: axboe@kernel.dk, jgross@suse.com, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE4LTEwLTExIGF0IDE4OjM0ICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiA+ICsrKyBiL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2Zyb250LmMKPiA+IEBAIC0yNDkzLDYgKzI0OTMsOSBAQCBzdGF0aWMgaW50
IGJsa2Zyb250X3JlbW92ZShzdHJ1Y3QKPiA+IHhlbmJ1c19kZXZpY2UgKnhiZGV2KQo+ID4gIAo+
ID4gIAlkZXZfZGJnKCZ4YmRldi0+ZGV2LCAiJXMgcmVtb3ZlZCIsIHhiZGV2LT5ub2RlbmFtZSk7
Cj4gPiAgCj4gPiArCWlmICghaW5mbykKPiA+ICsJCWdvdG8gb3V0Owo+IAo+IEkgZG9uJ3Qgc2Vl
IHRoZSBwb2ludCBpbiBhZGRpbmcgdGhlICdvdXQnIGxhYmVsLiBDYW4geW91IGp1c3QgcmV0dXJu
Cj4gMAo+IGhlcmU/CgpvZiBjb3Vyc2UsIEkgd2lsbCBzZW5kIGEgc2Vjb25kIHZlcnNpb24uCiAK
dGhhbmtzIGZvciB0aGUgcmV2aWV3LAoKLSBWYXNpbGlzCgo+IAo+IFRoYW5rcywgUm9nZXIuCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
