From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC v1 21/74] x86/entry: Early PVH boot code
Date: Tue, 9 Jan 2018 17:10:56 +0000
Message-ID: <20180109171056.kseshhurmf6oh3hj@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-22-wei.liu2@citrix.com>
 <5A4F8C98020000780019B61D@prv-mh.provo.novell.com>
 <20180109154549.zu5htiwtnjekwhyz@citrix.com>
 <5A54FEDF020000780019CD82@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0zzw=ee=citrix.com=prvs=5404865a5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYxQW-0007Xe-D5
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 17:11:04 +0000
Content-Disposition: inline
In-Reply-To: <5A54FEDF020000780019CD82@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wei.liu2@citrix.com, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDksIDIwMTggYXQgMDk6NDE6NTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA5LjAxLjE4IGF0IDE2OjQ1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIEphbiAwNSwgMjAxOCBhdCAwNjozMjo1NkFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+ICsgICAgcHZoX21iaS5tb2RzX2NvdW50ID0gcHZoX2luZm8tPm5y
X21vZHVsZXM7Cj4gPj4gPiArICAgIHB2aF9tYmkubW9kc19hZGRyID0gX19wYShwdmhfbWJpX21v
ZHMpOwo+ID4+ID4gKwo+ID4+ID4gKyAgICBtb2QgPSBwdmhfbWJpX21vZHM7Cj4gPj4gPiArICAg
IGVudHJ5ID0gX192YShwdmhfaW5mby0+bW9kbGlzdF9wYWRkcik7Cj4gPj4gCj4gPj4gSG93IGNv
bWUgX192YSgpIGFscmVhZHkgd29ya3MgYXQgdGhpcyBwb2ludCBpbiB0aW1lPyBBbmQgd2hhdCBh
Ym91dAo+ID4+IHRoaXMgYWRkcmVzcyBiZWluZyBiZXlvbmQgNEdiPwo+ID4+IAo+ID4gCj4gPiBU
aGUgb3JpZ2luYWwgY29kZSB1c2VzIF9fdmEgYXQgdGhlIGJlZ2lubmluZyBvZiBfX3N0YXJ0X3hl
biBzbyB0aGlzIGlzCj4gPiBubyBtb3JlIGVycm9uZW91cyB0aGFuIHdoYXQgd2Ugb3JpZ2luYWxs
eSBoYXZlLgo+IAo+IFdlbGwsIEkgd2FzIGFzc3VtaW5nIHRoYXQgdGhlc2UgdXNlcyBvZiBfX3Zh
KCkgaGVyZSBhcmUgdGhlCj4gcmVhc29uIHdoeSB5b3UgbmVlZCB0byBleHRlbmQgdGhlIGluaXRp
YWwgbWFwcGluZyBpbiBhbm90aGVyCj4gcGF0Y2guIFRoZSBvcmlnaW5hbCBvbmVzIGVhcmx5IGlu
IF9fc3RhcnRfeGVuKCkgYWxsIGRlYWwgd2l0aCB0aGUKPiBNQkkgd2hpY2ggd2UndmUgcmVsb2Nh
dGVkIHRvIGEgcGxhY2Ugd2hlcmUgX192YSgpIGNhbiBiZSB1c2VkLgoKSSBzZWUgLS0gSSB0aG91
Z2h0IGV2ZXJ5dGhpbmcgd2FzIHJlbG9jYXRlZCBhdXRvbWF0aWNhbGx5LCB3aGljaCBpbgpoaW5k
c2lnaHQgbG9va3MgdmVyeSBzdHVwaWQuIFRoYXQncyBwcm9iYWJseSB3aHkgQW5kcmV3IHdyb3Rl
IHRoYXQgcGF0Y2gKdG8gZXh0ZW5kIHRoZSBtYXBwaW5nLiBXZSBjYW4gY2VydGFpbmx5IHJlbG9j
YXRlIHB2aCBpbmZvIGFzIHdlbGwsIGJ1dAp0aGVuIHRoYXQgd291bGQgZGVsYXkgdGhlIHdvcmsu
ICBXZSBjYW4gYWRkIHRoYXQgYXMgYSBibG9ja2VyIGZvciB0aGUKcHJvcGVyIHNvbHV0aW9uIGxh
dGVyLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
