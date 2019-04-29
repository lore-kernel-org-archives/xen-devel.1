From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 01/20] xen/const: Introduce _BITUL and
 _BITULL
Date: Mon, 29 Apr 2019 17:47:11 +0100
Message-ID: <e48677c1-45c1-b6bd-a0f3-d7f106608b76@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-2-julien.grall@arm.com>
 <5CC1A4DD0200007800229083@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL9Qy-0007lo-8U
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:47:16 +0000
In-Reply-To: <5CC1A4DD0200007800229083@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNS8wNC8yMDE5IDEzOjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMi4w
NC4xOSBhdCAxODo0OSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gVGhlIHBhdHRl
cm4gX0FDKDEsIFVMeyxMfSkgPDwgWCBpcyBjb21tb25seSB1c2VkIGluIHRoZSBoZWFkZXJzIHRv
IG1ha2UKPj4gZGVmaW5lIHVzdWFibGUgaW4gYm90aCBhc3NlbWJseSBhbmQgQy4KPj4KPj4gU28g
aW50cm9kdWNlIF9CSVRVTCBhbmQgX0JJVFVMTCB0byBtYWtlIHRoZSBjb2RlIHNsaWdodGx5IG1v
cmUgcmVhZGFibGUuCj4gCj4gSSBkb24ndCBwYXJ0aWN1bGFybHkgbGlrZSB0aGUgbmFtZXMsIGFu
ZCBJIHNwZWNpZmljYWxseSBvYmplY3QgdG8KPiB0aGUgbGVhZGluZyB1bmRlcnNjb3Jlcy4gSSdt
IGFmcmFpZCBJIGRvbid0IGhhdmUgYmV0dGVyCj4gc3VnZ2VzdGlvbnMgZm9yIHRoZSBuYW1lcywg
YnV0IHdoYXQgSSdkIGxpa2UgdG8gYXNrIGZvciBpcyB0aGF0Cj4gYXQgbGVhc3QgdGhlIFVMIC8g
VUxMIGJlIHNvbWVob3cgc2VwYXJhdGVkIGZyb20gQklULiBPbmUKPiBvcHRpb24gbWlnaHQgYmUg
c29tZXRoaW5nIGxpa2UKClRoZSBfIG1hdGNoIHRoZSBvdGhlciBhc3NlbWJseSBtYWNybyB3ZSBo
YXZlIGRlZmluZWQgaW4gY29uc3QuaC4gSSB1bmRlcnN0YW5kIAp5b3UgZG9uJ3QgbGlrZSB0aGUg
bGVhZGluZyB1bmRlcnNjb3JlcywgYnV0IEkgdGhpbmsgY29uc2lzdGVuY3kgaXMgYmV0dGVyIGhl
cmUuCgpUaGUgbW9yZSBrZWVwaW5nIHRoZSBzYW1lIGdlbmVyaWMgbmFtaW5nIGxvd2VyIGRvd24g
dGhlIGNodXJuIHRvIGltcG9ydCBjb2RlIApmcm9tIExpbnV4LgoKPiAKPiAjZGVmaW5lIEJJVChw
b3MsIHNmeCkgKF9BQygxLCBzZngpIDw8IChwb3MpKQoKQklUKCkgaXMgYWxyZWFkeSBkZWZpbmUg
aW4gWGVuIGFuZCB1c2VkIGluIGNvZGUgY29taW5nIGZyb20gTGludXguIEkgd291bGQgCnJhdGhl
ciBub3QgY2hhbmdlIHRoZSBwcm90b3R5cGUgZm9yIHRoaXMgcmVhc29uLgoKPiAKPiBhbGJlaXQg
QklUIG1heSBiZSBhIGxpdHRsZSB0b28gZ2VuZXJpYyBhIG5hbWUsIHlldCBzb21ldGhpbmcKPiBs
aWtlIERFRklORV9CSVQgbG9va3MgYSBsaXR0bGUgbG9uZ2lzaC4gQnV0IGF0IGxlYXN0IGl0IHdv
dWxkIGFsc28KPiBhbGxvdyBlLmcuIHBsYWluIHVuc2lnbmVkIChub24tbG9uZykgY29uc3RhbnRz
IHRvIGJlIGRlZmluZWQKPiB3aXRob3V0IHlldCBhbm90aGVyIG5ldyBjb25zdHJ1Y3QuCgpTZWUg
YWJvdmUgdGhlIHJlYXNvbiB3aHkgdGhvc2UgbmFtZXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
