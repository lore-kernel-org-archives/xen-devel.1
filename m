From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 1/6] Port WARN_ON_ONCE() from Linux
Date: Thu, 24 May 2018 14:23:56 -0600
Message-ID: <aee35e24-cf78-5f33-c13d-f10715e899f4@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-2-sameer.goel@linaro.org>
 <5B066F7302000078001C56BB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=merd=il=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fLwmH-0005MY-OO
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 20:24:01 +0000
Received: by mail-pf0-x241.google.com with SMTP id a14-v6so1437478pfi.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 13:23:59 -0700 (PDT)
In-Reply-To: <5B066F7302000078001C56BB@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Manish Jaggi <mjaggi@caviumnetworks.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8yNC8yMDE4IDAxOjUzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNC4w
NS4xOCBhdCAwMjo0NiwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+IHdyb3RlOgo+PiBQb3J0IFdB
Uk5fT05fT05DRSBtYWNybyBmcm9tIExpbnV4Lgo+IEluIHN1Y2ggYSBjYXNlIHlvdSBzaG91bGQg
anVzdGlmeSBhZGp1c3RtZW50cyB5b3UndmUgbWFkZToKSSBjYW4gYWRkIG1vcmUgZGV0YWlscywg
YnV0IGhhdmUgbW9zdGx5IGp1c3QgY2hhbmdlZCB2YXJpYWJsZSBuYW1lcy4gVGhlIAptYWNybyBp
cyBzZWxmIGV4cGxhbmF0b3J5LgoKU2hvdWxkIEkganVzdCBjaGFuZ2UgdGhpcyB0bzogIkRlZmlu
ZSBXQVJOX09OX09OQ0UgbWFjcm8gdG8gbWlycm9yIExJbnV4IApmdW5jdGlvbmFsaXR5Igo+Cj4+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGli
LmgKPj4gQEAgLTExLDYgKzExLDE5IEBACj4+ICAgI2RlZmluZSBCVUdfT04ocCkgIGRvIHsgaWYg
KHVubGlrZWx5KHApKSBCVUcoKTsgIH0gd2hpbGUgKDApCj4+ICAgI2RlZmluZSBXQVJOX09OKHAp
IGRvIHsgaWYgKHVubGlrZWx5KHApKSBXQVJOKCk7IH0gd2hpbGUgKDApCj4+ICAgCj4+ICsjZGVm
aW5lIFdBUk5fT05fT05DRShwKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICso
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
ICsgICAgc3RhdGljIGJvb2wgX19zZWN0aW9uKCIuZGF0YS51bmxpa2VseSIpIHdhcm5lZDsgICBc
Cj4gTGludXggdXNlcyAuZGF0YS5vbmNlLiBUaGF0IG9yIC5kYXRhLmNvbGQgd291bGQgc2VlbSBi
ZXR0ZXIgdG8gbWUgdGhhbgo+IC5kYXRhLnVubGlrZWx5LgpJIGd1ZXNzIHRoZXJlIGlzIG5vdCBy
ZWFzb24gdG8ga2VlcCB0aGlzIGluIGEgc3BlY2lmaWMgc2VjdGlvbi4gSSdsbCAKanVzdCBnbyBh
aGVhZCBhbmQgcmVtb3ZlIHRoZSBzZWN0aW9uIGhlcmU/Cgo+Cj4gSmFuCj4KPgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
