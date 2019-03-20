From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 08/10] xen/arm: optee: add support for
 RPC commands
Date: Wed, 20 Mar 2019 16:27:42 +0000
Message-ID: <75554d22-9cfd-a5ef-38d7-09fc689f03bf@arm.com>
References: <20190307210404.12346-1-volodymyr_babchuk@epam.com>
 <20190307210404.12346-9-volodymyr_babchuk@epam.com>
 <3a9ffca5-5139-a607-8647-af9397a2f264@arm.com> <87sgvh8snx.fsf@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p8/H=RX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h6e4A-0006QZ-AS
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 16:27:46 +0000
In-Reply-To: <87sgvh8snx.fsf@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <vlad.babchuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDMvMjAxOSAxNTozNiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSGkgSnVs
aWVuLAoKSGkgVm9sb2R5bXlyLAoKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+Pj4gICAg
ICAgIGlmICggc2htX3JwYy0+Z3Vlc3RfcGFnZSApCj4+PiAgICAgICAgICAgIHB1dF9wYWdlKHNo
bV9ycGMtPmd1ZXN0X3BhZ2UpOwo+Pj4gKwo+Pgo+PiBTcHVyaW91cyBjaGFuZ2UuCj4gCj4gR29v
ZCBjYXRjaC4gVGhhbmsgeW91Lgo+IAo+Pgo+Pj4gKyAgICAgICAgLyoKPj4+ICsgICAgICAgICAq
IFRPRE86IFdpdGggY3VycmVudCBpbXBsZW1lbnRhdGlvbiwgT1AtVEVFIHdpbGwgbm90IGlzc3Vl
Cj4+PiArICAgICAgICAgKiBSUEMgdG8gZnJlZSB0aGlzIGJ1ZmZlci4gR3Vlc3QgYW5kIE9QLVRF
RSB3aWxsIGJlIG91dCBvZgo+Pj4gKyAgICAgICAgICogc3luYzogZ3Vlc3QgYmVsaWV2ZXMgdGhh
dCBpdCBwcm92aWRlZCBidWZmZXIgdG8gT1AtVEVFLAo+Pj4gKyAgICAgICAgICogd2hpbGUgT1At
VEVFIHRoaW5rcyBvZiBvcHBvc2l0ZS4gSWRlYWxseSwgd2UgbmVlZCB0bwo+Pj4gKyAgICAgICAg
ICogZW11bGF0ZSBSUEMgd2l0aCBPUFRFRV9NU0dfUlBDX0NNRF9TSE1fRlJFRSBjb21tYW5kLgo+
Pj4gKyAgICAgICAgICovCj4+IENhbiB0aGlzIGNvbmRpdGlvbiBoYXBwZW4gaWYgWGVuIHJ1bnMg
b3V0IG9mIG1lbW9yeT8KPiAKPiBZZXMsIHRoaXMgaXMgb25lIG9mIHJlYXNvbnMgd2h5IHRyYW5z
bGF0ZV9ub25jb250aWcoKSBtaWdodCBmYWlsLiBJdAo+IHVzZXMgYm90aCB4ZW5oZWFwIHRvIGFs
bG9jYXRlIGRhdGEgc3RydWN0dXJlIGFuZCBkb21oZWFwIHRvIGFsbG9jYXRlCj4gcGFnZWxpc3Rz
IGJ1ZmZlcnMuIEFueSBvZiB0aG9zZSBjYW4gZmFpbCwgcmVzdWx0aW5nIGluIGluY29uc2lzdGVu
Y3kuCgpUaGF0J3Mgbm90IHZlcnkgaWRlYWwuIFRoaXMgbWVhbiBhIHdlbGwtYmVoYXZpbmcgZ3Vl
c3QgY2FuIGdldCBvdXQgb2Ygc3luYyAKYmVjYXVzZSBvZiBtZW1vcnkgcHJlc3N1cmUgKGNvdWxk
IGJlIGNhdXNlIGJ5IGEgbWlzYmVoYXZpbmcgZ3Vlc3Qgb24gdGhlIApwbGF0Zm9ybSkuIFdoYXQg
d2lsbCBiZSB0aGUgY29uc2VxdWVuY2UgZm9yIHRoZSBndWVzdD8gQ2FuIGl0IGNvbnRpbnVlIHNh
ZmVseT8KClRoaXMgZmVhdHVyZSBpcyB1bmRlciBFWFBFUlQgbW9kZSBzbyBJIHdvdWxkIGJlIG9r
IHRvIGdldCBhcyB0aGlzIGluIFhlbi4gCkFsdGhvdWdoLCBJIHdvdWxkIGxpa2UgdG8gaGVhciBT
dGVmYW5vJ3Mgb3BpbmlvbiBoZXJlLgoKSW4gYW55IGNhc2UsIHRoaXMgc2hvdWxkIGJlIGZpeGVk
IGJlY2F1c2Ugd2UgY29uc2lkZXIgcmVtb3ZpbmcgRVhQRVJUIG1vZGUgYW5kIApzZWN1cml0eSBz
dXBwb3J0IGl0LgoKPiAKPiBZb3UgZ2F2ZSBtZSBpZGVhIHRvIHB1dCBnZHByaW50aygpIHdpdGgg
YmlnIGZhdCB3YXJuaW5nIHRoZXJlLgoKWW91IGNsZWFybHkgd2FudCB0byBncHJpbnRrIGhlcmUg
YmVjYXVzZSBpZiB0aGlzIGhhcHBlbiBpbiBub24tZGVidWcgYnVpbGQgeW91IAp3YW50IHRvIGtu
b3cgdGhhdCBzb21ldGhpbmcgaGFzIGdvbmUgcmVhbGx5IHdyb25nIGFzIHNvb24gYXMgcG9zc2li
bGUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
