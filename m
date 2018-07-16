From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 07/13] libx86: Introduce a helper to
 serialise cpuid_policy objects
Date: Mon, 16 Jul 2018 11:39:08 +0100
Message-ID: <63988cc2-3795-8bc1-66d1-10f55894288d@citrix.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-8-git-send-email-andrew.cooper3@citrix.com>
 <20180716091801.lcgno4b4g6h3hgoe@citrix.com>
 <5B4C694F02000078001D43C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4C694F02000078001D43C7@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTA6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA3LjE4IGF0
IDExOjE4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIEZyaSwgSnVsIDEzLCAy
MDE4IGF0IDA5OjAzOjA4UE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiArI2luY2x1
ZGUgPGVycm5vLmg+Cj4+PiAgI2luY2x1ZGUgPGludHR5cGVzLmg+Cj4+PiAgI2luY2x1ZGUgPHN0
ZGJvb2wuaD4KPj4+ICAjaW5jbHVkZSA8c3RkZGVmLmg+Cj4+PiBAQCAtMjMsNiArMjgsMTkgQEAg
c3RhdGljIGlubGluZSBib29sIHRlc3RfYml0KHVuc2lnbmVkIGludCBiaXQsIGNvbnN0IHZvaWQg
Cj4+ICp2YWRkcikKPj4+ICAgICAgcmV0dXJuIGFkZHJbYml0IC8gOF0gJiAoMXUgPDwgKGJpdCAl
IDgpKTsKPj4+ICB9Cj4+PiAgCj4+PiArLyogbWVtY3B5KCksIGJ1dCB3aXRoIGNvcHlfdG9fZ3Vl
c3Rfb2Zmc2V0KCkncyBBUEkuICovCj4+PiArI2RlZmluZSBjb3B5X3RvX2J1ZmZlcl9vZmZzZXQo
ZHN0LCBpbmRleCwgc3JjLCBucikgICAgICBcCj4+PiArKHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+PiArICAgIGNvbnN0IHR5cGVvZigq
KGRzdCkpICpzcmNfID0gKHNyYyk7ICAgICAgICAgICAgICAgICBcCj4+IEkgdGhpbmsgeW91IG1l
YW4gdHlwZW9mKCooc3JjKSkgaGVyZT8KPiBUbyBmb2xsb3cgY29weV90b19ndWVzdF9vZmZzZXQo
KSdzIG1vZGVsIHRoZXJlJ3MgbW9yZSBuZWVkZWQgaGVyZSwKPiBJIHRoaW5rOiBkc3QgYW5kIHNy
YyB3YW50IHRvIHBvaW50IHRvIHNpbWlsYXIgdHlwZSBvYmplY3RzIC8gYXJyYXlzIChpLmUuCj4g
dGhlIG1hY3JvIHdhbnRzIHRvIGVuZm9yY2UgdGhpcykuCgpUaGlzIHdyYXBwZXIgbmVlZHMgdG8g
YmUganVzdCBlbm91Z2ggdG8gY29tcGlsZSBmb3IgdXNlcnNwYWNlLsKgIEl0CmRvZXNuJ3QgbmVl
ZCBhbGwgdGhlIGZlYXR1cmVzIGFuZCBtaXNmZWF0dXJlcyBvZiB0aGUgaHlwZXJ2aXNvcgppbXBs
ZW1lbnRhdGlvbi4KClJlbWVtYmVyIHRoYXQgdGhlIGNvZGUgZ2V0cyBjb21waWxlZCB0d2ljZSwg
c28gdGhlcmUgaXMgbm8gY2hhbmNlIG9mCmVycm9ycyBhY3R1YWxseSBzbGlwcGluZyBpbi4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
