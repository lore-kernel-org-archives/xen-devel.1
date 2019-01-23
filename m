From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 0/2] Dangling fixes for ARM iommu
Date: Wed, 23 Jan 2019 20:29:29 +0200
Message-ID: <e919a1c0-2fef-29e9-658c-59660aaf63b9@gmail.com>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <c760919c-e635-ee39-6c74-fcac97dc060d@arm.com>
 <77aca14e-dd88-855c-4d7f-2e3a600a5e7a@gmail.com>
 <3a213999-d67a-9cff-d3bf-3d4cf5baa5b3@arm.com>
 <73eedabd-8552-8d20-f0eb-609fe0f35fbd@gmail.com>
 <ed087980-a2b9-2fd4-7e84-446142e8176b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmNHK-0006YJ-Cu
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 18:29:34 +0000
Received: by mail-lj1-x244.google.com with SMTP id u89-v6so2875188lje.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 10:29:33 -0800 (PST)
In-Reply-To: <ed087980-a2b9-2fd4-7e84-446142e8176b@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDIzLjAxLjE5IDIwOjE0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSSBjYW4gcXVldWUgdGhl
IGZpcnN0IGh1bmsgZm9yIFhlbiA0LjEzLgpGb3IgNC4xMz8gV2VsbCBJIGhvcGUgd2Ugd2lsbCBt
YW5hZ2UgdG8gdXBzdHJlYW0gdGhlIHdob2xlIHNlcmllcyB1bnRpbCB0aGVuLgoKPiBUaGlzIHN0
YXRlbWVudCBpcyBvbmx5IGNvcnJlY3QgaWYgdGhlIElPTU1VIGhhcyBiZWVuIGFjdGl2ZWx5IGJs
YWNrbGlzdGVkIGJ5IFhlbi4gSW4gdGhlIGNhc2Ugb2YgdGhlIFNNTVUgZHJpdmVyLCB0aGlzIGlz
IGRvbmUgYnkgYXJtX3NtbXVfZHRfaW5pdCgpLiBUaGUgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQg
d2hlbiB0aGUgSU9NTVUgaGFzIGJlZW4gZW5hYmxlZC4KPiAKPiBTbyBpZiB5b3UgcGFzcyAiaW9t
bXU9ZGlzYWJsZWQiIHRvIFhlbiBjb21tYW5kbGluZSwgdGhlIFNNTVUgd2lsbCBiZSBhY2Nlc3Np
YmxlIGJ5IERvbTAuCj4gCj4gV2hlbiB0aGVyZSBhcmUgbm8gZHJpdmVycyBmb3IgdGhlIElPTU1V
IHVzZWQsIHRoZW4geW91IGVuZCB1cCB0byBhc3NpZ24gdGhlIElPTU1VIHRvIERvbTAuIFRoaXMg
bWVhbnMgdGhhdCBEb20wIGNhbiB1c2UgdGhlbS4KPiAKPiBJdCBkb2VzIG5vdCBtYWtlIHNlbnNl
IHRvIHJlbW92ZSB0aGUgcHJvcGVydGllcyAiaW9tbXVzIiwgImlvbW11LW1hcCIsICJpb21tdS1t
YXAtbWFzayIgaWYgRG9tMCBpcyBhbHJlYWR5IHRvdWNoaW5nIHRoZSBJT01NVS4gSXQgaXMgZWl0
aGVyIGV2ZXJ5dGhpbmcgb3Igbm90aGluZy4KU28gdGhhdCBwYXRjaCBzaG91bGQgYmUgdG90YWxs
eSByZXdyaXR0ZW4uIEF0IGxlYXN0IHRvIHN1cHBvcnQgaW9tbXU9ZGlzYWJsZWQuCgotLSAKU2lu
Y2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
