From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH 11/15] cross builds:
 ts-kernel-build: Support cross target armhf
Date: Fri, 26 Apr 2019 22:26:49 +0100
Message-ID: <801bd1ba-1be4-c39c-8842-1d14623ff04e@arm.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-12-ian.jackson@eu.citrix.com>
 <8ba9d00a-daa1-c09d-4b7b-7556a9d98a7e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8Mv-0006Yl-OD
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:26:53 +0000
In-Reply-To: <8ba9d00a-daa1-c09d-4b7b-7556a9d98a7e@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiA0LzI2LzE5IDEwOjIzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSWFuLAo+IAo+
IFRoYW5rIHlvdSBmb3IgbG9va2luZyBpbnRvIHRoaXMuCj4gCj4gT24gNC8yNi8xOSA1OjM5IFBN
LCBJYW4gSmFja3NvbiB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Cj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+PiAtLS0KPj4gwqAgdHMta2VybmVsLWJ1aWxkIHwgMTkgKysrKysrKysrKysrKysrKysrLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCj4+IGluZGV4
IDcyY2E5OGExLi4yOWM2YzQzZCAxMDA3NTUKPj4gLS0tIGEvdHMta2VybmVsLWJ1aWxkCj4+ICsr
KyBiL3RzLWtlcm5lbC1idWlsZAo+PiBAQCAtMjEsNiArMjEsNyBAQCBCRUdJTiB7IHVuc2hpZnQg
QElOQywgcXcoLik7IH0KPj4gwqAgdXNlIE9zc3Rlc3Q7Cj4+IMKgIHVzZSBPc3N0ZXN0OjpUZXN0
U3VwcG9ydDsKPj4gwqAgdXNlIE9zc3Rlc3Q6OkJ1aWxkU3VwcG9ydDsKPj4gK3VzZSBDYXJwOwo+
PiDCoCB0c3JlYWRjb25maWcoKTsKPj4gQEAgLTQ4LDkgKzQ5LDI0IEBAIG15ICRwYXJtcyA9ICRh
cmNocGFybXMtPnsgJHJ7YXJjaH0gfTsKPj4gwqAgc3ViIGVuYWJsZV94ZW5fY29uZmlnICgpOwo+
PiArb3VyICRhcmNoX2VudnZhcnMgPSAnJzsKPj4gKwo+PiDCoCBzdWIgY21kICgkJCkgewo+PiDC
oMKgwqDCoMKgIG15ICgkdGltZW91dCwgJHNjcmlwdCkgPSBAXzsKPj4gLcKgwqDCoCB0YXJnZXRf
Y21kX2J1aWxkKCRobywgJHRpbWVvdXQsICRidWlsZGRpciwgJHNjcmlwdCk7Cj4+ICvCoMKgwqAg
dGFyZ2V0X2NtZF9idWlsZCgkaG8sICR0aW1lb3V0LCAkYnVpbGRkaXIsICRhcmNoX2VudnZhcnMu
JHNjcmlwdCk7Cj4+ICt9Cj4+ICsKPj4gK3N1YiBjaGVja2FyY2ggKCkgewo+PiArwqDCoMKgIHJl
dHVybiBpZiAkcnthcmNofSBlcSAkaG8tPntBcmNofTsKPj4gK8KgwqDCoCBteSAkY2MgPSAnZ2Nj
JzsKPj4gK8KgwqDCoCBpZiAoJHJ7YXJjaH0gZXEgJ2FybWhmJykgewo+PiArwqDCoMKgIHRhcmdl
dF9pbnN0YWxsX3BhY2thZ2VzKCRobywgImNyb3NzYnVpbGQtZXNzZW50aWFsLSRye2FyY2h9Iik7
Cj4+ICvCoMKgwqAgJGFyY2hfZW52dmFycyA9IDw8RU5EOwo+PiArwqDCoMKgIGV4cG9ydCBBUkNI
PWFybSBIT1NUQ0M9JGNjIENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdudWVhYmloZi0KPiAKPiBO
SVQ6IEhPU1RDQyBpcyBub3QgbmVjZXNzYXJ5LiBJdCB3aWxsIGJlIGRlZmF1bHQgdG8gZ2NjIGlm
IG5vdCBwYXNzZWQuCj4gCj4gT3RoZXJ3aXNlLCB0aGUgZXhwb3J0IGxvb2tzIHdyaXRlIHRvIG1l
LgoKSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IHlvdSBjYW4gYWRkIG15IGFjayBvbmUgaW4gYW55
IGNhc2U6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
