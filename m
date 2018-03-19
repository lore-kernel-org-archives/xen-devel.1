From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 04/12] hvmloader: add ACPI enabling for
 Q35
Date: Mon, 19 Mar 2018 13:01:58 +0000
Message-ID: <20180319130158.42vweh6u5qrtd63d@MacBook-Pro-de-Roger.local>
References: <cover.1520867740.git.x1917x@gmail.com>
 <ba3b25a03bc5f6d51988555ad71b7bea131ee4bc.1520867741.git.x1917x@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bmhu=gj=citrix.com=prvs=6096ac43a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1exuSO-0007h1-S0
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 13:04:08 +0000
Content-Disposition: inline
In-Reply-To: <ba3b25a03bc5f6d51988555ad71b7bea131ee4bc.1520867741.git.x1917x@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey Gerasimenko <x1917x@gmail.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDQ6MzM6NDlBTSArMTAwMCwgQWxleGV5IEdlcmFzaW1l
bmtvIHdyb3RlOgo+IEluIG9yZGVyIHRvIHR1cm4gb24gQUNQSSBmb3IgT1MsIHdlIG5lZWQgdG8g
d3JpdGUgYSBjaGlwc2V0LXNwZWNpZmljIHZhbHVlCj4gdG8gU01JX0NNRCByZWdpc3RlciAoc29y
dCBvZiBpbWl0YXRpb24gb2YgdGhlIEFQTS0+QUNQSSBzd2l0Y2ggb24gcmVhbAo+IHN5c3RlbXMp
LiBNb2RpZnkgYWNwaV9lbmFibGVfc2NpKCkgZnVuY3Rpb24gdG8gc3VwcG9ydCBib3RoIGk0NDAg
YW5kIFEzNQo+IGVtdWxhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4ZXkgR2VyYXNpbWVu
a28gPHgxOTE3eEBnbWFpbC5jb20+Cj4gLS0tCj4gIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9o
dm1sb2FkZXIuYyB8IDExICsrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2
bWxvYWRlci9odm1sb2FkZXIuYyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIu
Ywo+IGluZGV4IGY2MDNmNjhkZWQuLjA3MDY5ODQ0MGUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL2h2bWxvYWRlci5jCj4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9h
ZGVyL2h2bWxvYWRlci5jCj4gQEAgLTI1Nyw5ICsyNTcsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBiaW9zX2NvbmZpZyAqZGV0ZWN0X2Jpb3Modm9pZCkKPiAgc3RhdGljIHZvaWQgYWNwaV9lbmFi
bGVfc2NpKHZvaWQpCj4gIHsKPiAgICAgIHVpbnQ4X3QgcG0xYV9jbnRfdmFsOwo+ICsgICAgdWlu
dDhfdCBhY3BpX2VuYWJsZV92YWw7Cj4gIAo+IC0jZGVmaW5lIFBJSVg0X1NNSV9DTURfSU9QT1JU
IDB4YjIKPiArI2RlZmluZSBTTUlfQ01EX0lPUE9SVCAgICAgICAweGIyCj4gICNkZWZpbmUgUElJ
WDRfQUNQSV9FTkFCTEUgICAgMHhmMQo+ICsjZGVmaW5lIElDSDlfQUNQSV9FTkFCTEUgICAgIDB4
MDIKPiArCj4gKyAgICBpZiAoZ2V0X3BjX21hY2hpbmVfdHlwZSgpID09IE1BQ0hJTkVfVFlQRV9R
MzUpCj4gKyAgICAgICAgYWNwaV9lbmFibGVfdmFsID0gSUNIOV9BQ1BJX0VOQUJMRTsKPiArICAg
IGVsc2UKPiArICAgICAgICBhY3BpX2VuYWJsZV92YWwgPSBQSUlYNF9BQ1BJX0VOQUJMRTsKCkNv
ZGluZyBzdHlsZSwgYnV0IEkgd291bGQgcmF0aGVyOgoKc3dpdGNoICggZ2V0X3BjX21hY2hpbmVf
dHlwZSgpICkKewpjYXNlIE1BQ0hJTkVfVFlQRV9RMzU6Ci4uLgpjYXNlIE1BQ0hJTkVfVFlQRV9J
NDQwOgouLi4KZGVmYXVsdDoKQlVHKCk7Cn0KCkkgdGhpbmsgc3RvcmluZyB0aGUgbWFjaGluZSB0
eXBlIGluIGEgZ2xvYmFsIHZhcmlhYmxlIGlzIGJldHRlciB0aGFuCmNhbGxpbmcgZ2V0X3BjX21h
Y2hpbmVfdHlwZSBlYWNoIHRpbWUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
