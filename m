From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Fwd:  [PATCH 13/25] argo: implement the register op
Date: Wed, 9 Jan 2019 18:03:36 +0100
Message-ID: <CAPLaKK6Zop01p2XN+R5zEahqpuChs6kC3zN2GhA81y86_hFSUw@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-14-git-send-email-christopher.w.clark@gmail.com>
 <20181212164721.hag6gc3akcm2gvhd@mac>
 <CACMJ4GZRAck4oYtXJpV3c_tGer0n+EUuWjXCtcjLbySOs0W78w@mail.gmail.com>
 <20181220125218.75t3cr3ehc6e4u6n@mac.citrite.net>
 <CACMJ4GaG8kZBkcFiEWMi_ENdJ4uX=c2YxFpgu_sKjUab7618dA@mail.gmail.com>
 <20190104085704.ga7wsqonhbzpv5as@mac.bytemobile.com>
 <5C2F5E0B020000780020A37A@prv1-mh.provo.novell.com>
 <20190104153555.cfjx5mofw6mjbudh@mac.bytemobile.com>
 <5C2F7FF8020000780020A495@prv1-mh.provo.novell.com>
 <20190107085912.gd5bp6y35drjg5gr@mac>
 <CABfawhmfhYkHreJ3A4xnmhJjW3581Zt0L5-Vsswz93ZZTMrFQw@mail.gmail.com>
 <CAPLaKK4nijCrfATvUXNf8MR8cfFHCA0Zk9mYmp0kYj96c4V9Qg@mail.gmail.com>
 <d71b17a9-0ff9-5c48-db96-33bef501d3e0@bitdefender.com>
 <CABfawhnA1-7DjCQTY_7Ddy32nB4wDQZV35oSm567kt+tmnDkCQ@mail.gmail.com>
 <CAPLaKK68W40=rZhAQKugQfZbhv7dtouJiX7=aLKBGrz9tpT-ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fPtS=PR=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghHGf-0003LT-Og
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 17:03:49 +0000
Received: by mail-oi1-f171.google.com with SMTP id y1so6847084oie.12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 09:03:48 -0800 (PST)
In-Reply-To: <CAPLaKK68W40=rZhAQKugQfZbhv7dtouJiX7=aLKBGrz9tpT-ag@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tim Deegan <tim@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, eric chanudet <eric.chanudet@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gOSwgMjAxOSBhdCA1OjUxIFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiA5LCAyMDE5IGF0IDk6NDggQU0gUmF6
dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIDEvOS8xOSA2OjM0IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPj4+Pj4gTWF5
YmUgdGhpcyBpcyB1c2UtY2FzZSBpcyBkaWZmZXJlbnQsIGJ1dCBob3cgZG9lcyBpbnRyb3NwZWN0
aW9uIGhhbmRsZQo+ID4gPj4+Pj4gYWNjZXNzZXMgdG8gdGhlIHNoYXJlZCBpbmZvIHBhZ2Ugb3Ig
dGhlIHJ1bnN0YXRlIGluZm8gZm9yIGV4YW1wbGU/Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gSSB3b3Vs
ZCBjb25zaWRlciBhcmdvIHRvIGJlIHRoZSBzYW1lIGluIHRoaXMgcmVnYXJkLgo+ID4gPj4+Pgo+
ID4gPj4+PiBOb3QgZXhhY3RseTogVGhlIHNoYXJlZCBpbmZvIHBhZ2UgaXMgc3BlY2lhbCBpbiBh
bnkgZXZlbnQuIEZvcgo+ID4gPj4+PiBydW5zdGF0ZSBpbmZvIChhbmQgYWxpa2UgLSB0aGVyZSdz
IGFsc28gc3RydWN0IHZjcHVfdGltZV9pbmZvKQo+ID4gPj4+PiBJJ2QgcXVlc3Rpb24gY29ycmVj
dG5lc3Mgb2YgdGhlIGN1cnJlbnQgaGFuZGxpbmcuIElmIHRoYXQncwo+ID4gPj4+PiB3cm9uZyBh
bHJlYWR5LCBJJ2QgcHJlZmVyIGlmIHRoZSBpc3N1ZSB3YXNuJ3Qgc3ByZWFkLgo+ID4gPj4+Cj4g
PiA+Pj4gVGhlcmUgYXJlIGFsc28gZ3JhbnRzLCB3aGljaCB3aGVuIHVzZWQgdG9nZXRoZXIgd2l0
aCBhbm90aGVyIGd1ZXN0IG9uCj4gPiA+Pj4gdGhlIHNhbWUgaG9zdCBjb3VsZCBhbGxvdyB0byBi
eXBhc3MgaW50cm9zcGVjdGlvbiBBRkFJQ1Q/ICh1bmxlc3MKPiA+ID4+PiB0aGVyZSdzIHNvbWUg
cG9saWN5IGFwcGxpZWQgdGhhdCBsaW1pdCBncmFudCBzaGFyaW5nIHRvIHRydXN0ZWQKPiA+ID4+
PiBkb21haW5zKQo+ID4gPj4+Cj4gPiA+Pj4gVEJIIEknbSBub3Qgc3VyZSBob3cgdG8gaGFuZGxl
IGh5cG9lcnZpc29yIGFjY2Vzc2VzIHdpdGgKPiA+ID4+PiBpbnRyb3NwZWN0aW9uLiAgTXkga25v
d2xlZGdlIG9mIGludHJvc3BlY3Rpb24gaXMgZmFpcmx5IGxpbWl0ZWQsIGJ1dAo+ID4gPj4+IGl0
IHBhdXNlcyB0aGUgZ3Vlc3QgYW5kIHNlbmRzIGEgbm90aWZpY2F0aW9uIHRvIGFuIGluIGd1ZXN0
IGFnZW50LiBJJ20KPiA+ID4+PiBub3Qgc3VyZSB0aGlzIGlzIGFwcGxpY2FibGUgdG8gaHlwZXJ2
aXNvciB3cml0ZXMsIHNpbmNlIGl0J3Mgbm90Cj4gPiA+Pj4gcG9zc2libGUgdG8gcGF1c2UgaHlw
ZXJ2aXNvciBleGVjdXRpb24gYW5kIHdhaXQgZm9yIGEgcmVzcG9uc2UgZnJvbSBhCj4gPiA+Pj4g
Z3Vlc3QgYWdlbnQuCj4gPiA+Pj4KPiA+ID4+Cj4gPiA+PiBJbnRyb3NwZWN0aW9uIGFwcGxpY2F0
aW9ucyBvbmx5IGNhcmUgYWJvdXQgbWVtb3J5IGFjY2Vzc2VzIHBlcmZvcm1lZAo+ID4gPj4gYnkg
dGhlIGd1ZXN0LiBIeXBlcnZpc29yIGFjY2Vzc2VzIHRvIG1vbml0b3JlZCBwYWdlcyBhcmUgbm90
IGluY2x1ZGVkCj4gPiA+PiB3aGVuIG1vbml0b3JpbmcgLSBpdCBpcyBhY3R1YWxseSBhIGZlYXR1
cmUgd2hlbiB1c2luZyB0aGUgZW11bGF0b3IgaW4KPiA+ID4+IFhlbiB0byBjb250aW51ZSBndWVz
dCBleGVjdXRpb24gYmVjYXVzZSB0aGUgaHlwZXJ2aXNvciBpZ25vcmVzIEVQVAo+ID4gPj4gbWVt
b3J5IHBlcm1pc3Npb25zIHRoYXQgdHJpcCB0aGUgZ3Vlc3QgZm9yIGludHJvc3BlY3Rpb24uIFNv
IGhhdmluZwo+ID4gPj4gdGhlIGh5cGVydmlzb3IgYWNjZXNzIG1lbW9yeSBvciBhIGdyYW50LXNo
YXJlZCBwYWdlIGJlaW5nIGFjY2Vzc2VkIGluCj4gPiA+PiBhbm90aGVyIGRvbWFpbiBhcmUgbm90
IGEgcHJvYmxlbSBmb3IgaW50cm9zcGVjdGlvbi4KPiA+ID4KPiA+ID4gQ2FuJ3QgdGhlbiB0d28g
Z3Vlc3RzIHJ1bm5pbmcgb24gdGhlIHNhbWUgaG9zdCBiZSBhYmxlIHRvIGNvbXBsZXRlbHkKPiA+
ID4gYnlwYXNzIGludHJvc3BlY3Rpb24/IEkgZ3Vlc3MgeW91IHByZXZlbnQgdGhpcyBieSBsaW1p
dGluZyB0byB3aGljaAo+ID4gPiBndWVzdHMgcGFnZXMgY2FuIGJlIHNoYXJlZD8KPiA+Cj4gPiBX
b3VsZCB0aGVzZSB0d28gZ3Vlc3RzIGJlIEhWTSBndWVzdHM/IEludHJvc3BlY3Rpb24gb25seSB3
b3JrcyBmb3IgSFZNCj4gPiBndWVzdHMuIEknbSBub3Qgc3VyZSBJIGZvbGxvdyB5b3VyIHNjZW5h
cmlvIHRob3VnaC4gSG93IHdvdWxkIHRoZXNlCj4gPiBndWVzdHMgY29sbGFib3JhdGUgdG8gZXNj
YXBlIGludHJvc3BlY3Rpb24gdmlhIGdyYW50cz8KPgo+IElmIHRoZXJlIGFyZSB0d28gZG9tYWlu
cyBhY3RpbmcgbWFsaWNpb3VzbHkgaW4gY29uY2VydCB0byBieXBhc3MKPiBtb25pdG9yaW5nIG9m
IG1lbW9yeSB3cml0ZXMgdGhleSBjb3VsZCBhY2hpZXZlIHRoYXQgd2l0aCBncmFudHMsIHllcy4K
PiBTYXkgYSB3cml0ZS1tb25pdG9yZWQgcGFnZSBpcyBncmFudC1zaGFyZWQgdG8gYW5vdGhlciBk
b21haW4sIHdoaWNoCj4gdGhlbiBkb2VzIHRoZSB3cml0ZSBvbiBiZWhhbGYgb2YgdGhlIGZpcnN0
LiBJIHdvdWxkbid0IHNheSB0aGF0J3MKPiAiY29tcGxldGVseSBieXBhc3NpbmcgaW50cm9zcGVj
dGlvbiIgdGhvdWdoLCB0aGVyZSBhcmUgbWFueSB0eXBlcyBvZgo+IGV2ZW50cyB0aGF0IGNhbiBi
ZSBtb25pdG9yZWQsIHdyaXRlLWFjY2Vzc2VzIGFyZSBvbmx5IG9uZS4gSSdtIG5vdAo+IGF3YXJl
IG9mIGFueSBtZWNoYW5pc20gdGhhdCBjYW4gYmUgdXNlZCB0byBsaW1pdCB3aGljaCBwYWdlcyBj
YW4gYmUKPiBzaGFyZWQgYnV0IHlvdSBjYW4gdXNlIFhTTSB0byByZXN0cmljdCB3aGljaCBkb21h
aW5zIGNhbiBzaGFyZSBwYWdlcwo+IHRvIGJlZ2luIHdpdGguIFRoYXQncyBub3JtYWxseSBlbm91
Z2guCgpZZXMsIEkgYXNzdW1lZCB0aGF0IHdvdWxkIGJlIHRoZSB3YXkgdG8gcHJvdGVjdCBhZ2Fp
bnN0IHN1Y2ggYXR0YWNrcywKaWU6IGxpbWl0aW5nIHRvIHdoaWNoIGd1ZXN0cyBwYWdlcyBjYW4g
YmUgc2hhcmVkLiBJIHRoaW5rIGp1c3QgbWFraW5nCnN1cmUgdGhlIHJpZ2h0IGFjY2VzcyBjaGVj
a3MgYXJlIHBsYWNlZCBpbiBYU00gKGp1c3QgbGlrZSB0aGV5IGFyZSBmb3IKZ3JhbnRzKSBzaG91
bGQgYmUgZW5vdWdoLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
