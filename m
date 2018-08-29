From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 03/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Wed, 29 Aug 2018 15:37:35 +0100
Message-ID: <fce357b9-16d5-000b-ec39-427b49a53b23@arm.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
 <5B86A77B02000078001E3123@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vdd+=lm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fv1bJ-0000Ie-IB
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:37:41 +0000
In-Reply-To: <5B86A77B02000078001E3123@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDgvMjkvMjAxOCAwMzowMiBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gKyNk
ZWZpbmUgYWx0ZXJuYXRpdmVfdmNhbGwyKGZ1bmMsIGFyZzEsIGFyZzIpICh7ICAgICAgICAgICBc
Cj4gKyAgICBBTFRfQ0FMTF9BUkcoYXJnMSwgMSk7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gKyAgICBBTFRfQ0FMTF9BUkcoYXJnMiwgMik7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCgpJIGJlbGlldmUgdGhpcyBjb2RlIGhhcyB0aGUgc2FtZSBpc3N1ZSBTdGVm
YW5vIHJlY2VudGx5IGRpc2NvdmVyZWQgb24gCnRoZSBTTUNDQy4KClVzaW5nIGV4cGxpY2l0IHJl
Z2lzdGVyIHZhcmlhYmxlIHdpbGwgbm90IHJlc2VydmUgdGhlIHJlZ2lzdGVyLiBTbyBpZiAKYXJn
KiBpcyBhIGZ1bmN0aW9uIGNhbGwsIHRoZSByZWdpc3RlciB5b3UgaGF2ZSBqdXN0IGFzc2lnbmVk
IHdpbGwgZ2V0IApjbG9iYmVyZWQgKHNlZSBbMV0pLgoKVGhlIHNvbHV0aW9uIHRvIHRoaXMgaXMg
ZXZhbHVhdGluZyBhbGwgdGhlIGFyZ3VtZW50cyBiZWZvcmUgZGVjbGFyaW5nIAp0aGUgdmFyaWFi
bGUgd2l0aCBleHBsaWNpdCByZWdpc3RlcnMuIFNlZSB0aGUgcGF0Y2ggWzJdIGZvciBhbiBleGFt
cGxlLgoKCj4gKyAgICBBTFRfQ0FMTF9OT19BUkczOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gKyAgICAodm9pZClzaXplb2YoZnVuYyhhcmcxLCBhcmcyKSk7ICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAodm9pZClhbHRlcm5hdGl2ZV9jYWxsTigyLCBpbnQs
IGZ1bmMpOyAgICAgICAgICAgICAgICBcCj4gK30pCgpbLi4uXQoKPiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vbGliLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiBAQCAtNjYsNiArNjYs
MTAgQEAKPiAgIAo+ICAgI2RlZmluZSBST1VORFVQKHgsIGEpICgoKHgpICsgKGEpIC0gMSkgJiB+
KChhKSAtIDEpKQo+ICAgCj4gKyNkZWZpbmUgY291bnRfdmFfYXJnXyhkb3QsIGExLCBhMiwgYTMs
IGE0LCBhNSwgYTYsIGE3LCBhOCwgeCwgLi4uKSB4ID4gKyNkZWZpbmUgY291bnRfdmFfYXJnKGFy
Z3MuLi4pIFwKPiArICAgIGNvdW50X3ZhX2FyZ18oLiwgIyMgYXJncywgOCwgNywgNiwgNSwgNCwg
MywgMiwgMSwgMCkKCldlIGhhdmUgYSBzaW1pbGFyIGZ1bmN0aW9uIGluIFNNQ0NDIHdoZXJlIG9u
bHkgdGhlIGFyZ3VtZW50cyBleGNlcHQgdGhlIApmaXJzdCBvbmUgKEZ1bmN0aW9uIElEKSBhbmQg
bGFzdCBvbmUgKFJlc3VsdCBwb2ludGVyKS4gSSBiZWxpZXZlIApkaWZmZXJlbnQgY29udGV4dCB3
aWxsIHJlcXVpcmUgZGlmZmVyZW50IHdheSB0byBjb3VudCBhcmd1bWVudCBpbiBvcmRlciAKdG8g
a2VlcCB0aGUgY29kZSByZWFkYWJsZS4KClNvIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgaWYgdGhl
cmUgYXJlIGEgYmVuZWZpdCB0byBoYXZlIHRoaXMgZnVuY3Rpb24gCmluIGNvbW1vbi4KCkNoZWVy
cywKClsxXSAKaHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy9Mb2NhbC1SZWdpc3Rl
ci1WYXJpYWJsZXMuaHRtbCNMb2NhbC1SZWdpc3Rlci1WYXJpYWJsZXMKClsyXSBodHRwczovL2xp
c3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wOC9tc2cwMjEzOS5odG1s
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
