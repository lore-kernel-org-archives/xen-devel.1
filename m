From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 19:54:01 +0100
Message-ID: <ed01fc3b-5530-b487-d4ef-7b902a6dd92a@citrix.com>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
 <5B50D9420200007800137603@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zjjl=kd=citrix.com=prvs=7313ab634=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fgE4Q-0002DV-Ej
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 18:54:34 +0000
In-Reply-To: <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, tim@xen.org, Ian.Jackson@eu.citrix.com, christopher.w.clark@gmail.com, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDcvMTggMTk6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBUaHUsIDE5
IEp1bCAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPiAwNy8xOS8xOCA3OjAwIFBNID4+Pgo+Pj4gT24gVGh1LCAx
OSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Cj4+Pj4+IC0t
LQo+Pj4+PiBQbGVhc2UgdXNlIG15IGdtYWlsIGFkZHJlc3MgZm9yIGFueSBjb3JyZXNwb25kZW5j
ZSB0byBtZS4KPj4+PiBJIHRoaW5rIGl0IGlzIGdlbmVyYWxseSBjb25zaWRlcmVkIGJhZCBwcmFj
dGljZSB0byBoYXZlIEZyb206IGFuZCBTLW8tYgo+Pj4+IGRpZmZlci4KPj4+IFdoeT8gVGhhdCBp
cyBwZXJmZWN0bHkgZmluZS4gU2lnbmVkLW9mZi1ieSBpcyBhYm91dCBjb3B5cmlnaHQgb2YgdGhl
Cj4+PiBjb2RlIHdoaWxlIEZyb206IGlzIGFib3V0IGF1dGhvcnNoaXAuIAo+PiBXZWxsLCBpbiB0
aGlzIHBhcnRpY3VsYXIgY2FzZSBDaHJpc3RvcGhlciBoYWQgZXZlbiBhc2tlZCB0aGF0IGNvbW11
bmljYXRpb24KPj4gdG8gZ28gdG8gdGhlIG1haWwgYWRkcmVzcyBoZSBzZW50IGZyb20uIEhvdyBp
cyBhbnlvbmUgZ29pbmcgdG8ga25vdyB0aGF0IGlmCj4+IGp1ZGdpbmcganVzdCBmcm9tIHRoZSBl
dmVudHVhbCBjb21taXQgaW4gZ2l0Pwo+IFllYWgsIHRoYXQgYml0IG9mIGluZm9ybWF0aW9uIGlz
IGxvc3QgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAo+IHVuZm9ydHVuYXRlbHkuIEF0IHRoYXQgcG9p
bnQsIHRoZSBwYXRjaCBpcyBhbHJlYWR5IGNvbW1pdHRlZCwgc28gaXQgaXMKPiB1c3VhbGx5IG5v
dCBhIGJpZyBkZWFsLgo+Cj4KPj4gQmVzaWRlcyB0aGF0IC0gaG93IGRvZXMgYW55b25lIGtub3cg
d2hldGhlciB0aGUgdHdvIGFyZSBhY3R1YWxseSBhZGRyZXNzZXMKPj4gb2YgdGhlIHNhbWUgcGVy
c29uPwo+IEkgZG9uJ3QgdGhpbmsgdGhleSBoYXZlIHRvIGJlIHRoZSBzYW1lIHBlcnNvbi4gV2hh
dCBtYXR0ZXJzIGlzIHRoZQo+IFNpZ25lZC1vZmYtYnkgbGluZSwgdGhlIGF1dGhvciBpcyBvbmx5
IHRvIGdpdmUgY3JlZGl0cyB0byB3aG9tIGRpZCB0aGUKPiB3b3JrLiBJdCBjb3VsZCBiZSBhIHBz
ZXVkb255bS4gV2hpbGUgdGhlIFNpZ25lZC1vZmYtYnkgaGFzIHRvIGJlIGEgcmVhbAo+IHBlcnNv
bi4KCkluIHBhcnRpY3VsYXIsIGl0IGlzIGNvbW1vbiBmb3IgZW1wbG95ZWVzIG9mIGNvbXBhbmll
cyB3aXRoCmJyb2tlbi9kcmFjb25pYW4gbWFpbC9maXJld2FsbCBwb2xpY2llcyAob3Igc2ltcGx5
IGp1c3QgRXhjaGFuZ2UpIHRvCmVtYWlsIGZyb20gZ21haWwsIHdpdGggU29CIHJlZmVycmluZyB0
byB0aGVpciBwcm9wZXIgY29tcGFueSBlbWFpbCBhZGRyZXNzLgoKWW91J2xsIG5vdGljZSB0aGF0
IHRoZXJlIGxhcmdlIG51bWJlciBvZiBjb250cmlidXRpb25zIHRvIExpbnV4IHdoaWNoCmZvbGxv
dyB0aGlzIHN0eWxlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
