From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/4] xen/arm: initialize access
Date: Tue, 16 Oct 2018 09:14:19 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810160911160.4859@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
 <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
 <CABfawhmtLksbC6pyp2SuH=sPR5E6mndwbMMpucBca3nUpDUbqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pf7c=m4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gCDwH-0005lz-0b
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 01:14:25 +0000
In-Reply-To: <CABfawhmtLksbC6pyp2SuH=sPR5E6mndwbMMpucBca3nUpDUbqQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, stefanos@xilinx.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNSBPY3QgMjAxOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgT2N0
IDE1LCAyMDE4IGF0IDM6NTcgQU0gU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEluaXRpYWxpemUgdmFyaWFibGUgKmFjY2VzcyBiZWZv
cmUgcmV0dXJuaW5nIGl0IGJhY2sgdG8gdGhlIGNhbGxlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+ICB4
ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMg
Yi94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCj4gPiBpbmRleCBiYTRlYzc4Li4xMGFiMzA4IDEw
MDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYwo+ID4gKysrIGIveGVuL2Fy
Y2gvYXJtL21lbV9hY2Nlc3MuYwo+ID4gQEAgLTQ3LDYgKzQ3LDcgQEAgc3RhdGljIGludCBfX3Ay
bV9nZXRfbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCj4gPiAgICAgIH07
Cj4gPgo+ID4gICAgICBBU1NFUlQocDJtX2lzX2xvY2tlZChwMm0pKTsKPiA+ICsgICAgKmFjY2Vz
cyA9IFhFTk1FTV9hY2Nlc3NfbjsKPiAKPiAgV2h5IFhFTk1FTV9hY2Nlc3NfbiBhbmQgd2h5IHNl
dCB0aGlzIGF0IGFsbCBoZXJlPwoKSGkgVGFtYXMsCgpZZXMsIEkgbWlzc2VkIGFuIGV4cGxhbmF0
aW9uLiBJbml0aWFsaXppbmcgdmFyaWFibGVzIGJlZm9yZSBwYXNzaW5nIHRoZW0KYXMgcGFyYW1l
dGVyIG9yIGFzIGEgcmV0dXJuIHZhbHVlIHRvIGEgZnVuY3Rpb24gaXMgYSBzYWZldHkKY2VydGlm
aWNhdGlvbiByZXF1aXJlbWVudC4gQWxzbywgaXQgbWFrZXMgdGhlIGNvZGUgYSBiaXQgbmljZXIu
CgpJbiB0aGUgc3BlY2lmaWMgY2FzZSBvZiB0aGlzIGZ1bmN0aW9uLCAqYWNjZXNzIGlzIGluaXRp
YWxpemVkIGJlZm9yZQpyZXR1cm5pbmcgaW4gYWxsIGNhc2VzIGJ1dCB0aGUgcmV0dXJuIC1FU1JD
SCBjYXNlLiBJIHRob3VnaHQgdGhlIG5pY2VyCndheSB0byBtYWtlIHN1cmUgKmFjY2VzcyBpcyBh
bHdheXMgaW5pdGlhbGl6ZWQsIG1ha2luZyB0aGUgY29kZSBtb3JlCnJvYnVzdCwgd291bGQgYmUg
dG8gaW5pdGlhbGl6ZSAqYWNjZXNzIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGZ1bmN0aW9uCndp
dGggYSByZXN0cmljdGl2ZSB2YWx1ZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
