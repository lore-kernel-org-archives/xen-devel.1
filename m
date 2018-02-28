From: Haozhong Zhang <haozhong.zhang@intel.com>
Subject: Re: [RFC XEN PATCH v4 33/41] tools/libacpi,
 hvmloader: detect QEMU fw_cfg interface
Date: Wed, 28 Feb 2018 17:17:23 +0800
Message-ID: <20180228091723.ecoix24jpzvik5t3@hz-desktop>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20171207101030.22364-34-haozhong.zhang@intel.com>
 <20180227173749.GA2296@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180227173749.GA2296@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Chao Peng <chao.p.peng@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjcvMTggMTc6MzcgKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFRodSwg
RGVjIDA3LCAyMDE3IGF0IDA2OjEwOjIyUE0gKzA4MDAsIEhhb3pob25nIFpoYW5nIHdyb3RlOgo+
ID4gQWRkIGEgZnVuY3Rpb24gaW4gbGliYWNwaSB0byBkZXRlY3QgUUVNVSBmd19jZmcgaW50ZXJm
YWNlLiBMaW1pdCB0aGUKPiA+IHVzYWdlIG9mIGZ3X2NmZyBpbnRlcmZhY2UgdG8gaHZtbG9hZGVy
IG5vdywgc28gdXNlIHN0dWIgZnVuY3Rpb25zIGZvcgo+ID4gb3RoZXJzLgo+IAo+IEkgdGhpbmsg
bGliYWNwaSBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlIGZvciBhIGRyaXZlci4gVGhlIGZ3X2NmZyBk
cml2ZXIKPiB3b3VsZCBiZSBiZXR0ZXIgaW4gaHZtbG9hZGVyLgoKWWVzLCBJIGNhbiBtb3ZlIGl0
IHRvIGh2bWxvYWRlci4gTXkgb3JpZ2luYWwgdGhvdWdodCB3YXMgaXQgbWlnaHQgYmUKcmV1c2Vk
IChieSByZXBsYWNpbmcgdGhvc2Ugc3R1YiBmdW5jdGlvbnMpIHdoZW4gc29tZW9uZSB3YW50cyB0
byBhZGQKdk5WRElNTSBzdXBwb3J0IHRvIFBWSCBkb21VIGFuZCBzdGlsbCB1c2UgUUVNVSBhcyB0
aGUgZGV2aWNlIG1vZGVsCmZvciB2TlZESU1NLgoKPiAKPiBBcyB0byBjb3B5IHRoZSBBQ1BJIHRh
YmxlcyBmcm9tIGZ3X2NmZyB0byBsaWJhY3BpLCBtYXliZSB0aGUgcGFzc3Rocm91Z2gKPiB0YWJs
ZXMgKG9yIGFuIGltcHJvdmVtZW50IG9mIGl0KSBjb3VsZCBiZSB1c2UuIChJdCBpcyBhbHJlYWR5
IHRvIHRvIGFkZAo+IGV4dHJhIHRhYmxlcyBmcm9tIGxpYnhsIChIVk1fWFNfQUNQSV9QVF9BRERS
RVNTKS4pCj4KClRoZXkgYXJlIGRvaW5nIHRoZSBzYW1lIGpvYiAodHJhbnNmZXJyaW5nIGd1ZXN0
IEFDUEkgZnJvbSBob3N0IHRvCmd1ZXN0KSBpbiB0d28gcXVpdGUgZGlmZmVyZW50IHdheXMsIHJh
dGhlciB0aGFuIHR3byBwaWVjZXMgb2Ygam9icyBub3QKY29tcGxldGVseSBvdmVybGFwLCBzbyBJ
IHRoaW5rIGl0J3MgaGFyZCB0byBsZXQgdGhlbSBjb2xsYWJvcmF0ZSB3aXRoCmVhY2ggb3RoZXIu
IERvIHlvdSBoYXZlIGFueSBpZGVhIGluIG1pbmQ/CgpUaGFua3MsCkhhb3pob25nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
