From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Fri, 26 Apr 2019 14:19:28 +0100
Message-ID: <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK0lI-0006yM-JM
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:19:32 +0000
In-Reply-To: <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNi8wNC8yMDE5IDEyOjU4LCBBbWl0IFRvbWVyIHdyb3RlOgo+IEhlbGxvLAoKSGksCgo+
IAo+PiBDb3VsZCB3ZSBpbnN0ZWFkIHRyeSB0byBhdXRvbWF0aWNhbGx5IGJsYWNrbGlzdCBhbnkg
ZGV2aWNlIHVzaW5nIFBQST8KPiAKPiBKdXN0IHRlc3RlZCBmb2xsb3dpbmcgY2hhbmdlOgo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKPiBpbmRleCBkOTgzNjc3Li4wYzgyOTc2IDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYwo+IEBAIC0xMjg5LDYgKzEyODksMTAgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX2Rl
dmljZShzdHJ1Y3QgZG9tYWluCj4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAo+ICAg
ICAgICAgICAgICAgcmV0dXJuIHJlczsKPiAgICAgICAgICAgfQo+IAo+ICsgICAgICAgIC8qIERv
bid0IHByb2Nlc3MgZGV2aWNlIHVzaW5nIFBQSSBzb3VyY2UgKi8KPiArICAgICAgICBpZiAoIHJl
cyA+IDE2ICYmIHJlcyA8IDMyKQo+ICsgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gICAgICAg
ICAgIHJlcyA9IG1hcF9pcnFfdG9fZG9tYWluKGQsIHJlcywgbmVlZF9tYXBwaW5nLCBkdF9ub2Rl
X25hbWUoZGV2KSk7Cj4gICAgICAgICAgIGlmICggcmVzICkKPiAgICAgICAgICAgICAgIHJldHVy
biByZXM7Cj4gCj4gV291bGQgaXQgYmUgT2sgPwoKV2VsbCwgdGhpcyBkb2VzIG5vdCB3b3JrIHBy
b3Blcmx5LiBUaGUgRFQgbm9kZSB3aWxsIHN0aWxsIGJlIHdyaXR0ZW4gaW4gdGhlIApkb21haW4g
YmVjYXVzZSBoYW5kbGVfZGV2aWNlKCkgcmV0dXJuIDAuIEhvd2V2ZXIsIHRoZSBkZXZpY2Ugd2ls
bCBiZSBoYWxmIG1hcHBlZCAKcmVzdWx0aW5nIHRvIGNyYXNoIGxhdGVyIG9uLgoKVGhlIHByb3Bl
ciB3YXkgaXMgdG8gZGV0ZWN0IFBQSSBiZWZvcmUgaGFuZCBhbmQgY29tcGxldGVseSBza2lwIHRo
ZSBub2RlIGlmIGFueS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
