From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH v3 10/10] xen/arm: Enable errata for
 secondary CPU on hotplug after the boot
Date: Thu, 10 May 2018 16:12:55 +0200
Message-ID: <CAKPH-NjPpBmOgEZr9C_DUzOkXtcQT24b3hC8xVFj0R=ns+HkfA@mail.gmail.com>
References: <20180427171258.28852-1-mirela.simonovic@aggios.com>
 <20180427171258.28852-11-mirela.simonovic@aggios.com>
 <ffc6351e-350c-b1c9-ea3e-fd4936701eb1@arm.com>
 <CAKPH-NiTLoOdYgpcWiM1qXHXaC=znAvMp0HHGQo-9mfegz2LcA@mail.gmail.com>
 <c713cc00-ace2-f528-563f-175657dccb12@arm.com>
 <CAKPH-NhUyxO1vOJnJPFayw71F5SfY87vWchoQybcH1e6Z4Mg2A@mail.gmail.com>
 <CAKPH-NhZhcvAdnZ_PyCUe3oSEokZnoBi8aPwfYbpPHioGgU9KA@mail.gmail.com>
 <eec66fbe-5faa-3213-182a-5de560a52d46@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <eec66fbe-5faa-3213-182a-5de560a52d46@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Xen Devel <xen-devel@lists.xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Davorin Mista <dm@aggios.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKT24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMzoyOSBQTSwgSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gSGksCj4KPiBPbiAwNS8xMC8yMDE4IDAy
OjI0IFBNLCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+Pgo+PiBPbiBUaHUsIE1heSAxMCwgMjAx
OCBhdCAxOjU3IFBNLCBNaXJlbGEgU2ltb25vdmljCj4+IDxtaXJlbGEuc2ltb25vdmljQGFnZ2lv
cy5jb20+IHdyb3RlOgo+Cj4KPj4gSSBoYXZlIHRlc3RlZCB0aGUgdHVuZWQgc2NlbmFyaW8gd2hl
cmUgZW5hYmxpbmcgY2FwYWJpbGl0aWVzIGZhaWxzIC0KPj4gdGhlIGVycm9uZW91cyBDUFUgaXMg
c3RvcHBlZC9wb3dlcmVkIGRvd24gYW5kIHRoZSBzeXN0ZW0gY29udGludWVzIHRvCj4+IHdvcmsg
ZmluZSB3aXRob3V0IGl0LiBBbHRob3VnaCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IGlu
ZGVlZCBJCj4+IG5lZWRlZCB0byBkZWJ1ZyB0aGlzIEknbGwgYWRkIHRoZSBmaXggaW4gdjQuCj4K
Pgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIGxhc3Qgc2VudGVuY2UuIFdoYXQgZGlkIHlvdSBt
ZWFuPwo+CgpJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgaG93IGNhbiB0aGlzIHNjZW5hcmlvIGhh
cHBlbiBwcmFjdGljYWxseSBhdApydW50aW1lIChhIHNjZW5hcmlvIHdpdGhvdXQgbWUgdHVuaW5n
IHRoZSBmYWlsdXJlIGZvciB0ZXN0aW5nKS4gTWVtb3J5CmFsbG9jYXRpb24gZmFpbHVyZSBzaG91
bGRuJ3QgYmUgcG9zc2libGUgYXQgdGhpcyBwb2ludCBhbmQgYW55Cndvcmthcm91bmQgcmVsYXRl
ZCBmYWlsdXJlIHdvdWxkIGhhdmUgaGFwcGVuZWQgYXQgYm9vdC4gSSBkb24ndCBzZWUKYW55dGhp
bmcgZWxzZSBvciBteSB1bmRlcnN0YW5kaW5nIG1heSBub3QgYmUgY29ycmVjdC4uLgpIb3dldmVy
LCBpZiBzb21lIG5ldyBjYXBhYmlsaXR5IHdvdWxkIGJlIGludHJvZHVjZWQgb25lIGRheSBhbmQg
aXQKY291bGQgZmFpbCwgaXQgd291bGQgYmUgZ29vZCBpZiB3ZSBkb24ndCBoYXZlIHRvIGdvIGJh
Y2sgYW5kIGZpeCB0aGlzCnBhdGNoLgpBdCB0aGUgZW5kLCBpdCBkb2Vzbid0IG1hdHRlciBzaW5j
ZSB0aGUgc3lzdGVtIHdpbGwgYmUgYWJsZSB0bwpwcm9wZXJseSBkZWFsIHdpdGggc3VjaCBhIHNj
ZW5hcmlvIHdpdGggdGhlIGZpeC4KClRoYW5rcywKTWlyZWxhCgo+IENoZWVycywKPgo+IC0tCj4g
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
