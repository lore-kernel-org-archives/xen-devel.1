From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] libxc/arm: initialise p2m_size to make gcc
	happy
Date: Wed, 14 Mar 2018 13:27:37 +0000
Message-ID: <37798a67-72b4-901c-ba17-e76fc1d2da65@arm.com>
References: <20180314123203.30646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ty01=ge=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ew6RT-0006Df-Hd
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 13:27:43 +0000
In-Reply-To: <20180314123203.30646-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8xNC8yMDE4IDEyOjMyIFBNLCBXZWkgTGl1IHdyb3RlOgo+IEdjYyB3aXRoIC1P
MyBmYWlsZWQgdG8gc3BvdCB0aGUgbG9vcCB0byBpbml0aWFsaXNlIHAybV9zaXplIHJ1bnMgYXQK
PiBsZWFzdCBvbmNlLgoKQXNpZGUsIEFuZHJldydzIGNvbW1lbnQgdGhlIHBhdGNoIGxvb2tzIG9r
YXkuIEJ1dCBJIGFtIHdvbmRlcmluZyB3aHkgd2UgCm5lZWQgdG8gYWxsb2NhdGUgcDJtX2hvc3Qg
Zm9yIEFybT8KCiBGcm9tIGEgcXVpY2sgbG9vayBJIGhhdmUgc2VlbiBubyByZWFsIHVzZXIgZXhj
ZXB0IAp4Y19kb21fdXBkYXRlX2d1ZXN0X3AybSB0aGF0IGNhbiBjb3BlIHdpdGggcDJtX2hvc3Qg
PSBOVUxMLgoKQ2hlZXJzLAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+IC0tLQo+ICAgdG9vbHMvbGlieGMveGNfZG9tX2FybS5jIHwgMyArKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2FybS5jIGIvdG9vbHMvbGlieGMveGNfZG9tX2Fy
bS5jCj4gaW5kZXggNWI5ZWNhNjA4Ny4uOTdkMDhmMDU1YSAxMDA2NDQKPiAtLS0gYS90b29scy9s
aWJ4Yy94Y19kb21fYXJtLmMKPiArKysgYi90b29scy9saWJ4Yy94Y19kb21fYXJtLmMKPiBAQCAt
Mzk1LDcgKzM5NSw3IEBAIHN0YXRpYyBpbnQgbWVtaW5pdChzdHJ1Y3QgeGNfZG9tX2ltYWdlICpk
b20pCj4gICAgICAgY29uc3QgdWludDY0X3QgbW9kc2l6ZSA9IGR0Yl9zaXplICsgcmFtZGlza19z
aXplOwo+ICAgICAgIGNvbnN0IHVpbnQ2NF90IHJhbTEyOG1iID0gYmFua2Jhc2VbMF0gKyAoMTI4
PDwyMCk7Cj4gICAKPiAtICAgIHhlbl9wZm5fdCBwMm1fc2l6ZTsKPiArICAgIHhlbl9wZm5fdCBw
Mm1fc2l6ZSA9IDA7IC8qIG1ha2UgZ2NjIC1PMyBoYXBweSAqLwo+ICAgICAgIHVpbnQ2NF90IGJh
bmswZW5kOwo+ICAgCj4gICAgICAgYXNzZXJ0KGRvbS0+cmFtYmFzZV9wZm4gPDwgWENfUEFHRV9T
SElGVCA9PSBiYW5rYmFzZVswXSk7Cj4gQEAgLTQzOCw2ICs0MzgsNyBAQCBzdGF0aWMgaW50IG1l
bWluaXQoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+ICAgCj4gICAgICAgYXNzZXJ0KGRvbS0+
cmFtYmFua19zaXplWzBdICE9IDApOwo+ICAgICAgIGFzc2VydChyYW1zaXplID09IDApOyAvKiBU
b28gbXVjaCBSQU0gaXMgcmVqZWN0ZWQgYWJvdmUgKi8KPiArICAgIGFzc2VydChwMm1fc2l6ZSAh
PSAwKTsKPiAgIAo+ICAgICAgIGRvbS0+cDJtX3NpemUgPSBwMm1fc2l6ZTsKPiAgICAgICBkb20t
PnAybV9ob3N0ID0geGNfZG9tX21hbGxvYyhkb20sIHNpemVvZih4ZW5fcGZuX3QpICogcDJtX3Np
emUpOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
