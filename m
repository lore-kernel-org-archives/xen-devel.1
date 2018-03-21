From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Wed, 21 Mar 2018 09:36:04 +0000
Message-ID: <c2eee6cbf59e4bdc816c66ec0637388a@AMSPEX02CL03.citrite.net>
References: <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <20180319155802.immvsgqttrs3yezg@MacBook-Pro-de-Roger.local>
 <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wmog=gl=citrix.com=prvs=61138bc9a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1eyaAB-0007CG-0g
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 09:36:07 +0000
In-Reply-To: <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, Alexey G <x1917x@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IAo+ID4gVGhlIHF1ZXN0aW9uIGlzIHdoeSBJ
T1JFUV9UWVBFX0NPUFkgLT4gSU9SRVFfVFlQRV9QQ0lfQ09ORklHCj4gPiB0cmFuc2xhdGlvbiBp
cyBhIG11c3QgaGF2ZSB0aGluZyBhdCBhbGw/IEl0IHdvbid0IG1ha2UgaGFuZGxpbmcgc2ltcGxl
ci4KPiA+IEZvciBjdXJyZW50IFFFTVUgaW1wbGVtZW50YXRpb24gSU9SRVFfVFlQRV9DT1BZIChN
TUlPIGFjY2Vzc2VzIGZvcgo+ID4gTU1DT05GSUcpIHdvdWxkIGJlIHByZWZlcmFibGUgYXMgaXQg
YWxsb3dzIHRvIHVzZSB0aGUgZXhpc3RpbmcgY29kZS4KPiAKPiBHcmFudGVkIGl0J3MgbGlrZWx5
IGVhc2llciB0byBpbXBsZW1lbnQsIGJ1dCBpdCdzIGFsc28gaW5jb3JyZWN0LiBZb3UKPiBzZWVt
IHRvIGhhdmUgaW4gbWluZCB0aGUgcGljdHVyZSBvZiBhIHNpbmdsZSBJT1JFUSBzZXJ2ZXIgKFFF
TVUpCj4gaGFuZGxpbmcgYWxsIHRoZSBkZXZpY2VzLgo+IAo+IEFsdGhvdWdoIHRoaXMgaXMgdGhl
IG1vc3QgY29tbW9uIHNjZW5hcmlvLCBpdCdzIG5vdCB0aGUgb25seSBvbmUKPiBzdXBwb3J0ZWQg
YnkgWGVuLiBZb3VyIHByb3Bvc2VkIHNvbHV0aW9uIGJyZWFrcyB0aGUgdXNhZ2Ugb2YgbXVsdGlw
bGUKPiBJT1JFUSBzZXJ2ZXJzIGFzIFBDSSBkZXZpY2UgZW11bGF0b3JzLgo+IAoKSW5kZWVkIGl0
IHdpbGwsIGFuZCB0aGF0IGlzIG5vdCBhY2NlcHRhYmxlIGV2ZW4gaW4gdGhlIHNob3J0IHRlcm0u
Cgo+ID4gSSB0aGluayBpdCB3aWxsIGJlIHNhZmUgdG8gdXNlIE1NQ09ORklHIGVtdWxhdGlvbiBv
biBNTUlPIGxldmVsIGZvciBub3cKPiA+IGFuZCBsYXRlciBleHRlbmQgaXQgd2l0aCAnc2V0X21t
Y29uZmlnXycgZG1vcC9oeXBlcmNhbGwgZm9yIHRoZQo+ID4gJ211bHRpcGxlIGRldmljZSBlbXVs
YXRvcnMnIElPUkVRX1RZUEVfQ09QWSByb3V0aW5nIHRvIHdvcmsgc2FtZSBhcyBmb3IKPiA+IFBD
SSBjb25mLCBzbyBpdCBjYW4gYmUgdXNlZCBieSBYZW5HVCBldGMgb24gUTM1IGFzIHdlbGwuCj4g
CgpJbnRyb2R1Y2luZyBrbm93biBicmVha2FnZSBpcyBub3QgcmVhbGx5IG9uLCBwYXJ0aWN1bGFy
bHkgd2hlbiBpdCBjYW4gYmUgYXZvaWRlZCB3aXRoIGEgcmVhc29uYWJsZSBhbW91bnQgb2YgZXh0
cmEgd29yay4KCiAgUGF1bAoKPiBJJ20gYWZyYWlkIHRoaXMga2luZCBvZiBpc3N1ZXMgd291bGQg
aGF2ZSBiZWVuIGZhaXJseSBlYXNpZXIgdG8KPiBpZGVudGlmeSBpZiBhIGRlc2lnbiBkb2N1bWVu
dCBmb3IgdGhpcyBmZWF0dXJlIHdhcyBzZW50IHRvIHRoZSBsaXN0Cj4gcHJpb3IgdG8gaXQncyBp
bXBsZW1lbnRhdGlvbi4KPiAKPiBSZWdhcmRpbmcgd2hldGhlciB0byBhY2NlcHQgc29tZXRoaW5n
IGxpa2UgdGhpcywgSSdtIG5vdCByZWFsbHkgaW4KPiBmYXZvciwgYnV0IElNTyBpdCBkZXBlbmRz
IG9uIGhvdyBtdWNoIG5ldyBjb2RlIGlzIGFkZGVkIHRvIGhhbmRsZSB0aGlzCj4gaW5jb3JyZWN0
IHVzYWdlIHRoYXQgd291bGQgdGhlbiBnbyBhd2F5IChvciB3b3VsZCBoYXZlIHRvIGJlIGNoYW5n
ZWQpCj4gaW4gb3JkZXIgdG8gaGFuZGxlIHRoZSBwcm9wZXIgaW1wbGVtZW50YXRpb24uCj4gCj4g
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
