From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Wed, 25 Jul 2018 09:30:25 +0100
Message-ID: <20180725083025.khldqe66bskmsgc5@citrix.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <8ac9748a-258c-a9e4-6d0d-b838b58466b5@citrix.com>
 <5B4D934902000078001D4AE9@prv1-mh.provo.novell.com>
 <d47221f7-6b21-026e-3a68-36253250b2e1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiFBv-0004zZ-Rt
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 08:30:39 +0000
Content-Disposition: inline
In-Reply-To: <d47221f7-6b21-026e-3a68-36253250b2e1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <Wei.Liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDk6Mzk6MDNBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wNy8yMDE4IDA3OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+IE9u
IDE2LjA3LjE4IGF0IDE4OjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
Pj4gT24gMTYvMDcvMTggMTc6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+PiBGb3IgYSByZWFz
b24gdGhhdCBJIGNhbid0IGV4cGxhaW4sIGl0IGlzIG9ubHkgdGhlIHNoaW0gYnVpbGQgdGhhdCBm
YWlscwo+ID4+PiBmb3IgbWUgd2l0aCBhbiBvbGRlciBnY2MgZHVlIHRvIHRoZSBjb21waWxlciBu
b3QgcmVjb2duaXppbmcgdGhhdAo+ID4+PiBhcHBhcmVudGx5IHVuaW5pdGlhbGl6ZWQgdmFyaWFi
bGVzIGFyZW4ndCByZWFsbHkgdW5pbml0aWFsaXplZC4KPiA+PiBUaGUgb25seSB0aGluZyB0aGF0
IGNvbWVzIHRvIG1pbmQgaXMgc29tZSBkaWZmZXJlbmNlcyBpbiBDRkxBR1MgZXQgYWwuIAo+ID4+
IFRoZXJlIGlzIG5vdGhpbmcgaW4ga2NvbmZpZyB3aGljaCB3b3VsZCBwbGF1c2libHkgaW1wYWN0
IHRoYXQgY29kZS4KPiA+IE9oLCByaWdodCAtIGxvb2tzIGxpa2UgdGhlIHNoaW0gYnVpbGQgaW5o
ZXJpdHMgdGhlIHRvb2wgc3RhY2sncyBDRkxBR1MsCj4gPiB3aGljaCBzcGVjaWZ5IC1PMCBpbiBk
ZWJ1ZyBidWlsZHMuIE90b2ggSSdtIHN1cnByaXNlZCB0aGUgaHlwZXJ2aXNvcgo+ID4gYnVpbGRz
IGF0IGFsbCB3aXRoIC1PMCwgc28gSSBndWVzcyBJJ2xsIGhhdmUgdG8gbG9vayBhdCB0aGF0IGlu
IHNvbWUKPiA+IG1vcmUgZGV0YWlsLCBub3QgdGhlIGxlYXN0IGJlY2F1c2UgeGVuL1J1bGVzLm1r
IHVzZXMgKz0gdG8gaW5zZXJ0Cj4gPiBpdHMgb3duIC1PPG4+LiBJbiBhbnkgZXZlbnQsIGNvbXBh
cmluZyB0aGUgdHdvIG9iamVjdCBmaWxlcyBjbGVhcmx5Cj4gPiBzdWdnZXN0cyBhIGRpZmZlcmVu
Y2UgaW4gb3B0aW1pemF0aW9uIGxldmVsLgo+IAo+IEhtbSAtIGludGVyZXN0aW5nLsKgIEkgaGFk
IGludGVuZGVkIG5vdCB0byBpbmhlcml0IHRoZSB0b29scyBkdWJpb3VzCj4gQ0ZMQUdTIHNldHRp
bmcgKG5vdGhpbmcgc2hvdWxkIHVzZSBPMCwgbm90IGV2ZW4gZm9yIGRlYnVnZ2luZyksIGJ1dCBo
b3cKPiB0aGF0IEkgdGhpbmsgYmFjaywgdGhhdCBwcm9iYWJseSBmZWxsIHRocm91Z2ggdGhlIGNy
YWNrcyBpbiB0aGUKPiBhc3NvY2lhdGVkIGNoYW9zLgo+IAo+IE5ldmVydGhlbGVzcywgYWxsIG9m
IG91ciBjb2RlIHNob3VsZCBidWlsZCBhdCBhbnkgb3B0aW1pc2F0aW9uIGxldmVsLsKgIEkKPiBr
bm93IGZyb20gb3RoZXIgYXR0ZW1wdHMgdGhhdCBYZW4gYWxzbyBkb2Vzbid0IGJ1aWxkIGF0IE8z
LCBhbmQgd2UgY291bGQKPiBkbyB3aXRoIGEgd2F5IHRvIHNlbGVjdCB0aGUgb3B0aW1pc2F0aW9u
IGxldmVsLCBpbmRlcGVuZGVudGx5IG9mIGRlYnVnCj4gc2V0dGluZ3MuCgpJIGFncmVlIHdpdGgg
d2hhdCB5b3Ugc2FpZCBidXQgdW5mb3J0dW5hdGVseSByZXdvcmtpbmcgdGhlIGJ1aWxkIHN5c3Rl
bQppcyByYXRoZXIgbG93IG9uIG15IHByaW9yaXR5IGxpc3QuCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
