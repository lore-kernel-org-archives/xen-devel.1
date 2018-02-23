From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 12/16] xen/mm: Switch common/memory.c to
 use typesafe MFN
Date: Fri, 23 Feb 2018 18:06:55 +0000
Message-ID: <aaaea6ff-7593-f43c-9e43-2875a8d7f352@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-13-julien.grall@arm.com>
 <20180223172655.6luuswrqbtttqcff@citrix.com>
 <2566afed-ec43-231f-44cc-477a77109b1e@arm.com>
 <20180223180553.cegkcfthqjti4qwh@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180223180553.cegkcfthqjti4qwh@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy8wMi8xOCAxODowNSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEZlYiAyMywg
MjAxOCBhdCAwNTo0NjozOVBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9u
IDIzLzAyLzE4IDE3OjI2LCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gV2VkLCBGZWIgMjEsIDIwMTgg
YXQgMDI6MDI6NTVQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEEgbmV3IGhlbHBl
ciBjb3B5X21mbl90b19ndWVzdCBpcyBpbnRyb2R1Y2VkIHRvIGVhc2lseSB0byBjb3B5IGEgTUZO
IHRvCj4+Pj4gdGhlIGd1ZXN0IG1lbW9yeS4KPj4+Pgo+Pj4+IE5vdCBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZAo+Pj4KPj4+IElzIHRoZXJlIGEgcmVhc29uIHRvIG5vdCBtYWtlIGFsbCBndWVz
dCBhY2Nlc3NvcnMgdHllcC1zYWZlIGluc3RlYWQ/Cj4+Cj4+IENvdWxkIHlvdSBjbGFyaWZ5IHdo
YXQgeW91IG1lYW4/IE1GTiBhbmQgeGVuX3Bmbl90IGhhdmUgZGlmZmVyZW50IHR5cGUgb24KPj4g
QXJtLiBTbyBJIGFtIG5vdCBzdXJlIGhvdyB5b3Ugd291bGQgYmUgYWJsZSB0byBtYWtlIHRoZW0g
dHlwZXNhZmUuCj4gCj4gV2hhdCBJIG1lYW50IHdhcyB0byBtYWtlIGNvcHlfe3RvLGZyb219X2d1
ZXN0KiB0eXBlLXNhZmUuIEkganVzdCBmZWVsIGl0Cj4gYSBiaXQgc3RyYW5nZSB5b3Ugb25seSBj
cmVhdGVkIGEgd3JhcHBlciBmb3IgdGhpcyBmaWxlLiBJIHdvbmRlciB3aHkuCgpPaCwgSSBjYW4g
aGF2ZSBhIGxvb2sgYXQgdGhhdC4KCj4gCj4gTm90ZSBJJ20ganVzdCBhc2tpbmcgcXVlc3Rpb24u
IFRoYXQncyBub3QgbmVjZXNzYXJpbHkgYSBnb29kIGlkZWEgdG8KPiB0dXJuIHRoZW0gYWxsIGlu
IHRoZSBlbmQuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
