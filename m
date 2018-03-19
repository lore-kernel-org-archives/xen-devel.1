From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 04/12] hvmloader: add ACPI enabling for
 Q35
Date: Tue, 20 Mar 2018 09:59:41 +1000
Message-ID: <20180320095941.00001bce@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <ba3b25a03bc5f6d51988555ad71b7bea131ee4bc.1520867741.git.x1917x@gmail.com>
 <20180319130158.42vweh6u5qrtd63d@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zqd6=gj=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1ey4gy-0002uV-PF
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 23:59:52 +0000
Received: by mail-lf0-x242.google.com with SMTP id o102-v6so5482563lfg.8
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 16:59:50 -0700 (PDT)
In-Reply-To: <20180319130158.42vweh6u5qrtd63d@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxOSBNYXIgMjAxOCAxMzowMTo1OCArMDAwMApSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cgo+T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDQ6MzM6
NDlBTSArMTAwMCwgQWxleGV5IEdlcmFzaW1lbmtvIHdyb3RlOgo+PiBJbiBvcmRlciB0byB0dXJu
IG9uIEFDUEkgZm9yIE9TLCB3ZSBuZWVkIHRvIHdyaXRlIGEgY2hpcHNldC1zcGVjaWZpYwo+PiB2
YWx1ZSB0byBTTUlfQ01EIHJlZ2lzdGVyIChzb3J0IG9mIGltaXRhdGlvbiBvZiB0aGUgQVBNLT5B
Q1BJIHN3aXRjaAo+PiBvbiByZWFsIHN5c3RlbXMpLiBNb2RpZnkgYWNwaV9lbmFibGVfc2NpKCkg
ZnVuY3Rpb24gdG8gc3VwcG9ydCBib3RoCj4+IGk0NDAgYW5kIFEzNSBlbXVsYXRpb24uCj4+IAo+
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4ZXkgR2VyYXNpbWVua28gPHgxOTE3eEBnbWFpbC5jb20+Cj4+
IC0tLQo+PiAgdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxvYWRlci5jIHwgMTEgKysrKysr
KysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+IAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxvYWRlci5j
Cj4+IGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL2h2bWxvYWRlci5jIGluZGV4IGY2MDNmNjhk
ZWQuLjA3MDY5ODQ0MGUKPj4gMTAwNjQ0IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9o
dm1sb2FkZXIuYwo+PiArKysgYi90b29scy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmMK
Pj4gQEAgLTI1Nyw5ICsyNTcsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiaW9zX2NvbmZpZwo+
PiAqZGV0ZWN0X2Jpb3Modm9pZCkgc3RhdGljIHZvaWQgYWNwaV9lbmFibGVfc2NpKHZvaWQpCj4+
ICB7Cj4+ICAgICAgdWludDhfdCBwbTFhX2NudF92YWw7Cj4+ICsgICAgdWludDhfdCBhY3BpX2Vu
YWJsZV92YWw7Cj4+ICAKPj4gLSNkZWZpbmUgUElJWDRfU01JX0NNRF9JT1BPUlQgMHhiMgo+PiAr
I2RlZmluZSBTTUlfQ01EX0lPUE9SVCAgICAgICAweGIyCj4+ICAjZGVmaW5lIFBJSVg0X0FDUElf
RU5BQkxFICAgIDB4ZjEKPj4gKyNkZWZpbmUgSUNIOV9BQ1BJX0VOQUJMRSAgICAgMHgwMgo+PiAr
Cj4+ICsgICAgaWYgKGdldF9wY19tYWNoaW5lX3R5cGUoKSA9PSBNQUNISU5FX1RZUEVfUTM1KQo+
PiArICAgICAgICBhY3BpX2VuYWJsZV92YWwgPSBJQ0g5X0FDUElfRU5BQkxFOwo+PiArICAgIGVs
c2UKPj4gKyAgICAgICAgYWNwaV9lbmFibGVfdmFsID0gUElJWDRfQUNQSV9FTkFCTEU7ICAKPgo+
Q29kaW5nIHN0eWxlLCBidXQgSSB3b3VsZCByYXRoZXI6Cj4KPnN3aXRjaCAoIGdldF9wY19tYWNo
aW5lX3R5cGUoKSApCj57Cj5jYXNlIE1BQ0hJTkVfVFlQRV9RMzU6Cj4uLi4KPmNhc2UgTUFDSElO
RV9UWVBFX0k0NDA6Cj4uLi4KPmRlZmF1bHQ6Cj5CVUcoKTsKPn0KCkFncmVlLCBhIGJldHRlciBj
b2RlIG1haW50YWluYWJpbGl0eS4KCj5JIHRoaW5rIHN0b3JpbmcgdGhlIG1hY2hpbmUgdHlwZSBp
biBhIGdsb2JhbCB2YXJpYWJsZSBpcyBiZXR0ZXIgdGhhbgo+Y2FsbGluZyBnZXRfcGNfbWFjaGlu
ZV90eXBlIGVhY2ggdGltZS4KCk9LLCB3aWxsIHN3aXRjaCB0byBpdC4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
