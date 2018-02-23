From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 12/16] xen/mm: Switch common/memory.c to
 use typesafe MFN
Date: Fri, 23 Feb 2018 18:10:07 +0000
Message-ID: <20180223181007.zatqxo4cxfqfm7gd@citrix.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-13-julien.grall@arm.com>
 <20180223172655.6luuswrqbtttqcff@citrix.com>
 <2566afed-ec43-231f-44cc-477a77109b1e@arm.com>
 <20180223180553.cegkcfthqjti4qwh@citrix.com>
 <aaaea6ff-7593-f43c-9e43-2875a8d7f352@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <aaaea6ff-7593-f43c-9e43-2875a8d7f352@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDY6MDY6NTVQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIzLzAyLzE4IDE4OjA1LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24g
RnJpLCBGZWIgMjMsIDIwMTggYXQgMDU6NDY6MzlQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+ID4gPiAKPiA+ID4gCj4gPiA+IE9uIDIzLzAyLzE4IDE3OjI2LCBXZWkgTGl1IHdyb3RlOgo+
ID4gPiA+IE9uIFdlZCwgRmViIDIxLCAyMDE4IGF0IDAyOjAyOjU1UE0gKzAwMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPiA+ID4gPiA+IEEgbmV3IGhlbHBlciBjb3B5X21mbl90b19ndWVzdCBpcyBp
bnRyb2R1Y2VkIHRvIGVhc2lseSB0byBjb3B5IGEgTUZOIHRvCj4gPiA+ID4gPiB0aGUgZ3Vlc3Qg
bWVtb3J5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBOb3QgZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5k
ZWQKPiA+ID4gPiAKPiA+ID4gPiBJcyB0aGVyZSBhIHJlYXNvbiB0byBub3QgbWFrZSBhbGwgZ3Vl
c3QgYWNjZXNzb3JzIHR5ZXAtc2FmZSBpbnN0ZWFkPwo+ID4gPiAKPiA+ID4gQ291bGQgeW91IGNs
YXJpZnkgd2hhdCB5b3UgbWVhbj8gTUZOIGFuZCB4ZW5fcGZuX3QgaGF2ZSBkaWZmZXJlbnQgdHlw
ZSBvbgo+ID4gPiBBcm0uIFNvIEkgYW0gbm90IHN1cmUgaG93IHlvdSB3b3VsZCBiZSBhYmxlIHRv
IG1ha2UgdGhlbSB0eXBlc2FmZS4KPiA+IAo+ID4gV2hhdCBJIG1lYW50IHdhcyB0byBtYWtlIGNv
cHlfe3RvLGZyb219X2d1ZXN0KiB0eXBlLXNhZmUuIEkganVzdCBmZWVsIGl0Cj4gPiBhIGJpdCBz
dHJhbmdlIHlvdSBvbmx5IGNyZWF0ZWQgYSB3cmFwcGVyIGZvciB0aGlzIGZpbGUuIEkgd29uZGVy
IHdoeS4KPiAKPiBPaCwgSSBjYW4gaGF2ZSBhIGxvb2sgYXQgdGhhdC4KPiAKCkJlZm9yZSB5b3Ug
ZG8gYW55IHJlYWwgd29yayBwbGVhc2Ugd2FpdCBmb3Igb3RoZXIgcGVvcGxlIHRvIGNvbW1lbnQu
CgpJIGhhdmVuJ3QgZW50aXJlbHkgY29udmluY2VkIG15c2VsZiBpdCBpcyBhIGdvb2QgaWRlYS4g
Oy0pCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
