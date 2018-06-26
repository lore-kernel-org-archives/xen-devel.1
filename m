From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/xsm: Cleanup in preparation for XSM
 SILO mode
Date: Tue, 26 Jun 2018 07:16:08 -0600
Message-ID: <5B323C9802000078001CE0C3@prv1-mh.provo.novell.com>
References: <1530011348-4852-1-git-send-email-andrew.cooper3@citrix.com>
 <5B322BB302000078001CE02C@prv1-mh.provo.novell.com>
 <46d8010f-5d98-5649-df45-49e974a7df24@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <46d8010f-5d98-5649-df45-49e974a7df24@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>, Tim Deegan <tim@xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA2LjE4IGF0IDE0OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDYvMTggMTM6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNi4w
Ni4xOCBhdCAxMzowOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gRnV0
dXJlIGNoYW5nZXMgd2lsbCBpbnRyb2R1Y2UgYSBuZXcgU0lMTyBtb2RlLCB3aGljaCBpcyBpbnRl
bmRlZCB0byBiZSB1c2VmdWwKPj4+IGZvciBjbG91ZCBhbmQgZW50ZXJwcmlzZSBzZXR1cHMgd2hl
cmUgYWxsIGRvbVVzIGFyZSB1bnByaXZpbGVnZWQgYW5kIGhhdmUgbm8KPj4+IGJ1aXNuZXNzIGNv
bW11bmljYXRpbmcgZGlyZWN0bHkuCj4+Pgo+Pj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGF0IFhlblN1
bW1pdCwgYnV0IEknbGwgbGVhdmUgZnVydGhlciBkZXRhaWxzIHRvIHRoZSBzZXJpZXMKPj4+IHdo
aWNoIGludHJvZHVjZXMgaXQuICBIb3dldmVyLCB0byBiZWdpbiB3aXRoLCBjbGVhbiB1cCB0aGUg
WFNNIG5hbWVzcGFjaW5nIHRvCj4+PiBiZXR0ZXIgc2VwYXJhdGUgWFNNIGFuZCBGTEFTSy4KPj4+
Cj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPj4+Cj4+PiBBbmRyZXcgQ29vcGVyICgyKToKPj4+
ICAgeGVuL3hzbTogUmVuYW1lIENPTkZJR19GTEFTS18qIHRvIENPTkZJR19YU01fRkxBU0tfKgo+
Pj4gICB4ZW4veHNtOiBSZW5hbWUgQ09OSUZJR19YU01fUE9MSUNZIHRvIENPTkZJR19YU01fRkxB
U0tfUE9MSUNZCj4+IEkgZG9uJ3QgcGFydGljdWxhcmx5IG1pbmQgdGhlIGNoYW5nZSwgYnV0IEkg
YWxzbyBkb24ndCB2aWV3IGl0IGFzCj4+IHBhcnRpY3VsYXJseSB1c2VmdWw6IEZvciB0aGUgZmly
c3QgcGF0Y2ggSSdkIHNlZSB0aGUgcG9pbnQgaWYgeW91Cj4+IG1lYW50IHRvIGludHJvZHVjZSBz
b21lIENPTkZJR19BQkNfRkxBU0ssIGJ1dCB0aGF0J3Mgbm90IGhvdwo+PiBJIHVuZGVyc3RhbmQg
dGhlIGRlc2NyaXB0aW9uIHRoZXJlLiBGb3IgdGhlIHNlY29uZCBJIGRvbid0IHNlZQo+PiB0aGUg
cG9pbnQgb2YgcmV0YWluaW5nIFhTTSBpbiB0aGUgbmFtZS4KPiAKPiBYU00gIT0gRmxhc2ssIGFu
ZCB0aGlzIGlzIHRoZSBuYW1pbmcgY29uZnVzaW9uIHRyeWluZyB0byBiZSByZWN0aWZpZWQuCgpC
dXQgd2h5IGlzIEZMQVNLIGFsb25lIG5vdCBtZWFuaW5nZnVsIGVub3VnaD8KCj4gQ09ORklHX1hT
TV9TSUxPIGlzIGdvaW5nIHRvIGJlIHRoZSBpbnRyb2R1Y2VkIG5ldyBtb2RlLgoKQW5kIHRoZW4g
U0lMTyBhbG9uZSBoZXJlPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
