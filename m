From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 1/3] xen: Sync up with the canonical
 protocol definitions in Xen
Date: Tue, 12 Jun 2018 16:47:40 +0300
Message-ID: <fbc66cfa-f750-7810-1a0e-537c5c98d9e5__14687.8232401379$1528811231$gmane$org@epam.com>
References: <20180612074856.28451-1-andr2000@gmail.com>
 <20180612074856.28451-2-andr2000@gmail.com>
 <9c579567-ebe2-f465-5443-b3a3e71d34a5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tjfj=i6=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fSjep-0001ZA-T9
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 13:48:24 +0000
In-Reply-To: <9c579567-ebe2-f465-5443-b3a3e71d34a5@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, lyan@suse.com, boris.ostrovsky@oracle.com
Cc: andrii_chepurnyi@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAwNDo0NiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMi8wNi8x
OCAwOTo0OCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+IEZyb206IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4KPj4g
VGhpcyBpcyB0aGUgc3luYyB1cCB3aXRoIHRoZSBjYW5vbmljYWwgZGVmaW5pdGlvbnMgb2YgdGhl
IGlucHV0LAo+PiBzb3VuZCBhbmQgZGlzcGxheSBwcm90b2NvbHMgaW4gWGVuLgo+Pgo+PiBDaGFu
Z2VzIHRvIGtiZGlmOgo+PiAxLiBBZGQgbWlzc2luZyBzdHJpbmcgY29uc3RhbnRzIGZvciB7ZmVh
dHVyZXxyZXF1ZXN0fS1yYXctcG9pbnRlcgo+PiAgICAgdG8gYWxpZ24gd2l0aCB0aGUgcmVzdCBv
ZiB0aGUgaW50ZXJmYWNlIGZpbGUuCj4+Cj4+IDIuIEFkZCBuZXcgWGVuU3RvcmUgZmVhdHVyZSBm
aWVsZHMsIHNvIGl0IGlzIHBvc3NpYmxlIHRvIGluZGl2aWR1YWxseQo+PiAgICAgY29udHJvbCBz
ZXQgb2YgZXhwb3NlZCB2aXJ0dWFsIGRldmljZXMgZm9yIGVhY2ggZ3Vlc3QgT1M6Cj4+ICAgICAg
IC0gc2V0IGZlYXR1cmUtZGlzYWJsZS1rZXlib2FyZCB0byAxIGlmIG5vIGtleWJvYXJkIGRldmlj
ZSBuZWVkcwo+PiAgICAgICAgIHRvIGJlIGNyZWF0ZWQKPj4gICAgICAgLSBzZXQgZmVhdHVyZS1k
aXNhYmxlLXBvaW50ZXIgdG8gMSBpZiBubyBwb2ludGVyIGRldmljZSBuZWVkcwo+PiAgICAgICAg
IHRvIGJlIGNyZWF0ZWQKPj4KPj4gMy4gTW92ZSBtdWx0aS10b3VjaCBkZXZpY2UgcGFyYW1ldGVy
cyB0byBiYWNrZW5kIG5vZGVzOiB0aGVzZSBhcmUKPj4gICAgICBkZXNjcmliZWQgYXMgYSBwYXJ0
IG9mIGZyb250ZW5kJ3MgWGVuQnVzIGNvbmZpZ3VyYXRpb24gbm9kZXMKPj4gICAgICB3aGlsZSB0
aGV5IGJlbG9uZyB0byBiYWNrZW5kJ3MgY29uZmlndXJhdGlvbi4gRml4IHRoaXMgYnkgbW92aW5n
Cj4+ICAgICAgdGhlIHBhcmFtZXRlcnMgdG8gdGhlIHByb3BlciBzZWN0aW9uLgo+Pgo+PiBVbmlx
dWUtaWQgZmllbGQ6Cj4+IDEuIEFkZCB1bmlxdWUtaWQgWGVuQnVzIGVudHJ5IGZvciB2aXJ0dWFs
IGlucHV0IGFuZCBkaXNwbGF5Lgo+Pgo+PiAyLiBDaGFuZ2UgdHlwZSBvZiB1bmlxdWUtaWQgZmll
bGQgdG8gc3RyaW5nIGZvciBzbmRpZiB0byBhbGlnbiB3aXRoCj4+IGRpc3BsYXkgYW5kIGlucHV0
IHByb3RvY29scy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+PiBDYzogS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4KPiBJJ20gZmluZSB3aXRoIHRoaXMgcGF0Y2ggYmVpbmcg
YWRkZWQgdmlhIHRoZSBpbnB1dCB0cmVlIHdpdGggdGhlIG90aGVyCj4gcGF0Y2hlcy4gSW4gY2Fz
ZSBJIHNob3VsZCB0YWtlIGl0IHZpYSB0aGUgWGVuIHRyZWUsIHBsZWFzZSBzZW5kIG1lIGEKPiBu
b3RlLgpUaGFuayB5b3UKPgo+IEp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
