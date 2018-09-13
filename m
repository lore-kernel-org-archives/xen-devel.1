From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 11/16] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Thu, 13 Sep 2018 10:31:33 -0600
Message-ID: <CABfawh=j5hCuuXD0PBe1TvH0dwSsNyZMh19ZE515Bj_75X0m2w@mail.gmail.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-12-wei.liu2@citrix.com>
 <CABfawh=aBbV8P=iA3u17p1D3v=LspGUTyd-gjVsSEPuQn+y8=g@mail.gmail.com>
 <20180913154348.u473tkh5mzy3podd@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ekk3=l3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g0UXT-0007yr-IL
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:32:19 +0000
Received: by mail-ed1-f67.google.com with SMTP id a20-v6so5146526edd.4
 for <xen-devel@lists.xenproject.org>; Thu, 13 Sep 2018 09:32:18 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id c28-v6sm2471484edc.52.2018.09.13.09.32.12
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Sep 2018 09:32:15 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id v17-v6so6777879wrr.9
 for <xen-devel@lists.xenproject.org>; Thu, 13 Sep 2018 09:32:12 -0700 (PDT)
In-Reply-To: <20180913154348.u473tkh5mzy3podd@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMTMsIDIwMTggYXQgOTo0MyBBTSBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDA3LCAyMDE4IGF0IDAzOjI3OjM3UE0gLTA2MDAs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDQsIDIwMTgsIDEwOjI5IEFN
IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4KPiA+ID4gR29pbmcgdGhy
b3VnaCB0aGUgY29kZSwgSEFQLCBFUFQsIFBvRCBhbmQgQUxUUDJNIGRlcGVuZCBvbiBIVk0gY29k
ZS4KPiA+ID4gUHV0IHRoZXNlIGNvbXBvbmVudHMgdW5kZXIgQ09ORklHX0hWTS4gVGhpcyBmdXJ0
aGVyIHJlcXVpcmVzIHB1dHRpbmcKPiA+ID4gb25lIG9mIHRoZSB2bSBldmVudCB1bmRlciBDT05G
SUdfSFZNLgo+ID4gPgo+ID4gPiBBbHRwMm0gcmVxdWlyZXMgYSBiaXQgbW9yZSBhdHRlbnRpb24g
YmVjYXVzZSBpdHMgY29kZSBpcyBlbWJlZGRlZCBpbgo+ID4gPiBnZW5lcmljIHg4NiBwMm0gY29k
ZS4KPiA+ID4KPiA+ID4gQWxzbyBtYWtlIGhhcF9lbmFibGVkIGV2YWx1YXRlIHRvIGZhbHNlIHdo
ZW4gIUNPTkZJR19IVk0uIE1ha2Ugc3VyZSBpdAo+ID4gPiBldmFsdWF0ZSBpdHMgcGFyYW1ldGVy
IHRvIGF2b2lkIHVudXNlZCB2YXJpYWJsZSB3YXJuaW5ncyBpbiBpdHMgdXNlcnMuCj4gPiA+Cj4g
PiA+IEFsc28gc29ydCBpdGVtcyBpbiBNYWtlZmlsZSB3aGlsZSBhdCBpdC4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICB4ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUgICAgICAgICB8IDExICsrKysrKy0tLS0tCj4g
PiA+ICB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jICAgICB8IDE4ICsrKysrKysrKysrKysr
KysrLQo+ID4gPiAgeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgICAgfCAgMiArKwo+ID4g
PiAgeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgfCAyMyArKysrKysrKysrKystLS0t
LS0tLS0tLQo+ID4gPiAgeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAgICAgICAgfCAgMiArKwo+
ID4gPgo+ID4KPiA+IEFzIGJlZm9yZSwgcGxlYXNlIG9ubHkgYXBwbHkgQ09ORklHX0hWTSBpZmRl
ZnMgdG8geDg2IHNwZWNpZmljIHBhcnRzLiBXZQo+ID4gaGF2ZSBhbiBhbHRwMm0gaW1wbGVtZW50
YXRpb24gZm9yIEFSTSB0aGF0IGlzIHBsYW5uZWQgdG8gYmUgcG9zdGVkIGFnYWluIHRvCj4gPiB0
aGUgbWFpbGluZ2xpc3QgaW4gdGhlIG5lYXIgZnV0dXJlLgo+Cj4gSSB0YWtlIHRoYXQgeW91IGFy
ZSBzcGVjaWZpY2FsbHkgdGFsa2luZyBhYm91dCBjb21tb24vdm1fZXZlbnQuYyBiZWNhdXNlCj4g
dGhhdCdzIHRoZSBvbmx5IGNvbW1vbiBjb2RlIGhlcmUgaW4gdGhlIGxpc3Qgb2YgZmlsZS4KClll
cywgZXhhY3RseS4KCj4gSSBoYXZlIHN3aXRjaGVkIHRvIHByb3ZpZGUgYSBzdHViIGZvciBwMm1f
YWx0cDJtX2NoZWNrIGluIHg4NiBoZWFkZXIKPiBpbnN0ZWFkLgoKVGhhbmtzIQpUYW1hcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
