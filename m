From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] libgnttab: Add support for Linux dma-buf
Date: Wed, 25 Jul 2018 13:00:35 +0300
Message-ID: <d112f46c-b5f3-b5aa-2855-40d4b663aa1e@gmail.com>
References: <20180723122725.5476-1-andr2000@gmail.com>
 <20180725093921.22ncfttvjfiu4bkl@citrix.com>
 <17f7f750-caf2-8f6e-782a-a17cb21a2ad1@gmail.com>
 <20180725095313.iszfd4xyc6hgixhf@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i4nl=kj=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fiGb2-0005rz-Tc
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 10:00:40 +0000
Received: by mail-lf1-x142.google.com with SMTP id a134-v6so5019450lfe.6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 03:00:38 -0700 (PDT)
In-Reply-To: <20180725095313.iszfd4xyc6hgixhf@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, boris.ostrovsky@oracle.com
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjUvMjAxOCAxMjo1MyBQTSwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEp1bCAyNSwg
MjAxOCBhdCAxMjo0OToyOVBNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToK
Pj4gT24gMDcvMjUvMjAxOCAxMjozOSBQTSwgV2VpIExpdSB3cm90ZToKPj4+IE9uIE1vbiwgSnVs
IDIzLCAyMDE4IGF0IDAzOjI3OjI1UE0gKzAzMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOgo+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KPj4+Pgo+Pj4+IEFkZCBzdXBwb3J0IGZvciBMaW51eCBncmFudCBk
ZXZpY2UgZHJpdmVyIGV4dGVuc2lvbiB3aGljaCBhbGxvd3MKPj4+PiBjb252ZXJ0aW5nIGV4aXN0
aW5nIGRtYS1idWYncyBpbnRvIGFuIGFycmF5IG9mIGdyYW50IHJlZmVyZW5jZXMKPj4+PiBhbmQg
dmlzZSB2ZXJzYS4gVGhpcyBpcyBvbmx5IGltcGxlbWVudGVkIGZvciBMaW51eCBhcyBvdGhlciBP
U2VzCj4+Pj4gaGF2ZSBubyBMaW51eCBkbWEtYnVmIHN1cHBvcnQuCj4+Pj4KPj4+PiBCdW1wIGdu
dHRhYiBsaWJyYXJ5IG1pbm9yIHZlcnNpb24gdG8gMy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4KPj4+IEhhcyB0aGUgTGludXggc2lkZSBiZWVuIG1lcmdlZCB5ZXQ/Cj4+IEl0IGlzIGdvaW5n
IHRvIGJlIG1lcmdlZCBpbnRvIEJvcmlzJyBzdGFnaW5nIGZvciBub3cKPj4gYW5kIHRoZW4gZXZl
bnR1YWxseSBtb3ZlIGludG8gWGVuIHRpcCdzIGZvci1saW51cyAoQm9yaXMgY2FuCj4+IHRlbGwg
bW9yZSBvbiB0aGF0OiBMaW51eCBpcyBhbHJlYWR5IGF0IHJjNiwgc28gSSB0aGluayB0aGlzCj4+
IGNhbiBoYXBwZW4gaW4gdGhlIG5lYXJlc3QgZnV0dXJlKS4KPj4KPiBPSy4gU28gdGhlIGludGVy
ZmFjZXMgb24gTGludXgncyBzaWRlIGFyZSBhZ3JlZWQuClllcwo+Cj4+IEdpdmVuIHRoYXQgWGVu
IGFuZCBMaW51eCBwYXJ0cyBhcmUgYWN0dWFsbHkgaW5kZXBlbmRlbnQsCj4+IEkgZGVjaWRlZCB0
byBzdGFydCB1cHN0cmVhbWluZyBsaWJnbnR0YWIgY2hhbmdlcyBub3csIGFsbG93aW5nCj4+IG1l
IHRvIG1hdHVyZSB0aGUgY29kZSBhbmQgYWRkcmVzcyBjb21tZW50cwo+ICBGcm9tIG15IFBvViB0
aGlzIHBhdGNoIHByb3ZpZGVzIGEgYnVuY2ggb2Ygd3JhcHBlcnMgYXJvdW5kIExpbnV4IGlvY3Rs
cwo+IHNvIEkgd291bGQgbGlrZSB0byBiZSBzdXJlIHRoZSB1bmRlcmx5aW5nIGludGVyZmFjZXMg
YXJlIGFncmVlZCBiZWZvcmUKPiByZXZpZXdpbmcuCkZhaXIgZW5vdWdoLApCb3JpcyBjb3VsZCB5
b3UgcGxlYXNlIGVzdGltYXRlIHdoZW4gdGhlIGNvcnJlc3BvbmRpbmcgTGludXgKY2hhbmdlcyBo
YXZlIGEgY2hhbmNlIHRvIGdldCBpbnRvIFhlbiB0aXAgTGludXggdHJlZT8KPiBXZWkuClRoYW5r
IHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
