From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 11:30:26 +0000
Message-ID: <db620149-0728-c7b7-1e4b-6350eb859759@arm.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <1a9017e6-9f97-9cf2-fca1-11a2db23e232@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tzxq=Q5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gx92F-0003X4-8n
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:30:31 +0000
In-Reply-To: <1a9017e6-9f97-9cf2-fca1-11a2db23e232@gmail.com>
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

CgpPbiAyMi8wMi8yMDE5IDExOjIxLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDIyLjAyLjE5
IDEyOjI3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyMi8wMi8yMDE5IDA5OjU3LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBIZWxsbywgZXZl
cnlib2R5IQo+Pj4KPj4+IFdlIGF0IEVQQU0gU3lzdGVtcyB3b3VsZCBsaWtlIHRvIHByZXNlbnQg
Zmlyc3Qgc2VyaWVzIG9mIHBhdGNoZXMgdGFyZ2V0aW5nIFhlbgo+Pj4gb24gQVJNIEZ1bmN0aW9u
YWwgU2FmZXR5IGNlcnRpZmljYXRpb24gKElTTzYxNTA4IGJhc2VkKTogaW1wbGVtZW50YXRpb24g
b2YKPj4+IE1JU1JBIFsxXSBDOjIwMTIgUnVsZSAxNi40IHdoaWNoIHJlcXVpcmVzIHRoYXQgZXZl
cnkgc3dpdGNoIHN0YXRlbWVudCBoYXMgYQo+Pj4gZGVmYXVsdCBsYWJlbCBhcyBhIG1lYXN1cmUg
b2YgZGVmZW5zaXZlIHByb2dyYW1taW5nIHRlY2huaXF1ZS4KPj4KPj4gSGFuZyBvbiAtIHdoYXQ/
Cj4+Cj4+IENhbiBzb21lb25lIGF0dGVtcHQgdG8ganVzdGlmeSB3aHkgYWN0aXZlbHkgYnJlYWtp
bmcgLVdzd2l0Y2ggaXMgZ29pbmcKPj4gdG8gcmVzdWx0IGluIHNhZmVyL2JldHRlciBjb2RlPwo+
IAo+IEkgd291bGQgZXhwcmVzcyBteSB2aXNpb24gb2YgdGhhdCBNSVNSQSBydWxlIHJlcXVpcmVt
ZW50Ogo+IEl0IHJlcXVpcmVzIGhhbmRsaW5nIChpbiBhbnkgbWVhbmluZykgYWxsIHBvc3NpYmxl
IGluY29taW5nIHZhbHVlcyBleHBsaWNpdGx5Lgo+IFN3aXRjaGluZyB0aHJvdWdoIGVudW0gc3Rp
bGwgY291bGQgYmUgZ3VhcmRlZCBieSBCVUcvQVNTRVJUX1VOUkVBQ0hBQkxFIHVuZGVyIAo+IGRl
ZmF1bHQgbGFiZWwuIFRob3VnaCBhdCBydW50aW1lLCBub3QgY29tcGlsYXRpb24gdGltZS4KCldo
aWxlIHJldmlldyB0ZW5kIHRvIGJlIHZlcnkgdGhvcm91Z2gsIGl0IGlzIHNvbWV0aW1lcyBoYXJk
IHRvIHNwb3Qgd2hlbiB3ZSBtaXNzIAphIGNhc2UuIFRoaXMgaXMgd2hlcmUgLVdzd2l0Y2ggY29t
ZXMgaW50byBwbGFjZSB0byBzcG90IG1pc3NpbmcgaG93LgoKSG93IHRoZSBCVUcvQVNTRVJUX1VO
UkVBQ0hBQkxFIHNvbHV0aW9uIGlzIGdvaW5nIHRvIGhlbHAgdXMgaGVyZT8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
