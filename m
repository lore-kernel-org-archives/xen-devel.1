From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RESEND v1 1/7] x86: add a flag to enable
 Intel processor trace
Date: Thu, 26 Apr 2018 13:09:09 +0100
Message-ID: <20180426120909.6miciqgzuvxfxpyy@citrix.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1516039953-2988-2-git-send-email-luwei.kang@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: kevin.tian@intel.com, sstabellini@kernel.org, wei.liu2@citrix.com, jbeulich@suse.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tim@xen.org, xen-devel@lists.xen.org, jun.nakajima@intel.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTYsIDIwMTggYXQgMDI6MTI6MjdBTSArMDgwMCwgTHV3ZWkgS2FuZyB3cm90
ZToKPiBUaGlzIHBhdGNoIGFkZCBhIGZsYWcgdG8gZW5hYmxlIEludGVsIFBUIChJbnRlbCBwcm9j
ZXNzb3IgdHJhY2UpLgo+IERlZmF1bHQgdmFsdWUgaXMgMSAoZW5hYmxlZCkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTHV3ZWkgS2FuZyA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gIGRvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duIHwgIDcgKysrKysrKwo+ICB4ZW4vYXJjaC94
ODYvY3B1L01ha2VmaWxlICAgICAgICAgICB8ICAxICsKPiAgeGVuL2FyY2gveDg2L2NwdS9pbnRl
bF9wdC5jICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9pbnRlbF9wdC5oICAgICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9hcmNoL3g4Ni9jcHUvaW50ZWxfcHQuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2luY2x1ZGUvYXNtLXg4Ni9pbnRlbF9wdC5oCj4gCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUu
bWFya2Rvd24KPiBpbmRleCA3ODExMTBkLi45NTQxMWNmIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUubWFya2Rvd24KPiBAQCAtMTAwOSw2ICsxMDA5LDEzIEBAIGRlYnVnIGh5cGVydmlzb3Ig
b25seSkuCj4gICMjIyBpZGxlXF9sYXRlbmN5XF9mYWN0b3IKPiAgPiBgPSA8aW50ZWdlcj5gCj4g
IAo+ICsjIyMgaW50ZWxcX3B0Cj4gKz4gYD0gPGJvb2xlYW4+YAo+ICsKPiArPiBEZWZhdWx0OiBg
dHJ1ZWAKPiArCgpBZnRlciByZWFkaW5nIHRoZSBtYW51YWwgYSBiaXQgSSB0aGluayB0aGlzIG9w
dGlvbiBuZWVkcyB0byBiZSBtb3JlCnNvcGhpc3RpY2F0ZWQuIAoKVGhlIHNlcmllcyBvbmx5IGlt
cGxlbWVudHMgZ3Vlc3Qtb25seSB0cmFjaW5nLCB3aGlsZSBpbiB0aGUgZnV0dXJlIHdlIG1pZ2h0
CndhbnQgaG9zdC1vbmx5IHRyYWNpbmcgYW5kIHN5c3RlbSB3aWRlIHRyYWNpbmcuCgpFdmVuIHRo
ZSBvdGhlciBtb2RlcyBhcmVuJ3QgaW1wbGVtZW50ZWQgeWV0IHdlIHNob3VsZCBsZWF2ZSByb29t
IGZvcgp0aGVtLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
