From: Shuah Khan <shuahkhan@gmail.com>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Wed, 28 Nov 2018 16:01:10 -0700
Message-ID: <CAKocOOO2jELMaVh85m3V562ewCBDRUMJ1q_xoq7DgvUiagpTjQ__27453.7576515742$1543470176$gmane$org@mail.gmail.com>
References: <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128.112717.149234960284639699.davem@davemloft.net>
 <20181128194708.GP30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7fp/=oh=gmail.com=shuahkhan@srs-us1.protection.inumbo.net>)
 id 1gS8pi-0000ye-6w
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 23:01:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id r24so402165wmh.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Nov 2018 15:01:23 -0800 (PST)
In-Reply-To: <20181128194708.GP30658@n2100.armlinux.org.uk>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux@armlinux.org.uk
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, hch@lst.de, "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux-foundation.org>, Shuah Khan <shuahkhan@gmail.com>, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, dwmw2@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMTI6NDggUE0gUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4
CjxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gT24gV2VkLCBOb3YgMjgsIDIwMTgg
YXQgMTE6Mjc6MTdBTSAtMDgwMCwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+ID4gRnJvbTogTGludXMg
VG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+ID4gRGF0ZTogV2VkLCAy
OCBOb3YgMjAxOCAxMDowMDowNiAtMDgwMAo+ID4KPiA+ID4gTm90IGFsbCBtZW1vcnkgaXMgYWNj
ZXNzaWJsZSBldmVuIHRvIHRoZSBrZXJuZWwuIElmIHlvdSBoYXZlIG1lbW9yeQo+ID4gPiB0aGF0
IHNob3dzIHVwIGluIHRoZSBsYXN0IHBhZ2Ugb2YgcGh5c19hZGRyX3QsIHlvdSBqdXN0IG1hcmsg
aXQKPiA+ID4gcmVzZXJ2ZWQgYXQgYm9vdC10aW1lLgo+ID4KPiA+IEl0J3Mgbm90IHRoZSBwaHlz
aWNhbCBtZW1vcnkgYXQgdGhlIGVuZCB0aGF0IG5lZWRzIHRvIGJlIHJlc2VydmVkLgo+ID4KPiA+
IEl0J3MgdGhlIElPTU1VIG1hcHBpbmcgYXJlbmEuCj4KPiBUcnVlLCBpZiBhbmQgb25seSBpZiB5
b3UgaGF2ZSBhbiBJT01NVS4KPgo+IFdoZXJlIHRoZXJlIGlzbid0IGFuIElPTU1VLCB0aGVuIHdl
J2QgaGF2ZSB0byByZXNlcnZlIGV2ZXJ5IHBhZ2UgdGhhdAo+IHRoYXQgdHJhbnNsYXRlcyB0byBh
IGJ1cyBhZGRyZXNzIGluIHRoZSB0b3AgNEsgb2YgZG1hX2FkZHJfdCBvbiBhbnkKPiBidXMgaW4g
dGhlIHN5c3RlbSAtIHRoYXQgbWVhbnMga25vd2luZyBlYXJseSBpbiB0aGUga2VybmVsCj4gaW5p
dGlhbGlzYXRpb24gYWJvdXQgYWxsIGJ1c2VzIGluIHRoZSBzeXN0ZW0gc28gd2UgY2FuIGRldGVj
dCBhbmQKPiByZXNlcnZlIHRoZXNlIHBhZ2VzLgo+CgpUaGUgYXJjaCBhbmQgcGxhdGZvcm0gZGlm
ZmVyZW5jZXMvY29uZnVzaW9uIGFzIHRvICJ3aGF0IGlzIERNQSBlcnJvcgp2YWx1ZSIgaXMgdGhl
IHJlYXNvbiB3aHkgZG1hX21hcHBpbmdfZXJyb3IgaXMgcGFydCBkbWEgb3BzLiBJCnVuZGVyc3Rh
bmQgdGhhdCBpeSB3b3VsZCBtYWtlIHNlbnNlIHRvIHJlZHVjZSB0aGUgb3ZlcmhlYWQgb2YgYW4K
YWRkaXRpb25hbCBjYWxsLCBob3dldmVyLCBJIGFtIG5vdCBzdXJlIGlmIHdvdWxkIGJlIHRyaXZp
YWwgY2hhbmdlIHRvCmFkZHJlc3MgdGhpcy4KCkkgd2FzIGRvd24gdGhpcyBwYXRoIG9mIHRyeWlu
ZyB0byBhZGRyZXNzIHRoZSBtaXNzaW5nIG1hcHBpbmcgZXJyb3IKY2hlY2tzIGEgZmV3IHllYXJz
IGFnbyBhbmQgaW50cm9kdWNlZCBkbWFfbWFwcGluZ19lcnJvciBjaGVja3MgaW4gdGhlCkRNQSBE
RUJVRyBBUEkuIEFzIHlvdSBtaWdodCBhbHJlYWR5IGtub3cgdGhhdCB0aGVyZSBpcyBubyBjb21t
b24KZGVmaW5pdGlvbiBmb3IgdGhlIG1hcHBpbmcgZXJyb3IuCgpRdWljayBsb29rIGF0IHRoZSBk
ZWZpbmVzIHNob3dzOgoKI2RlZmluZSBDQUxHQVJZX01BUFBJTkdfRVJST1IgMAojZGVmaW5lIFMz
OTBfTUFQUElOR19FUlJPUiAgKH4oZG1hX2FkZHJfdCkgMHgwKQojZGVmaW5lIFNQQVJDX01BUFBJ
TkdfRVJST1IgKH4oZG1hX2FkZHJfdCkweDApCgpUaGlzIGlzIHRoZSByZWFzb24gd2h5IHRoZXJl
IGlzIGEgYXJjaCBvciBpbiBzb21lIGNhc2VzIGJ1cyBzcGVjaWZpYwptYXBwaW5nX2Vycm9yIG9w
cyBpcyBuZWVkZWQuCldlIGNvdWxkIHVuaWZ5IHRoaXMgYW5kIGZpeCBhbGwgdGhlc2UgZmlyc3Qu
IEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhlCnBhdGNoIHNldCBjbG9zZWx5LCBtYXliZSB5b3UgYXJl
IGFscmVhZHkgZG9pbmcgdGhpcy4KCnRoYW5rcywKLS0gU2h1YWgKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
