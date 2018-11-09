From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 10/15] libxl_exec: Add
 libxl__spawn_initiate_failure
Date: Fri, 9 Nov 2018 12:26:50 +0000
Message-ID: <20181109122650.GC1302@perard.uk.xensource.com>
References: <20180907151104.32306-1-anthony.perard@citrix.com>
 <20180907151104.32306-11-anthony.perard@citrix.com>
 <23493.61309.119890.578593@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zkit=nu=citrix.com=prvs=8444a692f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gL5sG-0000yC-LV
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 12:26:56 +0000
Content-Disposition: inline
In-Reply-To: <23493.61309.119890.578593@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMTYsIDIwMTggYXQgMDM6MDI6MzdQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY1IDEwLzE1XSBsaWJ4bF9leGVj
OiBBZGQgbGlieGxfX3NwYXduX2luaXRpYXRlX2ZhaWx1cmUiKToKPiA+ICsgKiBUaGUgc3Bhd24g
c3RhdGUgbXVzdCBiZSBBdHRhY2hlZCBlbnRyeSBhbmQgd2lsbCBiZSBBdHRhY2hlZCBGYWlsZWQK
PiA+ICsgKiBvbiByZXR1cm4uCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQXR0
YWNoZWQgb24gZW50cnkKPiAKPiBBbmQsIHRoZXJlIGlzIG5vIHN1Y2ggcHVibGljIHN0YXRlIGFz
IGBBdHRhY2hlZCBGYWlsZWQnLiAgVGhhdCBpcyBhCj4gcHJpdmF0ZSBzdGF0ZS4gIFRoZSBjb21t
ZW50IGFib3V0IGxpYnhsX19zcGF3bl9pbml0aWF0ZV9mYWlsdXJlCj4gcHV0dGluZyB0aGUgc3Bh
d24gaW50byBzdGF0ZSBBdHRhY2hlZCBGYWlsZWQgc2hvdWxkIGJlIGluCj4gbGlieGxfZXhlYy5j
LCBuZXh0IHRvIHRoYXQgZnVuY3Rpb24uCj4gCj4gV3JpdGluZyB0aGF0IHRoZSBzdGF0ZSBhZnRl
cndhcmRzIGlzIHN0aWxsIEF0dGFjaGVkIG1ha2VzIGl0IGNsZWFyCj4gdGhhdCB0aGlzIGZ1bmN0
aW9uIG1heSBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMuICBIb3cgYWJvdXQ6Cj4gCj4gICAgICAg
VGhlIHNwYXduIHN0YXRlIG11c3QgYmUgQXR0YWNoZWQgb24gZW50cnkgYW5kIHdpbGwgcmVtYWlu
Cj4gICAgICAgQXR0YWNoZWQuICBJdCBpcyBwb3NzaWJsZSBmb3IgYSBzcGF3biB0byBmYWlsIGZv
ciBtdWx0aXBsZQo+ICAgICAgIHJlYXNvbnMsIGZvciBleGFtcGxlIGNhbGwocykgdG8gbGlieGxf
X3NwYXduX2luaXRpYXRlX2ZhaWx1cmUKPiAgICAgICBhbmQgYWxzbyBmb3Igc29tZSBvdGhlciBy
ZWFzb24uICBJbiB0aGF0IGNhc2UgdGhlIGxhc3QgcmMgdmFsdWUKPiAgICAgICBmcm9tIGFueSBz
b3VyY2Ugd2lsbCB0YWtlIHByZWNlZGVuY2UuCj4gCj4gQnV0IGlzIHRoYXQgcmVhbGx5IHRoZSBz
ZW1hbnRpY3Mgd2Ugd2FudD8gIE1heWJlIHRoZSBmaXJzdCBvciBsYXN0Cj4gY2FsbCB0byBsaWJ4
bF9fc3Bhd25faW5pdGlhdGVfZmFpbHVyZSBzaG91bGQgdGFrZSBwcmVjZWRlbmNlID8KCiJUaGUg
Zmlyc3QgcmMgdmFsdWUgWy4uLl0gd2lsbCB0YWtlIHByZWNlZGVuY2UiIHNvdW5kIGJldHRlciBJ
IHRoaW5rLAppbnN0ZWFkIG9mIHRoZSBsYXN0LgoKSSdsbCBtb2RpZnkgbGlieGxfX3NwYXduX2lu
aXRpYXRlX2ZhaWx1cmUgdG8gb25seSBzZXQgc3MtPnJjIGlmIGl0IGl0Cmlzbid0IGFscmVhZHku
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
