From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: intel_pstate driver patches by Wei Wang from 2015
Date: Mon, 17 Dec 2018 13:19:00 +0000
Message-ID: <ad8bf58a-172c-0f82-6edc-ce0b4afb25c1@citrix.com>
References: <20181214141654.GF989@mail-itl> <5C176180.3090200@intel.com>
 <20181217110927.GA23474@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kJdr=O2=citrix.com=prvs=882bfab70=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gYsnY-00036U-PV
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 13:19:04 +0000
In-Reply-To: <20181217110927.GA23474@mail-itl>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Wang <wei.w.wang@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMTIvMjAxOCAxMTowOSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIE1vbiwgRGVjIDE3LCAyMDE4IGF0IDA0OjQyOjQwUE0gKzA4MDAsIFdlaSBXYW5nIHdyb3Rl
Ogo+PiBPbiAxMi8xNC8yMDE4IDEwOjE2IFBNLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
d3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBJIHdvbmRlciB3aGF0IGhhcHBlbmVkIHRvIGludGVsX3Bz
dGF0ZSBwYXRjaCBzZXJpZXNbMV0gYmFjayBpbiAyMDE1Pwo+Pj4gSSd2ZSBzZWVuIHRoZXJlIHdh
cyBzb21lIHJldmlldyBmZWVkYmFja1syXVszXVs0XVs1XVs2XVs3XSBvbiB2NiwKPj4+IHBhdGNo
ZXMgNC82IGFuZCA2LzYgd2VyZSBhY2tlZC4gV2VyZSB0aGUgcmV2aWV3IGNvbW1lbnRzIGV2ZXIg
YWRkcmVzc2VkCj4+PiAoY2FuJ3QgZmluZCBpdCk/ICBPciBtYXliZSB0aGVyZSBpcyBzb21lIG90
aGVyIG1lY2hhbmlzbSBpbiBwbGFjZSBmb3IgcHJvcGVyCj4+PiBwb3dlciBtYW5hZ2VtZW50IG9u
IHJlY2VudCBJbnRlbCBDUFVzPyBBcHBhcmVudGx5IGFjcGktY3B1ZnJlcSBkcml2ZXIKPj4+IG5v
dCBhbHdheXMgZG9lcyBpdHMgam9iIHdlbGxbOF0uCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNS0xMC9tc2cwMzA0OC5o
dG1sCj4+PiBbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hl
bi1kZXZlbC8yMDE1LTExL21zZzAyMDQzLmh0bWwKPj4+IFszXSBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTUtMTEvbXNnMDI0MTAuaHRtbAo+
Pj4gWzRdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAxNS0xMS9tc2cwMjQzMC5odG1sCj4+PiBbNV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE1LTExL21zZzAyNDQzLmh0bWwKPj4+IFs2
XSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTUtMTEvbXNnMDI0NTYuaHRtbAo+Pj4gWzddIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNS0xMC9tc2cwMzA4Ni5odG1sCj4+PiBbOF0gaHR0
cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtaXNzdWVzL2lzc3Vlcy80NjA0I2lzc3VlY29t
bWVudC00NDY4MTY1MzYKPj4+Cj4+IEhpIE1hcmVrLAo+Pgo+PiBJdCB3YXMgcGF1c2VkIGJlY2F1
c2UgdGhlcmUgd2FzIG5vIHVzZXJzIGluIHRoZSBjbG91ZHMgLSBwZW9wbGUgdXN1YWxseSBoYXZl
Cj4+IFAtc3RhdGUgZGlzYWJsZWQuCj4gSSBzZWUuIEZXSVcgWGVuIGhhdmUgYWxzbyBub24tY2xv
dWQgdXNlIGNhc2VzLCBsaWtlIFF1YmVzIE9TLgoKV2hlcmUgaGFzIHRoZSBjbGFpbSBhYm91dCAi
bm8gdXNlcnMgaW4gY2xvdWRzIHVzZSBwc3RhdGVzIiBjb21lIGZyb20/wqAKSSd2ZSBnb3Qgc2V2
ZXJhbCBjdXN0b21lcnMgd2hvIGFyZSBwdWJsaWMgY2xvdWRzIHlvdSdkIGRlZmluaXRlbHkKcmVj
b2duaXNlIHdobyB0ZW5kIHRvIG5vdGljZSB3aGVuIHBzdGF0ZXMvdHVyYm8gZ2V0cyBicm9rZW4u
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
