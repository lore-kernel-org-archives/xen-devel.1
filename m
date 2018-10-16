From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: initialize access
Date: Tue, 16 Oct 2018 09:24:36 -0600
Message-ID: <CABfawhng=F=kxn8OAx1Ns8_Lmb0rTxRPVuRToACueYkSPwzyUA@mail.gmail.com>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
 <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
 <CABfawhmtLksbC6pyp2SuH=sPR5E6mndwbMMpucBca3nUpDUbqQ@mail.gmail.com>
 <alpine.DEB.2.10.1810160911160.4859@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z/me=m4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gCRDh-0006Vh-1b
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 15:25:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id 206-v6so22887556wmb.5
 for <xen-devel@lists.xenproject.org>; Tue, 16 Oct 2018 08:25:15 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1810160911160.4859@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, stefanos@xilinx.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgNzoxNCBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCAxNSBPY3QgMjAxOCwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMzo1NyBBTSBTdGVm
YW5vIFN0YWJlbGxpbmkKPiA+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gSW5pdGlhbGl6ZSB2YXJpYWJsZSAqYWNjZXNzIGJlZm9yZSByZXR1cm5pbmcgaXQgYmFj
ayB0byB0aGUgY2FsbGVyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgeGVuL2FyY2gvYXJt
L21lbV9hY2Nlc3MuYyB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIGIveGVu
L2FyY2gvYXJtL21lbV9hY2Nlc3MuYwo+ID4gPiBpbmRleCBiYTRlYzc4Li4xMGFiMzA4IDEwMDY0
NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCj4gPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9tZW1fYWNjZXNzLmMKPiA+ID4gQEAgLTQ3LDYgKzQ3LDcgQEAgc3RhdGljIGludCBf
X3AybV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCj4gPiA+ICAg
ICAgfTsKPiA+ID4KPiA+ID4gICAgICBBU1NFUlQocDJtX2lzX2xvY2tlZChwMm0pKTsKPiA+ID4g
KyAgICAqYWNjZXNzID0gWEVOTUVNX2FjY2Vzc19uOwo+ID4KPiA+ICBXaHkgWEVOTUVNX2FjY2Vz
c19uIGFuZCB3aHkgc2V0IHRoaXMgYXQgYWxsIGhlcmU/Cj4KPiBIaSBUYW1hcywKPgo+IFllcywg
SSBtaXNzZWQgYW4gZXhwbGFuYXRpb24uIEluaXRpYWxpemluZyB2YXJpYWJsZXMgYmVmb3JlIHBh
c3NpbmcgdGhlbQo+IGFzIHBhcmFtZXRlciBvciBhcyBhIHJldHVybiB2YWx1ZSB0byBhIGZ1bmN0
aW9uIGlzIGEgc2FmZXR5Cj4gY2VydGlmaWNhdGlvbiByZXF1aXJlbWVudC4gQWxzbywgaXQgbWFr
ZXMgdGhlIGNvZGUgYSBiaXQgbmljZXIuCj4KPiBJbiB0aGUgc3BlY2lmaWMgY2FzZSBvZiB0aGlz
IGZ1bmN0aW9uLCAqYWNjZXNzIGlzIGluaXRpYWxpemVkIGJlZm9yZQo+IHJldHVybmluZyBpbiBh
bGwgY2FzZXMgYnV0IHRoZSByZXR1cm4gLUVTUkNIIGNhc2UuIEkgdGhvdWdodCB0aGUgbmljZXIK
PiB3YXkgdG8gbWFrZSBzdXJlICphY2Nlc3MgaXMgYWx3YXlzIGluaXRpYWxpemVkLCBtYWtpbmcg
dGhlIGNvZGUgbW9yZQo+IHJvYnVzdCwgd291bGQgYmUgdG8gaW5pdGlhbGl6ZSAqYWNjZXNzIGF0
IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGZ1bmN0aW9uCj4gd2l0aCBhIHJlc3RyaWN0aXZlIHZhbHVl
LgoKR290IGl0LCB0aGFua3MsIFBsZWFzZSB1c2UgcDJtLT5kZWZhdWx0X2FjY2VzcyBmb3IgdGhp
cyBpbnN0ZWFkIHRvIGJlCmNvbnNpc3RlbnQgd2l0aCBzaW1pbGFyIGNvZGUgYXQgb3RoZXIgc3Bv
dHMuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
