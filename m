From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] mm/page_alloc: always scrub pages given to
 the allocator
Date: Mon, 1 Oct 2018 09:44:31 -0400
Message-ID: <6ff6c992-2c6f-a0aa-8b51-cbb3dfc724c7@oracle.com>
References: <20181001095818.22782-1-sergey.dyasli@citrix.com>
 <5BB2014B02000078001ED2B6@prv1-mh.provo.novell.com>
 <43064b50-6f49-a073-9219-5a0a031be93b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <43064b50-6f49-a073-9219-5a0a031be93b@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMS8xOCA5OjEyIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDAxLzEwLzE4IDEy
OjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDEuMTAuMTggYXQgMTE6NTgsIDxzZXJn
ZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gSGF2aW5nIHRoZSBhbGxvY2F0b3IgcmV0
dXJuIHVuc2NydWJiZWQgcGFnZXMgaXMgYSBwb3RlbnRpYWwgc2VjdXJpdHkKPj4+IGNvbmNlcm46
IHNvbWUgZG9tYWluIGNhbiBiZSBnaXZlbiBwYWdlcyB3aXRoIG1lbW9yeSBjb250ZW50cyBvZiBh
bm90aGVyCj4+PiBkb21haW4uIFRoaXMgbWF5IGhhcHBlbiwgZm9yIGV4YW1wbGUsIGlmIGEgZG9t
YWluIHZvbHVudGFyaWx5IHJlbGVhc2VzCj4+PiBpdHMgb3duIG1lbW9yeSAoYmFsbG9vbmluZyBi
ZWluZyB0aGUgZWFzaWVzdCB3YXkgZm9yIGRvaW5nIHRoaXMpLgo+PiBBbmQgd2UndmUgYWx3YXlz
IHNhaWQgdGhhdCBpbiB0aGlzIGNhc2UgaXQncyB0aGUgZG9tYWluJ3MgcmVzcG9uc2liaWxpdHkK
Pj4gdG8gc2NydWIgdGhlIG1lbW9yeSBvZiBzZWNyZXRzIGl0IGNhcmVzIGFib3V0LiBUaGVyZWZv
cmUgSSdtIGF0IHRoZQo+PiB2ZXJ5IGxlYXN0IG1pc3Npbmcgc29tZSBiYWNrZ3JvdW5kIG9uIHRo
aXMgY2hhbmdlIG9mIGV4cGVjdGF0aW9ucy4KPiBZb3Ugd2VyZSBvbiB0aGUgY2FsbCB3aGVuIHRo
aXMgd2FzIGRpc2N1c3NlZCwgYWxvbmcgd2l0aCB0aGUgc3luY2hyb25vdXMKPiBzY3J1YmJpbmcg
aW4gZGVzdHJveWRvbWFpbi4KPgo+IFB1dCBzaW1wbHksIHRoZSBjdXJyZW50IGJlaGF2aW91ciBp
cyBub3QgZ29vZCBlbm91Z2ggZm9yIGEgbnVtYmVyIG9mCj4gc2VjdXJpdHkgc2Vuc2l0aXZlIHVz
ZWNhc2VzLgo+Cj4gVGhlIG1haW4gcmVhc29uIGhvd2V2ZXIgZm9yIGRvaW5nIHRoaXMgaXMgdGhl
IG9wdGltaXNhdGlvbnMgaXQgZW5hYmxlcywKPiBhbmQgaW4gcGFydGljdWxhciwgbm90IGRvdWJs
ZSBzY3J1YmJpbmcgbW9zdCBvZiBvdXIgcGFnZXMuCgpPVE9ILCBpdCBpbnRyb2R1Y2VzIGRvdWJs
ZSBzY3J1YmJpbmcgZm9yIGJhbGxvb25pbmcgYmVjYXVzZSAoYXQgbGVhc3QKTGludXgpIGd1ZXN0
cyBkbyBzY3J1YiBtZW1vcnkgYmVmb3JlIGhhbmRpbmcgaXQgYmFjayB0byB0aGUgaHlwZXJ2aXNv
ci4KCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
