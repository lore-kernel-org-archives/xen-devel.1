From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [Minios-devel] [PATCH RFC 12/16] Save/Restore
 Support: Add support for suspend/restore events.
Date: Wed, 20 Dec 2017 01:37:32 +0100
Message-ID: <20171220003732.pzslph3lubsk5m5a@var.youpi.perso.aquilenet.fr>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
 <1513726931-7516-13-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=drp2=dq=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1eRSO8-000348-IC
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 00:37:36 +0000
Content-Disposition: inline
In-Reply-To: <1513726931-7516-13-git-send-email-bruno.alvisio@gmail.com>
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

QnJ1bm8gQWx2aXNpbywgb24gbWFyLiAxOSBkw6ljLiAyMDE3IDE1OjQyOjA3IC0wODAwLCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBCcnVubyBBbHZpc2lvIDxicnVuby5hbHZpc2lvQGdtYWlsLmNv
bT4KClJldmlld2VkLWJ5OiBTYW11ZWwgVGhpYmF1bHQgPHNhbXVlbC50aGliYXVsdEBlbnMtbHlv
bi5vcmc+Cgo+IC0tLQo+ICBldmVudHMuYyAgICAgICAgIHwgNSArKysrKwo+ICBpbmNsdWRlL2V2
ZW50cy5oIHwgMSArCj4gIGtlcm5lbC5jICAgICAgICAgfCAyICsrCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2V2ZW50cy5jIGIvZXZlbnRzLmMK
PiBpbmRleCBlOGVmOGFhLi4zNDJhZWFkIDEwMDY0NAo+IC0tLSBhL2V2ZW50cy5jCj4gKysrIGIv
ZXZlbnRzLmMKPiBAQCAtMTgzLDYgKzE4MywxMSBAQCB2b2lkIGZpbmlfZXZlbnRzKHZvaWQpCj4g
ICAgICBhcmNoX2ZpbmlfZXZlbnRzKCk7Cj4gIH0KPiAgCj4gK3ZvaWQgc3VzcGVuZF9ldmVudHMo
dm9pZCkKPiArewo+ICsgICAgdW5iaW5kX2FsbF9wb3J0cygpOwo+ICt9Cj4gKwo+ICB2b2lkIGRl
ZmF1bHRfaGFuZGxlcihldnRjaG5fcG9ydF90IHBvcnQsIHN0cnVjdCBwdF9yZWdzICpyZWdzLCB2
b2lkICppZ25vcmUpCj4gIHsKPiAgICAgIHByaW50aygiW1BvcnQgJWRdIC0gZXZlbnQgcmVjZWl2
ZWRcbiIsIHBvcnQpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2V2ZW50cy5oIGIvaW5jbHVkZS9l
dmVudHMuaAo+IGluZGV4IDg5YjU5OTcuLjcwNWFkOTMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9l
dmVudHMuaAo+ICsrKyBiL2luY2x1ZGUvZXZlbnRzLmgKPiBAQCAtNTUsNSArNTUsNiBAQCBzdGF0
aWMgaW5saW5lIGludCBub3RpZnlfcmVtb3RlX3ZpYV9ldnRjaG4oZXZ0Y2huX3BvcnRfdCBwb3J0
KQo+ICB9Cj4gIAo+ICB2b2lkIGZpbmlfZXZlbnRzKHZvaWQpOwo+ICt2b2lkIHN1c3BlbmRfZXZl
bnRzKHZvaWQpOwo+ICAKPiAgI2VuZGlmIC8qIF9FVkVOVFNfSF8gKi8KPiBkaWZmIC0tZ2l0IGEv
a2VybmVsLmMgYi9rZXJuZWwuYwo+IGluZGV4IGZkMWM0YzUuLmM2ZmY5ZjMgMTAwNjQ0Cj4gLS0t
IGEva2VybmVsLmMKPiArKysgYi9rZXJuZWwuYwo+IEBAIC0xMjQsNiArMTI0LDggQEAgdm9pZCBw
cmVfc3VzcGVuZCh2b2lkKQo+ICAgICAgc3VzcGVuZF90aW1lKCk7Cj4gIAo+ICAgICAgc3VzcGVu
ZF9jb25zb2xlKCk7Cj4gKwo+ICsgICAgc3VzcGVuZF9ldmVudHMoKTsKPiAgfQo+ICAKPiAgdm9p
ZCBwb3N0X3N1c3BlbmQoaW50IGNhbmNlbGVkKQo+IC0tIAo+IDIuMy4yIChBcHBsZSBHaXQtNTUp
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBNaW5pb3MtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTWluaW9zLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL21p
bmlvcy1kZXZlbAoKLS0gClNhbXVlbApYLUZhdm9yaXQtQ2FydG9vbjogQ2FsdmluIGFuZCBIb2Ji
ZXMKIC0rLSBNYWlsIGhlYWRlciBvZiBXaW0gdmFuIERvcnN0IC0rLQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
