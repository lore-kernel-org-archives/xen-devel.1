From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 08:31:25 -0600
Message-ID: <5B06CCBD02000078001C5A05@prv1-mh.provo.novell.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
 <5B06CAA502000078001C59CF@prv1-mh.provo.novell.com>
 <a8d95374-396f-5d14-36b3-dcb062a4e4bd@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLrH9-0006GK-1N
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:31:31 +0000
In-Reply-To: <a8d95374-396f-5d14-36b3-dcb062a4e4bd@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE2OjI0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMTggMTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNC4w
NS4xOCBhdCAxNjoxOCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQ2Fu
IHlvdSB0cnkgd2l0aCB0aGUgIng4Ni90cmFwczogRHVtcCB0aGUgaW5zdHJ1Y3Rpb24gc3RyZWFt
IGV2ZW4gZm9yCj4+PiBkb3VibGUgZmF1bHRzIiBwYXRjaCBJJ3ZlIGp1c3QgcG9zdGVkLCBhbmQg
c2hvdyB0aGUgZnVsbCAjREYgcGFuaWMgbG9nCj4+PiBwbGVhc2U/ICAoSXRzIGNvbmNlaXZhYmxl
IHRoYXQgdGhlcmUgYXJlIG11bHRpcGxlIGRpZmZlcmVudCBpc3N1ZXMgaGVyZS4pCj4+IFdlbGws
IGFzIGxvbmcgYXMgd2UncmUgb24gYSBndWVzdCBrZXJuZWwgc3RhY2sgcmF0aGVyIHRoYW4gb3Vy
IG93biwgSQo+PiBkb24ndCB0aGluayB0aGUgZXhhY3QgaW5zbiBjYXVzaW5nIHRoZSAjREYgcmVh
bGx5IG1hdHRlcnMuIFNlZSBlYXJsaWVyCj4+IG1haWxzIEkgaGF2ZSBzZW50IGluIHRoaXMgcmVn
YXJkLgo+IAo+IEluIEdlb3JnZSdzIGNyYXNoLCB3ZSB3ZXJlIGluIGEgd2VpcmQgcGxhY2Ugb24g
dGhlIGh5cGVydmlzb3Igc3RhY2ssIG5vdAo+IGEgZ3Vlc3Qgc3RhY2suLi4KCkdvIGxvb2sgYWdh
aW4gLSAlcnNwIHBvaW50ZWQgb3V0c2lkZSBvZiBoeXBlcnZpc29yIHNwYWNlIGluIGFsbCBjYXNl
cyB0aGF0CkkgaGFkIGxvb2tlZCBhdC4gQW5kIHRoYXQncyBleHBsYWluZWQgYnkgdGhlIHVubWFw
cGluZyBvZiB0aGUgc3R1YnM6IFdlJ2QKI1BGIHJpZ2h0IGFmdGVyIGZpcnN0IFNZU0NBTEwsIGFu
ZCB0aGUgaGFuZGxlciB3b3VsZCB0aGVuIHJ1biBvbiB0aGUgc3RhY2sKdGhhdCdzIHN0aWxsIGFj
dGl2ZSBmcm9tIGd1ZXN0IGNvbnRleHQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
