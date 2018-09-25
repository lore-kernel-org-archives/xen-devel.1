From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] xen/vsprintf: Introduce %*pb[l] for
 printing bitmaps
Date: Tue, 25 Sep 2018 07:22:02 -0600
Message-ID: <5BAA367A02000078001EB9C1@prv1-mh.provo.novell.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-2-git-send-email-andrew.cooper3@citrix.com>
 <5B922BA702000078001E62D0@prv1-mh.provo.novell.com>
 <1c2ee3b3-9f7c-ab07-36bd-95103c93fb91@citrix.com>
 <5B9295CD02000078001E6723@prv1-mh.provo.novell.com>
 <e1719883-6217-722f-dba7-a8526b14f035@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e1719883-6217-722f-dba7-a8526b14f035@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDE1OjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDkvMTggMTY6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gSXJyZXNwZWN0
aXZlIG9mIHdoZXRoZXIgeW91IHRoaW5rIGl0IGlzIGFtYmlndW91cyBvciBub3QsIEkgZG9uJ3Qg
dmlldwo+Pj4gdGhpcyBhcyBhIGdvb2QgZW5vdWdoIChwb3RlbnRpYWwpIGlzc3VlIHRvIGRpdmVy
Z2UuCj4+Pgo+Pj4gRnVydGhlcm1vcmUsIChhbmQgbW9yZSBsaWtlbHkgdG8gc3dheSB5b3VyIG9w
aW5pb24pLCBOMTU3MCBpbmRpY2F0ZXMKPj4+IHRoYXQgdGhlICdsJyBsZW5ndGggbW9kaWZpZXIg
aXMgb25seSBhcHBsaWNhYmxlIGZvciB0aGUgZGlvdXhYY3MKPj4+IGNvbnZlcnNpb24gc3BlY2lm
aWVycywgYW5kIGJvdGggQ2xhbmcgYW5kIEdDQyBlbmZvcmNlIHRoaXMgd2l0aCAtV2Zvcm1hdC4K
Pj4+Cj4+PiBhbmRyZXdjb29wQGFuZHJld2Nvb3A6L2xvY2FsL3hlbi5naXQveGVuJCBjbGFuZy02
LjAgLVdhbGwgLVdlcnJvciAtV2V4dHJhIAo+Pj4gZm9vLmMgLW8gZm9vLm8KPj4+IGZvby5jOjc6
MjI6IGVycm9yOiBsZW5ndGggbW9kaWZpZXIgJ2wnIHJlc3VsdHMgaW4gdW5kZWZpbmVkIGJlaGF2
aW9yIG9yIG5vIAo+Pj4gZWZmZWN0IHdpdGggJ3AnIGNvbnZlcnNpb24gc3BlY2lmaWVyIFstV2Vy
cm9yLC1XZm9ybWF0XQo+Pj4gICAgIHByaW50ZigiVGVzdGluZyAlbHBkXG4iLCBwdHIpOwo+Pj4g
ICAgICAgICAgICAgICAgICAgICB+Xn4KPj4+IDEgZXJyb3IgZ2VuZXJhdGVkLgo+PiBZZWFoLCBJ
IHN0YXJ0ZWQgdG8gYmUgY29uY2VybmVkIG9mIHRoaXMgaGFwcGVuaW5nIGFmdGVyIEkgaGFkIHNl
bnQKPj4gdGhlIHJlcGx5LiBHaXZlbiB0aGlzIEkgZ3Vlc3Mgd2UgaGF2ZSBubyAoZ29vZCkgY2hv
aWNlIGJlc2lkZXMgZ29pbmcKPj4gdGhlIHN1ZmZpeCByb3V0ZS4KPiAKPiBTbyBjYW4gSSB0YWtl
IHRoaXMgYXMgYXQgbGVhc3QgYW4gYWNrPyAgQ3VycmVudGx5IHRoaXMgc2VyaWVzIGlzIHN0YWxs
ZWQuCgpXaXRoIGF0IGxlYXN0IHRoZSBidWcgYWRkcmVzc2VkIHRoYXQgSSBoYWQgcG9pbnRlZCBv
dXQgaW4gdGhlIGZpcnN0CnJlcGx5LCBhbmQgcHJlZmVyYWJseSB3aXRoIHRoZSBpbnQgLT4gdW5z
aWduZWQgaW50IGNvbnZlcnNpb24gZG9uZQp3aGVyZSBzdWl0YWJsZSwgeWVzLgoKRm9yIGxhdGVy
IHBhdGNoZXMsIHdoZXJlIGFwcGxpY2FibGUsIEkgaW5zaXN0IG9uIHVzaW5nIGNwdW1hc2tfYml0
cygpCm91dHNpZGUgb2YgY3B1bWFzay5oLCB0aG91Z2guCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
