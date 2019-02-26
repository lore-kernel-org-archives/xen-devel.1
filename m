From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 04:47:36 -0700
Message-ID: <5C752758020000780021A4CB@prv1-mh.provo.novell.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gybD4-0006xW-NK
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 11:47:42 +0000
In-Reply-To: <237094ca-6ec0-cb4d-9fab-c163909af0e2@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDEyOjMzLCA8YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToKPiBP
biAyLzI2LzE5IDE6MjAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNS4wMi4xOSBh
dCAyMjozNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDIvMjUvMTkgOTox
MyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+IEkgdGhpbmsgaXQgaXMgZmluZSB0
byBleHBsb2l0IGNvbXBpbGVyIHNwZWNpZmljIGNoZWNrcyB3aGVuIGF2YWlsYWJsZS4KPj4+PiBI
b3dldmVyLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBtYWtlIGFueSBkZWNpc2lvbnMgb24gY29k
ZSBjb3JyZWN0bmVzcwo+Pj4+IGJhc2VkIG9uIHRoZSBjb21waWxlciBjaGVja3MgdGhhdCB3ZSBp
bnRyb2R1Y2UuCj4+Pj4KPj4+PiBJbiBvdGhlciB3b3JkcywgSSB0aGluayBpdCBpcyBhIGdvb2Qg
aWRlYSB0byB1c2UgLVdzd2l0Y2gtZW51bSBpZgo+Pj4+IHBvc3NpYmxlLCBidXQgaXQgaXMgbm90
IGEgcmVhc29uIGZvciBub3QgaGF2aW5nIGRlZmF1bHQgbGFiZWxzIGluIHBsYWNlCj4+Pj4gYXMg
c3VnZ2VzdGVkIGJ5IDE2LjQuIFRoZSBjb2RlIHNob3VsZCBiZSBhcyBjb3JyZWN0IGFuZCBzYWZl
IGFzCj4+Pj4gcG9zc2libGUsIHdpdGhvdXQgcmVxdWlyaW5nIGV4dGVybmFsIGNvbXBpbGVyLXNw
ZWNpZmljIGNoZWNrcy4KPj4+IEFzIEkgc2FpZCBvbiBhbiBhbnN3ZXIgdG8gT2xla3NhbmRyLCBJ
IGFtIG5vdCBhZ2FpbnN0IG9mIGhhdmluZwo+Pj4gImRlZmF1bHQiIGxhYmVscyBhcyBsb25nIGFz
IHRoZXkgY29udGFpbiBzZW5zaWJsZSBhY3Rpb25zLgo+Pj4KPj4+IEJ1dCB0aGlzIGRvZXMgbm90
IHJlYWxseSBhZGRyZXNzIG15IHBvaW50IGFib3ZlIHJlZ2FyZGluZyB3YXkgdG8gaGVscAo+Pj4g
dGhlIHJldmlldy4gSmFuIGlzIGFnYWluc3QgLVdzd2l0Y2gtZW51bSwgYW5kIEkgY2FuIHVuZGVy
c3RhbmQgaGlzCj4+PiBwb2ludC4gU28gaG93IGRvIHlvdSBkZWFsIHdpdGggbWlzc2luZyBpdGVt
Pwo+PiBKdXN0IHRvIGNsYXJpZnkgLSBJJ20gbm90IGVudGlyZWx5IGFnYWluc3QgdGhlIF9vcHRp
b25hbF8gdXNlIG9mCj4+IC1Xc3dpdGNoLWVudW0sIGJ1dCB0aGUgYWRkZWQgY2x1dHRlciBuZWVk
cyB0byBlaXRoZXIgYmUgd2VsbCBqdXN0aWZpZWQKPj4gKHdoaWNoIHNvIGZhciBpdCBpc24ndCks
IG9yIGNvbmRpdGlvbmFsbHkgaGlkZGVuIHRocm91Z2ggc29tZSBtYWNybwo+PiAod2hlcmUgdGhl
IG1haW4gcHVycG9zZSBvZiB0aGUgbWFjcm8gcmVhbGx5IGlzIHRvIGRvY3VtZW50IHdoeSBzdWNo
Cj4+IG90aGVyd2lzZSBwb2ludGxlc3MgZGVmYXVsdCBsYWJlbHMgYXJlIHRoZXJlIGluIHRoZSBm
aXJzdCBwbGFjZSkuCj4gQWx0aG91Z2ggSSBjYW4gYWdyZWUgdGhhdCBpdCBtaWdodCBzZWVtIHRv
IGJlIGEgZ29vZCBpZGVhIHRvIGhpZGUKPiBhbGwgdGhvc2Ugd2l0aCBhIG1hY3JvLCBidXQgSSBh
bSBqdXN0IHRoaW5raW5nIGFib3V0IG90aGVyCj4gY2FzZXMgd2hpY2ggTUlTUkEgYnJpbmdzIGlu
LiBGb3IgZXhhbXBsZSBbMV0sCj4gUnVsZSAxNS43IEFsbCBpZiAuLi4gZWxzZSBpZiBjb25zdHJ1
Y3RzIHNoYWxsIGJlIHRlcm1pbmF0ZWQgd2l0aCBhbiBlbHNlIAo+IHN0YXRlbWVudAoKSSB2ZXJ5
IG11Y2ggaG9wZSB0aGF0IEknbSBub3QgZ29pbmcgdG8gYmUgdGhlIG9ubHkgb25lIHRvIHJlZnVz
ZQp0byBhbGxvdyBpbiBhbnkgYWRkaXRpb24gb2Ygc3VjaCBib2d1cyAiZWxzZSIgYWRkaXRpb25z
LgoKPiBTbywgd2UnbGwgZW5kIHVwIGhhdmluZyBsb3RzIG9mIG1hY3JvcyB0aGVuIHdoaWNoIGlz
IG9idmlvdXNseQo+IG5vdCBnb29kLiBUaGF0IHNhaWQsIEkgaG9wZSB3ZSBjYW4gd29yayBvdXQg
c29tZSBjb21tb24gYXBwcm9hY2gKPiBub3Qgb25seSB0byB0aGlzIGlzc3VlLCBidXQgaG93IHdl
IGRlYWwgd2l0aCBzdWNoIGluIGdlbmVyYWwuCgpJIGd1ZXNzIHRoZW4gSSBoYXZlIHRvIGFzayBm
b3IgZ2l2aW5nIGEgY29tcGxldGUgcGljdHVyZSBvZiB3aGF0Cm90aGVyIGNvZGUgdWdsaWZpY2F0
aW9ucyBhcmUgZ29pbmcgdG8gYmUgcHJvcG9zZWQuIElmLCB0byBiZSBNSVNSQS0KY29tcGxpYW50
LCB3ZSBoYXZlIHRvIHR1cm4gYWxsIG9mIG91ciBjb2RlIGludG8gYW4gdW5yZWFkYWJsZQptZXNz
LCB0aGFuIEknbSBhZnJhaWQgSSBoYXZlIHRvIHF1ZXN0aW9uIHdoZXRoZXIgd2UgcmVhbGx5IHdh
bnQKdG8gZ28gdGhhdCByb3V0ZS4gV2UgdGhlbiBtYXkgYmUgYmV0dGVyIG9mZiBzdG9wcGluZyB0
aGUgd2hvbGUKZXhlcmNpc2Ugbm93LCByYXRoZXIgdGhhbiBhZnRlciBoYXZpbmcgZG9uZSBzZXZl
cmFsIGluaXRpYWwgc3RlcHMKYWxyZWFkeS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
