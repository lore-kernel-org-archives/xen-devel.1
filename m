From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v5 1/2] memory_hotplug: Free pages as higher
 order
Date: Thu, 18 Oct 2018 19:18:25 -0700
Message-ID: <20181018191825.fcad6e28f32a3686f201acdf__38679.8126892701$1539915430$gmane$org@linux-foundation.org>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <72215e75-6c7e-0aef-c06e-e3aba47cf806@suse.cz>
 <efb65160af41d0e18cb2dcb30c2fb86a@codeaurora.org>
 <20181010173334.GL5873@dhcp22.suse.cz>
 <a2d576a5fc82cdf54fc89409686e58f5@codeaurora.org>
 <20181011075503.GQ5873@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=52d1=m7=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1gDKMw-0001Fh-IW
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 02:18:30 +0000
In-Reply-To: <20181011075503.GQ5873@dhcp22.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, Arun KS <arunks@codeaurora.org>, getarunks@gmail.com, kys@microsoft.com, dan.j.williams@intel.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, boris.ostrovsky@oracle.com, Vlastimil Babka <vbabka@suse.cz>, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMSBPY3QgMjAxOCAwOTo1NTowMyArMDIwMCBNaWNoYWwgSG9ja28gPG1ob2Nrb0Br
ZXJuZWwub3JnPiB3cm90ZToKCj4gPiA+ID4gPiBUaGlzIGlzIG5vdyBub3QgY2FsbGVkIGFueW1v
cmUsIGFsdGhvdWdoIHRoZSB4ZW4vaHYgdmFyaWFudHMgc3RpbGwgZG8KPiA+ID4gPiA+IGl0LiBU
aGUgZnVuY3Rpb24gc2VlbXMgZW1wdHkgdGhlc2UgZGF5cywgbWF5YmUgcmVtb3ZlIGl0IGFzIGEg
Zm9sbG93dXAKPiA+ID4gPiA+IGNsZWFudXA/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtCV9fb25s
aW5lX3BhZ2VfaW5jcmVtZW50X2NvdW50ZXJzKHBhZ2UpOwo+ID4gPiA+ID4gPiAtCV9fb25saW5l
X3BhZ2VfZnJlZShwYWdlKTsKPiA+ID4gPiA+ID4gKwlfX2ZyZWVfcGFnZXNfY29yZShwYWdlLCBv
cmRlcik7Cj4gPiA+ID4gPiA+ICsJdG90YWxyYW1fcGFnZXMgKz0gKDFVTCA8PCBvcmRlcik7Cj4g
PiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX0hJR0hNRU0KPiA+ID4gPiA+ID4gKwlpZiAoUGFnZUhp
Z2hNZW0ocGFnZSkpCj4gPiA+ID4gPiA+ICsJCXRvdGFsaGlnaF9wYWdlcyArPSAoMVVMIDw8IG9y
ZGVyKTsKPiA+ID4gPiA+ID4gKyNlbmRpZgo+ID4gPiA+ID4KPiA+ID4gPiA+IF9fb25saW5lX3Bh
Z2VfaW5jcmVtZW50X2NvdW50ZXJzKCkgd291bGQgaGF2ZSB1c2VkCj4gPiA+ID4gPiBhZGp1c3Rf
bWFuYWdlZF9wYWdlX2NvdW50KCkgd2hpY2ggd291bGQgZG8gdGhlIGNoYW5nZXMgdW5kZXIKPiA+
ID4gPiA+IG1hbmFnZWRfcGFnZV9jb3VudF9sb2NrLiBBcmUgd2Ugc2FmZSB3aXRob3V0IHRoZSBs
b2NrPyBJZiB5ZXMsIHRoZXJlCj4gPiA+ID4gPiBzaG91bGQgcGVyaGFwcyBiZSBhIGNvbW1lbnQg
ZXhwbGFpbmluZyB3aHkuCj4gPiA+ID4gCj4gPiA+ID4gTG9va3MgdW5zYWZlIHdpdGhvdXQgbWFu
YWdlZF9wYWdlX2NvdW50X2xvY2suCj4gPiA+IAo+ID4gPiBXaHkgZG9lcyBpdCBtYXR0ZXIgYWN0
dWFsbHk/IFdlIGNhbm5vdCBvbmxpbmUvb2ZmbGluZSBtZW1vcnkgaW4KPiA+ID4gcGFyYWxsZWwu
IFRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciB0aGUgYm9vdCB3aGVyZSB3ZSBpbml0aWFsaXplIG1l
bW9yeQo+ID4gPiBpbiBwYXJhbGxlbCBvbiBtdWx0aXBsZSBub2Rlcy4gU28gdGhpcyBzZWVtcyB0
byBiZSBzYWZlIGN1cnJlbnRseSB1bmxlc3MKPiA+ID4gSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4g
QSBjb21tZW50IGV4cGxhaW5pbmcgdGhhdCB3b3VsZCBiZSBoZWxwZnVsCj4gPiA+IHRob3VnaC4K
PiA+IAo+ID4gT3RoZXIgbWFpbiBjYWxsZXJzIG9mIGFkanVzdF9tYW5hZ2VfcGFnZV9jb3VudCgp
LAo+ID4gCj4gPiBzdGF0aWMgaW5saW5lIHZvaWQgZnJlZV9yZXNlcnZlZF9wYWdlKHN0cnVjdCBw
YWdlICpwYWdlKQo+ID4gewo+ID4gICAgICAgICBfX2ZyZWVfcmVzZXJ2ZWRfcGFnZShwYWdlKTsK
PiA+ICAgICAgICAgYWRqdXN0X21hbmFnZWRfcGFnZV9jb3VudChwYWdlLCAxKTsKPiA+IH0KPiA+
IAo+ID4gc3RhdGljIGlubGluZSB2b2lkIG1hcmtfcGFnZV9yZXNlcnZlZChzdHJ1Y3QgcGFnZSAq
cGFnZSkKPiA+IHsKPiA+ICAgICAgICAgU2V0UGFnZVJlc2VydmVkKHBhZ2UpOwo+ID4gICAgICAg
ICBhZGp1c3RfbWFuYWdlZF9wYWdlX2NvdW50KHBhZ2UsIC0xKTsKPiA+IH0KPiA+IAo+ID4gV29u
J3QgdGhleSByYWNlIHdpdGggbWVtb3J5IGhvdHBsdWc/Cj4gPiAKPiA+IEZldyBtb3JlLAo+ID4g
Li9kcml2ZXJzL3hlbi9iYWxsb29uLmM6NTE5OiAgICAgICAgICAgIGFkanVzdF9tYW5hZ2VkX3Bh
Z2VfY291bnQocGFnZSwgLTEpOwo+ID4gLi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5j
OjE3NTogIGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQocGFnZSwgLTEpOwo+ID4gLi9kcml2ZXJz
L3ZpcnRpby92aXJ0aW9fYmFsbG9vbi5jOjE5NjogIGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQo
cGFnZSwgMSk7Cj4gPiAuL21tL2h1Z2V0bGIuYzoyMTU4OiAgICAgICAgICAgICAgICAgICAgYWRq
dXN0X21hbmFnZWRfcGFnZV9jb3VudChwYWdlLCAxIDw8Cj4gPiBoLT5vcmRlcik7Cj4gCj4gVGhl
eSBjYW4sIGFuZCBJIGhhdmUgbWlzc2VkIHRob3NlLgoKU28gdGhpcyBwYXRjaCBuZWVkcyBtb3Jl
IHdvcmssIHllcz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
