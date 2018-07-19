From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] x86/HVM: prefill cache with PDPTEs when
 possible
Date: Thu, 19 Jul 2018 12:15:55 +0100
Message-ID: <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zjjl=kd=citrix.com=prvs=7313ab634=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fg6ue-0002EQ-Co
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 11:16:00 +0000
In-Reply-To: <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDcvMTggMTE6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFNpbmNlIHN0cmljdGx5IHNw
ZWFraW5nIGl0IGlzIGluY29ycmVjdCBmb3IgZ3Vlc3Rfd2Fsa190YWJsZXMoKSB0byByZWFkCj4g
TDMgZW50cmllcyBkdXJpbmcgUEFFIHBhZ2Ugd2Fsa3MsIHRyeSB0byBvdmVyY29tZSB0aGlzIHdo
ZXJlIHBvc3NpYmxlIGJ5Cj4gcHJlLWxvYWRpbmcgdGhlIHZhbHVlcyBmcm9tIGhhcmR3YXJlIGlu
dG8gdGhlIGNhY2hlLiBTYWRseSB0aGUKPiBpbmZvcm1hdGlvbiBpcyBhdmFpbGFibGUgaW4gdGhl
IEVQVCBjYXNlIG9ubHkuIE9uIHRoZSBwb3NpdGl2ZSBzaWRlIGZvcgo+IE5QVCB0aGUgc3BlYyBz
cGVsbHMgb3V0IHRoYXQgTDMgZW50cmllcyBhcmUgYWN0dWFsbHkgcmVhZCBvbiB3YWxrcywgc28K
PiB1cyByZWFkaW5nIHRoZW0gaXMgY29uc2lzdGVudCB3aXRoIGhhcmR3YXJlIGJlaGF2aW9yIGlu
IHRoYXQgY2FzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkknbSBhZnJhaWQgdGhhdCB0aGlzIGlzbid0IGFyY2hpdGVjdHVyYWxseSBjb3JyZWN0
LsKgIEl0IG1lYW5zIHRoYXQgYW4KZW11bGF0ZWQgbWVtb3J5IGFjY2VzcyB3aWxsIHJlYWQgdGhl
IFBEUFRFIHJlZ2lzdGVyIHZhbHVlcywgcmF0aGVyIHRoYW4Kd2hhdCBpcyBhY3R1YWxseSBpbiBS
QU0uCgpBcyBhbiBhbHRlcm5hdGl2ZSB3aXRoIHRoZSBzYW1lIGVmZmVjdCwgaG93IGFib3V0IGlu
IHRoZSBFUFQgY2FzZSwKcGFzc2luZyBpbiBhIHRvcF9tYXAgcG9pbnRlciB0byBhIGxvY2FsIHBp
ZWNlIG9mIHN0YWNrIHdpdGggdGhlIFBEUFRFCnJlZ2lzdGVycyByZWFkIG91dCBvZiBoYXJkd2Fy
ZT/CoCBUaGF0IHdheSwgd2UgZG9uJ3QgcmVhZCBtZW1vcnkgb24gdGhlCnBhZ2V3YWxrLCB5ZXQg
ZG9uJ3QgaW50ZXJmZXJlIHdpdGggb3RoZXIgZW11bGF0ZWQgbWVtb3J5IGFjY2Vzc2VzPwoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
