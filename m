From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [Minios-devel] [PATCH RFC 10/16] Save/Restore
 Support: Add suspend/resume support for timers
Date: Wed, 20 Dec 2017 01:26:51 +0100
Message-ID: <20171220002651.o2dfhatigpw6i2vh@var.youpi.perso.aquilenet.fr>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
 <1513726931-7516-11-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=drp2=dq=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1eRSDo-0002EX-0L
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 00:26:56 +0000
Content-Disposition: inline
In-Reply-To: <1513726931-7516-11-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jgross@suse.com
List-Id: xen-devel@lists.xenproject.org

QnJ1bm8gQWx2aXNpbywgb24gbWFyLiAxOSBkw6ljLiAyMDE3IDE1OjQyOjA1IC0wODAwLCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBCcnVubyBBbHZpc2lvIDxicnVuby5hbHZpc2lvQGdtYWlsLmNv
bT4KCj4gK3ZvaWQgcmVzdW1lX3RpbWUodm9pZCkKPiArewo+ICsgICAgcG9ydCA9IGJpbmRfdmly
cShWSVJRX1RJTUVSLCAmdGltZXJfaGFuZGxlciwgTlVMTCk7Cj4gKyAgICB1bm1hc2tfZXZ0Y2hu
KHBvcnQpOwo+ICt9CgpJJ2Qgc2F5IHJhdGhlciBmYWN0b3JpemUgaXQgd2l0aCBpbml0X3RpbWUu
Cih5b3UgY291bGQgZXZlbiBqdXN0IHJlbW92ZSB0aGUgcHJpbnRmIHRoZXJlIHRvIGF2b2lkIGhh
dmluZyB0byB3cml0ZQp5ZXQgYW5vdGhlciBmdW5jdGlvbikKCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdGltZS5oIGIvaW5jbHVkZS90aW1lLmgKPiBpbmRleCA1ZDZlZDY3Li4yZTA2ZDU4IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvdGltZS5oCj4gKysrIGIvaW5jbHVkZS90aW1lLmgKPiBAQCAtNTUs
NiArNTUsOCBAQCB0eXBlZGVmIGxvbmcgc3VzZWNvbmRzX3Q7Cj4gIC8qIHByb3RvdHlwZXMgKi8K
PiAgdm9pZCAgICAgaW5pdF90aW1lKHZvaWQpOwo+ICB2b2lkICAgICBmaW5pX3RpbWUodm9pZCk7
Cj4gK3ZvaWQgICAgIHN1c3BlbmRfdGltZSh2b2lkKTsKPiArdm9pZCAgICAgcmVzdW1lX3RpbWUo
dm9pZCk7Cj4gIHNfdGltZV90IGdldF9zX3RpbWUodm9pZCk7Cj4gIHNfdGltZV90IGdldF92X3Rp
bWUodm9pZCk7Cj4gIHVpbnQ2NF90IG1vbm90b25pY19jbG9jayh2b2lkKTsKPiBkaWZmIC0tZ2l0
IGEva2VybmVsLmMgYi9rZXJuZWwuYwo+IGluZGV4IDc4MmViNzkuLmExNmIxYmEgMTAwNjQ0Cj4g
LS0tIGEva2VybmVsLmMKPiArKysgYi9rZXJuZWwuYwo+IEBAIC0xMjAsMTAgKzEyMCwxNCBAQCB2
b2lkIHN0YXJ0X2tlcm5lbCh2b2lkKiBwYXIpCj4gIHZvaWQgcHJlX3N1c3BlbmQodm9pZCkKPiAg
ewo+ICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiArCj4gKyAgICBzdXNwZW5kX3RpbWUoKTsK
PiAgfQo+ICAKPiAgdm9pZCBwb3N0X3N1c3BlbmQoaW50IGNhbmNlbGVkKQo+ICB7Cj4gKyAgICBy
ZXN1bWVfdGltZSgpOwo+ICsKPiAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsKPiAgfQo+ICAKPiAt
LSAKPiAyLjMuMiAoQXBwbGUgR2l0LTU1KQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gTWluaW9zLWRldmVsIG1haWxpbmcgbGlzdAo+IE1p
bmlvcy1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9taW5pb3MtZGV2ZWwKCi0tIApTYW11ZWwKPHk+IMOnYSBn
YXplID8KPGw+IHByb3V0CiAtKy0gI2Vucy1taW0gLSBvdXZyZXogbGVzIGZlbsOqdHJlcyAhIC0r
LQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
