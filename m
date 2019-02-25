From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 14:00:46 +0200
Message-ID: <d6788a0e-787f-73f3-563c-b5e5627f86b6@gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <ceb1977e-c534-95f1-b3f8-63e7634b9e31@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyEwE-0006TN-Pp
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 12:00:50 +0000
Received: by mail-lj1-x242.google.com with SMTP id g80so7137412ljg.6
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 04:00:49 -0800 (PST)
In-Reply-To: <ceb1977e-c534-95f1-b3f8-63e7634b9e31@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNS8xOSAxOjQzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4KPiBPbiAyMi8w
Mi8yMDE5IDEwOjI3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyMi8wMi8yMDE5IDA5OjU3
LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBIZWxs
bywgZXZlcnlib2R5IQo+Pj4KPj4+IFdlIGF0IEVQQU0gU3lzdGVtcyB3b3VsZCBsaWtlIHRvIHBy
ZXNlbnQgZmlyc3Qgc2VyaWVzIG9mIHBhdGNoZXMgCj4+PiB0YXJnZXRpbmcgWGVuCj4+PiBvbiBB
Uk0gRnVuY3Rpb25hbCBTYWZldHkgY2VydGlmaWNhdGlvbiAoSVNPNjE1MDggYmFzZWQpOiAKPj4+
IGltcGxlbWVudGF0aW9uIG9mCj4+PiBNSVNSQSBbMV0gQzoyMDEyIFJ1bGUgMTYuNCB3aGljaCBy
ZXF1aXJlcyB0aGF0IGV2ZXJ5IHN3aXRjaCAKPj4+IHN0YXRlbWVudCBoYXMgYQo+Pj4gZGVmYXVs
dCBsYWJlbCBhcyBhIG1lYXN1cmUgb2YgZGVmZW5zaXZlIHByb2dyYW1taW5nIHRlY2huaXF1ZS4K
Pj4KPj4gSGFuZyBvbiAtIHdoYXQ/Cj4+Cj4+IENhbiBzb21lb25lIGF0dGVtcHQgdG8ganVzdGlm
eSB3aHkgYWN0aXZlbHkgYnJlYWtpbmcgLVdzd2l0Y2ggaXMgZ29pbmcKPj4gdG8gcmVzdWx0IGlu
IHNhZmVyL2JldHRlciBjb2RlPwo+Cj4gSSBqdXN0IGRpc2NvdmVyZWQgdGhhdCBHQ0MgaGFzIGFu
IG9wdGlvbiAtV3N3aXRjaC1lbnVtIHRoYXQgd291bGQgd2FybiAKPiBvZiBtaXNzaW5nIGVsZW1l
bnQgZXZlbiBpbiB0aGUgcHJlc2VuY2Ugb2YgdGhlICdkZWZhdWx0JyBsYWJlbC4gSSAKPiBndWVz
cyB0aGlzIGNvdWxkIGhlbHAgdXMgdG8gcmV1bml0ZSBNSVNSQSBhbmQgWGVuIGZvciB0aGlzIHJ1
bGU/Cj4KQW5kIHN0aWxsIHlvdXIgY29tbWVudCBvbiBwbGFpbiBpbnRlZ2VycyBpbiBhbm90aGVy
IHRocmVhZCBpcyBzdGlsbCB2YWxpZC4KU28sIGl0IG9ubHkgcGFydGlhbGx5IHNvbHZlcyB0aGUg
aXNzdWUuCj4gQ2hlZXJzLAo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
