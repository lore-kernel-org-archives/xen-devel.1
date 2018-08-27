From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/23] xen: is_hvm_{domain,
 vcpu} should evaluate to false when !CONFIG_HVM
Date: Mon, 27 Aug 2018 08:24:03 -0600
Message-ID: <5B84098302000078001E241E@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <dd4481dbc4e9fbfe0fcb3ab8a704e58e9d5f04ca.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jola=lk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuIR7-0008By-Ug
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 14:24:09 +0000
In-Reply-To: <dd4481dbc4e9fbfe0fcb3ab8a704e58e9d5f04ca.1535285866.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VHVybiB0aGVtIGludG8gc3RhdGljIGlubGluZSBmdW5jdGlvbnMgd2hpY2ggZXZhbHVhdGUgdG8g
ZmFsc2Ugd2hlbgo+IENPTkZJR19IVk0gaXMgbm90IHNldC4gQVJNIHdvbid0IGJlIGJyb2tlbiBi
ZWNhdXNlIEFSTSBndWVzdHMgYXJlIHNldAo+IHRvIFBWIHR5cGUgaW4gdGhlIGh5cGVydmlzb3Iu
Cj4gCj4gQnV0IEFSTSBoYXMgcGxhbiB0byBzd2l0Y2ggdG8gSFZNIGd1ZXN0IHR5cGUgaW5zaWRl
IHRoZSBoeXBlcnZpc29yLCBzbwo+IHByZWVtcHRpdmVseSBpbnRyb2R1Y2UgQ09ORklHX0hWTSBm
b3IgQVJNIGhlcmUuCgpCdXQgaXMgc2V0dGluZyB0aGlzIHRvIFkgdGhlbiBjb3JyZWN0IGF0IHRo
aXMgcG9pbnQ/Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKPiBAQCAtODc5LDggKzg3OSwxNyBAQCB2b2lkIHdhdGNoZG9nX2Rv
bWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpOwo+ICAKPiAgI2RlZmluZSBpc19wdl9kb21h
aW4oZCkgKChkKS0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX3B2KQo+ICAjZGVmaW5lIGlzX3B2
X3ZjcHUodikgICAoaXNfcHZfZG9tYWluKCh2KS0+ZG9tYWluKSkKPiAtI2RlZmluZSBpc19odm1f
ZG9tYWluKGQpICgoZCktPmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9odm0pCj4gLSNkZWZpbmUg
aXNfaHZtX3ZjcHUodikgICAoaXNfaHZtX2RvbWFpbih2LT5kb21haW4pKQo+ICsKPiArc3RhdGlj
IGlubGluZSBib29sIGlzX2h2bV9kb21haW4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPiArewo+
ICsgICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyBkLT5ndWVzdF90eXBlID09IGd1
ZXN0X3R5cGVfaHZtIDogZmFsc2U7CgpVbHRpbWF0ZWx5IEkgdGhpbmsgdGhlIGd1ZXN0X3R5cGVf
e2h2bSxwdn0gZW51bWVyYXRvcnMgc2hvdWxkIG9ubHkKYmUgZW5hYmxlZCB3aGVuIENPTkZJR197
SFZNLFBWfSwgc28gSSB0aGluayAjaWZkZWYgQ09ORklHX0hWTQp3b3VsZCBiZSB0aGUgYmV0dGVy
IGNob2ljZSBoZXJlLiBCdXQgb2YgY291cnNlIHdlIGNhbiBkbyB0aGlzIGZ1cnRoZXIKY29udmVy
c2lvbiBhdCBhIGxhdGVyIHBvaW50LCBzbwpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
