From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] dataplane/xen-block:
 remove dead code
Date: Fri, 15 Feb 2019 21:38:59 +0100
Message-ID: <9c6c6f2e-cac0-9e75-d5e2-baf613aad6b7__9670.0865122088$1550263204$gmane$org@redhat.com>
References: <20190215162533.19475-1-paul.durrant@citrix.com>
 <20190215162533.19475-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ip31=QW=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1gukGF-0004vB-TN
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 20:39:03 +0000
Received: by mail-wr1-f65.google.com with SMTP id w17so11630623wrn.12
 for <xen-devel@lists.xenproject.org>; Fri, 15 Feb 2019 12:39:02 -0800 (PST)
In-Reply-To: <20190215162533.19475-2-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org, xen-devel@lists.xenproject.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xNS8xOSA1OjI1IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gVGhlIGlmKCkgc3RhdGVt
ZW50IGlzIGNsZWFybHkgYm9ndXMgKGRlYWQgY29kZSB3aGljaCBzaG91bGQgaGF2ZSBiZWVuCj4g
Y2xlYW5lZCB1cCB3aGVuIGdyYW50IG1hcHBpbmcgd2FzIHJlbW92ZWQpLgoKIi4uLiB3YXMgcmVt
b3ZlZCBpbiAwNjQ1NGMyNGFkKS4iCgo+IAo+IFNwb3R0ZWQgYnkgQ292ZXJpdHk6IENJRCAxMzk4
NjM1Cj4gCj4gV2hpbGUgaW4gdGhlIG5laWdoYm91cmhvb2QsIGFkZCBhIG1pc3NpbmcgJ2ZhbGwg
dGhyb3VnaCcgYW5ub3RhdGlvbi4KPiAKPiBSZXBvcnRlZC1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgo+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
PiBDYzogS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4KPiBDYzogTWF4IFJlaXR6IDxtcmVp
dHpAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jIHwg
NSArLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2h3L2Jsb2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suYyBiL2h3L2Js
b2NrL2RhdGFwbGFuZS94ZW4tYmxvY2suYwo+IGluZGV4IGM2YTE1ZGEwMjQuLmYxNTIzYzViNDUg
MTAwNjQ0Cj4gLS0tIGEvaHcvYmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jCj4gKysrIGIvaHcv
YmxvY2svZGF0YXBsYW5lL3hlbi1ibG9jay5jCj4gQEAgLTI4MSwxMCArMjgxLDYgQEAgc3RhdGlj
IHZvaWQgeGVuX2Jsb2NrX2NvbXBsZXRlX2Fpbyh2b2lkICpvcGFxdWUsIGludCByZXQpCj4gICAg
ICAgICAgYnJlYWs7Cj4gICAgICBjYXNlIEJMS0lGX09QX1dSSVRFOgo+ICAgICAgY2FzZSBCTEtJ
Rl9PUF9GTFVTSF9ESVNLQ0FDSEU6Cj4gLSAgICAgICAgaWYgKCFyZXF1ZXN0LT5yZXEubnJfc2Vn
bWVudHMpIHsKPiAtICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICAgfQo+IC0gICAgICAgIGJy
ZWFrOwo+ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICBicmVhazsKPiAgICAgIH0KPiBAQCAtMjk4
LDYgKzI5NCw3IEBAIHN0YXRpYyB2b2lkIHhlbl9ibG9ja19jb21wbGV0ZV9haW8odm9pZCAqb3Bh
cXVlLCBpbnQgcmV0KQo+ICAgICAgICAgIGlmICghcmVxdWVzdC0+cmVxLm5yX3NlZ21lbnRzKSB7
Cj4gICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgIH0KPiArICAgICAgICAvKiBmYWxsIHRo
cm91Z2ggKi8KPiAgICAgIGNhc2UgQkxLSUZfT1BfUkVBRDoKPiAgICAgICAgICBpZiAocmVxdWVz
dC0+c3RhdHVzID09IEJMS0lGX1JTUF9PS0FZKSB7Cj4gICAgICAgICAgICAgIGJsb2NrX2FjY3Rf
ZG9uZShibGtfZ2V0X3N0YXRzKGRhdGFwbGFuZS0+YmxrKSwgJnJlcXVlc3QtPmFjY3QpOwo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
