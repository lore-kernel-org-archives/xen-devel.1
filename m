From: Ronan Abhamon <ronan.abhamon@vates.fr>
Subject: Re: [PATCH] tools/xentop: Display '-' when stats are
 not available.
Date: Fri, 22 Feb 2019 10:47:25 +0000
Message-ID: <25c9acd3-700c-dcc5-74ac-5c7e4d0fa576@vates.fr>
References: <20190220161922.14232-1-ronan.abhamon@vates.fr>
 <20190221153244.clfytovhcsdt7c7i@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=69Q2=Q5=bounce.vates.fr=bounce-md_30504962.5c6fd33d.v1-4bbe6ed2158b42e3bd8fea37d9ad46a6@srs-us1.protection.inumbo.net>)
 id 1gx8Ma-0007Hp-5N
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 10:47:28 +0000
Received: from pmta08.mandrill.prod.suw01.rsglab.com (127.0.0.1) by
 mail11.wdc04.mandrillapp.com id hdv9jq1jvmg8 for
 <xen-devel@lists.xenproject.org>;
 Fri, 22 Feb 2019 10:47:25 +0000 (envelope-from
 <bounce-md_30504962.5c6fd33d.v1-4bbe6ed2158b42e3bd8fea37d9ad46a6@bounce.vates.fr>)
In-Reply-To: <20190221153244.clfytovhcsdt7c7i@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Pritha Srivastava <pritha.srivastava@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

TGUgMjEvMDIvMjAxOSDDoCAxNjozMiwgV2VpIExpdSBhIMOpY3JpdMKgOgoKPiBPbiBXZWQsIEZl
YiAyMCwgMjAxOSBhdCAwNDoxOToyNVBNICswMDAwLCBSb25hbiBBYmhhbW9uIHdyb3RlOgo+PiBG
cm9tOiBQcml0aGEgU3JpdmFzdGF2YSA8cHJpdGhhLnNyaXZhc3RhdmFAY2l0cml4LmNvbT4KPj4K
Pj4gRGlzcGxheWluZyAwIGlzIG1pc2xlYWRpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFByaXRo
YSBTcml2YXN0YXZhIDxwcml0aGEuc3JpdmFzdGF2YUBjaXRyaXguY29tPgo+PiBTaWduZWQtb2Zm
LWJ5OiBSb25hbiBBYmhhbW9uIDxyb25hbi5hYmhhbW9uQHZhdGVzLmZyPgo+PiAtLS0KPj4gICB0
b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvc3JjL3hlbnN0YXQuYyAgICAgICB8ICAgNiArCj4+ICAg
dG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L3NyYy94ZW5zdGF0LmggICAgICAgfCAgIDMgKwo+PiAg
IHRvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdF9saW51eC5jIHwgIDQ3ICsrKy0t
LQo+PiAgIHRvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdF9wcml2LmggIHwgICAx
ICsKPj4gICB0b29scy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYyAgICAgICAgICAgICAgICB8IDE1
OSArKysrKysrKysrKysrKystLS0tCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9u
cygrKSwgNTggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdGF0L2xp
YnhlbnN0YXQvc3JjL3hlbnN0YXQuYyBiL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVu
c3RhdC5jCj4+IGluZGV4IGZiZTQ0ZjNjNTYuLjhmYTEyZDdiYzAgMTAwNjQ0Cj4+IC0tLSBhL3Rv
b2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdC5jCj4+ICsrKyBiL3Rvb2xzL3hlbnN0
YXQvbGlieGVuc3RhdC9zcmMveGVuc3RhdC5jCj4+IEBAIC03MjksNiArNzI5LDEyIEBAIHVuc2ln
bmVkIGxvbmcgbG9uZyB4ZW5zdGF0X3ZiZF93cl9zZWN0cyh4ZW5zdGF0X3ZiZCAqIHZiZCkKPj4g
ICAJcmV0dXJuIHZiZC0+d3Jfc2VjdHM7Cj4+ICAgfQo+PiAgIAo+PiArLyogUmV0dXJucyBlcnJv
ciB3aGlsZSBnZXR0aW5nIHN0YXRzICgxIGlmIGVycm9yIGhhcHBlbmVkLCAwIG90aGVyd2lzZSkg
Ki8KPj4gK3Vuc2lnbmVkIGludCB4ZW5zdGF0X3ZiZF9lcnJvcih4ZW5zdGF0X3ZiZCAqIHZiZCkK
Pj4gK3sKPj4gKwlyZXR1cm4gdmJkLT5lcnJvcjsKPj4gK30KPj4gKwo+IFlvdSBjYW4gZG8gYXdh
eSB3aXRoIHRoaXMgZnVuY3Rpb24gYnkgYWNjZXNzaW5nIHZiZC0+ZXJyb3IgZGlyZWN0bHkgaW4K
PiBjb2RlLgoKVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLCBidXQgeGVuc3RhdF92YmQgaXMg
YSBwcml2YXRlIHN0cnVjdCBvZiAKbGlieGVuc3RhdC4KCkNvcnJlY3QgbWUgaWYgSSBhbSB3cm9u
ZyBidXQgSSBjYW4ndCBpbmNsdWRlIHRoaXMgZmlsZSBpbiB0aGUgeGVudG9wIApmb2xkZXIuCgoK
Um9uYW4gQWJoYW1vbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
