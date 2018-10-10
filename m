From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Wed, 10 Oct 2018 19:33:34 +0200
Message-ID: <20181010173334.GL5873__30783.2006169066$1539192749$gmane$org@dhcp22.suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3vfw=mw=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gAIMe-0000e6-9y
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 17:33:40 +0000
Content-Disposition: inline
In-Reply-To: <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkIDEwLTEwLTE4IDIyOjI2OjQxLCBBcnVuIEtTIHdyb3RlOgo+IE9uIDIwMTgtMTAtMTAg
MjE6MDAsIFZsYXN0aW1pbCBCYWJrYSB3cm90ZToKPiA+IE9uIDEwLzUvMTggMTA6MTAgQU0sIEFy
dW4gS1Mgd3JvdGU6Cj4gPiA+IFdoZW4gZnJlZSBwYWdlcyBhcmUgZG9uZSB3aXRoIGhpZ2hlciBv
cmRlciwgdGltZSBzcGVuZCBvbgo+ID4gPiBjb2FsZXNjaW5nIHBhZ2VzIGJ5IGJ1ZGR5IGFsbG9j
YXRvciBjYW4gYmUgcmVkdWNlZC4gV2l0aAo+ID4gPiBzZWN0aW9uIHNpemUgb2YgMjU2TUIsIGhv
dCBhZGQgbGF0ZW5jeSBvZiBhIHNpbmdsZSBzZWN0aW9uCj4gPiA+IHNob3dzIGltcHJvdmVtZW50
IGZyb20gNTAtNjAgbXMgdG8gbGVzcyB0aGFuIDEgbXMsIGhlbmNlCj4gPiA+IGltcHJvdmluZyB0
aGUgaG90IGFkZCBsYXRlbmN5IGJ5IDYwJS4gTW9kaWZ5IGV4dGVybmFsCj4gPiA+IHByb3ZpZGVy
cyBvZiBvbmxpbmUgY2FsbGJhY2sgdG8gYWxpZ24gd2l0aCB0aGUgY2hhbmdlLgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogQXJ1biBLUyA8YXJ1bmtzQGNvZGVhdXJvcmEub3JnPgo+ID4gCj4g
PiBbLi4uXQo+ID4gCj4gPiA+IEBAIC02NTUsMjYgKzY1NSw0NCBAQCB2b2lkIF9fb25saW5lX3Bh
Z2VfZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+ID4gIH0KPiA+ID4gIEVYUE9SVF9TWU1CT0xf
R1BMKF9fb25saW5lX3BhZ2VfZnJlZSk7Cj4gPiA+IAo+ID4gPiAtc3RhdGljIHZvaWQgZ2VuZXJp
Y19vbmxpbmVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiA+ID4gK3N0YXRpYyBpbnQgZ2VuZXJp
Y19vbmxpbmVfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgaW50IG9yZGVyKQo+ID4g
PiAgewo+ID4gPiAtCV9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cyhwYWdlKTsKPiA+IAo+ID4gVGhp
cyBpcyBub3cgbm90IGNhbGxlZCBhbnltb3JlLCBhbHRob3VnaCB0aGUgeGVuL2h2IHZhcmlhbnRz
IHN0aWxsIGRvCj4gPiBpdC4gVGhlIGZ1bmN0aW9uIHNlZW1zIGVtcHR5IHRoZXNlIGRheXMsIG1h
eWJlIHJlbW92ZSBpdCBhcyBhIGZvbGxvd3VwCj4gPiBjbGVhbnVwPwo+ID4gCj4gPiA+IC0JX19v
bmxpbmVfcGFnZV9pbmNyZW1lbnRfY291bnRlcnMocGFnZSk7Cj4gPiA+IC0JX19vbmxpbmVfcGFn
ZV9mcmVlKHBhZ2UpOwo+ID4gPiArCV9fZnJlZV9wYWdlc19jb3JlKHBhZ2UsIG9yZGVyKTsKPiA+
ID4gKwl0b3RhbHJhbV9wYWdlcyArPSAoMVVMIDw8IG9yZGVyKTsKPiA+ID4gKyNpZmRlZiBDT05G
SUdfSElHSE1FTQo+ID4gPiArCWlmIChQYWdlSGlnaE1lbShwYWdlKSkKPiA+ID4gKwkJdG90YWxo
aWdoX3BhZ2VzICs9ICgxVUwgPDwgb3JkZXIpOwo+ID4gPiArI2VuZGlmCj4gPiAKPiA+IF9fb25s
aW5lX3BhZ2VfaW5jcmVtZW50X2NvdW50ZXJzKCkgd291bGQgaGF2ZSB1c2VkCj4gPiBhZGp1c3Rf
bWFuYWdlZF9wYWdlX2NvdW50KCkgd2hpY2ggd291bGQgZG8gdGhlIGNoYW5nZXMgdW5kZXIKPiA+
IG1hbmFnZWRfcGFnZV9jb3VudF9sb2NrLiBBcmUgd2Ugc2FmZSB3aXRob3V0IHRoZSBsb2NrPyBJ
ZiB5ZXMsIHRoZXJlCj4gPiBzaG91bGQgcGVyaGFwcyBiZSBhIGNvbW1lbnQgZXhwbGFpbmluZyB3
aHkuCj4gCj4gTG9va3MgdW5zYWZlIHdpdGhvdXQgbWFuYWdlZF9wYWdlX2NvdW50X2xvY2suCgpX
aHkgZG9lcyBpdCBtYXR0ZXIgYWN0dWFsbHk/IFdlIGNhbm5vdCBvbmxpbmUvb2ZmbGluZSBtZW1v
cnkgaW4KcGFyYWxsZWwuIFRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciB0aGUgYm9vdCB3aGVyZSB3
ZSBpbml0aWFsaXplIG1lbW9yeQppbiBwYXJhbGxlbCBvbiBtdWx0aXBsZSBub2Rlcy4gU28gdGhp
cyBzZWVtcyB0byBiZSBzYWZlIGN1cnJlbnRseSB1bmxlc3MKSSBhbSBtaXNzaW5nIHNvbWV0aGlu
Zy4gQSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCB3b3VsZCBiZSBoZWxwZnVsCnRob3VnaC4KLS0g
Ck1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
