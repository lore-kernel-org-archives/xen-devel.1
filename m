From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 20/21] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Wed, 18 Jul 2018 17:59:11 +0100
Message-ID: <e4e16cba-2545-1b4e-e15c-ac10c1a2b8a5@arm.com>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-20-git-send-email-sstabellini@kernel.org>
 <72242a48-711c-0e6d-0885-eeb88cfcfa66@arm.com>
 <5B4EE84D02000078001D5343@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4EE84D02000078001D5343@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMTgvMDcvMTggMDg6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE3
LjA3LjE4IGF0IDIyOjI5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAwNy8w
Ny8yMDE4IDAwOjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBUb2RheSBDdHJsLUFB
QSBpcyB1c2VkIHRvIHN3aXRjaCBiZXR3ZWVuIFhlbiBhbmQgRG9tMC4gRXh0ZW5kIHRoZQo+Pj4g
bWVjaGFuaXNtIHRvIGFsbG93IGZvciBzd2l0Y2hpbmcgYmV0d2VlbiBYZW4sIERvbTAsIGFuZCBh
bnkgb2YgdGhlCj4+PiBpbml0aWFsIERvbVUgY3JlYXRlZCBmcm9tIFhlbiBhbG9uZ3NpZGUgRG9t
MCBvdXQgb2YgaW5mb3JtYXRpb24gcHJvdmlkZWQKPj4+IHZpYSBkZXZpY2UgdHJlZS4KPj4gSXQg
ZmVlbHMgYSBiaXQgcGFpbmZ1bCBmb3IgdGhlIHVzZXIgdG8gc3dpdGNoIE4gdGltZXMgdG8gZ2V0
IGhpcyBkb21haW4KPj4gY29uc29sZS4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gcHJvdmlkZSBh
IG5ldyBrZXkgYmluZGluZyB3aGVyZSB5b3UKPj4gdHlwZSB0aGUgZG9tYWluIElEIHlvdSB3YW50
IHRvIHN3aXRjaCB0bz8KPiAKPiBEb2VzIHRoYXQgbWVhbiB5b3UnZCB3YW50IHRvIHVzZSAwLTkg
Zm9yIHRoaXMgcHVycG9zZT8gSSdkIGJlCj4gdmVyeSBoZXNpdGFudCB0byBhY2NlcHQgc3VjaCwg
YXMgd2UncmUgcHJldHR5IHRpZ2h0IHdpdGggYXZhaWxhYmxlCj4gY2hhcmFjdGVycyBhbHJlYWR5
LiBBbmQgb2YgY291cnNlIDAtOSB3b3VsZG4ndCBzY2FsZSB0byBEb20xMAo+IGFuZCBiZXlvbmQu
IElmIHlvdSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQsIEkgdGhpbmsgaXQgd291bGQKPiBo
ZWxwIGlmIHlvdSBzcGVsbGVkIHRoaXMgb3V0LgoKVGhhdCB3aGF0IEkgaGFkIGluIG1pbmQuIEkg
YWdyZWUgdGhhdCB0aGlzIHNvbHV0aW9uIHdvdWxkIG5vdCBzY2FsZSB0byAKRG9tMTAgYW5kIGJl
eW9uZC4gQnV0IHRoYXQgcmluZyBzb2x1dGlvbiBpcyBub3QgZ29pbmcgdG8gYmUgYW55IGJldHRl
ci4KCkxldCdzIGltYWdpbmUgeW91IHdhbnQgdG8gc3dpdGNoIGJldHdlZW4gZG9tYWluIDkgYW5k
IDguIFlvdSB3b3VsZCBuZWVkIAp0byB0eXBlIENUUkwtQUFBIE4gdGltZSBiZWZvcmUgcmVhY2hp
bmcgdGhlIHJpZ2h0IGNvbnNvbGUuIE4gYmVlbiB0aGUgCm51bWJlciBvZiBkb21haW4geW91IGhh
dmUgdXNpbmcgdGhlIGNvbnNvbGUuCgpJdCBmZWVscyBsaWtlLCB5b3Ugd2FudCB0byBwcm92aWRl
IGEga2V5IGZvciBzZWxlY3RpbmcgdGhlIGNvbnNvbGUgKGUuZyAKJ2MnKSBhbmQgdGhlbiB0eXBl
IHRoZSBkb21haW4gSUQgeW91IHdhbnQgdG8gYWNjZXNzLiBDYW4geW91IHJlYWQgCmFub3RoZXIg
a2V5IHdoZW4gaW4gdGhlIGtleWhhbmRsZXI/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
