From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC v2 00/16] Old GIC (gic-vgic) optimizations for
 GICV2
Date: Mon, 21 Jan 2019 17:48:49 +0000
Message-ID: <e30906ba-d82f-b460-715b-768a73bab0a2@arm.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
 <96cd2f23-282d-0773-7efe-62c9d25a83d2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rLzG=P5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gldgr-0004Y7-Nw
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 17:48:53 +0000
In-Reply-To: <96cd2f23-282d-0773-7efe-62c9d25a83d2@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMi8wMS8yMDE5IDE4OjMzLCBBbmRyw6kgUHJ6eXdhcmEgd3JvdGU6Cj4gT24gMjYv
MTIvMjAxOCAxMToyMCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBUaGVuIEkgbG9va2VkIGF0IHRo
ZSBJUlEgaGFuZGxlciBhbmQgc3R1bWJsZWQgdXBvbiB0aGUgZnVuY3Rpb24gcG9pbnRlcnMKPiB3
ZSBhcmUgdXNpbmcuIEkgd2FzIGV5ZWluZyB0aGVtIGJlZm9yZSwgYmVjYXVzZSBteSBodW5jaCBp
cyB0aGV5IGFyZQo+IGNvc3RseSwgZXNwZWNpYWxseSBvbiBiaWcgY29yZXMsIGFzIGl0IG1pZ2h0
IGJlIGhhcmQgZm9yIHRoZSBDUFUgdG8KPiBzcGVjdWxhdGUgY29ycmVjdGx5LiBCYXNpY2FsbHkg
c29tZXRoaW5nIGxpa2UgYSBjYWxsIHRvCj4gZ2ljX2h3X29wcy0+Z2ljX3JlYWRfaXJxKCkgdHJh
bnNsYXRlcyBpbnRvOgo+IAlsZHIgICAgIHgwLCBbeDIwXQo+IAlsZHIgICAgIHgwLCBbeDAsICM3
Ml0KPiAJYmxyICAgICB4MAo+IFRoYXQgY29udGFpbnMgdHdvIGRlcGVuZGVuY3kgb24gbG9hZHMu
IElmIG9uZSBvZiB0aGVtIG1pc3NlcyBpbiB0aGUKPiBjYWNoZSwgdGhlIHdob2xlIHBpcGVsaW5l
IGlzIHN0YWxsZWQsIGlmIHRoZSBDUFUgZG9lc24ndCBzcGVjdWxhdGUgYm90aAo+IGxvYWRzIGNv
cnJlY3RseSAod2hpY2ggaXQgbWlnaHQsIGJ1dCB3ZSBkb24ndCBrbm93KS4KPiBUaGlzIGlzIGV4
dHJhIGFubm95aW5nIHNpbmNlIHRob3NlIGZ1bmN0aW9uIHBvaW50ZXJzIG5ldmVyIGNoYW5nZSwg
YW5kCj4gYXJlIGFsd2F5cyBwb2ludGluZyB0byB0aGUgR0lDdjIgZnVuY3Rpb25zIGlmIENPTkZJ
R19HSUNWMyBpcyBub3QKPiBkZWZpbmVkLiBPbiB0b3Agb2YgdGhpcyBzb21lIGZ1bmN0aW9ucyBh
cmUgcmVhbGx5IHRyaXZpYWwsIHNvIHdlIHBheSBhCj4gYmlnIHByaWNlIGZvciBzb21ldGhpbmcg
dGhhdCBtaWdodCBiZSBhIHNpbmdsZSBNTUlPIHJlYWQgb3IgZXZlbiBzeXN0ZW0KPiByZWdpc3Rl
ciBhY2Nlc3MuIEkgdGhpbmsgdGhlIHByb3BlciBzb2x1dGlvbiAoVE0pIHdvdWxkIGJlIHRvIHBh
dGNoCj4gdGhlc2UgYWNjZXNzZXMgb25jZSB3ZSBrbm93IHdoaWNoIEdJQyB3ZSBhcmUgcnVubmlu
ZyBvbi4gTGludXggZG9lcwo+IHNvbWV0aGluZyB0byB0aGlzIGVmZmVjdCwgd2hpY2ggYmVuZWZp
dHMgR0lDdjMgaW4gcGFydGljdWxhci4gRnJvbQo+IHF1aWNrbHkgbG9va2luZyBhdCBpdCwgWGVu
IHNlZW1zIHRvIGxhY2sgdGhlIGluZnJhc3RydWN0dXJlIChqdW1wIGxhYmVscwo+IGFuZCBtb3Jl
IHNvcGhpc3RpY2F0ZWQgcnVudGltZSBwYXRjaGluZykgdG8gZWFzaWx5IGNvcHkgdGhpcyBtZXRo
b2QuCgpUaGUgeDg2IGZvbGtzIGFyZSBsb29raW5nIGF0IHJlZHVjaW5nIHRoZSBvdmVyaGVhZCBm
b3IgY2FsbCAoc2VlIFsxXSkuCgpXZSBjb3VsZCBpbXBsZW1lbnQgc2ltaWxhciBmcmFtZXdvcmsg
Zm9yIHBhdGNoaW5nIHRoZSBHSUMgY2FsbC4KCkNoZWVycywKClsxXSAJPDVCOTdDM0Q0MDIwMDAw
NzgwMDFFNzQ3Q0BwcnYxLW1oLnByb3ZvLm5vdmVsbC5jb20+CgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
