From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] tools/libxc: Drop xc_cpuid_to_str()
Date: Mon, 2 Jul 2018 15:45:02 +0200
Message-ID: <20180702134502.kvlrcdvpd4dzoio6@mac.bytemobile.com>
References: <1530525447-28347-1-git-send-email-andrew.cooper3@citrix.com>
 <1530525447-28347-2-git-send-email-andrew.cooper3@citrix.com>
 <20180702104156.ojtwqwxgqctnkzm7@mac.bytemobile.com>
 <88e87b02-9853-3106-22ae-4fa902b16606@citrix.com>
 <20180702133642.33zlcgbyo7fwmnzg@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180702133642.33zlcgbyo7fwmnzg@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMDM6MzY6NDJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEp1bCAwMiwgMjAxOCBhdCAwMToxNToxMFBNICswMTAwLCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24gMDIvMDcvMTggMTE6NDEsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4gPiA+IE9uIE1vbiwgSnVsIDAyLCAyMDE4IGF0IDEwOjU3OjI1QU0gKzAxMDAsIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+PiBUaGlzIGhlbHBlciBhcHBlYXJzIHRvIGhhdmUgYmVl
biBpbnRyb2R1Y2VkIDEwIHllYXJzIGFnbyBieSBjL3MgNWYxNGE4N2NlYgo+ID4gPj4gIng4Niwg
aHZtOiBHdWVzdCBDUFVJRCBjb25maWd1cmF0aW9uIiBhbmQgbmV2ZXIgaGFkIGFueSB1c2VycyBh
dCBhbGwuCj4gPiA+Pgo+ID4gPj4gYWxsb2Nfc3RyKCkgaXMgYWN0dWFsbHkgYW4gb3BlbmNvZGVk
IGNhbGxvYygpLCBhbmQgbm93IG9ubHkgaGFzIGEgc2luZ2xlCj4gPiA+PiBjYWxsZXIuICBVc2Ug
Y2FsbG9jKCkgZGlyZWN0bHkgYW5kIGRyb3AgYWxsb2Nfc3RyKCkuCj4gPiA+Pgo+ID4gPj4gU2ln
bmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+
ID4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
ID4gCj4gPiBUaGFua3MsCj4gPiAKPiA+ID4KPiA+ID4+IEBAIC04MzIsNyArODA5LDcgQEAgaW50
IHhjX2NwdWlkX3NldCgKPiA+ID4+ICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4+ICAgICAg
ICAgIH0KPiA+ID4+ICAgICAgICAgIAo+ID4gPj4gLSAgICAgICAgY29uZmlnX3RyYW5zZm9ybWVk
W2ldID0gYWxsb2Nfc3RyKCk7Cj4gPiA+PiArICAgICAgICBjb25maWdfdHJhbnNmb3JtZWRbaV0g
PSBjYWxsb2MoMzMsIDEpOyAvKiAzMiBiaXRzLCBOVUwgdGVybWluYXRvci4gKi8KPiA+ID4gSSB3
b3VsZCByYXRoZXIgZG8gc2l6ZW9mKCpjb25maWdfdHJhbnNmb3JtZWRbaV0pLCBidXQgSSdtIG5v
dCBnb2luZyB0bwo+ID4gPiBpbnNpc3QuCj4gPiAKPiA+IFdpdGhvdXQgYSBzdHJ1Y3R1cmUgb2Yg
dGhlIGZvcm06Cj4gPiAKPiA+IHN0cnVjdCB7Cj4gPiDCoMKgwqAgY2hhciBjZmdbMzNdOwo+ID4g
fTsKPiA+IAo+ID4gbm90IGFtb3VudCBvZiBzaXplb2YgdHJpY2tlcnkgd2lsbCB3b3JrIGhlcmUu
wqAgWW91ciBleGFtcGxlIHJlZHVjZXMgdG8KPiA+IHNpemVvZihjaGFyKSwgcmF0aGVyIHRoYW4g
MzIvMzMuCj4gCj4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgdXNpbmc6Cj4gCj4gY29uZmlnX3RyYW5z
Zm9ybWVkW2ldID0gY2FsbG9jKDMzLCAqY29uZmlnX3RyYW5zZm9ybWVkW2ldKTsKCkVyLCByYXRo
ZXI6Cgpjb25maWdfdHJhbnNmb3JtZWRbaV0gPSBjYWxsb2MoMzMsIHNpemVvZigqY29uZmlnX3Ry
YW5zZm9ybWVkW2ldKSk7CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
