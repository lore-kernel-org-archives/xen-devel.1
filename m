From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v12 5/9] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Mon, 1 Oct 2018 11:25:50 +0100
Message-ID: <8deef051-c035-f4f1-de95-c7b316a0bf41@arm.com>
References: <20180927143333.17516-1-paul.durrant@citrix.com>
 <20180927143333.17516-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g6vOl-0004Hi-EU
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 10:25:55 +0000
In-Reply-To: <20180927143333.17516-6-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA5LzI3LzIwMTggMDM6MzMgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPiAu
Li5mb3Igc29tZSB1c2VzIG9mIGdldF9wYWdlX2Zyb21fZ2ZuKCkuCj4gCj4gVGhlcmUgYXJlIG1h
bnkgb2NjdXJyZW5jZXMgb2YgdGhlIGZvbGxvd2luZyBwYXR0ZXJuIGluIHRoZSBjb2RlOgo+IAo+
ICAgICAgcSA9IDxyZWFkb25seSBsb29rLXVwPiA/IFAyTV9BTExPQyA6IFAyTV9VTlNIQVJFOwo+
ICAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbiwgJnAybXQsIHEpOwo+IAo+ICAg
ICAgaWYgKCBwMm1faXNfcGFnaW5nKHAybXQpICkKPiAgICAgIHsKPiAgICAgICAgICBpZiAoIHBh
Z2UgKQo+ICAgICAgICAgICAgICBwdXRfcGFnZShwYWdlKTsKPiAKPiAgICAgICAgICBwMm1fbWVt
X3BhZ2luZ19wb3B1bGF0ZShkLCBnZm4pOwo+ICAgICAgICAgIHJldHVybiA8LUVBR0FJTiBvciBl
cXVpdmFsZW50PjsKPiAgICAgIH0KPiAKPiAgICAgIGlmICggKHEgJiBQMk1fVU5TSEFSRSkgJiYg
cDJtX2lzX3NoYXJlZChwMm10KSApCj4gICAgICB7Cj4gICAgICAgICAgaWYgKCBwYWdlICkKPiAg
ICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gCj4gICAgICAgICAgcmV0dXJuIDwtRUFHQUlO
IG9yIGVxdWl2YWxlbnQ+Owo+ICAgICAgfQo+IAo+ICAgICAgaWYgKCAhcGFnZSApCj4gICAgICAg
ICAgcmV0dXJuIDwtRUlOVkFMIG9yIGVxdWl2YWxlbnQ+Owo+IAo+IFRoZXJlIGFyZSBzb21lIHNt
YWxsIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIGV4YWN0IHdheSB0aGUgb2NjdXJyZW5jZXMKPiBh
cmUgY29kZWQgYnV0IHRoZSBkZXNpcmVkIHNlbWFudGljIGlzIHRoZSBzYW1lLgo+IAo+IFRoaXMg
cGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBjb21tb24gaW1wbGVtZW50YXRpb24gb2YgdGhpcyBjb2Rl
IGluCj4gY2hlY2tfZ2V0X3BhZ2VfZnJvbV9nZm4oKSBhbmQgdGhlbiBjb252ZXJ0cyB0aGUgdmFy
aW91cyBvcGVuLWNvZGVkIHBhdHRlcm5zCj4gaW50byBjYWxscyB0byB0aGlzIG5ldyBmdW5jdGlv
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXgu
Y29tPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4g
Q2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3Jn
ZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiBDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiAKPiB2MTE6Cj4gICAtIEZvcndhcmQgZGVjbGFyZSBwMm1fdHlwZV90IGlu
IHAybS1jb21tb24uaCB0byBhbGxvdyB0aGUgZHVwbGljYXRlCj4gICAgIGRlY2xhcmF0aW9ucyBv
ZiBjaGVja19nZXRfcGFnZV9mcm9tX2dmbigpIHRvIGJlIHJlbW92ZWQsIGFuZCBoZW5jZSBhZGQK
PiAgICAgSmFuJ3MgUi1iLgoKSSB0aGluayB0aGlzIHdvdWxkIGJlIHdvcnRoIGFkZGluZyBhIHdv
cmQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFib3V0IAp0aGUgZm9yd2FyZCBkZWNsYXJhdGlvbi4K
CkZvciB0aGUgQXJtIGJpdHM6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
