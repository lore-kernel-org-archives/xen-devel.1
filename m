From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Setting up a Xen x86 community call
Date: Wed, 7 Mar 2018 13:27:45 +0100
Message-ID: <83E88477-F05E-4317-8643-85F54521BD78@gmail.com>
References: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rihp=f5=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1etYAh-00089z-Nw
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 12:27:51 +0000
Received: by mail-wm0-x241.google.com with SMTP id i3so4321997wmi.4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Mar 2018 04:27:50 -0800 (PST)
In-Reply-To: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Christopher Clark <christopher.w.clark@gmail.com>, daniel.kiper@oracle.com
Cc: Janakarajan Natarajan <jnataraj@amd.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 'Susie Li' <susie.li@intel.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, paul.durrant@citrix.com, committers@xenproject.org, "Hurwitz, Sherry" <sherry.hurwitz@amd.com>, Chao Peng <chao.p.peng@linux.intel.com>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKdGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEl0IHNlZW1zIHRvIG1lIHRoYXQgdGhl
IGZvbGxvd2luZyB0aW1lcyBzYXRpc2Z5IGFsbCByZXF1aXJlbWVudHMuIFRob3NlIHdpdGggbWlu
b3IgaXNzdWVzIGFyZSBvbiB0aGUgVE8gbGlzdCBhbmQgY2FsbGVkIG91dCBiZWxvdy4KCldpbnRl
cgo9PT09PT0KMTU6MDAgLSAxNjowMCBVVEMKMDc6MDAgLSAwODowMCBQYWNpZmljCjA5OjAwIC0g
MTA6MDAgQXVzdGluCjEwOjAwIC0gMTE6MDAgTmV3IFlvcmsKMTU6MDAgLSAxNjowMCBMb25kb24K
MTY6MDAgLSAxNzowMCBCZXJsaW4KMjM6MDAgLSAyNDowMCBCZWlqaW5nCgpTdW1tZXIKPT09PT09
CjE0OjAwIC0gMTU6MDAgVVRDCjA3OjAwIC0gMDg6MDAgUGFjaWZpYwowOTowMCAtIDEwOjAwIEF1
c3RpbgoxMDowMCAtIDExOjAwIE5ldyBZb3JrCjE1OjAwIC0gMTY6MDAgTG9uZG9uCjE2OjAwIC0g
MTc6MDAgQmVybGluCjIyOjAwIC0gMjM6MDAgQmVpamluZwoKU2VlIGh0dHBzOi8vd3d3LnRpbWVh
bmRkYXRlLmNvbS90aW1lL2RzdC9ldmVudHMuaHRtbCBmb3Igc3VtbWVyIHRpbWUgY2hhbmdlcyBz
cGVjaWZpYyBjb3VudHJpZXMKClRoZSBpbmZvcm1hdGlvbiBpcyBhbHNvIGNvbGxhdGVkIGluIGh0
dHBzOi8vZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFKUlR5NnU2WmZ3Zk4wd1JuVzc5
Ykp0S3ZNaE1EVGNRSXV0cEx6NEdkekZvL2VkaXQ/dXNwPXNoYXJpbmcgKHRoZSBzZWNvbmQgdGFi
IHNob3dzIGEgc25pcHBldCBvZiB0aGUgd29ybGQgY2xvY2spCgpKYW4gQmV1bGljaDogCk9ubHkg
V2VkIHVwIHRvIDE3OjAwIAoKRGFuaWVsIEtpcGVyOiAKQ2FuJ3QgZG8gdGhpcyBzbG90IG9uIFR1
ZXNkYXksIGFuZCBub3QgVGh1cnNkYXkKQnV0IEkgYW0gYXNzdW1pbmcgV2VkIG1heSB3b3JrLiAK
SWYgbm90LCBJIGhvcGUgdGhhdCBzb21lb25lIGVsc2UgZnJvbSBPcmFjbGUgY2FuIGF0dGVuZCBp
bnN0ZWFkLgoKQ2hyaXN0b3BoZXIgQ2xhcms6IApOb3QgdGhlIHByZWZlcnJlZCwgYnV0IGEgdG9s
ZXJhYmxlIHNsb3QuIApTbyBJIGFtIGFzc3VtaW5nIHRoaXMgd291bGQgYmUgT0sKCk15IHByb3Bv
c2FsIHdvdWxkIGJlIHRvIGhvbGQgdGhlIG1lZXRpbmcgYXQgbGVhc3QgZm9yIHRoZSBuZXh0IDMg
bW9udGhzIHRoZSAybmQgV2VkbmVzZGF5IGF0IDE1OjAwIC0gMTY6MDAgR01UL0JTVCwgc3RhcnRp
bmcgZnJvbSBXZWQsIE1hcmNoIDE0dGgKCkZvciBleGFjdCB0aW1lem9uZXMsIHNlZSBodHRwczov
L3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1sP3llYXI9
MjAxOCZtb250aD0zJmRheT0xNCZob3VyPTE1Jm1pbj0wJnNlYz0wJnAxPTIyNCZwMj0yNCZwMz0x
NzkmcDQ9MTM2JnA1PTM3JnA2PTMzCgpOb3RlIHRoYXQgb24gdGhhdCBkYXksIHRoZSBVUyB3aWxs
IGFscmVhZHkgYmUgaW4gZGF5bGlnaHQgc2F2aW5ncywgd2hpbGUgRXVyb3BlIGlzIG5vdC4KCkdp
dmVuIHRoYXQgZm9yIHRoZSA0LjExIHJlbGVhc2UsIHRoZSBmb2xsb3dpbmcgZGF0ZXMgaG9sZAoq
IExhc3QgcG9zdGluZyBkYXRlOiBNYXJjaCAxNnRoLCAyMDE4CiogSGFyZCBjb2RlIGZyZWV6ZTog
TWFyY2ggMzB0aCwgMjAxOAoKSSB3aWxsIGdvIGFoZWFkIGFuZCBib29rIHRoZSBtZWV0aW5nIGFu
ZCBzZW5kIG91dCBhIG1lZXRpbmcgaW52aXRlIHdpdGggcGVvcGxlIGluZGljYXRpbmcgaW50ZXJl
c3QgYmVpbmcgYWRkZWQgdG8gdGhlIENDIGxpc3QuCgpCZXN0IFJlZ2FyZHMKTGFycwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
