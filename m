From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: xenbus: Fix a possible data race in
 xs_request_enter
Date: Tue, 8 May 2018 09:02:06 +0200
Message-ID: <ea5634a2-b0e2-0fac-e5ec-cef1083958fe__43377.8844344944$1525762857$gmane$org@suse.com>
References: <20180508033429.12749-1-baijiaju1990@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=orcc=h3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFwdV-0001ZM-4T
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 07:02:09 +0000
In-Reply-To: <20180508033429.12749-1-baijiaju1990@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, boris.ostrovsky@oracle.com, simon@invisiblethingslab.com, joao.m.martins@oracle.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDUvMTggMDU6MzQsIEppYS1KdSBCYWkgd3JvdGU6Cj4gVGhlIHJlYWQgb3BlcmF0aW9u
IHRvICJyZXEtPnR5cGUiIGlzIHByb3RlY3RlZCBieQo+IHRoZSBsb2NrIG9uIGxpbmUgMTI4LCBi
dXQgdGhlIHdyaXRlIG9wZXJhdGlvbiB0bwo+IHRoaXMgZGF0YSBvbiBsaW5lIDExOCBpcyBub3Qg
cHJvdGVjdGVkIGJ5IHRoZSBsb2NrLgo+IFRodXMsIHRoZXJlIG1heSBleGlzdCBhIGRhdGEgcmFj
ZSBmb3IgInJlcS0+dHlwZSIuCj4gCj4gVG8gZml4IHRoaXMgZGF0YSByYWNlLCB0aGUgd3JpdGUg
b3BlcmF0aW9uIHRvICJyZXEtPnR5cGUiIAo+IHNob3VsZCBiZSBhbHNvIHByb3RlY3RlZCBieSB0
aGUgbG9jay4KCk5vLCB4c19yZXF1ZXN0X2VudGVyKCkgaXMgbmV2ZXIgY2FsbGVkIGZvciBhIHJl
cXVlc3QgYWxyZWFkeSB2aXNpYmxlIHRvCmFub3RoZXIgdGhyZWFkIG9yIHByb2Nlc3Nvci4gU28g
bm8gcmFjZSBleGlzdHMuCgoKSnVlcmdlbgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFp
IDxiYWlqaWFqdTE5OTBAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3hlbi94ZW5idXMveGVu
YnVzX3hzLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194
cy5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCj4gaW5kZXggNDlhMzg3NGFlNmJi
Li4yNzRjZGZlZTA4YjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194
cy5jCj4gKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c194cy5jCj4gQEAgLTExNSwxMCAr
MTE1LDEwIEBAIHN0YXRpYyB1aW50MzJfdCB4c19yZXF1ZXN0X2VudGVyKHN0cnVjdCB4Yl9yZXFf
ZGF0YSAqcmVxKQo+ICB7Cj4gIAl1aW50MzJfdCBycV9pZDsKPiAgCj4gLQlyZXEtPnR5cGUgPSBy
ZXEtPm1zZy50eXBlOwo+IC0KPiAgCXNwaW5fbG9jaygmeHNfc3RhdGVfbG9jayk7Cj4gIAo+ICsJ
cmVxLT50eXBlID0gcmVxLT5tc2cudHlwZTsKPiArCj4gIAl3aGlsZSAoIXhzX3N0YXRlX3VzZXJz
ICYmIHhzX3N1c3BlbmRfYWN0aXZlKSB7Cj4gIAkJc3Bpbl91bmxvY2soJnhzX3N0YXRlX2xvY2sp
Owo+ICAJCXdhaXRfZXZlbnQoeHNfc3RhdGVfZW50ZXJfd3EsIHhzX3N1c3BlbmRfYWN0aXZlID09
IDApOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
