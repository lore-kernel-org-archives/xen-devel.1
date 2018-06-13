From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v5 1/3] xen: Sync up with the canonical
 protocol definitions in Xen
Date: Wed, 13 Jun 2018 08:49:31 +0300
Message-ID: <3605901d-4a72-3f5a-6d74-cb13d2414a0b__46701.2534769767$1528868900$gmane$org@gmail.com>
References: <20180612074856.28451-1-andr2000@gmail.com>
 <20180612074856.28451-2-andr2000@gmail.com>
 <9c579567-ebe2-f465-5443-b3a3e71d34a5@suse.com>
 <20180612234020.GI38773@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t8s0=i7=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fSyf1-0004Yh-0X
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 05:49:35 +0000
Received: by mail-lf0-x243.google.com with SMTP id n3-v6so1927662lfe.12
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jun 2018 22:49:34 -0700 (PDT)
In-Reply-To: <20180612234020.GI38773@dtor-ws>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: lyan@suse.com, andrii_chepurnyi@epam.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTMvMjAxOCAwMjo0MCBBTSwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOgo+IE9uIFR1ZSwg
SnVuIDEyLCAyMDE4IGF0IDAzOjQ2OjEwUE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
IE9uIDEyLzA2LzE4IDA5OjQ4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+IEZy
b206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFt
LmNvbT4KPj4+Cj4+PiBUaGlzIGlzIHRoZSBzeW5jIHVwIHdpdGggdGhlIGNhbm9uaWNhbCBkZWZp
bml0aW9ucyBvZiB0aGUgaW5wdXQsCj4+PiBzb3VuZCBhbmQgZGlzcGxheSBwcm90b2NvbHMgaW4g
WGVuLgo+Pj4KPj4+IENoYW5nZXMgdG8ga2JkaWY6Cj4+PiAxLiBBZGQgbWlzc2luZyBzdHJpbmcg
Y29uc3RhbnRzIGZvciB7ZmVhdHVyZXxyZXF1ZXN0fS1yYXctcG9pbnRlcgo+Pj4gICAgIHRvIGFs
aWduIHdpdGggdGhlIHJlc3Qgb2YgdGhlIGludGVyZmFjZSBmaWxlLgo+Pj4KPj4+IDIuIEFkZCBu
ZXcgWGVuU3RvcmUgZmVhdHVyZSBmaWVsZHMsIHNvIGl0IGlzIHBvc3NpYmxlIHRvIGluZGl2aWR1
YWxseQo+Pj4gICAgIGNvbnRyb2wgc2V0IG9mIGV4cG9zZWQgdmlydHVhbCBkZXZpY2VzIGZvciBl
YWNoIGd1ZXN0IE9TOgo+Pj4gICAgICAgLSBzZXQgZmVhdHVyZS1kaXNhYmxlLWtleWJvYXJkIHRv
IDEgaWYgbm8ga2V5Ym9hcmQgZGV2aWNlIG5lZWRzCj4+PiAgICAgICAgIHRvIGJlIGNyZWF0ZWQK
Pj4+ICAgICAgIC0gc2V0IGZlYXR1cmUtZGlzYWJsZS1wb2ludGVyIHRvIDEgaWYgbm8gcG9pbnRl
ciBkZXZpY2UgbmVlZHMKPj4+ICAgICAgICAgdG8gYmUgY3JlYXRlZAo+Pj4KPj4+IDMuIE1vdmUg
bXVsdGktdG91Y2ggZGV2aWNlIHBhcmFtZXRlcnMgdG8gYmFja2VuZCBub2RlczogdGhlc2UgYXJl
Cj4+PiAgICAgIGRlc2NyaWJlZCBhcyBhIHBhcnQgb2YgZnJvbnRlbmQncyBYZW5CdXMgY29uZmln
dXJhdGlvbiBub2Rlcwo+Pj4gICAgICB3aGlsZSB0aGV5IGJlbG9uZyB0byBiYWNrZW5kJ3MgY29u
ZmlndXJhdGlvbi4gRml4IHRoaXMgYnkgbW92aW5nCj4+PiAgICAgIHRoZSBwYXJhbWV0ZXJzIHRv
IHRoZSBwcm9wZXIgc2VjdGlvbi4KPj4+Cj4+PiBVbmlxdWUtaWQgZmllbGQ6Cj4+PiAxLiBBZGQg
dW5pcXVlLWlkIFhlbkJ1cyBlbnRyeSBmb3IgdmlydHVhbCBpbnB1dCBhbmQgZGlzcGxheS4KPj4+
Cj4+PiAyLiBDaGFuZ2UgdHlwZSBvZiB1bmlxdWUtaWQgZmllbGQgdG8gc3RyaW5nIGZvciBzbmRp
ZiB0byBhbGlnbiB3aXRoCj4+PiBkaXNwbGF5IGFuZCBpbnB1dCBwcm90b2NvbHMuCj4+Pgo+Pj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPgo+Pj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4KPj4gSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoIGJlaW5nIGFkZGVkIHZpYSB0aGUg
aW5wdXQgdHJlZSB3aXRoIHRoZSBvdGhlcgo+PiBwYXRjaGVzLiBJbiBjYXNlIEkgc2hvdWxkIHRh
a2UgaXQgdmlhIHRoZSBYZW4gdHJlZSwgcGxlYXNlIHNlbmQgbWUgYQo+PiBub3RlLgo+IEp1ZXJn
ZW4sCj4KPiBJIGNyZWF0ZWQgYW4gaW1tdXRhYmxlIGJyYW5jaCBvZmYgdjQuMTcgd2l0aCB0aGVz
ZSAzIHBhdGNoZXMgaW4gY2FzZSB5b3UKPiB3b3VsZCB3YW50IHRvIG1lcmdlIHRoZW0gaW50byB5
b3VyIHRyZWUgd2l0aG91dCB3YWl0aW5nIGZvciB0aGVtIHRvCj4gYXBwZWFyIGluIG1haW5saW5l
Ogo+Cj4gZ2l0IHB1bGwgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2R0b3IvaW5wdXQuZ2l0IGliLzQuMTcteGVuLWtiZGZyb250LXJ1bnRpbWUtY29uZmlnCj4K
PiBUaGFua3MuCj4KVGhhbmsgeW91LApJIHdvdWxkIHByZWZlciB0aGUgZmFzdGVzdCBwYXRoIG9m
IGNvdXJzZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
