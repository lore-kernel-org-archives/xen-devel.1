From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: broken build:
 448c03b3cbe14873ee637755a29ea26ee7ca9ef9
Date: Tue, 20 Mar 2018 08:35:20 -0500
Message-ID: <5189c3f7-7a44-3045-4d84-1c4c1512a482@cardoe.com>
References: <19dc3afa-fbe1-564c-8502-6ca2c4f1cfc7@cardoe.com>
 <8b74237f-79a1-8fc1-f8e9-26ec05e37a1b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n/rg=gk=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eyHQB-0000xt-CB
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:35:23 +0000
Received: by mail-yb0-x234.google.com with SMTP id b6-v6so514005ybn.8
 for <xen-devel@lists.xenproject.org>; Tue, 20 Mar 2018 06:35:22 -0700 (PDT)
In-Reply-To: <8b74237f-79a1-8fc1-f8e9-26ec05e37a1b@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yMC8xOCAxOjA3IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDE5LzAzLzE4IDIw
OjA0LCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPj4gY29tbWl0IDQ0OGMwM2IzY2JlMTQ4NzNlZTYz
Nzc1NWEyOWVhMjZlZTdjYTllZjkKPj4gQXV0aG9yOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4+IERhdGU6ICAgTW9uIEZlYiAyNiAwOTo0NjoxMiAyMDE4ICswMTAwCj4+Cj4+IFRo
aXMgY29tbWl0IGJyZWFrcyB0aGUgYnVpbGQgb2YgcWVtdS14ZW4tdHJhZGl0aW9uYWwgZm9yOgo+
Pgo+PiBVYnVudHUgMTQuMDQ6IGh0dHBzOi8vZ2l0bGFiLmNvbS9jYXJkb2UveGVuLy0vam9icy81
ODI2NjE3MAo+PiBVYnVudHUgMTYuMDQ6IGh0dHBzOi8vZ2l0bGFiLmNvbS9jYXJkb2UveGVuLy0v
am9icy81ODI2NjE3NAo+Pgo+PiBBIHNob3J0IHNuaXBwZXQgb2YgdGhlIGZhaWx1cmUgaXM6Cj4+
Cj4+ICAgQVIgICAgaTM4Ni1kbS9saWJxZW11LmEKPj4gICBMSU5LICBpMzg2LWRtL3FlbXUtZG0K
Pj4gL2J1aWxkcy9jYXJkb2UveGVuL3Rvb2xzLy4uL3Rvb2xzL3hlbnN0b3JlL2xpYnhlbnN0b3Jl
LnNvOiB1bmRlZmluZWQKPj4gcmVmZXJlbmNlIHRvIGBkbHN5bScKPj4gY29sbGVjdDI6IGVycm9y
OiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4+IG1ha2VbNV06ICoqKiBbcWVtdS1kbV0gRXJy
b3IgMQo+PiBtYWtlWzVdOiBMZWF2aW5nIGRpcmVjdG9yeQo+PiBgL2J1aWxkcy9jYXJkb2UveGVu
L3Rvb2xzL3FlbXUteGVuLXRyYWRpdGlvbmFsLWRpci1yZW1vdGUvaTM4Ni1kbScKPj4gbWFrZVs0
XTogKioqIFtzdWJkaXItaTM4Ni1kbV0gRXJyb3IgMgo+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVj
dG9yeQo+PiBgL2J1aWxkcy9jYXJkb2UveGVuL3Rvb2xzL3FlbXUteGVuLXRyYWRpdGlvbmFsLWRp
ci1yZW1vdGUnCj4+IG1ha2VbM106ICoqKiBbc3ViZGlyLWFsbC1xZW11LXhlbi10cmFkaXRpb25h
bC1kaXJdIEVycm9yIDIKPj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgYC9idWlsZHMvY2Fy
ZG9lL3hlbi90b29scycKPj4gbWFrZVsyXTogKioqIFtzdWJkaXJzLWluc3RhbGxdIEVycm9yIDIK
Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgYC9idWlsZHMvY2FyZG9lL3hlbi90b29scycK
Pj4gbWFrZVsxXTogKioqIFtpbnN0YWxsXSBFcnJvciAyCj4+IG1ha2VbMV06IExlYXZpbmcgZGly
ZWN0b3J5IGAvYnVpbGRzL2NhcmRvZS94ZW4vdG9vbHMnCj4+IG1ha2U6ICoqKiBbaW5zdGFsbC10
b29sc10gRXJyb3IgMgo+Pgo+IAo+IERpZCB5b3UgaGF2ZSBjb21taXQgYzliZDhhNzM2NTZkNzQz
NWIxMDU1ZWU4ODI1ODIzYWVlOTk1OTkzZSA/Cj4gCj4gCj4gSnVlcmdlbgo+IAoKSW5kZWVkIEkg
ZG8uIFlvdSBjYW4gc2VlIHRoZSBicmFuY2ggdGhhdCBJIHVzZWQgdG8gYnVpbGQgaGVyZToKaHR0
cHM6Ly9naXRsYWIuY29tL2NhcmRvZS94ZW4vY29tbWl0cy9naXRsYWIgd2hpY2ggaXMganVzdCBz
dGFnaW5nICsKR2l0TGFiIHBhdGNoZXMgYXMgb2YgdGhlIGNvbXBpbGUgZGF0ZS4KCi0tIApEb3Vn
IEdvbGRzdGVpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
