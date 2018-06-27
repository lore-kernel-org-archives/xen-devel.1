From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] x86/cpuid: Alter the policy logic for
 leaf 0xb to be multi-invocation
Date: Wed, 27 Jun 2018 17:00:03 +0100
Message-ID: <20180627160003.kuvh5fgwnsnaqy3s@citrix.com>
References: <1530107750-22040-1-git-send-email-andrew.cooper3@citrix.com>
 <1530107750-22040-3-git-send-email-andrew.cooper3@citrix.com>
 <5B33A61902000078001CE750@prv1-mh.provo.novell.com>
 <5936b8d9-033f-9568-db23-5f8b45b8d710@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5936b8d9-033f-9568-db23-5f8b45b8d710@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDQ6NTg6MDhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wNi8xOCAxNTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+PiBPbiAy
Ny4wNi4xOCBhdCAxNTo1NSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+
IEBAIC0zMTYsNiArMzE5LDMzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcmF3X3Bv
bGljeSh2b2lkKQo+ID4+ICAgICAgICAgICAgICBjcHVpZF9jb3VudF9sZWFmKDcsIGksICZwLT5m
ZWF0LnJhd1tpXSk7Cj4gPj4gICAgICB9Cj4gPj4gIAo+ID4+ICsgICAgaWYgKCBwLT5iYXNpYy5t
YXhfbGVhZiA+PSAweGIgKQo+ID4+ICsgICAgewo+ID4+ICsgICAgICAgIHVuaW9uIHsKPiA+PiAr
ICAgICAgICAgICAgc3RydWN0IGNwdWlkX2xlYWYgbDsKPiA+PiArICAgICAgICAgICAgc3RydWN0
IGNwdWlkX3RvcG9fbGVhZiB0Owo+ID4+ICsgICAgICAgIH0gdTsKPiA+PiArCj4gPj4gKyAgICAg
ICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHAtPnRvcG8ucmF3KTsgKytpICkKPiA+PiAr
ICAgICAgICB7Cj4gPj4gKyAgICAgICAgICAgIGNwdWlkX2NvdW50X2xlYWYoMHhiLCBpLCAmdS5s
KTsKPiA+PiArCj4gPj4gKyAgICAgICAgICAgIGlmICggdS50LnR5cGUgPT0gMCApCj4gPj4gKyAg
ICAgICAgICAgICAgICBicmVhazsKPiA+PiArCj4gPj4gKyAgICAgICAgICAgIHAtPnRvcG8uc3Vi
bGVhZltpXSA9IHUudDsKPiA+PiArICAgICAgICB9Cj4gPj4gKwo+ID4+ICsgICAgICAgIC8qCj4g
Pj4gKyAgICAgICAgICogVGhlIGNob2ljZSBvZiBDUFVJRF9HVUVTVF9OUl9UT1BPIGlzIHBlciB0
aGUgbWFudWFsLiAgSXQgbWF5IG5lZWQKPiA+PiArICAgICAgICAgKiB0byBncm93IGZvciBmdXR1
cmUgaGFyd2FyZS4KPiA+IE1pc3NpbmcgZC4KPiAKPiBXaGVyZT/CoCBJJ20gYWZyYWlkIHRoYXQg
YWZ0ZXIgcmVwZWF0ZWQgcmUtcmVhZHMsIEkgY2FuJ3Qgc3BvdCBhbnkgaXNzdWUuCj4gCgpoYXIg
ZCB3YXJlLiA7cAoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
