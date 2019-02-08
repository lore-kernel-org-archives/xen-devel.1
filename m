From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2] x86/shadow: adjust minimum allocation
 calculations
Date: Fri, 8 Feb 2019 13:31:49 +0000
Message-ID: <CAFLBxZaNnOMzOK5QfzsLDWXyNKCo92wTW5uJb1tw0Vpzvocoig@mail.gmail.com>
References: <5C5ABD7102000078002143B1@prv1-mh.provo.novell.com>
 <5C5C196C020000780021495E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2PAf=QP=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1gs6GA-0005BP-DK
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 13:32:02 +0000
Received: by mail-qt1-x841.google.com with SMTP id j36so3839029qta.7
 for <xen-devel@lists.xenproject.org>; Fri, 08 Feb 2019 05:32:01 -0800 (PST)
In-Reply-To: <5C5C196C020000780021495E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgNywgMjAxOSBhdCAxMTo0MiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gQSBwcmV2aW91c2x5IGJhZCBzaXR1YXRpb24gaGFzIGJlY29tZSB3
b3JzZSB3aXRoIHRoZSBlYXJseSBzZXR0aW5nIG9mCj4gLT5tYXhfdmNwdXM6IFRoZSB2YWx1ZSBy
ZXR1cm5lZCBieSBzaGFkb3dfbWluX2FjY2VwdGFibGVfcGFnZXMoKSBoYXMKPiBmdXJ0aGVyIGdy
b3duLCBhbmQgaGVuY2Ugbm93IGhvbGRzIGJhY2sgZXZlbiBtb3JlIG1lbW9yeSBmcm9tIHVzZSBm
b3IKPiB0aGUgcDJtLgo+Cj4gTWFrZSBzaF9taW5fYWxsb2NhdGlvbigpIGFjY291bnQgZm9yIGFs
bCBwMm0gbWVtb3J5IG5lZWRlZCBmb3IKPiBzaGFkb3dfZW5hYmxlKCkgdG8gc3VjY2VlZCBkdXJp
bmcgZG9tYWluIGNyZWF0aW9uIChhdCB3aGljaCBwb2ludCB0aGUKPiBkb21haW4gaGFzIG5vIG1l
bW9yeSBhdCBhbGwgYWxsb2NhdGVkIHRvIGl0IHlldCwgYW5kIGhlbmNlIHVzZSBvZgo+IGQtPnRv
dF9wYWdlcyBpcyBtZWFuaW5nbGVzcykuCj4KPiBBbHNvIG1ha2Ugc2hhZG93X21pbl9hY2NlcHRh
YmxlX3BhZ2VzKCkgbm8gbG9uZ2VyIG5lZWRsZXNzbHkgYWRkIDEgdG8KPiB0aGUgdkNQVSBjb3Vu
dC4KPgo+IEZpbmFsbHkgbWFrZSB0aGUgZGVidWdnaW5nIHByaW50aygpIGluIHNoYWRvd19hbGxv
Y19wMm1fcGFnZSgpIGEgbGl0dGxlCj4gbW9yZSB1c2VmdWwgYnkgbG9nZ2luZyBzb21lIG9mIHRo
ZSByZWxldmFudCBkb21haW4gc2V0dGluZ3MuCj4KPiBSZXBvcnRlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiB2MjogRHJvcCBjcHVfaGFzX3ZteCBkZXBlbmRlbmN5
ICh0byBjb3ZlciBmdXR1cmUgU1ZNIGNvZGUgYXMgd2VsbCkuCj4gLS0tCj4gVEJEOiBUaGUgcXVl
c3Rpb24gb2YgY291cnNlIGlzIHdoZXRoZXIgc3VjaCBhbiAiZXhhY3QiIGNhbGN1bGF0aW9uIGlz
bid0Cj4gICAgICBhIGxpdHRsZSByaXNreSBnb2luZyBmb3J3YXJkLCB0aGUgbW9yZSB0aGF0IHRo
ZSByZWdyZXNzaW9uIGhlcmUKPiAgICAgIHdhc24ndCBmb3VuZCBieSBvc3N0ZXN0LCBiZWNhdXNl
IGRvbWFpbnMgd2l0aCBzdWZmaWNpZW50bHkgZmV3Cj4gICAgICB2Q1BVLXMgd2VyZW4ndCBhZmZl
Y3RlZCwgZHVlIHRvIHRoZSA0TWIgbWluaW11bSBhbGxvY2F0aW9uIGVuZm9yY2VkCj4gICAgICBi
eSBzaGFkb3dfZW5hYmxlKCkncyBjYWxsIHRvIHNoYWRvd19zZXRfYWxsb2NhdGlvbigpLiBJIHdv
dWxkLAo+ICAgICAgaG93ZXZlciwgcXVlc3Rpb24gdGhpcyBlbmZvcmNlbWVudCBvZiBhIHN0YXRp
YyBtaW5pbXVtIGFzIHdlbGwgLQo+ICAgICAgc2hhZG93X29uZV9iaXRfZW5hYmxlKCkgZG9lc24n
dCBkbyBzbywgZm9yIGV4YW1wbGUuCgpUaGlzIHdob2xlIHRoaW5nIGNvdWxkIHVzZSBzb21lIHJh
dGlvbmFsaXphdGlvbjsgYnV0IHRoaXMgd2lsbCBkbyBmb3IKbm93IEkgdGhpbms6CgpBY2tlZC1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
