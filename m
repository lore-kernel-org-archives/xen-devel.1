From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 12/16] xen/mm: Switch common/memory.c to
 use typesafe MFN
Date: Fri, 23 Feb 2018 18:05:53 +0000
Message-ID: <20180223180553.cegkcfthqjti4qwh@citrix.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-13-julien.grall@arm.com>
 <20180223172655.6luuswrqbtttqcff@citrix.com>
 <2566afed-ec43-231f-44cc-477a77109b1e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <2566afed-ec43-231f-44cc-477a77109b1e@arm.com>
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

T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDU6NDY6MzlQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IAo+IAo+IE9uIDIzLzAyLzE4IDE3OjI2LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2Vk
LCBGZWIgMjEsIDIwMTggYXQgMDI6MDI6NTVQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
ID4gPiBBIG5ldyBoZWxwZXIgY29weV9tZm5fdG9fZ3Vlc3QgaXMgaW50cm9kdWNlZCB0byBlYXNp
bHkgdG8gY29weSBhIE1GTiB0bwo+ID4gPiB0aGUgZ3Vlc3QgbWVtb3J5Lgo+ID4gPiAKPiA+ID4g
Tm90IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkCj4gPiAKPiA+IElzIHRoZXJlIGEgcmVhc29u
IHRvIG5vdCBtYWtlIGFsbCBndWVzdCBhY2Nlc3NvcnMgdHllcC1zYWZlIGluc3RlYWQ/Cj4gCj4g
Q291bGQgeW91IGNsYXJpZnkgd2hhdCB5b3UgbWVhbj8gTUZOIGFuZCB4ZW5fcGZuX3QgaGF2ZSBk
aWZmZXJlbnQgdHlwZSBvbgo+IEFybS4gU28gSSBhbSBub3Qgc3VyZSBob3cgeW91IHdvdWxkIGJl
IGFibGUgdG8gbWFrZSB0aGVtIHR5cGVzYWZlLgoKV2hhdCBJIG1lYW50IHdhcyB0byBtYWtlIGNv
cHlfe3RvLGZyb219X2d1ZXN0KiB0eXBlLXNhZmUuIEkganVzdCBmZWVsIGl0CmEgYml0IHN0cmFu
Z2UgeW91IG9ubHkgY3JlYXRlZCBhIHdyYXBwZXIgZm9yIHRoaXMgZmlsZS4gSSB3b25kZXIgd2h5
LgoKTm90ZSBJJ20ganVzdCBhc2tpbmcgcXVlc3Rpb24uIFRoYXQncyBub3QgbmVjZXNzYXJpbHkg
YSBnb29kIGlkZWEgdG8KdHVybiB0aGVtIGFsbCBpbiB0aGUgZW5kLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
