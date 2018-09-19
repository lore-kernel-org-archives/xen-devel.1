From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v11 5/7] memory: add
 check_get_page_from_gfn() as a wrapper...
Date: Wed, 19 Sep 2018 17:21:50 +0100
Message-ID: <20180919162150.5z7sjvcd7dub2h4e@zion.uk.xensource.com>
References: <20180919083602.8201-1-paul.durrant@citrix.com>
 <20180919083602.8201-6-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fEh-0005ak-C5
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:21:55 +0000
Content-Disposition: inline
In-Reply-To: <20180919083602.8201-6-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDk6MzY6MDBBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmZvciBzb21lIHVzZXMgb2YgZ2V0X3BhZ2VfZnJvbV9nZm4oKS4KPiAKPiBUaGVy
ZSBhcmUgbWFueSBvY2N1cnJlbmNlcyBvZiB0aGUgZm9sbG93aW5nIHBhdHRlcm4gaW4gdGhlIGNv
ZGU6Cj4gCj4gICAgIHEgPSA8cmVhZG9ubHkgbG9vay11cD4gPyBQMk1fQUxMT0MgOiBQMk1fVU5T
SEFSRTsKPiAgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbiwgJnAybXQsIHEpOwo+
IAo+ICAgICBpZiAoIHAybV9pc19wYWdpbmcocDJtdCkgKQo+ICAgICB7Cj4gICAgICAgICBpZiAo
IHBhZ2UgKQo+ICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwo+IAo+ICAgICAgICAgcDJtX21l
bV9wYWdpbmdfcG9wdWxhdGUoZCwgZ2ZuKTsKPiAgICAgICAgIHJldHVybiA8LUVBR0FJTiBvciBl
cXVpdmFsZW50PjsKPiAgICAgfQo+IAo+ICAgICBpZiAoIChxICYgUDJNX1VOU0hBUkUpICYmIHAy
bV9pc19zaGFyZWQocDJtdCkgKQo+ICAgICB7Cj4gICAgICAgICBpZiAoIHBhZ2UgKQo+ICAgICAg
ICAgICAgIHB1dF9wYWdlKHBhZ2UpOwo+IAo+ICAgICAgICAgcmV0dXJuIDwtRUFHQUlOIG9yIGVx
dWl2YWxlbnQ+Owo+ICAgICB9Cj4gCj4gICAgIGlmICggIXBhZ2UgKQo+ICAgICAgICAgcmV0dXJu
IDwtRUlOVkFMIG9yIGVxdWl2YWxlbnQ+Owo+IAo+IFRoZXJlIGFyZSBzb21lIHNtYWxsIGRpZmZl
cmVuY2VzIGJldHdlZW4gdGhlIGV4YWN0IHdheSB0aGUgb2NjdXJyZW5jZXMKPiBhcmUgY29kZWQg
YnV0IHRoZSBkZXNpcmVkIHNlbWFudGljIGlzIHRoZSBzYW1lLgo+IAo+IFRoaXMgcGF0Y2ggaW50
cm9kdWNlcyBhIG5ldyBjb21tb24gaW1wbGVtZW50YXRpb24gb2YgdGhpcyBjb2RlIGluCj4gY2hl
Y2tfZ2V0X3BhZ2VfZnJvbV9nZm4oKSBhbmQgdGhlbiBjb252ZXJ0cyB0aGUgdmFyaW91cyBvcGVu
LWNvZGVkIHBhdHRlcm5zCj4gaW50byBjYWxscyB0byB0aGlzIG5ldyBmdW5jdGlvbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
