From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v2 02/14] x86/cpu/mtrr: Add Hygon Dhyana
 support to get TOP_MEM2
Date: Mon, 18 Mar 2019 23:51:47 +0800
Message-ID: <76c47fa2-5cc9-ff62-aa69-8e4d88ca3795@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
 <def8c70bb26f9d5bc92e29f2ef182a87fbccb408.1550647742.git.puwen@hygon.cn>
 <5C8B9D0D020000780021F419@prv1-mh.provo.novell.com>
 <7edd53a4-99c6-ff6e-15e5-a88ff5d5efb8@hygon.cn>
 <5C8F5D69020000780021FB8B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E9mx=RV=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h5ud8-0006a8-JL
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 15:56:50 +0000
In-Reply-To: <5C8F5D69020000780021FB8B@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8zLzE4IDE2OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNi4wMy4xOSBh
dCAxMTowNiwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gT24gMjAxOS8zLzE1IDIwOjQwLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDIxLjAyLjE5IGF0IDEwOjQ4LCA8cHV3ZW5AaHln
b24uY24+IHdyb3RlOgo+Pj4+IFRoZSBIeWdvbiBEaHlhbmEgQ1BVIHN1cHBvcnRzIHRoZSBNU1Ig
d2F5IHRvIGdldCBUT1BfTUVNMi4gU28gYWRkIEh5Z29uCj4+Pj4gRGh5YW5hIHN1cHBvcnQgdG8g
cHJpbnQgdGhlIHZhbHVlIG9mIFRPUF9NRU0yLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUHUg
V2VuIDxwdXdlbkBoeWdvbi5jbj4KPj4+Cj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+Pj4KPj4+IEknbSBhZnJhaWQgSSB3b24ndCBiZSBhYmxlIHRvIG9mZmVy
IFJldmlld2VkLWJ5IHRhZ3MgZm9yIGFueSBvZgo+Pj4gdGhpcyBzZXJpZXMgd2l0aG91dCB5b3Ug
cG9pbnRpbmcgdXMgYXQgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZQo+Pj4gcHJvY2Vzc29yIChh
IGxpbmsgc2hvdWxkIHJlYWxseSBiZSBpbiB0aGUgY292ZXIgbGV0dGVyKS4KPj4KPj4gRG8geW91
IG1lYW4gdGhlIHNwZWNpZmljYXRpb24gZm9yIEh5Z29uIHByb2Nlc3Nvcj8gV2UgZG9uJ3QgaGF2
ZSBhbnkKPj4gcHVibGljIHNwZWMgbm93LCBidXQgeW91IGNhbiByZWZlcmVuY2UgdG8gdGhlIEFN
RCBaZW4gb25lWzFdLgo+IAo+IFdlbGwsIG5vLCBub3QgcmVhbGx5LiBUaGVyZSBhcmUgdW5kb3Vi
dGVkbHkgZGlmZmVyZW5jZXMgKHNlZSB5b3VyCj4gcmVwbHkgdG8gbXkgcGNpX2NmZ19vaygpIHF1
ZXN0aW9uIGFzIGFuIGV4YW1wbGUpLiBJIGNhbiBhY2sKPiBjaGFuZ2VzIG9uIHRoZSBiYXNpcyB0
aGF0IHlvdSBrbm93IGhvdyB5b3VyIHByb2Nlc3NvcnMgYmVoYXZlLgo+IEkgY2FuIGdpdmUgUi1i
IG9ubHkgaWYgSSBoYXZlIEh5Z29uLXNwZWNpZmljIGRvYyB0byBjaGVjayBhZ2FpbnN0LgoKSW4g
ZmFjdCB0aGVyZSBpcyBubyBkZWZpbml0aW9uIG9mIE1TUiBDMDAxXzAwMUYoTVNSX0FNRDY0X05C
X0NGRykgaW4gdGhlCkFNRCBmYW1pbHkgMTdoIG1vZGVscyAwMGgtMEZoIFBQUiwgSSBkb24ndCBr
bm93IHdoeSB0aGVyZSBpcyAweDE3IHN1cHBvcnQKaW4gcGNpX2NmZ19vaygpLgoKQmVzaWRlcywg
dGhlIG90aGVyIE1TUnMgYW5kIENQVUlEcyB3aGljaCBhcmUgdXNlZCBieSBIeWdvbiBpbiB0aGlz
IHBhdGNoCnNlcmllcyBhcmUgYWxsIGRlZmluZWQgaW4gdGhpcyBQUFIsIGFuZCB0aGUgbWVhbmlu
Z3MgYXJlIGZ1bGx5IHRoZSBzYW1lLgpGb3IgZXhhbXBsZSBpbiBjdXJyZW50IHBhdGNoLCBiaXQg
MjEgb2YgTVNSIEMwMDFfMDAxMChNU1JfSzhfVE9QX01FTTIpCmluIHByaW50X210cnJfc3RhdGUo
KS4KCi0tIApSZWdhcmRzLApQdSBXZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
