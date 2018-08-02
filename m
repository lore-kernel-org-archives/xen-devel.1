From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 20/32] libxl_qmp: Handle write to QMP
 socket
Date: Thu, 2 Aug 2018 13:02:13 +0200
Message-ID: <20180802110213.g3sikn5ybs5bpqep@mac>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-21-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=os/m=kr=citrix.com=prvs=7454c2131=roger.pau@srs-us1.protection.inumbo.net>)
 id 1flBNB-0002Ip-TL
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 11:02:25 +0000
Content-Disposition: inline
In-Reply-To: <20180727140614.13256-21-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjcsIDIwMTggYXQgMDM6MDY6MDJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhlIGxpYnhsX19ldl9xbXBfKiB3aWxsIG5vdyBzZW5kIHRoZSBjb21tYW5kIHRv
IFFFTVUgd2hlbiB0aGUgc29ja2V0IGlzCj4gcmVhZHkgZm9yIHdyaXRlcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4gLS0tCj4g
IHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgYi90b29scy9saWJ4bC9saWJ4bF9x
bXAuYwo+IGluZGV4IDI3OTJmMzU5MTIuLjc1Zjk1M2Q1MjEgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfcW1wLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwo+IEBAIC0x
MzI2LDYgKzEzMjYsOCBAQCBzdGF0aWMgaW50IHFtcF9ldl9wcmVwYXJlX2NtZChsaWJ4bF9fZ2Mg
KmdjLAo+ICAgICAgZXYtPnR4X2J1ZiA9IGJ1ZjsKPiAgICAgIGV2LT50eF9idWZfbGVuID0gbGVu
Owo+ICAKPiArICAgIGxpYnhsX19ldl9mZF9tb2RpZnkoZ2MsICZldi0+cW1wX2VmZCwgZXYtPnFt
cF9lZmQuZXZlbnRzIHwgUE9MTE9VVCk7Cj4gKwo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAgCj4g
QEAgLTE0MzUsNiArMTQzNyw0MyBAQCBzdGF0aWMgaW50IHFtcF9ldl9jYWxsYmFja19yZWFkYWJs
ZShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9xbXAgKmV2LCBpbnQgZmQpCj4gICAgICByZXR1
cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIGludCBxbXBfZXZfY2FsbGJhY2tfd3JpdGFibGUobGli
eGxfX2djICpnYywgbGlieGxfX2V2X3FtcCAqZXYsIGludCBmZCkKPiArewo+ICsgICAgaW50IHJj
Owo+ICsgICAgY2hhciAqYnVmOwo+ICsgICAgc2l6ZV90IGxlbjsKPiArICAgIGludCBidWZfZmQg
PSAtMTsKCkkgd291bGQgbmFtZSB0aGlzIHNlbmRfZmQuCgo+ICsKPiArICAgIC8qIE5vIG5lZWQg
dG8gY2FsbCBxbXBfZXZfY2FsbGJhY2tfd3JpdGFibGUgYWdhaW4sIGV2ZXJ5dGhpbmcgdGhhdCBu
ZWVkcyB0bwo+ICsgICAgICogYmUgc2VuZCBmb3Igbm93IHdpbGwgYmUgaW4gdGhpcyBjYWxsLiAq
Lwo+ICsgICAgbGlieGxfX2V2X2ZkX21vZGlmeShnYywgJmV2LT5xbXBfZWZkLCBldi0+cW1wX2Vm
ZC5ldmVudHMgJiB+UE9MTE9VVCk7CgpJIHRoaW5rIHlvdSBkbyB0aGlzIGJlY2F1c2UgeW91IG5l
ZWQgdG8gd2FpdCBmb3IgdGhpcyBjb21tYW5kIHRvCmNvbXBsZXRlIGJlZm9yZSBxdWV1aW5nIGFu
b3RoZXIgY29tbWFuZD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
