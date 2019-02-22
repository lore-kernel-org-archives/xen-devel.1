From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 11:32:50 +0000
Message-ID: <2cfebd6a-0b99-9704-9338-a87de37a1fb1@arm.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <1a9017e6-9f97-9cf2-fca1-11a2db23e232@gmail.com>
 <db620149-0728-c7b7-1e4b-6350eb859759@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tzxq=Q5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gx952-0003eM-CG
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:33:24 +0000
In-Reply-To: <db620149-0728-c7b7-1e4b-6350eb859759@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMi8wMi8yMDE5IDExOjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24gMjIv
MDIvMjAxOSAxMToyMSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gT24gMjIuMDIuMTkgMTI6Mjcs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAyMi8wMi8yMDE5IDA5OjU3LCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pj4KPj4+PiBIZWxsbywgZXZlcnli
b2R5IQo+Pj4+Cj4+Pj4gV2UgYXQgRVBBTSBTeXN0ZW1zIHdvdWxkIGxpa2UgdG8gcHJlc2VudCBm
aXJzdCBzZXJpZXMgb2YgcGF0Y2hlcyB0YXJnZXRpbmcgWGVuCj4+Pj4gb24gQVJNIEZ1bmN0aW9u
YWwgU2FmZXR5IGNlcnRpZmljYXRpb24gKElTTzYxNTA4IGJhc2VkKTogaW1wbGVtZW50YXRpb24g
b2YKPj4+PiBNSVNSQSBbMV0gQzoyMDEyIFJ1bGUgMTYuNCB3aGljaCByZXF1aXJlcyB0aGF0IGV2
ZXJ5IHN3aXRjaCBzdGF0ZW1lbnQgaGFzIGEKPj4+PiBkZWZhdWx0IGxhYmVsIGFzIGEgbWVhc3Vy
ZSBvZiBkZWZlbnNpdmUgcHJvZ3JhbW1pbmcgdGVjaG5pcXVlLgo+Pj4KPj4+IEhhbmcgb24gLSB3
aGF0Pwo+Pj4KPj4+IENhbiBzb21lb25lIGF0dGVtcHQgdG8ganVzdGlmeSB3aHkgYWN0aXZlbHkg
YnJlYWtpbmcgLVdzd2l0Y2ggaXMgZ29pbmcKPj4+IHRvIHJlc3VsdCBpbiBzYWZlci9iZXR0ZXIg
Y29kZT8KPj4KPj4gSSB3b3VsZCBleHByZXNzIG15IHZpc2lvbiBvZiB0aGF0IE1JU1JBIHJ1bGUg
cmVxdWlyZW1lbnQ6Cj4+IEl0IHJlcXVpcmVzIGhhbmRsaW5nIChpbiBhbnkgbWVhbmluZykgYWxs
IHBvc3NpYmxlIGluY29taW5nIHZhbHVlcyBleHBsaWNpdGx5Lgo+PiBTd2l0Y2hpbmcgdGhyb3Vn
aCBlbnVtIHN0aWxsIGNvdWxkIGJlIGd1YXJkZWQgYnkgQlVHL0FTU0VSVF9VTlJFQUNIQUJMRSB1
bmRlciAKPj4gZGVmYXVsdCBsYWJlbC4gVGhvdWdoIGF0IHJ1bnRpbWUsIG5vdCBjb21waWxhdGlv
biB0aW1lLgo+IAo+IFdoaWxlIHJldmlldyB0ZW5kIHRvIGJlIHZlcnkgdGhvcm91Z2gsIGl0IGlz
IHNvbWV0aW1lcyBoYXJkIHRvIHNwb3Qgd2hlbiB3ZSBtaXNzIAo+IGEgY2FzZS4gVGhpcyBpcyB3
aGVyZSAtV3N3aXRjaCBjb21lcyBpbnRvIHBsYWNlIHRvIHNwb3QgbWlzc2luZyBob3cuCgpzL2hv
dy9jYXNlLwoKPiAKPiBIb3cgdGhlIEJVRy9BU1NFUlRfVU5SRUFDSEFCTEUgc29sdXRpb24gaXMg
Z29pbmcgdG8gaGVscCB1cyBoZXJlPwo+IAo+IENoZWVycywKPiAKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
