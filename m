From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: consolidate legacy FPU state loading
Date: Tue, 3 Jul 2018 11:48:04 +0100
Message-ID: <20180703104803.ajalohm47ljid5y4@citrix.com>
References: <5B31F09302000078001CDD99@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ov0f=jt=citrix.com=prvs=7153ab8a3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1faIqt-0007Gm-KF
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 10:48:07 +0000
Content-Disposition: inline
In-Reply-To: <5B31F09302000078001CDD99@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDE6NTE6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRmlyc3Qgb2YgYWxsIGludHJvZHVjZSBhIGhlbHBlciBmdW5jdGlvbiBpbnN0ZWFkIG9m
IHJlcGxpY2F0aW5nIGFsbW9zdAo+IHRoZSBzYW1lIGNvZGUgZm9yIFBWIGFuZCBIVk0uIFRoZSBk
aWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSB0d28gcGllY2VzIG9mCj4gY29kZSBhY3R1YWxseSBwb2lu
dHMgb3V0IGFuIGlzc3VlICh3aGljaCBpcyBhbHNvIGFkZHJlc3NlZCBoZXJlKTogSW4KPiB0aGUg
SFZNIGNhc2UgRkNXIHdvdWxkIG5vdCBoYXZlIGJlZW4gc2V0IHRvIEZDV19SRVNFVCBpbiBjZXJ0
YWluIGNhc2VzCj4gKG5vdGUgZm9yIGV4YW1wbGUgdGhhdCBYUlNUT1IgbG9hZHMgRkNXX0RFRkFV
TFQgcmF0aGVyIHRoZW4gRkNXX1JFU0VUCj4gd2hlbiB0aGUgcmVzcGVjdGl2ZSB4c3RhdGVfYnYg
Yml0IGlzIGNsZWFyKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkkg
ZG8gd29uZGVyIGlmIHRoaXMgZnVuY3Rpb24gY2FuIGJlIHVzZWQgaW4gaHZtX3ZjcHVfcmVzZXRf
c3RhdGUgYXMKd2VsbC4KCj4gK3ZvaWQgdmNwdV9sb2FkX2ZwdShzdHJ1Y3QgdmNwdSAqdiwgc3Ry
dWN0IHhzYXZlX3N0cnVjdCAqeHNhdmVfYXJlYSwKPiArICAgICAgICAgICAgICAgICAgIGNvbnN0
IHZvaWQgKmRhdGEsIHVuc2lnbmVkIGludCBmY3dfZGVmYXVsdCkKPiArewo+ICsgICAgLyoKPiAr
ICAgICAqIEZvciB0aGUgZW50aXJlIGZ1bmN0aW9uIHBsZWFzZSBub3RlIHRoYXQgdmNwdV9pbml0
X2ZwdSgpIChhYm92ZSkgcG9pbnRzCgpUaGUgImFib3ZlIiBpc24ndCB2ZXJ5IHVzZWZ1bCBoZXJl
LiBJdCB3aWxsIGJlY29tZSBzdGFsZSBvbmNlIGNvZGUgaXMKc2h1ZmZsZWQuCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
