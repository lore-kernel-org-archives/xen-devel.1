From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v9 06/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Fri, 19 Jan 2018 10:39:32 +0000
Message-ID: <56e83536-8f47-69ed-9caa-b40dd99809ff@citrix.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516290370-14958-7-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDEvMTggMTU6NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gV2UgbmVlZCB0byBiZSBh
YmxlIHRvIGVpdGhlciBzZXQgb3IgY2xlYXIgSUJSUyBpbiBYZW4gY29udGV4dCwgYXMgd2VsbCBh
cwo+IHJlc3RvcmUgYXBwcm9wcmlhdGUgZ3Vlc3QgdmFsdWVzIGluIGd1ZXN0IGNvbnRleHQuICBT
ZWUgdGhlIGRvY3VtZW50YXRpb24gaW4KPiBhc20teDg2L3NwZWNfY3RybF9hc20uaCBmb3IgZGV0
YWlscy4KPgo+IFdyaXRlcyB0byAlY3IzIGFyZSBzbG93ZXIgd2hlbiBTUEVDX0NUUkwuSUJSUyBp
cyBzZXQsIHNvIHRoZQo+IFNQRUNfQ1RSTF97RU5UUlkvRVhJVH0qIHBvc2l0aW9uaW5nIGlzIGlt
cG9ydGFudCwgYW5kIG9wdGltaXNlZCBmb3IgdGhlCj4gZXhwZWN0ZWQgY29tbW9uIGNhc2Ugb2Yg
WGVuIG5vdCB1c2luZyBJQlJTIGl0c2VsZi4KPgo+IFRoZXJlIGlzIGEgc2VtaS11bnJlbGF0ZWQg
YnVnZml4LCB3aGVyZSB2YXJpb3VzIGFzbV9kZWZuLmggbWFjcm9zIGhhdmUgYQo+IGhpZGRlbiBk
ZXBlbmRlbmN5IG9uIFBBR0VfU0laRSwgd2hpY2ggcmVzdWx0cyBpbiBhbiBhc3NlbWJsZXIgZXJy
b3IgaWYgdXNlZCBpbgo+IGEgLm1hY3JvIGRlZmluaXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKL3NpZ2ggLSBJdCBhcHBl
YXJzIHRoYXQgSSd2ZSBtaXNzZWQgdHdvIGh1bmtzIGZyb20gdGhpcyBwYXRjaCwgYW5kIGFzIGEK
cmVzdWx0LCBpdHMgc3VidGx5IGJyb2tlbiBmb3IgSFZNIGd1ZXN0cy4KCkknbGwgcG9zdCBhbiBp
bmNyZW1lbnRhbCB2ZXJzaW9uIHdoZW4gSSd2ZSB1bmJyb2tlbiBteSBhdXRvbWF0aWMgdGVzdHMK
YW5kIHJlZnJlc2hlZCB0aGUgWFRGIHVuaXQgdGVzdHMgZm9yIHRoZXNlIE1TUnMuCgpJdCBpcyBl
eHBlY3RlZCB0byBiZSB0d28gZXh0cmEgbW92J3MgaW4gdGhlIHZteC9zdm0gZXhpdCBwYXRocywg
c28gdGhlCnJlc3Qgb2YgdGhlIHBhdGNoIGlzIG9rIGZvciByZXZpZXcgaW4gZ2VuZXJhbC4KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
