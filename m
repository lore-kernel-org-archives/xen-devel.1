From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Thu, 19 Apr 2018 15:54:53 +0100
Message-ID: <20180419145453.ahbpxclr5isbhdcm@citrix.com>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
 <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g8v3=hi=citrix.com=prvs=6400f7f3c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f9AyF-0003EI-KD
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 14:55:35 +0000
Content-Disposition: inline
In-Reply-To: <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDE6MDE6NTNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAxOS8wNC8xOCAxMjo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+PiBPbiAx
OS4wNC4xOCBhdCAxMjozMCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gLS0tIGEvdG9v
bHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+ID4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hl
bi1kaXIvTWFrZWZpbGUKPiA+PiBAQCAtNDEsMjEgKzQxLDIyIEBAIGxpbmtmYXJtLnN0YW1wOiAk
KERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKPiA+PiAgJChEKTogbGlua2Zhcm0uc3RhbXAK
PiA+PiAgCSQoTUFLRSkgLUMgJChEKS94ZW4gZGlzdGNsZWFuCj4gPj4gIAo+ID4+IC0uUEhPTlk6
IHNoaW0tJWNvbmZpZwo+ID4+IC1zaGltLSVjb25maWc6ICQoRCkgRk9SQ0UKPiA+PiAtCSQoTUFL
RSkgLUMgJChEKS94ZW4gJCpjb25maWcgXAo+ID4gCj4gPiBJIHRoaW5rIHRoZXJlIHdhcyBhIHJl
YXNvbiBmb3IgdGhlICUgYW5kICQqLgo+IAo+IFRoZSBvbmx5IG9uZSBJIGNvdWxkIHRoaW5rIG9m
IGlzIHRoZSBwb3NzaWJpbGl0eSB0byBkbwo+IAo+IG1ha2Ugc2hpbS1kZWZhdWx0Y29uZmlnCj4g
Cj4gb3Igc2ltaWxhciBjYWxscy4gUXVlc3Rpb24gaXMgd2hvIHdpbGwgZXZlciBuZWVkIHRoYXQu
IEluIGNhc2UgaXQgaXMKPiBiZWxpZXZlZCB0byBiZSB2YWx1YWJsZSBJIGNhbiBrZWVwIGl0LgoK
Tm90IGxpa2VseSBJIHRoaW5rLgoKPiAKPiA+PiAreGVuLXNoaW0uY29uZmlnOiBzaGltLmNvbmZp
Zwo+ID4+ICsJY3AgJDwgJEAKPiA+IAo+ID4gV2h5IG5vdCBjb3B5IGl0IHRvIHdoZXJlIGl0IGFj
dHVhbGx5IGJlbG9uZyAtIHhlbi8uY29uZmlnPwo+IAo+IEhtbSwgdHJ1ZS4gSW4gY2FzZSBub2Jv
ZHkgb2JqZWN0cyBJJ2xsIGRvIHRoYXQuCj4gCj4gCgpObyBvYmplY3Rpb24uCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
