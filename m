From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 11/17] x86: provide stubs for entry point
Date: Tue, 16 Oct 2018 14:22:50 +0100
Message-ID: <f024dd35-23bc-1410-6c21-1f36b9277f72@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <61764e0b2721746d3a7a5febd24de380a893aa90.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0B61602000078001F1113@prv1-mh.provo.novell.com>
 <20181015104009.kwqqvixwui5cxuxd@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g94e=m4=citrix.com=prvs=820d23aae=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gCPMj-0004SO-Ci
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 13:26:29 +0000
In-Reply-To: <20181015104009.kwqqvixwui5cxuxd@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMTAvMTggMTE6NDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTIsIDIwMTgg
YXQgMDg6NTY6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA0LjEwLjE4
IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBJbnN0ZWFkIG9mIHRy
eWluZyB0byBzcGxpdCB1cCBlbnRyeS5TIGFuZCBjb21wYXQvZW50cnkuUywgc2ltcGx5Cj4+PiBw
cm92aWRlIHNvbWUgc3R1YnMgZm9yIHRoZW0uCj4+IEknbSBub3QgY29udmluY2VkOyBJJ2QgbXVj
aCByYXRoZXIgc2VlIHRoZSBjYWxsIHNpdGVzIHJlY29nbml6YWJseQo+PiBjb21waWxlZCBvdXQg
d2l0aCAhUFYuIEknbSBjdXJpb3VzIHdoYXQgQW5kcmV3IHRoaW5rcyBoZXJlLgo+Pgo+IEFuZHJl
dz8KCkl0IHdvdWxkIGJlIG5pY2UgdG8gc2VlIGlmIHdlIGNhbiBjbGVhbmx5IGNvbXBpbGUgb3V0
IGJpdHMgb2YgZW50cnkuUywKcmF0aGVyIHRoYW4gc3R1YmJpbmcgb3V0IGF0IHRoZSBDIGxldmVs
LgoKQSBmZXcgd2VsbC1wbGFjZWQgI2lmZGVmIENPTkZJR19QViBtaWdodCBnbyBhIGxvbmcgd2F5
LCBidXQgeW91CmRlZmluaXRlbHkgZG9uJ3Qgd2FudCB0byB0cnkgc3BsaXR0aW5nIGZyYWdtZW50
cyBvdXQgaW50byBhIHNlcGFyYXRlIGZpbGUuCgpJZiBob3dldmVyIHRoYXQgcHJvdmVzIHRvIGJl
IHZlcnkgdGFuZ2xlZCwgdGhpcyBwYXRjaCBpcyBvayBpbiB0aGUgaW50ZXJpbS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
