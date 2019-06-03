From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
Date: Mon, 3 Jun 2019 10:38:03 -0600
Message-ID: <CABfawh=LbZ6dTQhYS+pxkPLA_=8OrGpeYYnPeZ60bhZ6kzT2Ew@mail.gmail.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-4-tamas@tklengyel.com>
 <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mem4=UC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hXpyt-0006M1-9V
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:38:43 +0000
Received: by mail-wr1-f41.google.com with SMTP id c2so12804058wrm.8
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2019 09:38:40 -0700 (PDT)
In-Reply-To: <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMywgMjAxOSBhdCAyOjI2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMTYuMDUuMTkgYXQgMjM6MzcsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IERpc2FibGUgaXQgYnkgZGVmYXVsdCBhcyBpdCBpcyBvbmx5IGFu
IGV4cGVyaW1lbnRhbCBzdWJzeXN0ZW0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBM
ZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+ID4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiBDYzogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IENjOiBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+Cj4gPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiA+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+Cj4gPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
ID4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+ID4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdl
b3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+IC0tLS0KPiA+IHY0OiBhZGQgQVNTRVJUX1VO
UkVBQ0hBQkxFIHRvIGlubGluZWQgZnVuY3Rpb25zIHdoZXJlIGFwcGxpY2FibGUgJiBvdGhlcgo+
ID4gZml4dXBzCj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAg
fCAgNiArKysrKy0KPiA+ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgfCAgMiAr
Kwo+ID4gIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICB8ICAyICsrCj4gPiAgeGVu
L2FyY2gveDg2L21tL01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KPiA+ICB4ZW4vYXJjaC94ODYv
eDg2XzY0L2NvbXBhdC9tbS5jICAgfCAgMiArKwo+ID4gIHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0u
YyAgICAgICAgICB8ICAyICsrCj4gPiAgeGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAg
IHwgIDMgLS0tCj4gPiAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgIHwgIDIgKy0K
PiA+ICB4ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgICAgICAgICAgfCAgMiArLQo+ID4gIHhlbi9j
b21tb24vbWVtb3J5LmMgICAgICAgICAgICAgICB8ICAyICstCj4gPiAgeGVuL2NvbW1vbi92bV9l
dmVudC5jICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9t
ZW1fc2hhcmluZy5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIHhlbi9p
bmNsdWRlL2FzbS14ODYvbW0uaCAgICAgICAgICB8ICAzICsrKwo+ID4gIHhlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oICAgICAgICAgICB8ICAyICstCj4gPiAgeGVuL2luY2x1ZGUveHNtL2R1bW15Lmgg
ICAgICAgICAgIHwgIDIgKy0KPiA+ICB4ZW4vaW5jbHVkZS94c20veHNtLmggICAgICAgICAgICAg
fCAgNCArKy0tCj4gPiAgeGVuL3hzbS9kdW1teS5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
PiA+ICB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gPiAgMTgg
ZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4KPiBEYW5p
ZWwsIGl0IGxvb2tzIGxpa2UgeW91IHdlcmVuJ3QgQ2MtZWQgaGVyZSwgYnV0IHlvdXIgYWNrIGlz
IG5lZWRlZC4KCkluZGVlZCwgSSd2ZSBhbHNvIHNlZW0gdG8gaGF2ZSBtaXNzZWQgQ0MtaW5nIFJh
enZhbiAoZml4ZWQgbm93KS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
