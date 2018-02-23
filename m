From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Fri, 23 Feb 2018 00:55:22 -0700
Message-ID: <5A8FD6FA02000078001AAB69@prv-mh.provo.novell.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <4a278c80-0009-b875-c7ec-ea3333ae83b0@citrix.com>
 <5A8EF37002000078001AA7AB@prv-mh.provo.novell.com>
 <2aa2cf71-64e1-a810-f194-a4a62279a1ce@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ep8CY-00079L-TX
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 07:55:30 +0000
In-Reply-To: <2aa2cf71-64e1-a810-f194-a4a62279a1ce@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE4IGF0IDIzOjE2LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDAyLzIyLzIwMTggMTA6NDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAyMi4wMi4xOCBhdCAxNTo1MywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+
Pj4gT24gMjIvMDIvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IC4uLiBmb3IgdW5r
bm93biBNU1JzOiB3cm1zcl9oeXBlcnZpc29yX3JlZ3MoKSdzIGNvbW1lbnQgY2xlYXJseSBzYXlz
Cj4+Pj4gdGhhdCB0aGUgZnVuY3Rpb24gcmV0dXJucyAwIGZvciB1bnJlY29nbml6ZWQgTVNScywg
c28KPj4+PiB7c3ZtLHZteH1fbXNyX3dyaXRlX2ludGVyY2VwdCgpIHNob3VsZCBub3QgY29udmVy
dCB0aGlzIGludG8gc3VjY2Vzcy4KPj4+Pgo+Pj4+IEF0IHRoZSB0aW1lIGl0IHdlbnQgaW4sIGNv
bW1pdCAwMTNlMzRmNWE2ICgieDg2OiBoYW5kbGUgcGFnZWQgZ2ZuIGluCj4+Pj4gd3Jtc3JfaHlw
ZXJ2aXNvcl9yZWdzIikgd2FzIHByb2JhYmx5IG9rYXksIHNpbmNlIHByaW9yIHRvIHRoYXQgdGhl
Cj4+Pj4gcmV0dXJuIHZhbHVlIHdhc24ndCBjaGVja2VkIGF0IGFsbC4gQnV0IHRoYXQncyBub3Qg
aG93IHdlIHdhbnQgdGhpbmdzCj4+Pj4gdG8gYmUgaGFuZGxlZCBub3dhZGF5cy4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IEkgYWdy
ZWUgaW4gcHJpbmNpcGxlLCBidXQgdGhpcyBkb2VzIGhhdmUgYSBsYXJnZSBwb3RlbnRpYWwgcmlz
ayBmb3IKPj4+IGd1ZXN0cy4gIEFueSB1bmtub3duIE1TUiB3aGljaCBndWVzdHMgZG9uJ3QgY2hl
Y2sgZm9yICNHUCBmYXVsdHMgZnJvbQo+Pj4gd2lsbCBub3cgY2F1c2UgdGhlIGd1ZXN0cyB0byBj
cmFzaC4KPj4+Cj4+PiBUaGF0IHNhaWQsIGl0IGlzIHRoZSBjb3JyZWN0IGRpcmVjdGlvbiB0byBn
byBsb25nLXRlcm0sIGFuZCB3ZSd2ZSBnb3QgdG8KPj4+IHRocm93IHRoZSBzd2l0Y2ggc29tZSB0
aW1lLCBidXQgSSBleHBlY3QgdGhpcyB3aWxsIGNhdXNlIHByb2JsZW1zIGluIHRoZQo+Pj4gc2hv
cnQgdGVybSwgZXNwZWNpYWxseSBmb3IgbWlncmF0ZWQtaW4gZ3Vlc3RzLgo+PiBUaGlua2luZyBh
Ym91dCB0aGlzIGFnYWluLCB0aGUgUkRNU1Igc2lkZSBvZiB0aGluZ3MgYWxyZWFkeSByYWlzZXMK
Pj4gI0dQIGZvciBpbmFjY2Vzc2libGUgTVNScy4gV2Ugb2J2aW91c2x5IGNhbid0IGRvIGEgcHJv
YmluZyBXUk1TUgo+PiBpbiB7c3ZtLHZteH1fbXNyX3dyaXRlX2ludGVyY2VwdCgpLCBidXQgY291
bGRuJ3Qgd2UgcmRtc3Jfc2FmZSgpCj4+IGluIHRoZSAiY2FzZSAwOiIgYmxvY2ssIHRyZWF0aW5n
IHRoZSByZXN1bHQgYXMgdGhlIHZlcmRpY3Qgd2hldGhlciB0bwo+PiByYWlzZSAjR1AgdG8gdGhl
IGd1ZXN0PyBBcyB0aGUgcmVhZCBwYXRoIGRvZXMgdGhpcyBhbnl3YXksIHdlJ3JlCj4+IG5vdCBl
eHBvc2luZyBvdXJzZWx2ZXMgdG8gbmV3IHJpc2tzLgo+IAo+IFdoYXQgYWJvdXQgd3JpdGUtb25s
eSBNU1JzPwoKQmFkIGx1Y2sgKEknbSBzb3JyeSB0byBzYXkgc28sIGJ1dCB3ZSBoYXZlIGFuIGFj
dHVhbCBidWcgdG8gZml4IGhlcmUpLgpJZiB3ZSBmaW5kIGFueSBzdWNoIGlzIHVzZWQsIHdlJ2xs
IGhhdmUgdG8gYWRkIGluZGl2aWR1YWwgY2FzZSBsYWJlbHMuCgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
