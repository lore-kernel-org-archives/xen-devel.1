From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 5/5] x86: remove usage of .skip with
 non-absolute expressions
Date: Mon, 29 Jan 2018 06:39:24 -0700
Message-ID: <5A6F321C02000078001A3657@prv-mh.provo.novell.com>
References: <20180129122643.13008-1-roger.pau@citrix.com>
 <20180129122643.13008-6-roger.pau@citrix.com>
 <20180129124310.whaq7z37t7kvlsxg@citrix.com>
 <5A6F296002000078001A3610@prv-mh.provo.novell.com>
 <bcb8aa9b-9e41-01b4-b0a6-31cff3c18bb0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=763w=ey=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eg9el-0000dq-Uf
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 13:39:31 +0000
In-Reply-To: <bcb8aa9b-9e41-01b4-b0a6-31cff3c18bb0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE4IGF0IDE0OjA1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDEvMTggMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOS4w
MS4xOCBhdCAxMzo0MywgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gTW9uLCBK
YW4gMjksIDIwMTggYXQgMTI6MjY6NDNQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+
Pj4+IENsYW5nIGFzc2VtYmxlciBkb2Vzbid0IHN1cHBvcnQgdXNpbmcgLnNraXAgd2l0aCBub24t
YWJzb2x1dGUKPj4+PiBleHByZXNzaW9uczoKPj4+Pgo+Pj4gQnV0IHNvIGlzIEdOVSBhcy4gRnJv
bSBpdHMgbWFudWFsIGZvciAuc2tpcDoKPj4+Cj4+PiAiVGhpcyBkaXJlY3RpdmUgZW1pdHMgc2l6
ZSBieXRlcywgZWFjaCBvZiB2YWx1ZSBmaWxsLiBCb3RoIHNpemUgYW5kIGZpbGwKPj4+IGFyZSBh
YnNvbHV0ZSBleHByZXNzaW9ucy4iCj4+Pgo+Pj4+IGVudHJ5LlM6MTA5OjE1OiBlcnJvcjogZXhw
ZWN0ZWQgYWJzb2x1dGUgZXhwcmVzc2lvbgo+Pj4+ICAgICAgICAgLnNraXAgLkxjcjRfYWx0X2Vu
ZCAtIC5MY3I0X2FsdCwgMHg5MAo+Pj4+ICAgICAgICAgICAgICAgXgo+Pj4+Cj4+PiBPT0kgd2hh
dCBtYWtlcyAuTGNyNF9hbHRfZW5kIC0gLkxjcjRfYWx0IG5vbi1hYnNvbHV0ZT8KPj4gSSBndWVz
cyB0aGV5IGV4cGVjdCB0byBiZSBhYmxlIHRvIGNhbGN1bGF0ZSB0aGUgdmFsdWUgcmlnaHQgYXQg
dGhlCj4+IHBvaW50IHRoZXkgZXZhbHVhdGUgLnNraXAncyBhcmd1bWVudHMuIFdoZXJlYXMgZ2Fz
IGVpdGhlciByZWNvcmRzCj4+IGEgZnJhZ21lbnQgd2l0aCB2YXJpYWJsZSBzaXplLCBvciAobGVz
cyBsaWtlbHksIGFzIHRoYXQgY291bGQgZW5kIHVwCj4+IHdyb25nKSBldmFsdWF0ZXMgdGhlIGV4
cHJlc3Npb24gcmlnaHQgYXdheSAoaWlyYyB0aGUgLnNraXAgc2l0cyBhZnRlcgo+PiB0aGUgZGVm
aW5pdGlvbiBvZiBib3RoIHN5bWJvbHMsIGFuZCBpaXJjIGZ1cnRoZXIgZ2FzIFthdCBsZWFzdCBz
b21lCj4+IHZlcnNpb25zXSBoYXMgcHJvYmxlbXMgaWYgdGhhdCB3YXNuJ3QgdGhlIGNhc2UpLgo+
IAo+IE9uZSB0aGluZyBJJ3ZlIGJlZW4gZXhwZXJpbWVudGluZyB3aXRoLCBhbG9uZyB3aXRoIHRy
eWluZyB0byBvcmdhbmlzZQo+IHRoZSBhbHRlcm5hdGl2ZXMgaW50byBhIG1lcmdlYWJsZSBzZWN0
aW9uLCBpcyB0byBmaXJzdCB3cml0ZSB0aGUKPiBhbHRlcm5hdGl2ZXMgaW50byAuZGlzY2FyZCBz
ZWN0aW9uLCB3aGljaCBhbGxvd3MgY2FsY3VsYXRpb25zIGxpa2UgdGhpcwo+IHRvIGJlIGNvbXBs
ZXRlZCBpbW1lZGlhdGVseSwgcmF0aGVyIHRoYW4gYmVpbmcgZGVmZXJyZWQuCgpIb3cgd291bGQg
c3VjaCBjYWxjdWxhdGlvbnMgYmUgY29tcGxldGVkIGltbWVkaWF0ZWx5PyBJdCBkb2Vzbid0Cm1h
dHRlciB3aGF0IHNlY3Rpb24geW91IHB1dCB0aGluZ3MgaW4gLSBmaW5hbCBhZGRyZXNzZXMgY2Fu
IGJlCmtub3duIG9ubHkgb25jZSBhbGwgaW5wdXQgaGFzIGJlZW4gY29uc3VtZWQgYnkgdGhlIGFz
c2VtYmxlci4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
