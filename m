From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 04/18] xen/arm: While a domain is suspended
 put its watchdogs on pause
Date: Mon, 12 Nov 2018 16:17:25 +0100
Message-ID: <CAKPH-NgJ=YFcdQtL4iN3RbFTLyiV7VgHWo1YVZw4qA5Sh5MtHw@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-5-git-send-email-mirela.simonovic@aggios.com>
 <5BE9684802000078001FADC0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE9684802000078001FADC0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMTI6NDcgUE0gSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAxMi4xMS4xOCBhdCAxMjozMCwgPG1p
cmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vdGltZXIuaAo+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3RpbWVyLmgKPiA+IEBAIC0xOCw2
ICsxOCw5IEBAIHN0cnVjdCB0aW1lciB7Cj4gPiAgICAgIC8qIFN5c3RlbSB0aW1lIGV4cGlyeSB2
YWx1ZSAobmFub3NlY29uZHMgc2luY2UgYm9vdCkuICovCj4gPiAgICAgIHNfdGltZV90IGV4cGly
ZXM7Cj4gPgo+ID4gKyAgICAvKiBTdXNwZW5kIHRpbWVzdGFtcCB2YWx1ZSAobmFub3NlY29uZHMg
c2luY2UgYm9vdCkuICovCj4gPiArICAgIHNfdGltZV90IHN1c3BlbmRlZDsKPgo+IEkgY2FuJ3Qg
c2VlIGhvdyB0aGlzIGJlY29tZXMgYSB1bml2ZXJzYWxseSB1c2VmdWwgZmllbGQsIHNvIEkKPiBk
b24ndCB0aGluayBpdCBiZWxvbmdzIGhlcmUuIEZvciB5b3VyIHB1cnBvc2UgZGVyaXZpbmcgYSBu
ZXcKPiBzdHJ1Y3R1cmUgY29udGFpbmluZyBzdHJ1Y3QgdGltZXIgYW5kIHRoaXMgb25lIGZpZWxk
IHNob3VsZAo+IHdvcmsuCgpFYWNoICdleHBpcmVzJyB2YWx1ZSBuZWVkcyB0byBiZSBjb3VwbGVk
IHdpdGggJ3N1c3BlbmRlZCcgdmFsdWUgdG8gYmUKYWJsZSB0byBkZWFsIHdpdGggd2F0Y2hkb2dz
IHdoZW4gc3VzcGVuZGluZyBhIGRvbWFpbi4gVGhpcyBpcyBzcGVjaWZpYwp0byBhIHdhdGNoZG9n
LgpJZiB3ZSBhZGQgYSBkZXJpdmVkIHN0cnVjdHVyZSB0byBjb250YWluIHRoaXMgZmllbGQgd2Ug
c3RpbGwgbmVlZCB0bwphc3NvY2lhdGUgc3VjaCBhIHN0cnVjdHVyZSB3aXRoIGVhY2ggd2F0Y2hk
b2cgb2YgYSBkb21haW4sIHdoaWNoIGlzCmFsc28gZG9tYWluIGdlbmVyaWMgaW5mbyBhbmQgcmVx
dWlyZXMgYSBsb3QgbW9yZSAoaW4gbXkgb3Bpbmlvbgp1bm5lY2Vzc2FyeSkgY2hhbmdlcy4gUGxl
YXNlIGxldCBtZSBrbm93IGlmIEkgbWlzaW50ZXJwcmV0ZWQgeW91cgpwcm9wb3NhbC4KClRoYW5r
cywKTWlyZWxhCgo+Cj4gSmFuCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
