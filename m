From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 4/6] xen: don't free percpu areas during
 suspend
Date: Tue, 2 Apr 2019 14:26:24 +0200
Message-ID: <2cae2c54-f03e-b738-2db0-5fe2507cea7d@suse.com>
References: <20190402053457.24912-1-jgross@suse.com>
 <20190402053457.24912-5-jgross@suse.com>
 <5CA34E170200007800223E02@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fK7G=SE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hBIUm-0003zy-34
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 12:26:28 +0000
In-Reply-To: <5CA34E170200007800223E02@prv1-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDQvMjAxOSAxMzo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDQuMTkg
YXQgMDc6MzQsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGZyZWVpbmcg
cGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0KPj4gYWdhaW4g
d2hlbiByZXN1bWluZyBrZWVwIHRoZW0uIE9ubHkgZnJlZSBhbiBhcmVhIGluIGNhc2UgYSBjcHUg
ZGlkbid0Cj4+IGNvbWUgdXAgYWdhaW4gd2hlbiByZXN1bWluZy4KPj4KPj4gSXQgc2hvdWxkIGJl
IG5vdGVkIHRoYXQgdGhlcmUgaXMgYSBwb3RlbnRpYWwgY2hhbmdlIGluIGJlaGF2aW91ciBhcwo+
PiB0aGUgcGVyY3B1IGFyZWFzIGFyZSBubyBsb25nZXIgemVyb2VkIG91dCBkdXJpbmcgc3VzcGVu
ZC9yZXN1bWUuIFdoaWxlCj4+IEkgaGF2ZSBjaGVja2VkIHRoZSBjYWxsZWQgY3B1IG5vdGlmaWVy
IGhvb2tzIHRvIGNvcGUgd2l0aCB0aGF0IHRoZXJlCj4+IG1pZ2h0IGJlIHNvbWUgd2VsbCBoaWRk
ZW4gZGVwZW5kZW5jeSBvbiB0aGUgcHJldmlvdXMgYmVoYXZpb3VyLiBPVE9ICj4+IGEgY29tcG9u
ZW50IG5vdCByZWdpc3RlcmluZyBpdHNlbGYgZm9yIGNwdSBkb3duL3VwIGFuZCBleHBlY3Rpbmcg
dG8KPj4gc2VlIGEgemVyb2VkIHBlcmNwdSB2YXJpYWJsZSBhZnRlciBzdXNwZW5kL3Jlc3VtZSBp
cyBraW5kIG9mIGJyb2tlbgo+PiBhbHJlYWR5LiBBbmQgdGhlIG9wcG9zaXRlIGNhc2UsIHdoZXJl
IGEgY29tcG9uZW50IGlzIG5vdCByZWdpc3RlcmVkCj4+IHRvIGJlIGNhbGxlZCBmb3IgY3B1IGRv
d24vdXAgYW5kIGlzIG5vdCBleHBlY3RpbmcgYSBwZXJjcHUgdmFyaWFibGUKPj4gc3VkZGVubHkg
dG8gYmUgemVybyBkdWUgdG8gc3VzcGVuZC9yZXN1bWUgaXMgbXVjaCBtb3JlIHByb2JhYmxlLAo+
PiBlc3BlY2lhbGx5IGFzIHRoZSBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbmFsaXR5IHNlZW1zIG5v
dCB0byBiZSB0ZXN0ZWQKPj4gdGhhdCBvZnRlbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBSZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkg
PGRmYWdnaW9saUBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IFdhc24ndCB0aGVyZSBhIHJlcXVlc3QgdGhvdWdoIHRvIGRvIHRoZSBz
YW1lIG9uIEFybT8gRXZlbiBpZgo+IHJpZ2h0IG5vdyBBcm0gZG9lc24ndCBzdXBwb3J0IHN1c3Bl
bmQvcmVzdW1lIG91dCBvZiB0aGUgYm94LAo+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGlm
IHN1Y2ggcmVsYXRpdmVseSBnZW5lcmljIGFkanVzdG1lbnRzCj4gd2VyZSBkb25lIGluIGxvY2sg
c3RlcC4KCkp1bGllbiBhc2tlZCB0byBpbmNsdWRlIHRoYXQgaW4gdGhlIEFSTSBzdXNwZW5kL3Jl
c3VtZSBzZXJpZXMuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
