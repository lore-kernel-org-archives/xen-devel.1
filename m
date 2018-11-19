From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/4] x86: Drop PVRDTSCP and fix MSR_TSC_AUX
 handling for guests
Date: Mon, 19 Nov 2018 01:29:28 -0700
Message-ID: <5BF2746802000078001FD2DD@prv1-mh.provo.novell.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
 <5BEE97C402000078001FCB10@prv1-mh.provo.novell.com>
 <78463755-55b3-7914-227e-9351702b6764@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <78463755-55b3-7914-227e-9351702b6764@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjExLjE4IGF0IDE4OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMTEvMjAxOCAxMDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE1
LjExLjE4IGF0IDIyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBC
b3JpcyBoYXMgY29uZmlybWVkIHRoYXQgbm9vbmUgYXBwZWFycyB0byBiZSB1c2luZyBQVlJEVFND
UCBhbnkgbW9yZSwgYW5kIGluCj4+PiB0aGUgZGVjYWRlIHNpbmNlIGl0IHdhcyBpbnRyb2R1Y2Vk
LCBndWVzdCBrZXJuZWwgLyBoYXJkd2FyZSBzdXBwb3J0IGhhcwo+Pj4gcHJvdmlkZWQgYSBiZXR0
ZXIgYWx0ZXJuYXRpdmUuCj4+IERvZXNuJ3QgcmVtb3ZhbCBvZiBmdW5jdGlvbmFsaXR5IHJlcXVp
cmUga25vd2luZyB0aGF0IGl0IHdhcyBuZXZlciB1c2VkCj4+IGF0IGFsbCwgcmF0aGVyIHRoYW4g
anVzdCBrbm93aW5nIHRoYXQgbm90aGluZyB1c2VzIGl0IGFueW1vcmU/IFdoYXQgaWYKPj4gc29t
ZSBvbGQgZ3Vlc3Qgc29tZXdoZXJlIHJlbGllcyBvbiBpdD8KPiAKPiBJdHMgYW4gYWxsLW9yLW5v
dGhpbmcgZmVhdHVyZS4gIFRoZSBlbnRpcmV0eSBvZiB5b3VyIFZNIHVzZXJzcGFjZSBuZWVkCj4g
dG8gc3VwcG9ydCBpdCwgb3IgdGltaW5nIHdpbGwgZ28gd3Jvbmcgb24gbWlncmF0ZS4KPiAKPiBX
ZSBhbHJlYWR5IGVzdGFibGlzaGVkIHRoYXQgaXQgYXBwZWFycyB0byBiZSBhIHZlc3RpZ2lhbCBP
cmFjbGUtaXNtIGZvcgo+IHdoaWNoIG5vIGNvbnN1bWVyIHNpZGUgY29kZSBldmVyIGFwcGVhcmVk
LCBhbmQgdGhhdCBpc24ndCB1c2VkLgo+IAo+IFdoYXQgaXMgdW5hY2NlcHRhYmxlIGlzIFBWUkRU
U0NQJ3MgaW1wbGVtZW50YXRpb24gY2F1c2luZyBicmVha2FnZXMgaW4KPiBhcmNoaXRlY3R1cmFs
IGJlaGF2aW91ciBmb3Igbm9uLVBWUkRUU0NQIGNvbmZpZ3VyYXRpb25zLCBhbmQgb25lIHdheSBv
cgo+IGFub3RoZXIsIHRoaXMgbmVlZHMgZml4aW5nLgo+IAo+IFBsZWFzZSBjYW4gd2UgbWFrZSBh
IGRlY2lzaW9uLCBiZWNhdXNlIEkgZG9uJ3QgaGF2ZSB0byB0aW1lIChvciBpbmRlZWQsCj4gdGhl
IHdhbnQpIHRvIGFuZCBmaXggdGhpcyBhIDNyZCBkaWZmZXJlbnQgd2F5IGlmIHRoYXQncyBnb2lu
ZyB0byBydW4KPiBpbnRvIGEgc2ltaWxhciByZWFjdGlvbi4KCldpdGggS29ucmFkJ3Mgc3RhdGVt
ZW50IEknbSBmaW5lIHdpdGggdGhlIHJlbW92YWwuIEknbGwgZ2V0IHRvIGxvb2sKYXQgdGhlIGlu
ZGl2aWR1YWwgcGF0Y2hlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
