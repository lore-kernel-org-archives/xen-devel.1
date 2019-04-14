From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3 3/5] xen/arm: drivers: scif: Add support
 for SCIFA compatible UARTs
Date: Sun, 14 Apr 2019 17:57:33 +0100
Message-ID: <27ed97d0-b30b-6c7b-9308-6f69644fce03@arm.com>
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-4-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFiSF-0005nd-MQ
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:58:07 +0000
In-Reply-To: <1554718489-11318-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla2Fuc2RyLAoKT24gNC84LzE5IDExOjE0IEFNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9zY2lmLXVhcnQuYyBiL3hlbi9k
cml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMKPiBpbmRleCA5NThmNzE3Li45NGNiMjMwIDEwMDY0NAo+
IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvc2NpZi11YXJ0LmMKPiArKysgYi94ZW4vZHJpdmVycy9j
aGFyL3NjaWYtdWFydC5jCj4gQEAgLTEsNyArMSw3IEBACj4gICAvKgo+ICAgICogeGVuL2RyaXZl
cnMvY2hhci9zY2lmLXVhcnQuYwo+ICAgICoKPiAtICogRHJpdmVyIGZvciBTQ0lGIChTZXJpYWwg
Y29tbXVuaWNhdGlvbiBpbnRlcmZhY2Ugd2l0aCBGSUZPKQo+ICsgKiBEcml2ZXIgZm9yIFNDSUYo
QSkgKFNlcmlhbCBjb21tdW5pY2F0aW9uIGludGVyZmFjZSB3aXRoIEZJRk8gKEEpKQo+ICAgICog
Y29tcGF0aWJsZSBVQVJULgo+ICAgICoKPiAgICAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVr
c2FuZHIudHlzaGNoZW5rb0BnbG9iYWxsb2dpYy5jb20+Cj4gQEAgLTQ2LDYgKzQ2LDcgQEAgc3Rh
dGljIHN0cnVjdCBzY2lmX3VhcnQgewo+ICAgZW51bSBwb3J0X3R5cGVzCj4gICB7Cj4gICAgICAg
U0NJRl9QT1JULAo+ICsgICAgU0NJRkFfUE9SVCwKPiAgICAgICBOUl9QT1JUUywKPiAgIH07Cj4g
ICAKPiBAQCAtNzQsNiArNzUsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwb3J0X3BhcmFtcyBw
b3J0X3BhcmFtc1tOUl9QT1JUU10gPQo+ICAgICAgICAgICAuaXJxX2ZsYWdzICAgID0gU0NTQ1Jf
UklFIHwgU0NTQ1JfVElFIHwgU0NTQ1JfUkVJRSwKPiAgICAgICAgICAgLmZpZm9fc2l6ZSAgICA9
IDE2LAo+ICAgICAgIH0sCj4gKwo+ICsgICAgW1NDSUZBX1BPUlRdID0KPiArICAgIHsKPiArICAg
ICAgICAuc3RhdHVzX3JlZyAgID0gU0NJRkFfU0NBU1NSLAo+ICsgICAgICAgIC50eF9maWZvX3Jl
ZyAgPSBTQ0lGQV9TQ0FGVERSLAo+ICsgICAgICAgIC5yeF9maWZvX3JlZyAgPSBTQ0lGQV9TQ0FG
UkRSLAo+ICsgICAgICAgIC5vdmVycnVuX3JlZyAgPSBTQ0lGQV9TQ0FTU1IsCj4gKyAgICAgICAg
Lm92ZXJydW5fbWFzayA9IFNDQVNTUl9PUkVSLAoKQXMgbWVudGlvbmVkIGluIHBhdGNoICMyLCBv
dmVycnVuX21hc2sgd2lsbCBuZXZlciBiZSB1c2VkIGhlcmUuIENhbiB5b3UgCnBsZWFzZSBjb25m
aXJtIHdoZXRoZXIgdGhpcyBpcyBpbnRlbmRlZD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
