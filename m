From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH 2/4] xen/arm: initialize access
Date: Mon, 15 Oct 2018 09:15:49 -0600
Message-ID: <CABfawhmtLksbC6pyp2SuH=sPR5E6mndwbMMpucBca3nUpDUbqQ@mail.gmail.com>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
 <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ghen=m3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gC4bc-00019B-7B
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 15:16:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id y11-v6so21780598wrd.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Oct 2018 08:16:26 -0700 (PDT)
In-Reply-To: <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
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

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMzo1NyBBTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW5pdGlhbGl6ZSB2YXJpYWJsZSAqYWNjZXNz
IGJlZm9yZSByZXR1cm5pbmcgaXQgYmFjayB0byB0aGUgY2FsbGVyLgo+Cj4gU2lnbmVkLW9mZi1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IC0tLQo+ICB4ZW4v
YXJjaC9hcm0vbWVtX2FjY2Vzcy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJj
aC9hcm0vbWVtX2FjY2Vzcy5jCj4gaW5kZXggYmE0ZWM3OC4uMTBhYjMwOCAxMDA2NDQKPiAtLS0g
YS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL21lbV9hY2Nl
c3MuYwo+IEBAIC00Nyw2ICs0Nyw3IEBAIHN0YXRpYyBpbnQgX19wMm1fZ2V0X21lbV9hY2Nlc3Mo
c3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLAo+ICAgICAgfTsKPgo+ICAgICAgQVNTRVJUKHAy
bV9pc19sb2NrZWQocDJtKSk7Cj4gKyAgICAqYWNjZXNzID0gWEVOTUVNX2FjY2Vzc19uOwoKIFdo
eSBYRU5NRU1fYWNjZXNzX24gYW5kIHdoeSBzZXQgdGhpcyBhdCBhbGwgaGVyZT8KClRhbWFzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
