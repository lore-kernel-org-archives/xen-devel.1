From: Karl Johnson <karljohnson.it@gmail.com>
Subject: Re: Recent 4.9 kernel not booting as dom0
Date: Wed, 11 Jul 2018 15:39:49 -0400
Message-ID: <CAAzNQHT97==QQOqepDAntuaPaMSHsZeZvcQ8w+9Kn9JVafrxUg@mail.gmail.com>
References: <CAAzNQHQGhtGReJ=7p=i7nQE72pQdWgsyYRp=K2KBzbqKt3HyLA@mail.gmail.com>
 <755ba9c6-34c8-1a06-73c2-7afbc02b1bbd@suse.com>
 <adcdd60e-50e4-86ed-3573-efc407ae9b78@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0yim=j3=gmail.com=karljohnson.it@srs-us1.protection.inumbo.net>)
 id 1fdKy3-0000Kb-Pi
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 19:40:03 +0000
Received: by mail-lf0-x243.google.com with SMTP id u202-v6so22209428lff.9
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jul 2018 12:40:02 -0700 (PDT)
In-Reply-To: <adcdd60e-50e4-86ed-3573-efc407ae9b78@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdWwgNSwgMjAxOCBhdCA2OjU3IEFNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwNS8wNy8xOCAxMjoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
PiA+IE9uIDA0LzA3LzE4IDIwOjE2LCBLYXJsIEpvaG5zb24gd3JvdGU6Cj4gPj4gSGVsbG8sCj4g
Pj4KPiA+PiBJJ20gYnVpbGRpbmcgZG9tMCBrZXJuZWwgUlBNcyBmb3IgdGhlIENlbnRPUyBYZW4g
cHJvamVjdAo+ID4+IChodHRwczovL2dpdGh1Yi5jb20vQ2VudE9TLXZpcnQ3L3hlbi1rZXJuZWwp
IGFuZCBpdCBzZWVtcyB0aGF0IHRoZSA0LjkKPiA+PiBicmFuY2ggaXNuJ3QgYm9vdGluZyBhbnlt
b3JlIGFzIGRvbTAuIEkgcmVjZW50bHkgYnVpbHQgNC45LjExMCBhbmQKPiA+PiA0LjkuMTExLCBi
b3RoIGdpdmUgYmxhY2sgc2NyZWVuIGFuZCByZWJvb3Qgd2hpbGUgYm9vdGluZyBkb20wLiBPdXIg
bGFzdAo+ID4+IHN1Y2Nlc3NmdWwgdmVyc2lvbiBpcyA0LjkuMTA1IHRoZXJlZm9yZSBzb21ldGhp
bmcgbXVzdCBiZSB3cm9uZyBiZXR3ZWVuCj4gPj4gNC45LjEwNiBhbmQgNC45LjExMC4KPiA+Pgo+
ID4+IEkgY2hlY2tlZCB0aGUgT1NTVEVTVCBmb3IgbGludXgtNC45IGFuZCB0aGUgbGFzdCB3b3Jr
aW5nIGZsaWdodCB3YXMKPiA+PiA0LjkuMTAxLiBJcyB0aGVyZSBhIGtub3duIGlzc3VlIHdpdGgg
WGVuIGFuZCBMaW51eCA0Ljk/Cj4gPgo+ID4gSSB0aGluayBJJ3ZlIGZvdW5kIHRoZSByZWFzb24u
IFRlc3RpbmcgYSBwYXRjaCByaWdodCBub3cuCj4KPiBJdCB3b3JrZWQuIEkgaGF2ZSBhbHJlYWR5
IHNlbnQgaXQgdG8gc3RhYmxlLiBJbiBjYXNlIHlvdSB3YW50IHRvIHRyeQo+IGl0IEknbSBhdHRh
Y2hpbmcgaXQgZm9yIHJlZmVyZW5jZS4KPgo+Cj4gSnVlcmdlbgoKVGhhbmtzLCB0aGUgcGF0Y2gg
aGFzIGJlZW4gcm9sbGVkIGluIHN0YWJsZSBhbmQgaXQgd29ya3MuCgpbcm9vdEBub2RlLXRtcDEg
fl0jIGNhdCAvcHJvYy92ZXJzaW9uCkxpbnV4IHZlcnNpb24gNC45LjExMi0zMi5lbDYueDg2XzY0
IChtb2NrYnVpbGRAYnVpbGQuYWVyaXNuZXR3b3JrLm5ldCkKKGdjYyB2ZXJzaW9uIDQuNC43IDIw
MTIwMzEzIChSZWQgSGF0IDQuNC43LTIzKSAoR0NDKSApICMxIFNNUCBXZWQgSnVsCjExIDEzOjAz
OjI2IEVEVCAyMDE4CgpLYXJsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
