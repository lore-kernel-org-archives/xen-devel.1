From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH MM-PART2 RESEND v2 07/19] xen/arm64: head:
 Remove unnecessary comment
Date: Mon, 20 May 2019 15:56:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905201533110.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSrCq-0005MG-3U
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 22:56:32 +0000
In-Reply-To: <20190514122456.28559-8-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNvIGZhciwgd2UgZG9u
J3QgaGF2ZSBzcGVjaWZpYyBjb3JlIGluaXRpYWxpemF0aW9uIGF0IGJvb3QuIFNvIHJlbW92ZQo+
IHRoZSBjb21tZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZA
ZXBhbS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIEZpeCB0eXBv
IGluIHRoZSBjb21taXQgbWVzc2FnZQo+ICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQt
YnkKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDIgLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gaW5kZXggY2IzMGQ2ZjIyZS4u
YWQ0NDZlNzM0NSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysr
IGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC0zNDQsOCArMzQ0LDYgQEAgZWwyOiAg
ICBQUklOVCgiLSBYZW4gc3RhcnRpbmcgYXQgRUwyIC1cclxuIikKPiAgc2tpcF9ic3M6Cj4gICAg
ICAgICAgUFJJTlQoIi0gU2V0dGluZyB1cCBjb250cm9sIHJlZ2lzdGVycyAtXHJcbiIpCj4gIAo+
IC0gICAgICAgIC8qIFhYWFggY2FsbCBQUk9DSU5GT19jcHVfaW5pdCBoZXJlICovCj4gLQo+ICAg
ICAgICAgIC8qIFNldCB1cCBtZW1vcnkgYXR0cmlidXRlIHR5cGUgdGFibGVzICovCj4gICAgICAg
ICAgbGRyICAgeDAsID1NQUlSVkFMCj4gICAgICAgICAgbXNyICAgbWFpcl9lbDIsIHgwCj4gLS0g
Cj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
