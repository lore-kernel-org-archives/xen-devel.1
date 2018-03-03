From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: Setting up a Xen x86 community call
Date: Fri, 2 Mar 2018 18:08:25 -0700
Message-ID: <CABfawhmNdxAY58aTwLMUiLQr8oEzouFmjNZhAJKG14s3M6UT6Q@mail.gmail.com>
References: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ieat=fz=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ervfo-0002l0-Dy
 for xen-devel@lists.xenproject.org; Sat, 03 Mar 2018 01:09:16 +0000
Received: by mail-wm0-f67.google.com with SMTP id h21so6210040wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Mar 2018 17:09:10 -0800 (PST)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com.
 [209.85.128.177])
 by smtp.gmail.com with ESMTPSA id f16sm7163428edj.68.2018.03.02.17.09.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Mar 2018 17:09:07 -0800 (PST)
Received: by mail-wr0-f177.google.com with SMTP id o76so11785223wrb.7
 for <xen-devel@lists.xenproject.org>; Fri, 02 Mar 2018 17:09:06 -0800 (PST)
In-Reply-To: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, Susie Li <susie.li@intel.com>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org, Jan Beulich <jbeulich@suse.com>, "Hurwitz,
 Sherry" <sherry.hurwitz@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMiwgMjAxOCBhdCA4OjM5IEFNLCBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoLnhl
bkBnbWFpbC5jb20+IHdyb3RlOgo+IEhpIGFsbCwKPiAoc29ycnkgZm9yIHRoZSBleHRlbnNpdmUg
ZGlzdHJpYnV0aW9uIGxpc3QgLSBJIHdlbnQgdGhyb3VnaCBNQUlOVEFJTkVSUyBhbmQgcGVvcGxl
IHdobyBtYXkgaGF2ZSBhbiBpbnRlcmVzdCkKPgo+IEkgd291bGQgbGlrZSB0byBzdGFydCBvcmdh
bml6aW5nIGEgcmVjdXJyaW5nIHg4NiBjb21tdW5pdHkgY2FsbCB0byBkaXNjdXNzIGFuZCBzeW5j
LXVwIG9uIHVwY29taW5nIGZlYXR1cmVzIGZvciBYZW4gb24geDg2LiBUaGlzIGNhbGwgd291bGQg
bWlycm9yIGFuZCBmb2xsb3cgYSBzaW1pbGFyIHN0cnVjdHVyZSB0byB0aGUgQVJNIGNhbGwgKHNl
ZSBodHRwOi8veGVuLm1hcmttYWlsLm9yZy90aHJlYWQveHFkeHZxY2pwZjJ5NWZ0dSBmb3IgdGhl
IGxhc3Qgb25lKQo+Cj4gSSBleHBlY3QgdGhhdCB0aGUgY2FsbCB3aWxsIGNvbnRhaW4KPgo+IGEp
IENvb3JkaW5hdGlvbiBhbmQgUGxhbm5pbmcKPiBDb29yZGluYXRpbmcgd2hvIGRvZXMgd2hhdCwg
d2hhdCBuZWVkcyBhdHRlbnRpb24sIHdoYXQgaXMgYmxvY2tlZCwgZXRjLgo+IEkgd291bGQgcHJl
cGFyZSBhIGxpc3Qgb2Ygbm9uLW1lcmdlZCBwYXRjaCBzZXJpZXMgb2YgYSBjZXJ0YWluIHNpemUg
KGUuZy4gbW9yZSB0aGFuIDUgcGF0Y2hlcykgYW5kIGF0dGFjaCB0byB0aGUgaW52aXRlCj4gSWYg
YW55dGhpbmcgaXMgbWlzc2VkLCBJIHdvdWxkIGV4cGVjdCB0aGF0IHRoZXNlIGFyZSBzZW50IHRv
IG1lIGJlZm9yZSB0aGUgbWVldGluZwo+Cj4gYikgRGVzaWduIGFuZCBhcmNoaXRlY3R1cmUgcmVs
YXRlZCBkaXNjdXNzaW9uczogaW4gcGFydGljdWxhciBmb3IgYmlnZ2VyLCBtb3JlIGNvbXBsZXgg
aXRlbXMsIC4uLgo+IEFsdGhvdWdoIGFsbCBvZiB0aGlzIGNvdWxkIGJlIGRvbmUgYnkgZW1haWws
IGluIHJlYWxpdHksIHdlIGFyZSBhbGwgaHVtYW4gYW5kIG1hbnkgcGVvcGxlIGZpbmQgaXQgZWFz
aWVyIHRvIGNvbGxhYm9yYXRlCj4gYW5kIGNvbW11bmljYXRlIGJ5IHRhbGtpbmcgdG8gZWFjaCBv
dGhlciwgcmF0aGVyIHRoYW4gYnkgZW1haWwuIFRoaXMgaXMgbm90IGEgbXVzdCwgYnV0IGFuIG9w
dGlvbiB0byBoaWdobGlnaHQgaXNzdWVzCj4KPiBjKSBEZW1vcywgU2hhcmluZyBvZiBFeHBlcmll
bmNlcywgU29tZXRpbWVzIGRpc2N1c3Npb24gb2Ygc3BlY2lmaWMgaXNzdWVzL2J1Z3MvcHJvYmxl
bXMvLi4uCj4gVGhpcyBpcyBzb21ldGhpbmcgd2hpY2ggaGFwcGVucyBmcmVxdWVudGx5IG9uIHRo
ZSBBUk0gY2FsbCBhbmQgc2VlbXMgdG8gd29yayB2ZXJ5IHdlbGwKPgo+IEkgd291bGQgc3VnZ2Vz
dCB0byBzdGFydCB3aXRoIGEgMSBob3VyIG1vbnRobHkgbWVldGluZzogcG9zc2libHkgZXZlcnkg
Mm5kIFR1ZSBvciBUaHUgZWFjaCBtb250aCAoZGVwZW5kcyBvbiB0aW1pbmcpLiBJIGtub3cgdGhh
dCBwZW9wbGUgYXJlIHNwcmVhZCBhY3Jvc3MgZGlmZmVyZW50IHRpbWV6b25lcyAoZnJvbSBDaGlu
YSB0byB0aGUgVVMpLCBzbyBJIHdvdWxkIGxpa2UgdG8gZ2F0aGVyIHRob3VnaHRzIGJlZm9yZSBj
aG9vc2luZyBhIHRpbWUuIFdlIG1heSBoYXZlIHRvIGhhdmUgYWx0ZXJuYXRpbmcgdGltZS1zbG90
cyBldmVyeSBvdGhlciBtb250aDogYnV0IHRoaXMgaXMgbm90IGlkZWFsIGZvciBzb21lLgo+Cj4g
VG8gZG8gdGhpcywgcGxlYXNlCj4gKiBSYWlzZSB5b3VyIGhhbmRzIG9uIHdoZXRoZXIgeW91IG9y
IHlvdXIgb3JnIHdvdWxkIHdhbnQgdG8gcGFydGljaXBhdGUKClxvLwoKPiAqIFByb3ZpZGUgeW91
ciB0aW1lem9uZQoKTVNUCgo+ICogUHJvdmlkZSBhIFVUQyB0aW1lIHJhbmdlIHdoZW4geW91IGNh
biBhdHRlbmQKCjE1OjAwLTIzOjAwCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
