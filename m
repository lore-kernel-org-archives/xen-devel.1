From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Wed, 24 Jan 2018 16:52:17 +0000
Message-ID: <20180124165217.6c35apjisrdgioz2@MacBook-Pro-de-Roger.local>
References: <20180124154849.84889-1-roger.pau@citrix.com>
 <20180124154849.84889-3-roger.pau@citrix.com>
 <5A68C11902000078001A20EE@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rcjb=et=citrix.com=prvs=555701784=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eeOIU-0007fn-J8
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:53:14 +0000
Content-Disposition: inline
In-Reply-To: <5A68C11902000078001A20EE@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMDk6MjM6MzdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjAxLjE4IGF0IDE2OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gV2hlbiBpbmRpcmVjdF90aHVua19hc20uaCBpcyBpbnN0YW50aWF0ZWQgZGlyZWN0
bHkgaW50byBhc3NlbWJseSBmaWxlcwo+ID4gQ09ORklHX0lORElSRUNUX1RIVU5LIG1pZ2h0IG5v
dCBiZSBkZWZpbmVkLCBhbmQgdGh1cyB1c2luZyAuaWYgYWdhaW5zdAo+ID4gaXQgaXMgd3Jvbmcu
Cj4gPiAKPiA+IEFkZCBhIGNoZWNrIHRvIGRlZmluZSBDT05GSUdfSU5ESVJFQ1RfVEhVTksgdG8g
MCBpZiBub3QgZGVmaW5lZCwgc28KPiA+IHRoYXQgdXNpbmcgLmlmIENPTkZJR19JTkRJUkVDVF9U
SFVOSyBpcyBhbHdheXMgY29ycmVjdC4KPiA+IAo+ID4gVGhpcyBzdXBwcmVzc2VzIHRoZSBmb2xs
b3dpbmcgY2xhbmcgZXJyb3I6Cj4gPiAKPiA+IDxpbnN0YW50aWF0aW9uPjo4Ojk6IGVycm9yOiBl
eHBlY3RlZCBhYnNvbHV0ZSBleHByZXNzaW9uCj4gPiAgICAgLmlmIENPTkZJR19JTkRJUkVDVF9U
SFVOSyA9PSAxCj4gPiAgICAgICAgIF4KPiA+IDxpbnN0YW50aWF0aW9uPjoxOjE6IG5vdGU6IHdo
aWxlIGluIG1hY3JvIGluc3RhbnRpYXRpb24KPiA+IElORElSRUNUX0JSQU5DSCBjYWxsICVyZHgK
PiA+IF4KPiA+IGVudHJ5LlM6NTg5Ojk6IG5vdGU6IHdoaWxlIGluIG1hY3JvIGluc3RhbnRpYXRp
b24KPiA+ICAgICAgICAgSU5ESVJFQ1RfQ0FMTCAlcmR4Cj4gPiAgICAgICAgIF4KPiAKPiBXaHkg
aXMgdGhlIHNhbWUgbm8gcHJvYmxlbSB3aXRoIGdhcz8gSXQgd2FudHMgY29uc3RhbnQKPiBleHBy
ZXNzaW9ucyB3aXRoIC5pZiB0b28sIGFmdGVyIGFsbC4KClJpZ2h0LCBhbmQgSSBjYW5ub3QgZmln
dXJlIG91dCB3aHkgaXQgd29ya3Mgd2hlbiB1c2luZwotbm8taW50ZWdyYXRlZC1hcyBhbmQgbm90
IHdoZW4gbm90IHVzaW5nIGl0LiBUaGUgbW9yZSB0aGF0IEkgY2Fubm90CnNlZSBDT05GSUdfSU5E
SVJFQ1RfVEhVTksgYmVpbmcgdW5jb25kaXRpb25hbGx5IGRlZmluZWQgdG8gZWl0aGVyIDAgb3IK
MS4gSSBndWVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcuCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
