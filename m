From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC
 with GFP_KERNEL in pcistub_probe
Date: Tue, 10 Apr 2018 11:01:46 -0400
Message-ID: <9703e77f-35e8-aa11-9ddb-fdc322efd6d2__24111.5139950582$1523372349$gmane$org@oracle.com>
References: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
 <b07f0a27-f09d-1617-ab9e-ebbc761cb3a4@oracle.com>
 <74fe5dd3-fb85-bed8-82b6-a9fb7a3a376d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nhop=g7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f5ukb-0001Ei-1j
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 15:00:01 +0000
In-Reply-To: <74fe5dd3-fb85-bed8-82b6-a9fb7a3a376d@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, jgross@suse.com, gregkh@linuxfoundation.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTAvMjAxOCAxMDozMSBBTSwgSmlhLUp1IEJhaSB3cm90ZToKPgo+Cj4KPiBPbiAyMDE4
LzQvMTAgMjI6MjcsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gMDQvMDkvMjAxOCAxMTow
MyBBTSwgSmlhLUp1IEJhaSB3cm90ZToKPj4+IHBjaXN0dWJfcHJvYmUoKSBpcyBuZXZlciBjYWxs
ZWQgaW4gYXRvbWljIGNvbnRleHQuCj4+PiBUaGlzIGZ1bmN0aW9uIGlzIG9ubHkgc2V0IGFzICIu
cHJvYmUiIGluIHN0cnVjdCBwY2lfZHJpdmVyLgo+Pj4KPj4+IERlc3BpdGUgbmV2ZXIgZ2V0dGlu
ZyBjYWxsZWQgZnJvbSBhdG9taWMgY29udGV4dCwKPj4+IHBjaXN0dWJfcHJvYmUoKSBjYWxscyBr
bWFsbG9jKCkgd2l0aCBHRlBfQVRPTUlDLAo+Pj4gd2hpY2ggZG9lcyBub3Qgc2xlZXAgZm9yIGFs
bG9jYXRpb24uCj4+PiBHRlBfQVRPTUlDIGlzIG5vdCBuZWNlc3NhcnkgYW5kIGNhbiBiZSByZXBs
YWNlZCB3aXRoIEdGUF9LRVJORUwsCj4+PiB3aGljaCBjYW4gc2xlZXAgYW5kIGltcHJvdmUgdGhl
IHBvc3NpYmlsaXR5IG9mIHN1Y2Vzc2Z1bCBhbGxvY2F0aW9uLgo+Pj4KPj4+IFRoaXMgaXMgZm91
bmQgYnkgYSBzdGF0aWMgYW5hbHlzaXMgdG9vbCBuYW1lZCBEQ05TIHdyaXR0ZW4gYnkgbXlzZWxm
Lgo+Pj4gQW5kIEkgYWxzbyBtYW51YWxseSBjaGVjayBpdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBKaWEtSnUgQmFpIDxiYWlqaWFqdTE5OTBAZ21haWwuY29tPgo+PiBXaGF0IGFib3V0IHVzZSBv
ZiBHRlBfQVRPTUlDIGluIHBjaXN0dWJfcmVnX2FkZCgpPwo+Cj4gVGhhbmtzIGZvciB5b3VyIHJl
cGx5IDopCj4gSSBmaW5kIHBjaXN0dWJfcmVnX2FkZCgpIGlzIGNhbGxlZCBieSBwY2lzdHViX3F1
aXJrX2FkZCgpLgo+IEFuZCBwY2lzdHViX3F1aXJrX2FkZCgpIGlzIGNhbGxlZCBpbiB0aGUgbWFj
cm8gRFJJVkVSX0FUVFIoKS4KPiBJIGFtIG5vdCBzdXJlIHdoZXRoZXIgRFJJVkVSX0FUVFIoKSBj
YW4gbWFrZSB0aGUgZnVuY3Rpb24gY2FsbGVkIGluCj4gYXRvbWljIGNvbnRleHQsCj4gc28gSSBk
byBub3QgYW5hbHl6ZSBpdCBpbiBteSB0b29sLgoKSSBkb24ndCBzZWUgd2h5IGl0IG5lZWRzIHRv
IGJlIEFUT01JQywgaXQncyBzeXNmcyBhY2Nlc3MuIENhbiB5b3Ugc2VuZCBhCnBhdGNoIHRvIGZp
eCBpdCBhcyB3ZWxsPwoKClRoYW5rcy4KLWJvcmlzCgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
