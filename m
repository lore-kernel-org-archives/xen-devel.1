From: Haozhong Zhang <haozhong.zhang@intel.com>
Subject: Re: [RFC QEMU PATCH v4 00/10] Implement vNVDIMM for Xen
	HVM guest
Date: Wed, 28 Feb 2018 17:36:59 +0800
Message-ID: <20180228093659.xpq2amq2zjuw2mdr__49135.3490193889$1519810559$gmane$org@hz-desktop>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20171207101812.23602-1-haozhong.zhang@intel.com>
 <20180227172223.GD1799@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hf/x=fw=intel.com=haozhong.zhang@srs-us1.protection.inumbo.net>)
 id 1eqyAd-0000lo-5J
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 09:37:07 +0000
Content-Disposition: inline
In-Reply-To: <20180227172223.GD1799@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Chao Peng <chao.p.peng@linux.intel.com>, xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>, Richard Henderson <rth@twiddle.net>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjcvMTggMTc6MjIgKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFRodSwg
RGVjIDA3LCAyMDE3IGF0IDA2OjE4OjAyUE0gKzA4MDAsIEhhb3pob25nIFpoYW5nIHdyb3RlOgo+
ID4gVGhpcyBpcyB0aGUgUUVNVSBwYXJ0IHBhdGNoZXMgdGhhdCB3b3JrcyB3aXRoIHRoZSBhc3Nv
Y2lhdGVkIFhlbgo+ID4gcGF0Y2hlcyB0byBlbmFibGUgdk5WRElNTSBzdXBwb3J0IGZvciBYZW4g
SFZNIGRvbWFpbnMuIFhlbiByZWxpZXMgb24KPiA+IFFFTVUgdG8gYnVpbGQgZ3Vlc3QgTkZJVCBh
bmQgTlZESU1NIG5hbWVzcGFjZSBkZXZpY2VzLCBhbmQgYWxsb2NhdGUKPiA+IGd1ZXN0IGFkZHJl
c3Mgc3BhY2UgZm9yIHZOVkRJTU0gZGV2aWNlcy4KPiAKPiBJJ3ZlIGdvdCBvdGhlciBxdWVzdGlv
biwgYW5kIG1heWJlIHBvc3NpYmxlIGltcHJvdmVtZW50cy4KPiAKPiBXaGVuIFFFTVUgYnVpbGQg
dGhlIEFDUEkgdGFibGVzLCBpdCBhbHNvIGluaXRpYWxpemUgc29tZSBNZW1vcnlSZWdpb24sCj4g
d2hpY2ggdXNlIG1vcmUgZ3Vlc3QgbWVtb3J5LiBEbyB5b3Uga25vdyBpZiB0aG9zZSByZWdpb25z
IGFyZSB1c2VkIHdpdGgKPiB5b3VyIHBhdGNoIHNlcmllcyBvbiBYZW4/CgpZZXMsIHRoYXQncyB3
aHkgZG1fYWNwaV9zaXplIGlzIGludHJvZHVjZWQuCgo+IE90aGVyd2lzZSwgd2UgY291bGQgdHJ5
IHRvIGF2b2lkIHRoZWlyCj4gY3JlYXRpb24gd2l0aCB0aGlzOgo+IEluIHhlbmZ2X21hY2hpbmVf
b3B0aW9ucygpCj4gbS0+cm9tX2ZpbGVfaGFzX21yID0gZmFsc2U7Cj4gKHNldHRpbmcgdGhpcyBp
biB4ZW5faHZtX2luaXQoKSB3b3VsZCBwcm9iYWJseSBiZSBiZXR0ZXIsIGJ1dCBJIGhhdm4ndAo+
IHRyeSkKCklmIG15IG1lbW9yeSBpcyBjb3JyZWN0LCBzaW1wbHkgc2V0dGluZyByb21fZmlsZV9o
YXNfbXIgdG8gZmFsc2UgZG9lcwpub3Qgd29yayAodGhvdWdoIEkgY2Fubm90IHJlbWluZCB0aGUg
ZXhhY3QgcmVhc29uKS4gSSdsbCBoYXZlIGEgbG9vawphcyB0aGUgY29kZSB0byByZWZyZXNoIG15
IG1lbW9yeS4KCkhhb3pob25nCgo+IAo+IElmIHRoaXMgaXMgcG9zc2libGUsIGxpYnhsIHdvdWxk
IG5vdCBuZWVkIHRvIGFsbG9jYXRlIG1vcmUgbWVtb3J5IGZvcgo+IHRoZSBndWVzdCAoZG1fYWNw
aV9zaXplKS4KPiAKPiAtLSAKPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
