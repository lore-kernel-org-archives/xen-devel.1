From: Isaila Alexandru <aisaila@bitdefender.com>
Subject: Re: [PATCH v4] x86/mm: Add mem access rights to NPT
Date: Thu, 09 Aug 2018 15:14:45 +0300
Message-ID: <1533816885.10950.1.camel@bitdefender.com>
References: <1532353689-2242-1-git-send-email-aisaila@bitdefender.com>
 <5B56E99D02000078001D706B@prv1-mh.provo.novell.com>
 <31981fe5-90b4-9490-08d9-f58afc28b6b1@citrix.com>
 <5B57154C02000078001D72F6@prv1-mh.provo.novell.com>
 <9ad5e355-8d22-c67c-b803-46dc935fe47b@citrix.com>
 <5B5852F402000078001D79E9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B5852F402000078001D79E9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, george.dunlap@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTWksIDIwMTgtMDctMjUgYXQgMDQ6MzcgLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4g
Cj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IE9uIDI1LjA3LjE4IGF0IDExOjI1LCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIDA3LzI0LzIwMTggMDE6MDIgUE0sIEphbiBC
ZXVsaWNoIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gT24gMjQuMDcuMTggYXQgMTM6MjYsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4gPiA+IE9uIDA3LzI0LzIwMTggMDk6NTUgQU0sIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gPiBPbiAyMy4wNy4xOCBhdCAxNTo0OCwgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqB7Cj4gPiA+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZnJlZShkLT5hcmNoLm1vbml0b3IubXNyX2JpdG1h
cCk7Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsK
PiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgcmFkaXhfdHJlZV9pbml0KHAybS0+bWVtX2FjY2Vzc19zZXR0aW5ncyk7Cj4gPiA+ID4gPiA+
ICvCoMKgwqDCoH0KPiA+ID4gPiA+IFdoYXQncyB0aGUgU1ZNIGNvbm5lY3Rpb24gaGVyZT8gUGxl
YXNlIGRvbid0IGZvcmdldCB0aGF0IHAybS0KPiA+ID4gPiA+IHB0LmMKPiA+ID4gPiA+IGFsc28g
c2VydmVzIHRoZSBzaGFkb3cgY2FzZS4gUGVyaGFwcyBzdHJ1Y3QgcDJtX2RvbWFpbiBzaG91bGQK
PiA+ID4gPiA+IGNvbnRhaW4gYSBib29sZWFuIGluZGljYXRvciB3aGV0aGVyIHRoaXMgYXV4aWxp
YXJ5IGRhdGEKPiA+ID4gPiA+IHN0cnVjdHVyZSBpcwo+ID4gPiA+ID4gbmVlZGVkPwo+ID4gPiA+
IEl0J3MgYmFzaWNhbGx5IGp1c3QgImhhcF9lbmFibGVkKCkiIGlzbid0IGl0Pwo+ID4gPiBPbmx5
IGlmIHdlIGNhbid0IG1ha2UgaXQgdGhlcmUgd2hlbiBFUFQgaXMgYWN0aXZlLgo+ID4gSXQgY2Fu
IG1ha2UgaXQgaGVyZSB3aGVuIFZNWCBpcyBhY3RpdmUgYW5kIHNoYWRvdyBpcyBlbmFibGVkLCBi
dXQKPiA+IGl0Cj4gPiBzaG91bGRuJ3QgYmUgYWJsZSB0byBnZXQgaGVyZSB3aGVuIEVQVCBpcyBh
Y3RpdmUuwqDCoFdlIGNvdWxkIGFkZCBhbgo+ID4gQVNTRVJUKCkgdG8gdGhhdCBlZmZlY3Q7IGl0
IHNob3VsZCBiZSBzYWZlIGluIHByb2R1Y3Rpb24sIGFzIHRoZQo+ID4gb25seQo+ID4gc2lkZSBl
ZmZlY3Qgc2hvdWxkIGJlIHRoYXQgd2UgZG8gYSBzbWFsbCBwb2ludGxlc3MgYWxsb2NhdGlvbi4K
PiBTbyBJJ3ZlIGxvb2tlZCBhIGxpdHRsZSBtb3JlIGNsb3NlbHk6IFRoaXMgaXMgYmVpbmcgYWRk
ZWQgdG8KPiBhcmNoX21vbml0b3JfaW5pdF9kb21haW4oKSwgY2FsbGVkIGZyb20gdm1fZXZlbnRf
ZG9tY3RsKCkuIEkgY2FuJ3QKPiBzZWUgd2h5IHRoaXMgd291bGRuJ3QgYmUgcmVhY2hhYmxlIHdp
dGggRVBUIGVuYWJsZWQuCj4gCkhpIEdlb3JnZSzCoAoKQW55IHRob3VnaHRzIG9uIHRoaXM/CgpU
aGFua3MsCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
