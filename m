From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Fri, 11 Jan 2019 13:37:51 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901111331490.27759@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
 <5C37013C020000780020C17D@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
 <CAF3u54A-1_cum6u-nXm4m+60=7tFF=Y1vnR-0+fEKg2y6_68rw@mail.gmail.com>
 <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
 <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
 <alpine.DEB.2.10.1901101745560.27759@sstabellini-ThinkPad-X260>
 <5C387472020000780020C9A7@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901110911310.27759@sstabellini-ThinkPad-X260>
 <a3743bd4b2d54188890945322e92fc1b@dornerworks.com>
 <CAF3u54AAmx0rBVPscfvqcx5f0ezYNCkrsagJgZb3v2GqfB9TEw@mail.gmail.com>
 <0e731cbd10b64a2faac309c04c2030e2@dornerworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhUh=PT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gi4V0-0007Xc-Ak
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 21:37:54 +0000
In-Reply-To: <0e731cbd10b64a2faac309c04c2030e2@dornerworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxMSBKYW4gMjAxOSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IE9uIEZyaWRh
eSwgSmFudWFyeSAxMSwgMjAxOSAzOjM2IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBPbiBG
cmksIDExIEphbiAyMDE5LCAxMjo1MyBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gPiA+Cj4g
PiA+IFdoeSBkb24ndCB3ZSBjaGFuZ2UgdGhlIHR5cGUgb2YgX3N0YXJ0IHNvIGl0J3Mgbm90IGEg
cG9pbnRlciB0eXBlPwo+ID4KPiA+IENhbiB5b3Ugc3VnZ2VzdCBhIHR5cGUgdGhhdCB3b3VsZCBi
ZSBzdWl0YWJsZT8KPiA+Cj4gPiBDaGVlcnMsCj4gCj4gWWVzLiBNeSBvcGluaW9uIGlzIHRoYXQg
dGhlICJzdWZmaWNpZW50LXdpZHRoIGludGVnZXIgdHlwZSIgc2hvdWxkIGJlIGEKPiAidWludHB0
cl90IiBvciAiaW50cHRyX3QiLCBzaW5jZSB0aG9zZSB0eXBlcyBieSBkZWZpbml0aW9uIGFyZSAq
aW50ZWdlciogdHlwZXMKPiB3aWRlIGVub3VnaCB0byBob2xkIGEgdmFsdWUgY29udmVydGVkIGZy
b20gYSB2b2lkIHBvaW50ZXIuIFdoaWxlICJ1bnNpZ25lZAo+IGxvbmciIHNlZW1zIHRvIHdvcmsg
Zm9yIExpbnV4LCB0aGUgZGVmaW5pdGlvbiBvZiB0aGF0IHR5cGUgZG9lc24ndCBwcm92aWRlIHRo
ZQo+IHNhbWUgZ3VhcmFudGVlLiBTaW5jZSB1aW50cHRyX3QgaXMgYW4gKmludGVnZXIqIHR5cGUg
YnkgZGVmaW5pdGlvbiAoYW5kIG5vdCBhCj4gcG9pbnRlciB0eXBlKSwgbXkgaW50ZXJwcmV0YXRp
b24gb2YgdGhlIEMgc3RhbmRhcmQgaXMgdGhhdAo+IHN1YnRyYWN0aW9uL2NvbXBhcmlzb24gb2Yg
dWludHB0cl90IHR5cGVzIHdvbid0IGJlIHN1YmplY3QgdG8gdGhlIHBvdGVudGlhbAo+ICJwb2lu
dGVyIHRvIG9iamVjdCIgaXNzdWVzIGluIHF1ZXN0aW9uLgo+IAo+IElmIEkgaGFkIHRvIGNob29z
ZSBiZXR3ZWVuICJ1aW50cHRyX3QiIG9yICJpbnRwdHJfdCIgSSBndWVzcyBJIHdvdWxkIGNob29z
ZQo+ICJ1aW50cHRyX3QiIHNpbmNlIHRoYXQgdHlwZSBpcyBhbHJlYWR5IHVzZWQgaW4gdmFyaW91
cyBwbGFjZXMgaW4gdGhlIFhlbgo+IGNvZGViYXNlLiBBbmQgdGhlIExpbnV4IHdvcmthcm91bmQg
aXMgYWxzbyB1c2luZyBhbiB1bnNpZ25lZCBpbnRlZ2VyIHR5cGUuCgpPbiBjaGFuZ2luZyB0eXBl
IG9mIF9zdGFydCAmIGZyaWVuZHM6IHdlIGNhbm5vdCBkZWNsYXJlIF9zdGFydCBhcwp1aW50cHRy
X3QsIHRoZSBsaW5rZXIgd29uJ3QgYmUgYWJsZSB0byBzZXQgdGhlIHZhbHVlLiBJdCBuZWVkcyB0
byBiZSBhbgphcnJheSB0eXBlLiBBdCB0aGF0IHBvaW50LCBpdCBpcyBiYXNpY2FsbHkgYSBwb2lu
dGVyLCBpdCBkb2Vzbid0IG1hdHRlcgppZiBpdCBpcyBhIGNoYXJbXSBvciB1aW50cHRyX3RbXS4g
SXQgd29uJ3QgaGVscC4KCkJ1dCwgaW5zdGVhZCBvZiBjb252ZXJ0aW5nIF9zdGFydCB0byB1bnNp
Z25lZCBsb25nIHZpYSBTWU1CT0xfSElERSwgd2UKY291bGQgY29udmVydCBpdCB0byB1aW50cHRy
X3QgaW5zdGVhZCwgaXQgd291bGQgYmUgYSB0cml2aWFsIGNoYW5nZSBvbgp0b3Agb2YgdGhlIGV4
aXN0aW5nIHVuc2lnbmVkIGxvbmcgc2VyaWVzLiBOb3Qgc3VyZSBpZiBpdCBpcyBiZW5lZmljaWFs
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
