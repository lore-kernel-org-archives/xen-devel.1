From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2 2/2] x86: allow Meltdown band-aid to be
	disabled
Date: Tue, 16 Jan 2018 12:39:29 +0000
Message-ID: <CAFLBxZafWsTXUBqgQ1cXXRpFtHf8js1_ac7NDBwoEoN+QteXOQ@mail.gmail.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5C996A020000780019EB97@prv-mh.provo.novell.com>
 <CAFLBxZa12YCq_=jnPK_s-ZbRk6=p9AL+MY0K=SiJL+e-OT+4ZA@mail.gmail.com>
 <c57288e4-d351-7de3-8a60-467c45c09542@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=prux=el=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ebQWb-0000Ya-5u
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 12:39:33 +0000
Received: by mail-qt0-x241.google.com with SMTP id a16so18022912qtj.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 04:39:31 -0800 (PST)
In-Reply-To: <c57288e4-d351-7de3-8a60-467c45c09542@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMTI6MjEgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4gd3JvdGU6Cj4gT24gMTYvMDEvMTggMTM6MTIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6
Cj4+IE9uIE1vbiwgSmFuIDE1LCAyMDE4IGF0IDExOjA3IEFNLCBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4gRmlyc3Qgb2YgYWxsIHdlIGRvbid0IG5lZWQgaXQgb24g
QU1EIHN5c3RlbXMuIEFkZGl0aW9uYWxseSBhbGxvdyBpdHMgdXNlCj4+PiB0byBiZSBjb250cm9s
bGVkIGJ5IGNvbW1hbmQgbGluZSBvcHRpb24uIEZvciBiZXN0IGJhY2twb3J0YWJpbGl0eSwgdGhp
cwo+Pj4gaW50ZW50aW9uYWxseSBkb2Vzbid0IHVzZSBhbHRlcm5hdGl2ZSBpbnN0cnVjdGlvbiBw
YXRjaGluZyB0byBhY2hpZXZlCj4+PiB0aGUgaW50ZW5kZWQgZWZmZWN0IC0gd2hpbGUgd2UgbGlr
ZWx5IHdhbnQgaXQsIHRoaXMgd2lsbCBiZSBsYXRlcgo+Pj4gZm9sbG93LXVwLgo+Pgo+PiBJcyBp
dCB3b3J0aCBtYWtpbmcgaXQgb3B0aW9uYWwgdG8gYXBwbHkgdG8gZG9tMD8gIEluIG1vc3QgY2Fz
ZXMsIGlmIGFuCj4+IGF0dGFja2VyIGNhbiBtYW5hZ2UgdG8gZ2V0IHVzZXJzcGFjZSBvbiBkb20w
LCB0aGV5IHNob3VsZCBiZSBhYmxlIHRvCj4+IHRha2Ugb3ZlciB0aGUgd2hvbGUgc3lzdGVtIGFu
eXdheTsgdHVybmluZyBpdCBvZmYgb24gZG9tMCB0byBnZXQKPj4gYmV0dGVyIHBlcmZvcm1hbmNl
IHNlZW1zIGxpa2UgYSBwb2xpY3kgZGVjaXNpb24gdGhhdCBhZG1pbmlzdHJhdG9ycwo+PiBtaWdo
dCByZWFzb25hYmx5IG1ha2UuCj4KPiBZb3UgYXJlIGltcGx5aW5nIGhlcmUgdGhhdCBMaW51eCBp
cyBpbnNlY3VyZTogd2h5IGRvZXMgdXNlcnNwYWNlIGFjY2Vzcwo+IGFsbG93IHlvdSB0byB0YWtl
IG92ZXIgdGhlIG1hY2hpbmU/IEkgY2FuIHNlZSB0aGF0IGJlaW5nIHRydWUgZm9yIHJvb3QKPiBh
Y2Nlc3MsIGJ1dCBub3QgZm9yIGFueSBvdGhlciB1bnByaXZpbGVnZWQgdXNlciBhY2NvdW50LgoK
V2VsbCBmaXJzdCBvZiBhbGwsIGdvIGxvb2sgYXQgbXkgdGFsayBhYm91dCBsb2NhbCByb290IGV4
cGxvaXRzIGluCkxpbnV4IC0tIHVzdWFsbHkgdGhlcmUgYXJlIGEgZmV3IGZvdW5kIGV2ZXJ5IG1v
bnRoLgoKQnV0IGxldCdzIGlnbm9yZSB0aGF0IG91dCBmb3IgYSBtaW51dGUuICBDb25zaWRlciBh
ICJ0eXBpY2FsIgpyZWNvbW1lbmRlZCBkb20wIHNldHVwOgotIERvbTAgb24gYSBzZXBhcmF0ZSBu
ZXR3b3JrCi0gTm90aGluZyBydW5uaW5nIG9uIGRvbTAgZXhjZXB0IFhlbi1yZWxhdGVkIHNlcnZp
Y2VzLCBhbmQgdG9vbHN0YWNrCgpIb3cgd291bGQgYW4gYXR0YWNrZXIgZ2V0IHVzZXJzcGFjZSBh
Y2Nlc3Mgb24gc3VjaCBhIGhvc3QgYXQgYWxsPwotIEF0dGFjayBhIGRldmljZW1vZGVsIHJ1bm5p
bmcgaW4gZG9tMAotIEF0dGFjayBhIGJhY2tlbmQgcnVubmluZyBpbiB0aGUga2VybmVsCi0gQXR0
YWNrIHhlbnN0b3JlCgpXZSBkb24ndCB5ZXQgaGF2ZSBhIGRlcHJpdmlsZWdlZCBRRU11LCBzbyBh
dCB0aGUgbW9tZW50IGFuIGF0dGFjayBvbgphbnkgb2YgdGhlc2Ugd2lsbCBhbHJlYWR5IGdpdmUg
eW91IGZ1bGwgY29udHJvbCBvZiB0aGUgc3lzdGVtLgoKT2J2aW91c2x5IHRoaXMgd291bGRuJ3Qg
YmUgYXBwcm9wcmlhdGUgdG8gYWxsIHN5c3RlbXM7IGJ1dCBpdCBjb3VsZCBiZQphcHByb3ByaWF0
ZSB0byBhIGZhaXIgbnVtYmVyIG9mIHRoZW0uCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
