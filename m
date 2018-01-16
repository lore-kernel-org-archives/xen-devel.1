From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86: Meltdown band-aid against
 malicious 64-bit PV guests
Date: Tue, 16 Jan 2018 05:25:53 -0700
Message-ID: <5A5DFD61020000780019F129@prv-mh.provo.novell.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5C994B020000780019EB94@prv-mh.provo.novell.com>
 <793eca29-b24b-9807-cc37-fd0332b35dbe@citrix.com>
 <5A5DD508020000780019F03C@prv-mh.provo.novell.com>
 <a625a145-b7f5-fcc5-f4c9-cc4748fb7565@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=n0uv=el=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ebQJT-0007kB-MG
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 12:25:59 +0000
In-Reply-To: <a625a145-b7f5-fcc5-f4c9-cc4748fb7565@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE4IGF0IDEyOjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDEvMTggMDk6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNS4w
MS4xOCBhdCAxOToyMywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MTUvMDEvMTggMTE6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IFRoaXMgYWxzbyB3YW50cyBB
bmRyZXcncyAiW1BBVENIIFJGQyAxMS80NF0geDg2L3B0LXNoYWRvdzogQWx3YXlzIHNldAo+Pj4+
IF9QQUdFX0FDQ0VTU0VEIG9uIEw0ZSB1cGRhdGVzIi4KPj4+IEkndmUgY2xlYW5lZCB0aGlzIHBh
dGNoIHVwIGFuZCBjb21taXR0ZWQgaXQgaW4gcHJlcGFyYXRpb24uCj4+Pgo+Pj4gaHR0cDovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWNvbW1pdGRpZmY7aD1iZDYxZmU5NGJl
ZTA1NTZiYzJmNiAKPiAKPj4+IDQ5OTlhNGE4MzE1YjkzZjkwZjIxCj4+IE9ubHkgbm93IHRoYXQg
SSdtIGRvaW5nIGJhY2twb3J0cyB0aGVyZW9mIEkgbm90aWNlIGFuIG9kZGl0eSB3aXRoCj4+IDMy
LWJpdCBndWVzdCBoYW5kbGluZzogV2h5IHdvdWxkIHlvdSBzZXQgdGhlIGFjY2Vzc2VkIGJpdCBp
biB0aGF0Cj4+IGNhc2U/IFRoZSBMNCBpcyBhbiBpbnRlcm5hbCB0aGluZyB0aGVyZSwgYW5kIGhl
bmNlIGJ5IHVzIGtub3dpbmcKPj4gdGhhdCB3ZSBkb24ndCBjYXJlLCB0aGlzIGlzIHVubmVjZXNz
YXJ5IChidXQgb2YgY291cnNlIGFsc28gbm90Cj4+IHdyb25nKS4gSSdsbCBkbyB0aGUgNC45IGFu
ZCBvbGRlciBiYWNrcG9ydHMgYWNjb3JkaW5nIHRvIHRoYXQKPj4gb2JzZXJ2YXRpb24gKG1ha2lu
ZyBmb3Igc2xpZ2h0bHkgbGVzcyBvZiBhIGNvZGUgY2hhbmdlKS4KPiAKPiBUaGVyZSBhcmUgbm8g
cGF0aHMgbGVhZGluZyB0byBhZGp1c3RfZ3Vlc3RfbDRlKCkgZm9yIDMyYml0IFBWIGd1ZXN0cy4g
Cj4gVGhlIG9ubHkgTDQgaGFuZGxpbmcgd2hpY2ggZXhpc3RzIGlzIGNvbnN0cnVjdGluZyB0aGUg
bW9uaXRvciB0YWJsZSwKPiB3aGljaCB3cml0ZXMgdGhlIFBURXMgZGlyZWN0bHkuCgpZZWFoLCBJ
IGRpZCByZWFsaXplIHRoaXMgYWZ0ZXIgd3JpdGluZy4gVGhlIGNoZWNrIGNvdWxkIHByb2JhYmx5
CmdvIGF3YXkgYWx0b2dldGhlci4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
