From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [RFC PATCH 1/8] x86/domctl: introduce a pair of
 hypercall to set and get cpu topology
Date: Tue, 9 Jan 2018 12:18:13 -0500
Message-ID: <f1fbdab3-2fc9-2158-3f9b-5838e8aae3ce@tycho.nsa.gov>
References: <1515384090-175916-1-git-send-email-chao.gao@intel.com>
 <1515384090-175916-2-git-send-email-chao.gao@intel.com>
 <76d0f6f4-cb12-c4e6-bc9e-e80a581d82c8@tycho.nsa.gov>
 <20180109090604.GA249902@op-computing>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180109090604.GA249902@op-computing>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>, xen-devel@lists.xen.org, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDkvMjAxOCAwNDowNiBBTSwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gTW9uLCBKYW4gMDgs
IDIwMTggYXQgMDE6MTQ6NDRQTSAtMDUwMCwgRGFuaWVsIERlIEdyYWFmIHdyb3RlOgo+PiBPbiAw
MS8wNy8yMDE4IDExOjAxIFBNLCBDaGFvIEdhbyB3cm90ZToKPj4+IERlZmluZSBpbnRlcmZhY2Us
IHN0cnVjdHVyZXMgYW5kIGh5cGVyY2FsbHMgZm9yIHRvb2xzdGFjayB0byBidWlsZAo+Pj4gY3B1
IHRvcG9sb2d5IGFuZCBmb3IgZ3Vlc3QgdGhhdCB3aWxsIHJldHJpZXZlIGl0IFsxXS4KPj4+IFR3
byBzdWJvcCBoeXBlcmNhbGxzIGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaDoKPj4+IFhFTl9ET01D
VExfc2V0X2NwdV90b3BvbG9neSB0byBkZWZpbmUgY3B1IHRvcG9sb2d5IGluZm9ybWF0aW9uIHBl
ciBkb21haW4KPj4+IGFuZCBYRU5NRU1fZ2V0X2NwdV90b3BvbG9neSB0byByZXRyaWV2ZSBjcHUg
dG9wb2xvZ3kgaW5mb3JtYXRpb24uCj4+Pgo+Pj4gWzFdOiBkdXJpbmcgZ3Vlc3QgY3JlYXRpb24s
IHRob3NlIGluZm9ybWF0aW9uIGhlbHBzIGh2bWxvYWRlciB0byBidWlsZCBBQ1BJLgo+Pj4KPj4+
IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+Cj4+IFdoZW4g
YWRkaW5nIG5ldyBYU00gY29udHJvbHMgZm9yIHVzZSBieSBkZXZpY2UgbW9kZWxzLCB5b3UgYWxz
bwo+PiBuZWVkIHRvIGFkZCB0aGUgcGVybWlzc2lvbnMgdG8gdGhlIGRldmljZV9tb2RlbCBtYWNy
byBkZWZpbmVkIGluCj4+IHRvb2xzL2ZsYXNrL3BvbGljeS9tb2R1bGVzL3hlbi5pZi4gIElmIGRv
bWFpbnMgbmVlZCB0byBjYWxsIHRoaXMKPj4gZnVuY3Rpb24gb24gdGhlbXNlbHZlcyAoaXMgdGhp
cyBvbmx5IHRydWUgZm9yIGdldD8pLCB5b3Ugd2lsbCBhbHNvCj4+IG5lZWQgdG8gYWRkIGl0IHRv
IGRlY2xhcmVfZG9tYWluX2NvbW1vbi4KPj4KPiAKPiBIaSwgRGFuaWVsLgo+IAo+IFllcy4gWEVO
TUVNX2dldF9jcHVfdG9wb2xvZ3kgd2lsbCBiZSBjYWxsZWQgYnkgdGhlIGRvbWFpbiBpdHNlbGYu
Cj4gQW5kIEJvdGggZ2V0IGFuZCBzZXQgd2lsbCBiZSBjYWxsZWQgYnkgZG9tMCB3aGVuIGNyZWF0
aW5nIG9uZSBkb21haW4uCj4gU28gSSBuZWVkOgo+IDEuIGFkZCAqc2V0KiBhbmQgKmdldCogdG8g
Y3JlYXRlX2RvbWFpbl9jb21tb24uCj4gMi4gYWRkICpzZXQqIHRvIGRlY2xhcmVfZG9tYWluX2Nv
bW1vbi4KPiAKPiBJcyBpdCByaWdodD8KPiAKPiBUaGFua3MKPiBDaGFvCgpJdCBzb3VuZHMgbGlr
ZSB5b3UgbmVlZCB0byBhZGQgZ2V0IHRvIGRlY2xhcmVfZG9tYWluX2NvbW1vbiAobm90IHNldCkK
YmVjYXVzZSB0aGUgZG9tYWluIG9ubHkgbmVlZHMgdG8gaW52b2tlIHRoaXMgb24gaXRzZWxmLiAg
SWYgdGhlIGRldmljZQptb2RlbCBkb2Vzbid0IG5lZWQgdG8gdXNlIHRoZXNlIGh5cGVyY2FsbHMg
KHdvdWxkIGd1ZXN0IGNwdSBob3RwbHVnIG9yCnNpbWlsYXIgdGhpbmdzIG5lZWQgdGhlbT8pLCB0
aGVuIHRoYXQncyBhbGwgeW91IG5lZWQgdG8gYWRkLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
