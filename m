From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 20/21] xen: support console_switching
 between Dom0 and DomUs on ARM
Date: Thu, 19 Jul 2018 00:10:42 -0600
Message-ID: <5B502B6202000078001D5A90@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1807061523160.13502@sstabellini-ThinkPad-X260>
 <1530918736-13965-20-git-send-email-sstabellini@kernel.org>
 <72242a48-711c-0e6d-0885-eeb88cfcfa66@arm.com>
 <5B4EE84D02000078001D5343@prv1-mh.provo.novell.com>
 <e4e16cba-2545-1b4e-e15c-ac10c1a2b8a5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e4e16cba-2545-1b4e-e15c-ac10c1a2b8a5@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA3LjE4IGF0IDE4OjU5LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE4LzA3LzE4IDA4OjEyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTcuMDcuMTgg
YXQgMjI6MjksIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBPbiAwNy8wNy8yMDE4
IDAwOjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4gVG9kYXkgQ3RybC1BQUEgaXMg
dXNlZCB0byBzd2l0Y2ggYmV0d2VlbiBYZW4gYW5kIERvbTAuIEV4dGVuZCB0aGUKPj4+PiBtZWNo
YW5pc20gdG8gYWxsb3cgZm9yIHN3aXRjaGluZyBiZXR3ZWVuIFhlbiwgRG9tMCwgYW5kIGFueSBv
ZiB0aGUKPj4+PiBpbml0aWFsIERvbVUgY3JlYXRlZCBmcm9tIFhlbiBhbG9uZ3NpZGUgRG9tMCBv
dXQgb2YgaW5mb3JtYXRpb24gcHJvdmlkZWQKPj4+PiB2aWEgZGV2aWNlIHRyZWUuCj4+PiBJdCBm
ZWVscyBhIGJpdCBwYWluZnVsIGZvciB0aGUgdXNlciB0byBzd2l0Y2ggTiB0aW1lcyB0byBnZXQg
aGlzIGRvbWFpbgo+Pj4gY29uc29sZS4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gcHJvdmlkZSBh
IG5ldyBrZXkgYmluZGluZyB3aGVyZSB5b3UKPj4+IHR5cGUgdGhlIGRvbWFpbiBJRCB5b3Ugd2Fu
dCB0byBzd2l0Y2ggdG8/Cj4+IAo+PiBEb2VzIHRoYXQgbWVhbiB5b3UnZCB3YW50IHRvIHVzZSAw
LTkgZm9yIHRoaXMgcHVycG9zZT8gSSdkIGJlCj4+IHZlcnkgaGVzaXRhbnQgdG8gYWNjZXB0IHN1
Y2gsIGFzIHdlJ3JlIHByZXR0eSB0aWdodCB3aXRoIGF2YWlsYWJsZQo+PiBjaGFyYWN0ZXJzIGFs
cmVhZHkuIEFuZCBvZiBjb3Vyc2UgMC05IHdvdWxkbid0IHNjYWxlIHRvIERvbTEwCj4+IGFuZCBi
ZXlvbmQuIElmIHlvdSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQsIEkgdGhpbmsgaXQgd291
bGQKPj4gaGVscCBpZiB5b3Ugc3BlbGxlZCB0aGlzIG91dC4KPiAKPiBUaGF0IHdoYXQgSSBoYWQg
aW4gbWluZC4gSSBhZ3JlZSB0aGF0IHRoaXMgc29sdXRpb24gd291bGQgbm90IHNjYWxlIHRvIAo+
IERvbTEwIGFuZCBiZXlvbmQuIEJ1dCB0aGF0IHJpbmcgc29sdXRpb24gaXMgbm90IGdvaW5nIHRv
IGJlIGFueSBiZXR0ZXIuCj4gCj4gTGV0J3MgaW1hZ2luZSB5b3Ugd2FudCB0byBzd2l0Y2ggYmV0
d2VlbiBkb21haW4gOSBhbmQgOC4gWW91IHdvdWxkIG5lZWQgCj4gdG8gdHlwZSBDVFJMLUFBQSBO
IHRpbWUgYmVmb3JlIHJlYWNoaW5nIHRoZSByaWdodCBjb25zb2xlLiBOIGJlZW4gdGhlIAo+IG51
bWJlciBvZiBkb21haW4geW91IGhhdmUgdXNpbmcgdGhlIGNvbnNvbGUuCj4gCj4gSXQgZmVlbHMg
bGlrZSwgeW91IHdhbnQgdG8gcHJvdmlkZSBhIGtleSBmb3Igc2VsZWN0aW5nIHRoZSBjb25zb2xl
IChlLmcgCj4gJ2MnKSBhbmQgdGhlbiB0eXBlIHRoZSBkb21haW4gSUQgeW91IHdhbnQgdG8gYWNj
ZXNzLiBDYW4geW91IHJlYWQgCj4gYW5vdGhlciBrZXkgd2hlbiBpbiB0aGUga2V5aGFuZGxlcj8K
CldlbGwsIGFzIGFsd2F5cyAtIGV2ZXJ5dGhpbmcgY2FuIGJlIG1hZGUgd29yayB3aGljaCBpcyBh
dCBsZWFzdAp0aGVvcmV0aWNhbGx5IHBvc3NpYmxlLiBXZSBkb24ndCBoYXZlIGFueSBleGFtcGxl
IG9mIHRoaXMgc28gZmFyLApidXQgSSBkb24ndCB0aGluayBpdCB3b3VsZCBiZSBvdmVybHkgY29t
cGxpY2F0ZWQuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
