From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Tue, 06 Mar 2018 05:35:53 -0700
Message-ID: <5A9E993902000078001AF01D@prv-mh.provo.novell.com>
References: <20180306104133.22106-1-olaf@aepfle.de>
 <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjAzLjE4IGF0IDEyOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMDMvMTggMTA6NDEsIE9sYWYgSGVyaW5nIHdyb3RlOgo+PiBXaXRoIHRoaXMg
b3B0aW9uIHRoZSBob3N0IGFkbWluIGNhbiBkZWNpZGUgaG93IGEgZG9tVSBzaG91bGQgYmVoYXZl
IHdoZW4KPj4gaXQgaXMgbWlncmF0ZWQgYWNyb3NzIHN5c3RlbXMgb2YgdGhlIHNhbWUgY2xhc3Mu
IFNpbmNlIHRoZXJlIGlzIGFsd2F5cwo+PiBzb21lIGppdHRlciB3aGVuIFhlbiBjYWxpYnJhdGVz
IHRoZSBjcHVfa2h6IHZhbHVlLCBhbGwgaG9zdHMgb2YgdGhlIHNhbWUKPj4gY2xhc3Mgd2lsbCBt
b3N0IGxpa2VseSBoYXZlIHNsaWdodGx5IGRpZmZlcmVudCB2YWx1ZXMuIEFzIGEgcmVzdWx0IHZU
U0MKPj4gZW11bGF0aW9uIGlzIHVuYXZvaWRhYmxlLiBEYXRhIGNvbGxlY3RlZCBkdXJpbmcgdGhl
IGluY2lkZW50IHdoaWNoCj4+IHRyaWdnZXJlZCB0aGlzIGNoYW5nZSBzaG93ZWQgYSBqaXR0ZXIg
b2YgdXAgdG8gMjAwIEtIeiBhY3Jvc3Mgc3lzdGVtcyBvZgo+PiB0aGUgc2FtZSBjbGFzcy4KPiAK
PiBXZSBzaG91bGQgc2VlIGFib3V0IHVzaW5nIGJldHRlciBzb3VyY2VzIG9mIGluZm9ybWF0aW9u
LiAgRm9yIG9uZSwgbWFueQo+IEludGVsIHN5c3RlbXMgYWN0dWFsbHkgZXhwb3NlIHRoZSBUU0Mg
ZnJlcXVlbmN5IGluIHRoZSBib3R0b20gb2YgdGhlCj4gUExBVEZPUk1fSU5GTyBNU1IsIGFsdGhv
dWdoIHRoaXMgaXNuJ3QgYXJjaGl0ZWN0dXJhbCwgYW5kIGhhcyBiZWVuCj4gcmVwbGFjZWQgd2l0
aCBDUFVJRCBpbmZvcm1hdGlvbiBpbiBTa3lsYWtlLgoKVGhlIHF1ZXN0aW9uIGlzIGhvdyBwcmVj
aXNlIHRoaXMgaW5mb3JtYXRpb24gaXMgLSBJIGNhbid0IGltYWdpbmUgaXQKaXMgYW55IGJldHRl
ciB0aGFuIHRoZSBub21pbmFsIGNsb2NrLCB3aGljaCB0aGVuIG1heSBiZSBhcyBmYXIgb2ZmCnRo
ZSBhY3R1YWwgb25lIGFzIHRoZSBqaXR0ZXIgT2xhZiBpcyB0YWxraW5nIGFib3V0LgoKSmFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
