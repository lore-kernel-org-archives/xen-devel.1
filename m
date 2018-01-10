From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v4 02/39] arm/p2m: Add first altp2m HVMOP
 stubs
Date: Wed, 10 Jan 2018 17:20:57 +0000
Message-ID: <c31f39bb-6d28-81a5-69f2-5a629fa9d4de@linaro.org>
References: <20170830183258.14612-1-proskurin@sec.in.tum.de>
 <20170830183258.14612-3-proskurin@sec.in.tum.de>
 <c6fed3f8-eb9a-dc36-5679-c6a9c3d3df71@linaro.org>
 <42b33681-3437-2b5e-4e09-24364c279050@sec.in.tum.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=n77h=ef=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eZK3i-0004jy-R1
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 17:21:02 +0000
Received: by mail-wm0-x22d.google.com with SMTP id 143so392323wma.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2018 09:21:01 -0800 (PST)
In-Reply-To: <42b33681-3437-2b5e-4e09-24364c279050@sec.in.tum.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8wMS8xOCAxNzoxNiwgU2VyZ2VqIFByb3NrdXJpbiB3cm90ZToKPiBIaSBKdWxpZW4s
CgpIaSwKCj4gCj4gT24gMTAvMDkvMjAxNyAwNjo0MyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+
PiBIaSBTZXJnZWosCj4+Cj4+IE9uIDMwLzA4LzE3IDE5OjMyLCBTZXJnZWogUHJvc2t1cmluIHdy
b3RlOgo+Pj4gVGhpcyBjb21taXQgY29waWVzIGFuZCBleHRlbmRzIHRoZSBhbHRwMm0tcmVsYXRl
ZCBjb2RlIGZyb20geDg2IHRvIEFSTS4KPj4+IEZ1bmN0aW9ucyB0aGF0IGFyZSBubyB5ZXQgc3Vw
cG9ydGVkIG5vdGlmeSB0aGUgY2FsbGVyIG9yIHByaW50IGEgQlVHCj4+PiBtZXNzYWdlIHN0YXRp
bmcgdGhlaXIgYWJzZW5jZS4KPj4KPj4gSSBhbSBzdGlsbCBjb25jZXJuZWQgb24gdGhlIGxvY2tp
bmcgZGlmZmVyaW5nIGJldHdlZW4geDg2IGFuZCBBcm0KPj4gKGxpa2VseSB0aGUgZm9ybWVyIGlz
IHdyb25nKSBhbmQgZm9yIG1haW50YWluIFBPViBpbiB0aGUgZnV0dXJlLgo+Pgo+PiBMYXN0IHll
YXIgeW91IHNhaWQgeW91IHdlcmUgd29ya2luZyBvbiBnZXR0aW5nIGRvX2FsdHAybV9vcCBjb21t
b24KPj4gYmV0d2VlbiB4ODYgYW5kIEFybS4gV2hhdCdzIHRoZSBzdGF0dXM/Cj4gCj4gSSByZW1l
bWJlciB1cyBoYXZpbmcgdGhlIGRpc2N1c3Npb24gYWJvdXQgcHVsbGluZyBvdXQgY29tbW9uIGNv
ZGUgb2YKPiBib3RoIGFyY2hpdGVjdHVyZXMuIEkgc3RpbGwgYmVsaWV2ZSB0aGF0IHRoaXMgaXMg
bmVjZXNzYXJ5LiBZZXQsIGFzIEkKPiB0b2xkIHlvdSB0aGUgbGFzdCB0aW1lLCBJIHJlYWxseSB3
b3VsZCBsaWtlIHRvIGZpcnN0IGdldCB0aGUKPiBpbXBsZW1lbnRhdGlvbiBmb3IgQVJNIGludG8g
bWFpbmxpbmUgYmVmb3JlIGJsb3dpbmcgdXAgdGhpcyBwYXRjaCBzZXJpZXMKPiBldmVuIG1vcmUu
CgpUaGF0J3MgYSBuby1nbyBmcm9tIG15IHNpZGUgZnJvbSAyIHJlYXNvbnM6CgkxKSBZb3UgYWRk
IGJ1cmRlbiBpbiByZXZpZXcuIEkgaGF2ZSB0byBtYWtlIHN1cmUgdGhhdCBldmVyeSBuZXcgY29k
ZSAKeW91IGFkZCBhbmQgbWFrZSBzdXJlIHlvdSBkb24ndCBnZXQgdGhlIGxvY2tpbmcgd3Jvbmcu
IENvbW1vbiBjb2RlIG1ha2VzIAplYXNpZXIgZm9yIHRoYXQKCTIpIE1vc3Qgb2YgZmVhdHVyZXMg
YWRkZWQgdG8gQXJtIHRoYXQgYWxyZWFkeSBjb21pbmcgZnJvbSB4ODYgYXJlIAp1c3VhbGx5IGNv
bnNvbGlkYXRlZC4KClNvIHRvIG1ha2UgY2xlYXIsIHRoZSBjdXJyZW50IHN0YXRlOgoKTkFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
