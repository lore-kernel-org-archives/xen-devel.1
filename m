From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 2/2] xen: fill topology info for all
 present cpus
Date: Tue, 4 Sep 2018 10:39:54 +0100
Message-ID: <7c9f4a60-8f90-107c-919a-1ddefb31b4eb@arm.com>
References: <20180831152205.21872-1-jgross@suse.com>
 <20180831152205.21872-3-jgross@suse.com>
 <5B8D39F402000078001E4A17@prv1-mh.provo.novell.com>
 <01442930-60b8-4702-1f46-b7e2ab03ebdf@suse.com>
 <5B8E470102000078001E4FE8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0yqp=ls=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fx7oY-0003U1-5p
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 09:40:02 +0000
In-Reply-To: <5B8E470102000078001E4FE8@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwOS8wNC8yMDE4IDA5OjQ5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAw
NC4wOS4xOCBhdCAwOTozOCwgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+IE9uIDAzLzA5LzE4
IDE1OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDMxLjA4LjE4IGF0IDE3OjIyLCA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+PiBUaGUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gb2J0
YWluYWJsZSB2aWEgWEVOX1NZU0NUTF9jcHV0b3BvaW5mbyBpcwo+Pj4+IGZpbGxlZCByYXRoZXIg
d2VpcmQ6IHRoZSBzaXplIG9mIHRoZSBhcnJheSBpcyBkZXJpdmVkIGZyb20gdGhlIGhpZ2hlc3QK
Pj4+PiBvbmxpbmUgY3B1IG51bWJlciwgc28gaW4gY2FzZSB0aGVyZSBhcmUgdHJhaWxpbmcgb2Zm
bGluZSBjcHVzIHRoZXkKPj4+PiB3aWxsIG5vdCBiZSBpbmNsdWRlZC4KPj4+Pgo+Pj4+IE9uIGEg
ZHVhbCBjb3JlIHN5c3RlbSB3aXRoIDQgdGhyZWFkcyBib290ZWQgd2l0aCBzbXQ9MCB3aXRob3V0
IHRoaXMKPj4+PiBwYXRjaCB4bCBpbmZvIC1uIHdpbGwgcHJpbnQ6Cj4+Pj4KPj4+PiBjcHVfdG9w
b2xvZ3kgICAgICAgICAgIDoKPj4+PiBjcHU6ICAgIGNvcmUgICAgc29ja2V0ICAgICBub2RlCj4+
Pj4gICAgMDogICAgICAgMCAgICAgICAgMCAgICAgICAgMAo+Pj4+ICAgIDE6ICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAKPj4+PiAgICAyOiAgICAgICAxICAgICAgICAwICAgICAgICAwCj4+Pj4K
Pj4+PiB3aGlsZSB3aXRoIHRoaXMgcGF0Y2ggdGhlIG91dHB1dCBpczoKPj4+Pgo+Pj4+IGNwdV90
b3BvbG9neSAgICAgICAgICAgOgo+Pj4+IGNwdTogICAgY29yZSAgICBzb2NrZXQgICAgIG5vZGUK
Pj4+PiAgICAwOiAgICAgICAwICAgICAgICAwICAgICAgICAwCj4+Pj4gICAgMTogICAgICAgMCAg
ICAgICAgMCAgICAgICAgMAo+Pj4+ICAgIDI6ICAgICAgIDEgICAgICAgIDAgICAgICAgIDAKPj4+
PiAgICAzOiAgICAgICAxICAgICAgICAwICAgICAgICAwCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IGZvciB4ODYuIEknZCBsaWtlIHRoaXMg
dG8gaGF2ZSBhbiBBUk0gYWNrIGFzIHdlbGwsIHRob3VnaCwgZm9yCj4+PiB0aGVyZSBwb3NzaWJs
eSBiZWluZyBkaWZmZXJlbmNlcyBpbiBob3cgY3B1X3ByZXNlbnRfbWFwIGlzCj4+PiBoYW5kbGVk
IGluIHRoZWlyIGNhc2UuIEluIHBhcnRpY3VsYXIgSSBub3RpY2UgdGhhdCB0aGUgb25seSBhY2Nl
c3MKPj4+IHRvIHRoZSB2YXJpYWJsZSBpcyBpbiBzbXBfcHJlcGFyZV9jcHVzKCkuCj4+Cj4+IEhv
dyByZWxldmFudCBpcyB0aGF0IGluZm9ybWF0aW9uIGZvciBhcm0gYXQgYWxsPwo+Pgo+PiBjcHVf
dG9fY29yZShpKSBldCBhbCBhbHdheXMgcmV0dXJuIDAuIFNvIHRvcG9sb2d5IGluZm9ybWF0aW9u
IGlzIG5vdAo+PiByZWFsbHkgaGVscGZ1bC4KCldlbGwsIHRoaXMgaXMgY29tbW9uIGNvZGUgYW5k
IGF0IHNvbWUgcG9pbnQgd2Ugd2lsbCByZWFkIHRoZSBDUFUgCnRvcG9sb2d5IHRvIGltcHJvdmUg
c2NoZWR1bGluZy4gVGhpcyBoYXMgbm90IGJlZW4gZG9uZSBzbyBmYXIgYmVjYXVzZSAKdGhlcmUg
YXJlIG90aGVyIGltcG9ydGFudCBwYXJ0IHRvIGZvY3VzIGZpcnN0LgoKPiAKPiBTdGVmYW5vLCBK
dWxpZW4/CgpJIHRoaW5rIHRoZSBwYXRjaCBtYWtlcyBzZW5zZSBmb3IgQXJtIHRvbzoKCkFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQXQgdGhlIG1vbWVudCwg
Y3B1X3ByZXNlbnRfbWFwIGlzIGEgY29weSBvZiBjcHVfb25saW5lX21hcC4gSSB3b3VsZCAKZXhw
ZWN0IHRoaXMgdG8gY2hhbmdlIHdoZW4gaG90cGx1ZyB3aWxsIGJlIHN1cHBvcnRlZC4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
