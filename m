From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 7/9] libxl: Make killing of device model
 asynchronous
Date: Fri, 30 Nov 2018 16:14:48 +0000
Message-ID: <550BD6B4-8278-439E-9C5D-B324EDEDEC7C@citrix.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-7-george.dunlap@citrix.com>
 <23550.50595.50966.218438@mariner.uk.xensource.com>
 <43308BAB-7F2D-408A-A7AB-5874E00BC093@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2ngE=OJ=citrix.com=prvs=86598431a=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gSlRi-0005Yn-KA
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:15:14 +0000
In-Reply-To: <43308BAB-7F2D-408A-A7AB-5874E00BC093@citrix.com>
Content-Language: en-US
Content-ID: <A835FCDEC0FF434689B6453F9168866B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIE5vdiAzMCwgMjAxOCwgYXQgNDoxMiBQTSwgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPiAKPiAKPiAKPj4gT24gTm92IDI4LCAyMDE4LCBhdCA0
OjQzIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6Cj4+IAo+
PiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRDSCA3LzldIGxpYnhsOiBNYWtlIGtpbGxpbmcg
b2YgZGV2aWNlIG1vZGVsIGFzeW5jaHJvbm91cyIpOgo+Pj4gT3IgYXQgbGVhc3QsIGdpdmUgaXQg
YW4gYXN5bmNocm9ub3VzIGludGVyZmFjZSBzbyB0aGF0IHdlIGNhbiBtYWtlIGl0Cj4+PiBhY3R1
YWxseSBhc3luY2hyb25vdXMgaW4gc3Vic2VxdWVudCBwYXRjaGVzLgo+Pj4gCj4+PiBDcmVhdGUg
c3RhdGUgc3RydWN0dXJlcyBhbmQgY2FsbGJhY2sgZnVuY3Rpb24gc2lnbmF0dXJlcy4gIEFkZCB0
aGUKPj4+IHN0YXRlIHN0cnVjdHVyZSB0byBsaWJ4bF9fZGVzdHJveV9kb21pZF9zdGF0ZS4gIEJy
ZWFrCj4+PiBsaWJ4bF9fZGVzdHJveV9kb21pZCBkb3duIGludG8gdHdvIGZ1bmN0aW9ucy4KPj4g
Li4uCj4+PiArLyogVXNlZCB0byBkZXRyb3kgdGhlIGRldmljZSBtb2RlbCAqLwo+Pj4gK19oaWRk
ZW4gdm9pZCBsaWJ4bF9fZGVzdHJveV9kZXZpY2VfbW9kZWwobGlieGxfX2VnYyAqZWdjLAo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2Rlc3Ryb3lf
ZGV2aWNlbW9kZWxfc3RhdGUgKmRkbXMpOwo+PiAKPj4gSSB0aGluayB0aGF0IGNvbW1lbnQgaXMg
cmF0aGVyIHBvaW50bGVzcyAoYnV0IEkgd29uJ3Qgb2JqZWN0IGlmIHlvdQo+PiByZWFsbHkgd2Fu
dCB0byBrZWVwIGl0KS4gIAo+IAo+IFllczsgdGhhdCBjb21tZW50IGxvb2tzIHJhdGhlciB2ZXN0
aWdhbC4KCk9oLCBJIHNlZTsgSSB3YXMgZm9sbG93aW5nIHN1aXQgd2l0aCB0aGUgY29kZSBhcm91
bmQgaXQ6CgovKiBVc2VkIHRvIGRlc3Ryb3kgYSBkb21haW4gd2l0aCB0aGUgcGFzc2VkIGlkIChp
dCBkb2Vzbid0IGNoZWNrIGZvciBzdHVicykgKi8KX2hpZGRlbiB2b2lkIGxpYnhsX19kZXN0cm95
X2RvbWlkKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX19kZXN0cm95X2RvbWlkX3N0YXRlICpkaXMpOwoKLyogVXNlZCB0byBkZXRyb3kgdGhl
IGRldmljZSBtb2RlbCAqLwpfaGlkZGVuIHZvaWQgbGlieGxfX2Rlc3Ryb3lfZGV2aWNlX21vZGVs
KGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJ4bF9fZGVzdHJveV9kZXZpY2Vtb2RlbF9zdGF0ZSAqZGRtcyk7CgovKiBFbnRyeSBwb2lu
dCBmb3IgZGV2aWNlcyBkZXN0cnVjdGlvbiAqLwpfaGlkZGVuIHZvaWQgbGlieGxfX2RldmljZXNf
ZGVzdHJveShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX19kZXZpY2VzX3JlbW92ZV9zdGF0ZSAqZHJzKTsKCkl0IGxvb2tzIGNsZWFuZXIg
dG8gbWUgdG8gaGF2ZSAqc29tZXRoaW5nKiB0aGVyZSB0aGFuIG5vdCwganVzdCB0byB2aXN1YWxs
eSBtYWtlIGl0IGNsZWFyIHRoYXQgaXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgcHJldmlv
dXMgZnVuY3Rpb24uCgogLUdlb3JnZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
