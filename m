From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/mm: Add mem access rights to NPT
Date: Mon, 02 Jul 2018 00:37:39 -0600
Message-ID: <5B39C83302000078001CF8E2@prv1-mh.provo.novell.com>
References: <1529335072-2141-1-git-send-email-aisaila@bitdefender.com>
 <5B2D1B0002000078001CD08E@prv1-mh.provo.novell.com>
 <1530195070.8880.9.camel@bitdefender.com>
 <5B34F36C02000078001CEEA0@prv1-mh.provo.novell.com>
 <1530197609.8880.14.camel@bitdefender.com>
 <5B35CDF502000078001350D8@prv1-mh.provo.novell.com>
 <1530261783.8880.18.camel@bitdefender.com>
 <5B35FE1C02000078001CF056@prv1-mh.provo.novell.com>
 <CABfawhmYHQy36bbQ_du0yHjbfNHwmoL=oDY+EX5COJeZA64SBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhmYHQy36bbQ_du0yHjbfNHwmoL=oDY+EX5COJeZA64SBg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: tamas@tklengyel.com
Cc: aisaila@bitdefender.com, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA2LjE4IGF0IDE4OjQyLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBKdW4gMjksIDIwMTggYXQgMzozOCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMjkuMDYuMTggYXQgMTA6NDIsIDxhaXNhaWxhQGJp
dGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+ID4gSSd2ZSBzdGFydGVkIGEgd2luIDcgbWFjaGluZSB3
aXRoIG5vIGludHJvc3BlY3Rpb24gb3IgeGVuLWFjY2Vzcy4gQWZ0ZXIKPj4gPiAzMCBtaW4gb2Yg
dXB0aW1lIHRoZXJlIHdlcmUgMCBpbnNlcnRzIGludG8gdGhlIHRyZWUuIEkgZ3Vlc3MgdGhlCj4+
ID4gb3ZlcmhlYWQgaXMgZG93biB0byBhIG1pbmltdW0gd2l0aCBubyB1c2VyIG1vZGlmaWVkIGFj
Y2VzcyByaWdodHMuCj4+Cj4+IFRoYW5rcywgdGhpcyBpcyBoZWxwZnVsIHRvIGtub3cuIEluIHRo
YXQgY2FzZSB0aG91Z2gsIGFzIHNhaWQgYmVmb3JlLCBJJ2QKPj4gbGlrZSB0byBhc2sgdG8gZGVm
ZXIgc2V0dGluZyB1cCBvZiB0aGUgcmFkaXggdHJlZSB0byB0aGUgcG9pbnQgd2hlcmUgaXQKPj4g
YWN0dWFsbHkgaXMgZ29pbmcgdG8gYmUgbmVlZGVkLgo+IAo+IEFyZSB5b3Ugd29ycmllZCBhYm91
dCB0aGUgcmFkaXggdHJlZSBiZWluZyBwcmVzZW50IChpZSByYWRpeF90cmVlX2luaXQKPiBoYXZl
IGJlZW4gY2FsbGVkKSBiZWZvcmUgaXQgaXMgdXNlZCBmb3IgbWVtX2FjY2Vzcz8gQXMgSSBzYWlk
IGVhcmxpZXIsCj4gYSBsb29rdXAgb24gYW4gZW1wdHkgcmFkaXggdHJlZSBpcyBlcXVpdmFsZW50
IG9mIGEgTlVMTCBjaGVjay4gSSBkb24ndAo+IGdldCBob3cgbm90IGhhdmluZyB0aGUgdHJlZSBp
bml0aWFsaXplZCB3aWxsIGJlIGFueSBmYXN0ZXIgdGhlbiBkb2luZwo+IGEgbG9va3VwIG9uIGFu
IGVtcHR5IG9uZS4KCk5vLCB0aGUgcXVlc3Rpb24gaXMgbm90IGFib3V0IHBlcmZvcm1hbmNlLiBU
aGUgcG9pbnQgaXMgYWJvdXQKcmVhc3N1cmFuY2UgdGhhdCB0aGUgdHJlZSBpc24ndCBnb2luZyB0
byBiZSB1c2VkIGluIG5vcm1hbCAobm9uLQppbnRyb3NwZWN0aW9uKSBvcGVyYXRpb24uIElmIGl0
IHN1ZGRlbmx5IGFuZCB1bmtub3dpbmdseSBiZWNhbWUKdXNlZCBkb3duIHRoZSByb2FkLCB0aGUg
cmVzb3VyY2UgY29uc3VtcHRpb24gcGF0dGVybiBvZgpkb21haW5zIG1heSBjaGFuZ2UgcXVpdGUg
c2lnbmlmaWNhbnRseS4gTm90IHNldHRpbmcgdXAgdGhlIHRyZWUKdW5sZXNzIG5lZWRlZCBsaWtl
bHkgYWxzbyBoZWxwcyByZXZpZXcgb2YgdGhlIGNoYW5nZXMsIGFzIGl0J2xsIGJlCm5lY2Vzc2Fy
eSB0byBtYWtlIHN1cmUgaW4gdGhlIHBhdGNoIHRoYXQgaXQgd29uJ3QgZ2V0IGFjY2Vzc2VkCndp
dGhvdXQgaGF2aW5nIGJlZW4gc2V0IHVwLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
