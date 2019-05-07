From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] mm: option to _always_ scrub freed
 domheap pages
Date: Tue, 7 May 2019 14:15:35 +0100
Message-ID: <c80dfae7-bb03-fe46-a51e-f3a552a2b327@citrix.com>
References: <20190507113405.71851-1-elnikety@amazon.com>
 <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eprW=TH=citrix.com=prvs=0232d1aa4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hNzwg-00041u-AI
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:15:46 +0000
In-Reply-To: <5CD175F5020000780022C7EF@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Amit Shah <aams@amazon.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS83LzE5IDE6MTEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA3LjA1LjE5IGF0
IDEzOjM0LCA8ZWxuaWtldHlAYW1hem9uLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jCj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+IEBAIC0yMTQs
NiArMjE0LDEwIEBAIGN1c3RvbV9wYXJhbSgiYm9vdHNjcnViIiwgcGFyc2VfYm9vdHNjcnViX3Bh
cmFtKTsKPj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9faW5pdGRhdGEgb3B0X2Jvb3RzY3J1Yl9j
aHVuayA9IE1CKDEyOCk7Cj4+ICBzaXplX3BhcmFtKCJib290c2NydWJfY2h1bmsiLCBvcHRfYm9v
dHNjcnViX2NodW5rKTsKPj4gIAo+PiArIC8qIHNjcnViLWRvbWhlYXAgLT4gRG9taGVhcCBwYWdl
cyBhcmUgc2NydWJiZWQgd2hlbiBmcmVlZCAqLwo+PiArc3RhdGljIGJvb2wgX19yZWFkX21vc3Rs
eSBvcHRfc2NydWJfZG9taGVhcDsKPj4gK2Jvb2xlYW5fcGFyYW0oInNjcnViLWRvbWhlYXAiLCBv
cHRfc2NydWJfZG9taGVhcCk7Cj4gCj4gVXBvbiAybmQgdGhvdWdodCB0aGlzLCBidHcsIHdvdWxk
IHNlZW0gdG8gYmUgYW4gZXhjZWxsZW50IGNhbmRpZGF0ZQo+IGZvciBiZWNvbWluZyBhIHJ1bnRp
bWUgcGFyYW1ldGVyLgo+IAo+PiBAQCAtMjM3OCw5ICsyMzgyLDEwIEBAIHZvaWQgZnJlZV9kb21o
ZWFwX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4+ICAg
ICAgICAgICAgICAvKgo+PiAgICAgICAgICAgICAgICogTm9ybWFsbHkgd2UgZXhwZWN0IGEgZG9t
YWluIHRvIGNsZWFyIHBhZ2VzIGJlZm9yZSBmcmVlaW5nIHRoZW0sCj4+ICAgICAgICAgICAgICAg
KiBpZiBpdCBjYXJlcyBhYm91dCB0aGUgc2VjcmVjeSBvZiB0aGVpciBjb250ZW50cy4gSG93ZXZl
ciwgYWZ0ZXIKPj4gLSAgICAgICAgICAgICAqIGEgZG9tYWluIGhhcyBkaWVkIHdlIGFzc3VtZSBy
ZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4KPj4gKyAgICAgICAgICAgICAqIGEgZG9tYWluIGhh
cyBkaWVkIHdlIGFzc3VtZSByZXNwb25zaWJpbGl0eSBmb3IgZXJhc3VyZS4gV2UgZG8KPj4gKyAg
ICAgICAgICAgICAqIHNjcnViIHJlZ2FyZGxlc3MgaWYgb3B0aW9uIHNjcnViX2RvbWhlYXAgaXMg
c2V0Lgo+PiAgICAgICAgICAgICAgICovCj4+IC0gICAgICAgICAgICBzY3J1YiA9IGQtPmlzX2R5
aW5nIHx8IHNjcnViX2RlYnVnOwo+PiArICAgICAgICAgICAgc2NydWIgPSBkLT5pc19keWluZyB8
fCBzY3J1Yl9kZWJ1ZyB8fCBvcHRfc2NydWJfZG9taGVhcDsKPiAKPiBEaWQgeW91IGNvbnNpZGVy
IHNldHRpbmcgb3B0X3NjcnViX2RvbWhlYXAgd2hlbiBzY3J1Yl9kZWJ1ZyBpcwo+IHNldD8gVGhp
cyB3b3VsZCBzaG9ydGVuIHRoZSAocnVudGltZSkgY2FsY3VsYXRpb24gaGVyZSBieSBhIHRpbnkg
Yml0LAo+IGF0IHRoZSBwcmljZSBvZiBkb2luZyBvbmUgbW9yZSB0aGluZyBvbmNlIHdoaWxlIGJv
b3RpbmcuCgpKdXN0IGZvciBjbGFyaWZpY2F0aW9uIEphbiAtLSBkaWQgeW91IG1lYW4sICJJJ20g
aGFwcHkgZm9yIHRoaXMgdG8gZ28gaW4KYXMgaXQgaXMsIGJ1dCBpZiB5b3UgZmVlbCBsaWtlIGl0
LCBoZXJlIGFyZSB0d28gaW1wcm92ZW1lbnRzIj8KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
