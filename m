From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen Project Security Process Whitepaper v1 is ready
 for community review
Date: Mon, 2 Jul 2018 19:11:16 +0100
Message-ID: <F42A6C96-F6D3-4FB0-B242-BE2CDB04A9F0@xenproject.org>
References: <2AF1AB1A-2DFE-429B-8F3B-0153D339EC5F@citrix.com>
 <5546007.nMA9FcojZc@wopr.lan.crc.id.au>
 <5B3356BE02000078001CE3F9@prv1-mh.provo.novell.com>
 <2259308.S7C7BiUIIS@wopr.lan.crc.id.au>
 <2329F08C-4F93-4A61-BFAE-A345BD6C9AD0@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nl1s=js=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1fa3IH-0003E7-SL
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 18:11:21 +0000
Received: by mail-wm0-x236.google.com with SMTP id l15-v6so8433263wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jul 2018 11:11:20 -0700 (PDT)
In-Reply-To: <2329F08C-4F93-4A61-BFAE-A345BD6C9AD0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Steven Haigh <netwiz@crc.id.au>, George Dunlap <dunlapg@umich.edu>, Doug Goldstein <cardoe@cardoe.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Matt Spencer <Matt.Spencer@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, "security@xenproject.org" <security@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, Andrew Halley <andrew.halley@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Ajey Kulkarni <Ajey.Kulkarni@rackspace.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDI4IEp1biAyMDE4LCBhdCAwMjo1NywgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRy
aXguY29tPiB3cm90ZToKPiAKPiAKPiDvu79PbiAyNy8wNi8yMDE4LCAyMjo0NywgIlN0ZXZlbiBI
YWlnaCIgPG5ldHdpekBjcmMuaWQuYXU+IHdyb3RlOgo+IAo+ICAgIE9uIFdlZG5lc2RheSwgMjcg
SnVuZSAyMDE4IDc6MTk6NTggUE0gQUVTVCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMjcu
MDYuMTggYXQgMDY6MDUsIDxuZXR3aXpAY3JjLmlkLmF1PiB3cm90ZToKPj4+IFJpZ2h0IG5vdywg
d2UncmUgYXQgYSBzdGFnZSB3aGVyZSB3ZSBjb3VsZCBwcm9iYWJseSBqdXN0aWZ5IGEgbmV3IHJl
bGVhc2UKPj4+IG9mIDQuNiwgNC43LCA0LjgsIDQuOSwgYW5kIDQuMTAgZHVlIHRvIHRoZSBkZXB0
aCBvZiBYU0FzIGNvbnRhaW5lZCB3aXRoaW4KPj4+IHRoYXQgY2FuJ3QgYmUgcGF0Y2hlZCBvbiB0
b3Agb2YgdGhlIHJlbGVhc2UgYXJjaGl2ZS4KPj4gCj4+IDQuNy42IGFuZCA0LjguNCBhcmUgaW1t
aW5lbnQgYW55d2F5LCBhbmQgNC45LjMgaXMgZHVlIGluIGFib3V0IGEKPj4gbW9udGgncyB0aW1l
IChJJ2xsIHNlbmQgYSByZXNwZWN0aXZlIGNhbGwgZm9yIHBvaW50aW5nIG91dCBtaXNzaW5nCj4+
IGJhY2twb3J0cyBvbmNlIEkndmUgZmx1c2hlZCBvdXQgbXkgb3duIHF1ZXVlKS4gVGhlcmUncyBu
b3QgZ29pbmcgdG8KPj4gYmUgYW5vdGhlciByZWxlYXNlIG9mZiB0aGUgNC42IGJyYW5jaCwgYXQg
bGVhc3Qgbm90IG9uZSBvcmdhbml6ZWQgYnkKPj4gWGVuUHJvamVjdC4gRXZlbiB1cyBtZWFuaW5n
IHRvIGRvIHNvIGZvciA0LjcgaXMgb25seSBiZWNhdXNlIG9mIHRoZQo+PiBjaXJjdW1zdGFuY2Vz
Lgo+PiAKPj4gQXMgbWVudGlvbmVkIGJlZm9yZSAtIHBlcnNvbmFsbHkgSSdtIG5vdCBmYW5jeWlu
ZyB0byBkbyBtb3JlIGZyZXF1ZW50Cj4+IHN0YWJsZSByZWxlYXNlcy4KPiAKPiAgICBTdXJlbHkg
d2UgYXJlIGFibGUgdG8gYXV0b21hdGUgdGhlIG1ham9yaXR5IG9mIHRoZSBwcm9jZXNzPwo+IAo+
ICAgIEkgY291bGQgaW1hZ2luZSB0aGF0IHdpdGggYSByZWd1bGFyIHJlbGVhc2Ugc2NoZWR1bGUs
IGl0IGNvdWxkIGJlIHJlZmluZWQgCj4gICAgZW5vdWdoIHRvIGF1dG9tYXRpY2FsbHkgcGFja2Fn
ZSB0aGUgY3VycmVudCBnaXQgYnJhbmNoIGJhc2VkIG9uIGp1c3QgCj4gICAgY29tbWl0dGluZyBh
IHRhZy4KPiAKPiBUaGVyZSB3YXMgYSBkaXNjdXNzaW9uIGF0IHRoZSBzdW1taXQgaW4gdGhpcyBh
cmVhLCB3aGljaCB3b3VsZCBiZSBhIHN0ZXAgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiwgd2hpY2gg
d2FzIHByb3Bvc2VkIGJ5IERvdWcgZnJvbSBSYWNrc3BhY2UgYW5kIE1hdHQgZnJvbSBBUk0uIEkg
c3RpbGwgbmVlZCB0byBkZWFsIHdpdGggdGhlIG1lZXRpbmcgbm90ZXMKPiBMYXJzCgpUaGUgcmVs
ZXZhbnQgbWVldGluZyBub3RlcyBhcmU6CiogaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA3L3RocmVhZHMuaHRtbCMwMDEyOSAoVGVzdGlu
Zy9CdWlsZGluZyB3aXRoIERvY2tlci9HaXRMYWIpCiogaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA3L3RocmVhZHMuaHRtbCMwMDE2NiAo
UHJvY2VzcyBjaGFuZ2VzOiBpcyB0aGUgNiBtb250aGx5IHJlbGVhc2UgQ2FkZW5jZSB0b28gc2hv
cnQsIFNlY3VyaXR5IFByb2Nlc3MsIC4uLikKCklmIHlvdSB3YW50IHRvIHBpY2sgdXAgaXRlbXMg
ZnJvbSB0aGVzZSBkaXNjdXNzaW9ucyBpbiB0aGlzIHRocmVhZCwgcGxlYXNlIGNvcHkgdGhlIHJl
bGV2YW50IHNlY3Rpb24gZnJvbSB0aGUgYWJvdmUgZGlzY3Vzc2lvbiBpbnRvIHRoaXMgdGhyZWFk
LgoKTGFycwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
