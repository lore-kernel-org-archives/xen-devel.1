From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 01/57] tools: ARM: vGICv3: Avoid inserting
 optional DT properties
Date: Tue, 6 Mar 2018 11:16:26 +0000
Message-ID: <1c68bcb3-7ec7-5266-c5e4-93b8e65bbc0d@arm.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-2-andre.przywara@linaro.org>
 <c1084fea-836d-c0d9-edbf-4be72dec3b54@arm.com>
 <20180305171802.nnbxiogt7pgbcisg@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lh2b=f4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etAa7-0006QM-Hu
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 11:16:31 +0000
In-Reply-To: <20180305171802.nnbxiogt7pgbcisg@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8wMy8xOCAxNzoxOCwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIE1hciAwNSwgMjAx
OCBhdCAwNDozOTowOVBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+ICgrIHRvb2xzIG1h
aW50YWluZXJzKQo+Pgo+PiBIaSBBbmRyZSwKPj4KPj4gUGxlYXNlIGRvbid0IGZvcmdldCB0byBD
QyB0aGUgcmVsZXZhbnQgbWFpbnRhaW5lcnMuCj4+Cj4+IE9uIDA1LzAzLzE4IDE2OjAzLCBBbmRy
ZSBQcnp5d2FyYSB3cm90ZToKPj4+IFdoZW4gY3JlYXRpbmcgYSBHSUN2MyBkZXZpY2V0cmVlIG5v
ZGUsIHdlIGN1cnJlbnRseSBpbnNlcnQgdGhlCj4+PiByZWRpc3RyaWJ1dG9yLXN0cmlkZSBhbmQg
I3JlZGlzdHJpYnV0b3ItcmVnaW9ucyBwcm9wZXJ0aWVzLCB3aXRoIGZpeGVkCj4+PiB2YWx1ZXMg
d2hpY2ggYXJlIGFjdHVhbGx5IHRoZSBhcmNoaXRlY3RlZCBvbmVzLiBTaW5jZSB0aG9zZSBwcm9w
ZXJ0aWVzIGFyZQo+Pj4gb3B0aW9uYWwsIGFuZCBpbiB0aGUgY2FzZSBvZiB0aGUgc3RyaWRlIG9u
bHkgbmVlZGVkIHRvIGNvdmVyIGZvciBicm9rZW4KPj4+IHBsYXRmb3Jtcywgd2UgZG9uJ3QgbmVl
ZCB0byBkZXNjcmliZSB0aGVtIGlmIHRoZXkgZG9uJ3QgZGlmZmVyIGZyb20gdGhlCj4+PiBkZWZh
dWx0IHZhbHVlcy4gVGhpcyB3aWxsIGFsd2F5cyBiZSB0aGUgY2FzZSBmb3Igb3VyIGNvbnN0cnVj
dGVkCj4+PiBEb21VIG1lbW9yeSBtYXAuCj4+PiBTbyB3ZSBkcm9wIHRob3NlIHByb3BlcnRpZXMg
YWx0b2dldGhlciBhbmQgcHJvdmlkZSBhIGNsZWFuIGFuZCBhcmNoaXRlY3RlZAo+Pj4gR0lDdjMg
RFQgbm9kZSBmb3IgRG9tVXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEg
PGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+Cj4+Cj4+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pgo+IAo+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+IAo+IEp1bGllbiBwbGVhc2UgY29tbWl0IHRoaXMgeW91cnNlbGYu
CgpEb25lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
