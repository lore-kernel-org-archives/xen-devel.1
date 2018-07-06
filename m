From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Fri, 6 Jul 2018 15:27:00 +0100
Message-ID: <23359.31796.334739.293608@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
 <23358.13791.774484.444256@mariner.uk.xensource.com>
 <4f90cd43-2781-a8e1-17f8-15b974f1aad4@suse.com>
 <23359.30664.732519.101974@mariner.uk.xensource.com>
 <f3985d38-d391-9344-4dce-a494aad0ab69@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4trt=jw=citrix.com=prvs=718f97a87=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fbRhR-0007v2-0A
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 14:27:05 +0000
In-Reply-To: <f3985d38-d391-9344-4dce-a494aad0ab69@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3Vt
bWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhs
eSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPiBP
biAwNi8wNy8xOCAxNjowOCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBJIHRoaW5rIHlvdSBhcmUg
Y29uZmxhdGluZyAicmVsZWFzZWQiIHdpdGggInRlc3RlZCIuICBJbiB0aGUgY3VycmVudAo+ID4g
b3NzdGVzdCBzZXR1cCBlYWNoIHRlc3Qgb2YgeGVuLXVuc3RhYmxlI3N0YWdpbmcgaXMgZG9uZSB3
aXRoICp0ZXN0ZWQqCj4gPiB2ZXJzaW9ucyBvZiBhbGwgdGhlIG90aGVyIHRyZWVzLgo+IAo+IEFu
ZCB3aGF0IGFib3V0IHRlc3RzIG9mIHRoZSBvdGhlciB0cmVlcz8gRG8gdGhvc2Ugb25seSB1c2UK
PiB4ZW4tdW5zdGFibGUjbWFzdGVyPyBJZiB5ZXMsIEknbSBmaW5lLgoKWWVzLCBleGFjdGx5LiAg
R29vZC4KCj4gPiBTbyBiYXJyaW5nIGhlaXNlbmJ1Z3MsIGhhcmR3YXJlIHByb2JsZW1zLCBvciB3
aGF0ZXZlciwgYmxvY2tpbmcKPiA+IGZhaWx1cmVzIHdpbGwgYmUgZHVlIHRvIGNoYW5nZXMgaW4g
eGVuLXVuc3RhYmxlI3N0YWdpbmcuCj4gPiAoSG9zdC1zcGVjaWZpYyBmYWlsdXJlcyBtaWdodCBh
bHNvIHNsaXAgdGhyb3VnaCwgYnV0IHRoaXMgaXMgbm90IHZlcnkKPiA+IGxpa2VseS4pCj4gPiAK
PiA+IFRoZSBwcm9ibGVtIGlzIHRoYXQgd2UgaGF2ZSB0b28gbWFueSAiaGVpc2VuYnVncywgaGFy
ZHdhcmUgcHJvYmxlbXMsCj4gPiBvciB3aGF0ZXZlciIuCj4gCj4gWWVzLgoKUmlnaHQuICBJIHRo
aW5rIHRoYXQncyB3aGF0IHdlIG5lZWQgdG8gd29yayBvbi4gIEkgYW0gdHJ5aW5nLCBidXQKdGhl
cmUgaXMgb25seSBvbmUgb2YgbWUgYW5kIEkgaGF2ZSBvdGhlciByZXNwb25zaWJpbGl0aWVzIHRv
by4uLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
