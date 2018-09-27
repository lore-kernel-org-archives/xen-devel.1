From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen PV: Sample new PV driver for buffer sharing
 between domains
Date: Thu, 27 Sep 2018 11:34:50 +0100
Message-ID: <fc7ffa62-8cfa-d225-f6c8-026886ade036@arm.com>
References: <CAC4nxbvWUpWQcUATQswoaVJfSq8EU7CH6-Jx1VwVGYVeOc0tZw@mail.gmail.com>
 <B9D01323-5CE0-4CAE-9A7C-2B1CE482A833@xenproject.org>
 <aebd40b7-e7d2-c861-b658-863b2c8f2079@gmail.com>
 <f688cda0-a342-0b66-fb5c-56238d941f9c@suse.com>
 <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f8ae32f3-8399-24d3-fe1e-45d4c1669e1b@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Omkar Bolla <omkar.bolla@pathpartnertech.com>
Cc: xen-devel@lists.xensource.com, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwOS8yNy8yMDE4IDExOjIwIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToKPiBPbiAwOS8yNy8yMDE4IDAxOjE2IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAy
Ny8wOS8yMDE4IDEyOjA3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEhpLAo+
Pj4gT24gMDkvMjcvMjAxOCAxMjozOSBQTSwgTGFycyBLdXJ0aCB3cm90ZToKPj4+PiBBZGRpbmcg
YSBmZXcgcGVvcGxlIHdobyBoYXZlIHJlY2VudGx5IGJlZW4gd29ya2luZyBvbiBQViBkcml2ZXJz
LCBhcwo+Pj4+IHdlbGwgYXMgSnVsaWVuCj4+Pj4gTGFycwo+Pj4+Cj4+Pj4+IE9uIDI3IFNlcCAy
MDE4LCBhdCAwNjo0NCwgT21rYXIgQm9sbGEKPj4+Pj4gPG9ta2FyLmJvbGxhQHBhdGhwYXJ0bmVy
dGVjaC5jb20KPj4+Pj4gPG1haWx0bzpvbWthci5ib2xsYUBwYXRocGFydG5lcnRlY2guY29tPj4g
d3JvdGU6Cj4+Pj4+Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+PiBJIGFtIHVzaW5nIERlYmlhbiBhcyBE
b21haW4tMCBhbmQgRGViaWFuIGFzIERvbWFpbi1VIG9uIEhpa2V5OTYwCj4+Pj4+IHBsYXRmb3Jt
KEFSTXY4KSBhbmQgdXNpbmcgWGVuLTQuOCBzdGFibGUgcmVsZWFzZS4gSGVyZSBJIHdhbnQgdG8K
Pj4+Pj4gY3JlYXRlIGEgUFYgZnJvbnRlbmQgYW5kIGJhY2tlbmQgdG8gc2hhcmUgbWVtb3J5IGJl
dHdlZW4gRG9tYWluLTAgYW5kCj4+Pj4+IERvbWFpbi1VLgoKRG8geW91IG5lZWQgdG8gc2hhcmUg
dGhlIGJ1ZmZlciBkeW5hbWljYWxseT8gSWYgbm90LCB5b3UgbWF5IHdhbnQgdG8gCmhhdmUgYSBs
b29rIGF0ICJBbGxvdyBzZXR0aW5nIHVwIHNoYXJlZCBtZW1vcnkgYXJlYXMgYmV0d2VlbiBWTXMg
ZnJvbSB4bCAKY29uZmlnIGZpbGVzIiBbMl0uIFdlIGFpbSB0byBtZXJnZSBpdCBpbiB0aGUgbmV4
dCBYZW4gcmVsZWFzZS4KCkNoZWVycywKClsyXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wOC9tc2cwMDg4My5odG1sCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
