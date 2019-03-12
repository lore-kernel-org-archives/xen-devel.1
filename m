From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/7] common: avoid atomic read-modify-write
 accesses in map_vcpu_info()
Date: Tue, 12 Mar 2019 10:15:16 +0000
Message-ID: <b36d670d-fe2c-b701-6a28-f58fc75f2ba2@arm.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C86916A020000780021D5F4@prv1-mh.provo.novell.com>
 <ff56f677-a300-a769-a021-b36192d47c3a@citrix.com>
 <d1c5d13d-90b3-94fd-5a8f-dc80f4ae4a56@arm.com>
 <5C877C1D020000780021D92C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=05AI=RP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h3eRP-0002Uy-5T
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 10:15:23 +0000
In-Reply-To: <5C877C1D020000780021D92C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMy8xMi8xOSA5OjMwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAx
MS4wMy4xOSBhdCAxODo1MywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gSGksCj4+
Cj4+IE9uIDExLzAzLzIwMTkgMTY6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAxMS8w
My8yMDE5IDE2OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBUaGVyZSdzIG5vIG5lZWQgdG8g
c2V0IHRoZSBldnRjaG5fcGVuZGluZ19zZWwgYml0cyBvbmUgYnkgb25lLiBTaW1wbHkKPj4+PiB3
cml0ZSBmdWxsIHdvcmRzIHdpdGggYWxsIG9uZXMuCj4+Pj4KPj4+PiBGb3IgQXJtIHRoaXMgcmVx
dWlyZXMgZXh0ZW5kaW5nIHdyaXRlX2F0b21pYygpIHRvIGFsc28gaGFuZGxlIDY0LWJpdAo+Pj4+
IHZhbHVlczsgZm9yIHN5bW1ldHJ5IHJlYWRfYXRvbWljKCkgZ2V0cyBhZGp1c3RlZCBhcyB3ZWxs
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+Pj4KPj4+IChJJ2xsIGxlYXZlIHRoZSBBUk0gYXNzZW1ibHkgdG8gSnVsaWVuIHRv
IGNoZWNrIG92ZXIpCj4+Cj4+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+Pgo+PiBJIGNhbiBxdWV1ZSB0aGlzIHNlcmllcyBpbiBteSBuZXh0IGJyYW5j
aCBvbmNlIGl0IGlzIGZ1bGx5IGFja2VkLgo+IAo+IEkgd2FzIG1lYW5pbmcgdG8gYXBwbHkgcmln
aHQgYXdheSB3aGF0ZXZlciBpbml0aWFsIHBhcnRzIG9mIGl0IGFyZQo+IGZ1bGx5IGFja2VkLCBh
cyB0aGlzIGlzbid0IGEgbWFqb3IgY2hhbmdlLCBhbmQgaXQgZG9lc24ndCBoYXZlIGEKPiBzaWdu
aWZpY2FudCByaXNrIG9mIGNvbmZsaWN0cyB3aXRoIHBvdGVudGlhbCBsYXN0IG1pbnV0ZSBjaGFu
Z2VzIGZvcgo+IDQuMTIuCgpUaGlzIHdvcmtzIGZvciBtZS4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
