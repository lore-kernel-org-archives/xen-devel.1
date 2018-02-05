From: Brian Woods <brian.woods@amd.com>
Subject: Re: [PATCH 2/3] x86/svm: add EFER SVME support for
	VGIF/VLOAD
Date: Mon, 5 Feb 2018 10:47:32 -0600
Message-ID: <20180205164732.GB8527@amd.com>
References: <20180131203525.21660-1-brian.woods@amd.com>
 <20180131203525.21660-3-brian.woods@amd.com>
 <5A782D4B02000078001A519C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5A782D4B02000078001A519C@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMDUsIDIwMTggYXQgMDI6MDk6MTVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSWYgdGhlIGxhdHRlciBjaGVjayB3YXMgbW92ZWQgdG8gdGhlIGNhbGxlciwgdGhlIHdo
b2xlIGZ1bmN0aW9uCj4gd291bGQgcGVyaGFwcyBiZSBiZXR0ZXIgcGxhY2VkIGluIG5lc3RlZHN2
bS5jPwoKSSB0aG91Z2h0IGFib3V0IHB1dHRpbmcgaXQgaW4gbmVzdGVkc3ZtLmMgYnV0IEkgdGhv
dWdodCBoYXZpbmcgaXQgYXMgYQpzdGF0aWMgZnVuY3Rpb24gd291bGQgYmUgYmV0dGVyLiAgSSBj
b3VsZCBtb3ZlIGl0IHRvIG5lc3RlZHN2bS5jIAp0aG91Z2guCgo+IENhbiB5b3UgcGxlYXNlIGF2
b2lkICI9PSAwIiBhbmQgIj09IDEiIG9uIGJvb2xlYW4gZmllbGRzIChldmVuCj4gaWYsIGxpa2Ug
aW4gdGhlIGNhc2UgaGVyZSwgdGhlIGJpdGZpZWxkIGhhcyB1NjQgYXMgdW5kZXJseWluZyB0eXBl
LAo+IHdoaWNoIGlzIHNvcnQgb2YgcG9pbnRsZXNzKT8KPiAKPiBKYW4KCnN2bS5jIGlzIG9sZGVy
IGFuZCB1c2VzICI9PSBYIiwgYW5kIEkgd2FzIHRyeWluZyB0byBrZWVwIGl0IGNvbnNpc3RlbnQK
d2l0aGluIHRoZSBmaWxlLiAgRm9yIHRoaW5ncyBsaWtlIGlmICgpIHtcbix9IFx7LCB3aGljaCBh
cmUKaW5jb25zaXN0ZW50LCBJIGFsd2F5cyB1c2UgaWYgKCkgXG4gXHsuICBTaG91bGQgSSBvbmx5
IGJlIHVzaW5nIGJvb2xlYW4/CgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
