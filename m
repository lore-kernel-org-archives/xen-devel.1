From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/domctl: Drop vcpu_alloc_lock
Date: Fri, 07 Sep 2018 04:21:52 -0600
Message-ID: <5B92514002000078001E64C7@prv1-mh.provo.novell.com>
References: <1536174925-5500-1-git-send-email-andrew.cooper3@citrix.com>
 <5B923B4002000078001E6383@prv1-mh.provo.novell.com>
 <0f24ce6a-ff4a-002c-db82-890bdd401755@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0f24ce6a-ff4a-002c-db82-890bdd401755@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDExOjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDkvMTggMDk6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBSYXRoZXIgdGhh
biBibGluZGx5IGRyb3BwaW5nIHRoZSBsb2dpYywgSSdkIGhhdmUgZXhwZWN0ZWQKPj4gZm9yIGl0
IHRvIGJlIGZpeGVkOiBEZXNwaXRlIHRoZSBtb3ZlbWVudCBpbnRvIFhFTl9ET01DVExfY3JlYXRl
ZG9tYWluCj4+IHRoZXJlJ3Mgc3RpbGwgYSByYWNlIGJldHdlZW4gdWNvZGUgdXBkYXRlcyBhbmQg
ZG9tYWluIGNyZWF0aW9uLgo+IAo+IFdoYXQgcmFjZT8gIFdoYXQgaGF2ZSBJIG92ZXJsb29rZWQ/
CgpPbmUgQ1BVIGRvaW5nIGEgbWljcm9jb2RlIHVwZGF0ZSB3aGlsZSB0aGUgb3RoZXIgY3JlYXRl
cyBhCmRvbWFpbi4gSSBoYXZlbid0IGxvb2tlZCBpbiBkZXRhaWwsIGJ1dCBJIHRoaW5rIGFsbCBk
b21haW4gY3JlYXRpb24Kc2hvdWxkIGJlIGRlZmVycmVkIHVudGlsIGNvbXBsZXRpb24gb2YgdGhl
IG1pY3JvY29kZSB1cGRhdGUsIHNvCnRoYXQgZG9tYWlucyBnZXQgYSBjb25zaXN0ZW50L3ByZWRp
Y3RhYmxlIE9TVlcgc3RhdGUgc2V0IHVwLgoKT2YgY291cnNlIHdlIGNhbiBwdXQgb3Vyc2VsdmVz
IG9uIHRoZSBwb3NpdGlvbiB0aGF0IGl0IGlzIGFuCmFkbWluIG1pc3Rha2UgdG8gaW52b2tlIGEg
bWljcm9jb2RlIHVwZGF0ZSB3aXRob3V0IHN1c3BlbmRpbmcKZG9tYWluIGNyZWF0aW9ucyB0ZW1w
b3JhcmlseSwgYnV0IHNpbmNlIGRvbWFpbiBjcmVhdGlvbiBpbmNsdWRlcwpkb21haW4gcmVib290
cywgSSBkb24ndCB0aGluayB0aGlzIGlzIHNvbWV0aGluZyBhbiBhZG1pbiBjYW4KZnVsbHkgY29u
dHJvbC4KCllldCBmdXJ0aGVyIHdlIGNvdWxkIHB1dCBvdXJzZWx2ZXMgb24gdGhlIHBvc2l0aW9u
IHRoYXQgdWNvZGUKdXBkYXRlcyB3aXRoIF9hbnlfIGd1ZXN0cyBydW5uaW5nIGFyZSBhIGJhZCBp
ZGVhLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
