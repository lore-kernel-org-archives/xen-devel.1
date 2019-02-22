From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 13:53:41 +0200
Message-ID: <a604beb1-4b20-b22e-ad5b-f423c66af3db@gmail.com>
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
 <SRS0=Jiny=Q5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gx9Oj-0005zL-Ao
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:53:45 +0000
Received: by mail-lj1-x242.google.com with SMTP id q128so1457826ljb.11
 for <xen-devel@lists.xenproject.org>; Fri, 22 Feb 2019 03:53:44 -0800 (PST)
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
To: Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDIuMTkgMTM6MzAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBX
aGlsZSByZXZpZXcgdGVuZCB0byBiZSB2ZXJ5IHRob3JvdWdoLCBpdCBpcyBzb21ldGltZXMgaGFy
ZCB0byBzcG90IHdoZW4gd2UgbWlzcyBhIGNhc2UuIFRoaXMgaXMgd2hlcmUgLVdzd2l0Y2ggY29t
ZXMgaW50byBwbGFjZSB0byBzcG90IG1pc3NpbmcgaG93Lgo+Cj4gSG93IHRoZSBCVUcvQVNTRVJU
X1VOUkVBQ0hBQkxFIHNvbHV0aW9uIGlzIGdvaW5nIHRvIGhlbHAgdXMgaGVyZT8KSSB1bmRlcnN0
YW5kIHRoYXQgaGl0dGluZyAtV3N3aXRjaCByZXF1aXJlcyBsZXNzIGVmZm9ydHMsIHRoZSBjb21w
aWxhdGlvbiBvbmx5LiBPdGhlcndpc2UgYnVpbGQgcnVuLCBldmVuIGZ1bGZpbGxpbmcgc29tZSBj
b25kaXRpb25zIGFyZSBuZWVkZWQgdG8gaGl0IG1pc3NlZCBlbnVtIGluZGV4LgoKQnV0IGhvdyB0
aG9zZSBgc3dpdGNoKClgIHdpdGhvdXQgYGRlZmF1bHQ6YCBsYWJlbCBhcmUgcHJvdGVjdGVkIGFn
YWluc3QgdGhlIHZhbHVlIG91dHNpZGUgdGhlIGVudW0/CgotLSAKU2luY2VyZWx5LApBbmRyaWkg
QW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
