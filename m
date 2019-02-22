From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Fri, 22 Feb 2019 11:05:18 +0000
Message-ID: <a30ca582-0993-9652-112e-467f49605405@arm.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tzxq=Q5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gx8dv-0000Ww-AC
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 11:05:23 +0000
In-Reply-To: <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMi8wMi8yMDE5IDEwOjI3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIyLzAy
LzIwMTkgMDk6NTcsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+
Cj4+IEhlbGxvLCBldmVyeWJvZHkhCj4+Cj4+IFdlIGF0IEVQQU0gU3lzdGVtcyB3b3VsZCBsaWtl
IHRvIHByZXNlbnQgZmlyc3Qgc2VyaWVzIG9mIHBhdGNoZXMgdGFyZ2V0aW5nIFhlbgo+PiBvbiBB
Uk0gRnVuY3Rpb25hbCBTYWZldHkgY2VydGlmaWNhdGlvbiAoSVNPNjE1MDggYmFzZWQpOiBpbXBs
ZW1lbnRhdGlvbiBvZgo+PiBNSVNSQSBbMV0gQzoyMDEyIFJ1bGUgMTYuNCB3aGljaCByZXF1aXJl
cyB0aGF0IGV2ZXJ5IHN3aXRjaCBzdGF0ZW1lbnQgaGFzIGEKPj4gZGVmYXVsdCBsYWJlbCBhcyBh
IG1lYXN1cmUgb2YgZGVmZW5zaXZlIHByb2dyYW1taW5nIHRlY2huaXF1ZS4KPiAKPiBIYW5nIG9u
IC0gd2hhdD8KPiAKPiBDYW4gc29tZW9uZSBhdHRlbXB0IHRvIGp1c3RpZnkgd2h5IGFjdGl2ZWx5
IGJyZWFraW5nIC1Xc3dpdGNoIGlzIGdvaW5nCj4gdG8gcmVzdWx0IGluIHNhZmVyL2JldHRlciBj
b2RlPwoKSSB3YXMgYWJvdXQgdG8gYXNrIHRoZSBzYW1lLiBUaGVyZSBhcmUgcXVpdGUgYSBmZXcg
Y2FzZXMgd2hlcmUgdGhpcyBzZXJpZXMgaXMgCmdvaW5nIHRvIG1ha2UgbW9yZSBkaWZmaWN1bHQg
ZXh0ZW5kaW5nIGVudW0uCgpGdXJ0aGVybW9yZSwgdXNpbmcgQlVHKCkgaXMgYSBwcmV0dHkgYmFk
IGlkZWEgaW4gc3dpdGNoLiBBIGd1ZXN0IHdvdWxkIGJlIGFibGUgCnRvIGNyYXNoIHRoZSB3aG9s
ZSBwbGF0Zm9ybSBpZiB0aGVyZSB3YXMgYSBjb2RpbmcgbWlzdGFrZS4gSW5zdGVhZCB3ZSBzaG91
bGQgdXNlIApBU1NFUlRfVU5SRUFDSEFCTEUoKSBhbmQgcHJvdmlkZSBwcm9wZXIgZmFsbGJhY2sg
d2hlbmV2ZXIgaXQgaXMgcG9zc2libGUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
