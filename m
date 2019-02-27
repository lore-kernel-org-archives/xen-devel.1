From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Wed, 27 Feb 2019 09:23:21 +0000
Message-ID: <85742448-F90D-4286-96BE-47E26F870E32@gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
 <eeec5cb2-5242-5331-21cb-e84317b85351@arm.com>
 <alpine.DEB.2.10.1902251311320.4000@sstabellini-ThinkPad-X260>
 <014390ec-6f3d-ce86-b760-c6b52362d22f@arm.com>
 <5C7520E6020000780021A46F@prv1-mh.provo.novell.com>
 <237094ca-6ec0-cb4d-9fab-c163909af0e2@gmail.com>
 <5C752758020000780021A4CB@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902261020580.20689@sstabellini-ThinkPad-X260>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vs71=RC=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1gyvR2-0006IV-5D
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 09:23:28 +0000
Received: by mail-wm1-x342.google.com with SMTP id a62so5078930wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Feb 2019 01:23:26 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1902261020580.20689@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIDI2IEZlYiAyMDE5LCBhdCAxODoyNywgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiAKPiBPbiBUdWUsIDI2IEZlYiAyMDE5LCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+IFNvLCB3ZSdsbCBlbmQgdXAgaGF2aW5nIGxvdHMgb2YgbWFjcm9zIHRo
ZW4gd2hpY2ggaXMgb2J2aW91c2x5Cj4+PiBub3QgZ29vZC4gVGhhdCBzYWlkLCBJIGhvcGUgd2Ug
Y2FuIHdvcmsgb3V0IHNvbWUgY29tbW9uIGFwcHJvYWNoCj4+PiBub3Qgb25seSB0byB0aGlzIGlz
c3VlLCBidXQgaG93IHdlIGRlYWwgd2l0aCBzdWNoIGluIGdlbmVyYWwuCj4+IAo+PiBJIGd1ZXNz
IHRoZW4gSSBoYXZlIHRvIGFzayBmb3IgZ2l2aW5nIGEgY29tcGxldGUgcGljdHVyZSBvZiB3aGF0
Cj4+IG90aGVyIGNvZGUgdWdsaWZpY2F0aW9ucyBhcmUgZ29pbmcgdG8gYmUgcHJvcG9zZWQuIElm
LCB0byBiZSBNSVNSQS0KPj4gY29tcGxpYW50LCB3ZSBoYXZlIHRvIHR1cm4gYWxsIG9mIG91ciBj
b2RlIGludG8gYW4gdW5yZWFkYWJsZQo+PiBtZXNzLCB0aGFuIEknbSBhZnJhaWQgSSBoYXZlIHRv
IHF1ZXN0aW9uIHdoZXRoZXIgd2UgcmVhbGx5IHdhbnQKPj4gdG8gZ28gdGhhdCByb3V0ZS4gV2Ug
dGhlbiBtYXkgYmUgYmV0dGVyIG9mZiBzdG9wcGluZyB0aGUgd2hvbGUKPj4gZXhlcmNpc2Ugbm93
LCByYXRoZXIgdGhhbiBhZnRlciBoYXZpbmcgZG9uZSBzZXZlcmFsIGluaXRpYWwgc3RlcHMKPj4g
YWxyZWFkeS4KPiAKPiBIaSBKYW4sCj4gCj4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhIHNpbXBs
ZSBhbnN3ZXIgdG8geW91ciBwb2ludC4gQnV0IHRoZSBiZXN0IHdheQo+IHRvIGdldCBhbiBpZGVh
IGlzIHRvIGdpdmUgYSBsb29rIGF0IE1JU1JBLUMgWzFdLiBJdCdzIGxlc3MgdGhhbiA1MEdCUCwg
SQo+IGFtIGhvcGluZyBMYXJzIHdpbGwgYmUgYWJsZSB0byBzb3J0IGl0IG91dCBmb3IgeW91LiBU
aGUgcHVycG9zZSBvZiB0aGlzCj4gd29yayBpcyBhbHNvIHRvIHByb3ZpZGUgdGhlIGNvbnRleHQg
Zm9yIHRoZSB1cGNvbWluZyBmMmYgZGlzY3Vzc2lvbnMuCgoKSSBjYW4gY2VydGFpbmx5IGRvIHRo
aXM6IHRoZSBjb3N0IG9mIGJ1eWluZyBhIGZldyBjb3BpZXMgb2YgTUlTUkEgQyBzdGFuZGFyZCBk
b2N1bWVudHMgZm9yIGEgZmV3IGNvbW1pdHRlcnMgaXMgc29tZXRoaW5nIEkgY2FuIGFwcHJvdmUg
d2l0aG91dCBuZWVkaW5nIGFkdmlzb3J5IGJvYXJkIGFwcHJvdmFsLiBUaGUgZG9jdW1lbnRzIGFy
ZSBzaGlwcGVkIGluIFBERiBhbmQgdGhlIGxpY2Vuc2UgaXMgc2luZ2xlIHVzZXIuIFRvIGJ1eSB0
aGVtIEkgbmVlZCB0aGUgbmFtZXMgYW5kIGUtbWFpbCBhZGRyZXNzZXMgb2YgdGhvc2Ugd2hvIG5l
ZWQgaXQuIAoKSSByZWNhbGwgdGhhdCBJIHJlYWQgaW4gYW4gZWFybGllciB0aHJlYWQgdGhhdCBK
dWxpZW4gYW5kIFN0ZWZhbm8gaGF2ZSBhY2Nlc3MgdG8gdGhlIGRvY3VtZW50LCB3aGljaCB3b3Vs
ZCBsZWF2ZSBKYW4gYW5kIGEgZmV3IG1lbWJlcnMgb2YgQ2l0cml4IHN0YWZmLiBDYW4gdGhvc2Ug
Y29tbWl0dGVycyB3aG8gbmVlZCBhY2Nlc3MgcmFpc2UgdGhlaXIgaGFuZHM/IEkgY2FuIHRoZW4g
Z28gYWhlYWQgYW5kIG9yZGVyIHRoZXNlLgoKSGF2aW5nIGZvbGxvd2VkIHRoaXMgdGhyZWFkIChh
bmQgdGhlIG90aGVyIE1JU1JBIHJlbGF0ZWQgb25lIGZyb20gU3RlZmFubyksIGl0IHNlZW1zIHRv
IG1lIHRoYXQgcG90ZW50aWFsbHkgZWFjaCBvZiB0aGVzZSBkaXNjdXNzaW9ucyBpcyBxdWl0ZSBk
aXZpc2l2ZSBhbmQgdGFrZSB1cCBhIGxvdCBvZiBkaXNjdXNzaW9uIGFuZCBlbW90aW9uYWwgZW5l
cmd5LiBXaXRoIDE0MyBydWxlcyBhbmQgMTYgImRpcmVjdGl2ZXMiIChtb3JlIGxpa2UgZ3VpZGFu
Y2UpIGFuZCBzb21lIG9mIHRoZSBydWxlcyBiZWluZyBtYW5kYXRvcnkgKDczJSkgYW5kIHNvbWUg
YWR2aXNvcnkgKDI3JSksIGJ1dCB0aGUgcG9zc2liaWxpdHkgdG8ganVzdGlmeSBkZXZpYXRpbmcg
ZnJvbSB0aGUgcnVsZSwgbWF5YmUgd2UgYXJlIGFwcHJvYWNoaW5nIHRoaXMgd3JvbmdseS4gCgpJ
IGhhdmUgc29tZSB0aG91Z2h0cyBhYm91dCB0aGUgYXBwcm9hY2ggYW5kIHdpbGwgZm9sbG93IHVw
IG9uIHRoaXMgdGhyZWFkIGxhdGVyIHRvZGF5IG9yIHRvbW9ycm93IHdoZW4gSSBoYWQgc29tZSBt
b3JlIHRpbWUgdG8gY2xhcmlmeSBteSB0aG91Z2h0cy4KClJlZ2FyZHMKTGFycyAgCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
