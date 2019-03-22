From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH for-4.12] passthrough/vtd: Drop the
 "workaround_bios_bug" logic entirely
Date: Fri, 22 Mar 2019 11:53:35 +0000
Message-ID: <6f43d8e0-2444-f4c1-a0e1-58afdf119c98@citrix.com>
References: <1553199980-9849-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1553199980-9849-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8yMS8xOSA4OjI2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IEl0IHR1cm5zIG91dCB0
aGF0IHRoaXMgY29kZSB3YXMgcHJldmlvdXNseSBkZWFkLgo+IAo+IGMvcyBkY2Y0MTc5MCAiIHg4
Ni9tbWNmZy9kcmhkOiBNb3ZlIGFjcGlfbW1jZmdfaW5pdCgpIGNhbGwgYmVmb3JlIGNhbGxpbmcK
PiBhY3BpX3BhcnNlX2RtYXIoKSIgcmVzdWx0ZWQgaW4gUENJIHNlZ21lbnQgMCBub3cgaGF2aW5n
IGJlZW4gaW5pdGlhbGlzZWQKPiBlbm91Z2ggZm9yIGFjcGlfcGFyc2Vfb25lX2RyaGQoKSB0byBu
b3QgdGFrZSB0aGUKPiAKPiAgIC8qIFNraXAgY2hlY2tpbmcgaWYgc2VnbWVudCBpcyBub3QgYWNj
ZXNzaWJsZSB5ZXQuICovCj4gCj4gcGF0aCB1bmNvbmRpdGlvbmFsbHkuICBIb3dldmVyLCBzb21l
IHN5c3RlbXMgaGF2ZSBETUFSIHRhYmxlcyB3aGljaCBsaXN0Cj4gZGV2aWNlcyB3aGljaCBhcmUg
ZGlzYWJsZWQgYnkgdXNlciBjaG9pY2UgKGluIHBhcnRpY3VsYXIsIERlbGwgUG93ZXJFZGdlIFI3
NDAKPiB3aXRoIEkvTyBBVCBETUEgZGlzYWJsZWQpLCBhbmQgdHVybmluZyBvZmYgYWxsIElPTU1V
IGZ1bmN0aW9uYWxpdHkgaW4gdGhpcwo+IGNhc2UgaXMgZW50aXJlbHkgdW5oZWxwZnVsIGJlaGF2
aW91ci4KPiAKPiBMZWF2ZSB0aGUgd2FybmluZyB3aGljaCBpZGVudGlmaWVzIHRoZSBwcm9ibGVt
YXRpYyBkZXZpY2VzLCBidXQgZHJvcCB0aGUKPiByZW1haW5pbmcgbG9naWMuICBUaGlzIGxlYXZl
cyB0aGUgc3lzdGVtIGluIGJldHRlciBvdmVyYWxsIHN0YXRlLCBhbmQgd29ya2luZwo+IGluIHRo
ZSBzYW1lIHdheSB0aGF0IGl0IGRpZCBpbiBwcmV2aW91cyByZWxlYXNlcy4KPiAKPiBSZXBvcnRl
ZC1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkluIHRo
ZSBtYWludGlhbmVyJ3MgYWJzZW5jZSwgYW5kIGluIGxpZ2h0IG9mIHRoZSBvdGhlciBSLWIncywg
YW5kIHRoZQp0aW1pbmcsIEkgYXBwcm92ZSB0aGlzIGdvaW5nIGluIHdpdGhvdXQgdGhlIG1haW50
aWFuZXIncyBhY2s6CgpBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
