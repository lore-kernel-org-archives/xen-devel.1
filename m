From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2 2/2] x86: allow Meltdown band-aid to be
	disabled
Date: Tue, 16 Jan 2018 12:40:14 +0000
Message-ID: <CAFLBxZZfBKNyueHdG7aowHRut_3jSKkTtJ_3exNOWxaxOwkM2Q@mail.gmail.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5C996A020000780019EB97@prv-mh.provo.novell.com>
 <CAFLBxZa12YCq_=jnPK_s-ZbRk6=p9AL+MY0K=SiJL+e-OT+4ZA@mail.gmail.com>
 <5A5DFF9D020000780019F13E@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=prux=el=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ebQXI-000195-6j
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 12:40:16 +0000
Received: by mail-qk0-x22b.google.com with SMTP id l29so11035929qkj.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 04:40:14 -0800 (PST)
In-Reply-To: <5A5DFF9D020000780019F13E@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMTI6MzUgUE0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTYuMDEuMTggYXQgMTM6MTIsIDxkdW5sYXBnQHVtaWNo
LmVkdT4gd3JvdGU6Cj4+IE9uIE1vbiwgSmFuIDE1LCAyMDE4IGF0IDExOjA3IEFNLCBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4gRmlyc3Qgb2YgYWxsIHdlIGRvbid0
IG5lZWQgaXQgb24gQU1EIHN5c3RlbXMuIEFkZGl0aW9uYWxseSBhbGxvdyBpdHMgdXNlCj4+PiB0
byBiZSBjb250cm9sbGVkIGJ5IGNvbW1hbmQgbGluZSBvcHRpb24uIEZvciBiZXN0IGJhY2twb3J0
YWJpbGl0eSwgdGhpcwo+Pj4gaW50ZW50aW9uYWxseSBkb2Vzbid0IHVzZSBhbHRlcm5hdGl2ZSBp
bnN0cnVjdGlvbiBwYXRjaGluZyB0byBhY2hpZXZlCj4+PiB0aGUgaW50ZW5kZWQgZWZmZWN0IC0g
d2hpbGUgd2UgbGlrZWx5IHdhbnQgaXQsIHRoaXMgd2lsbCBiZSBsYXRlcgo+Pj4gZm9sbG93LXVw
Lgo+Pgo+PiBJcyBpdCB3b3J0aCBtYWtpbmcgaXQgb3B0aW9uYWwgdG8gYXBwbHkgdG8gZG9tMD8g
IEluIG1vc3QgY2FzZXMsIGlmIGFuCj4+IGF0dGFja2VyIGNhbiBtYW5hZ2UgdG8gZ2V0IHVzZXJz
cGFjZSBvbiBkb20wLCB0aGV5IHNob3VsZCBiZSBhYmxlIHRvCj4+IHRha2Ugb3ZlciB0aGUgd2hv
bGUgc3lzdGVtIGFueXdheTsgdHVybmluZyBpdCBvZmYgb24gZG9tMCB0byBnZXQKPj4gYmV0dGVy
IHBlcmZvcm1hbmNlIHNlZW1zIGxpa2UgYSBwb2xpY3kgZGVjaXNpb24gdGhhdCBhZG1pbmlzdHJh
dG9ycwo+PiBtaWdodCByZWFzb25hYmx5IG1ha2UuCj4KPiBJcnJlc3BlY3RpdmUgb2YgSsO8cmdl
bidzIHJlcGx5ICh3aGljaCBJIGFncmVlIHdpdGgpIHRoaXMgd291bGQgYmUgYW4KPiBvcHRpb24s
IGJ1dCBJJ2QgcHJlZmVyIHRvIGZvbGQgdGhpcyBpbnRvIHRoZSBzdGFnZSAyIGFjdGl2aXRpZXMg
KGlmIHdlCj4gcmVhbGx5IHdhbnQgaXQgaW4gdGhlIGZpcnN0IHBsYWNlKS4KClRoYXQgc291bmRz
IHJlYXNvbmFibGUuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
