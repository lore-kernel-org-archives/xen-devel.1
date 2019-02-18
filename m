From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V2 2/3] xen/arm: Clarify usage of
 earlyprintk for Lager board
Date: Mon, 18 Feb 2019 14:01:21 +0000
Message-ID: <85a439a7-9a64-602b-77b7-cd00e9f27be7@arm.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
 <1549024652-24805-3-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BVaE=QZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gvjUH-00089T-1k
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 14:01:37 +0000
In-Reply-To: <1549024652-24805-3-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMS8wMi8yMDE5IDEyOjM3LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPiBG
cm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
Cj4gCj4gQ3VycmVudCBzZW50ZW5jZSBpcyBub3QgZW50aXJlbHkgY29ycmVjdC4gU2luY2UgU0NJ
RjAgaW50ZXJmYWNlIGlzCj4gYXBwbGljYWJsZSBmb3IgTGFnZXIgYm9hcmQsIGJ1dCBpcyBub3Qg
YXBwbGljYWJsZSBmb3IgYWxsIFItQ2FyIEgyCj4gYmFzZWQgYm9hcmRzLiBGb3IgZXhhbXBsZSwg
U3RvdXQgYm9hcmQgdXNlcyBTQ0lGQTAgaW50ZXJmYWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KCkFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiAtLS0KPiAgIGRvY3Mv
bWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJt
L2Vhcmx5LXByaW50ay50eHQgYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQKPiBpbmRl
eCBmNzY1ZjU5Li5iMjNjNTRmIDEwMDY0NAo+IC0tLSBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJp
bnRrLnR4dAo+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAo+IEBAIC0zOSw3
ICszOSw3IEBAIHRoZSBuYW1lIG9mIHRoZSBtYWNoaW5lOgo+ICAgICAtIGZhc3Rtb2RlbDogcHJp
bnRrIG9uIEFSTSBGYXN0bW9kZWwgc29mdHdhcmUgZW11bGF0b3JzCj4gICAgIC0gaGlrZXk5NjA6
IHByaW50ayB3aXRoIHBsMDExIHdpdGggSGlrZXkgOTYwCj4gICAgIC0ganVubzogcHJpbnRrIHdp
dGggcGwwMTEgb24gSnVubyBwbGF0Zm9ybQo+IC0gIC0gbGFnZXI6IHByaW50ayB3aXRoIFNDSUYw
IG9uIFJlbmVzYXMgUi1DYXIgSDIgcHJvY2Vzc29ycwo+ICsgIC0gbGFnZXI6IHByaW50ayB3aXRo
IFNDSUYwIG9uIFJlbmVzYXMgTGFnZXIgYm9hcmQgKFItQ2FyIEgyIHByb2Nlc3NvcikKPiAgICAg
LSBtaWR3YXk6IHByaW50ayB3aXRoIHRoZSBwbDAxMSBvbiBDYWx4ZWRhIE1pZHdheSBwcm9jZXNz
b3JzCj4gICAgIC0gbXZlYnU6IHByaW50ayB3aXRoIHRoZSBNVkVCVSBmb3IgTWFydmVsbCBBcm1h
ZGEgMzcwMCBTb0NzCj4gICAgIC0gb21hcDU0MzI6IHByaW50ayB3aXRoIFVBUlQzIG9uIFRJIE9N
QVA1NDMyIHByb2Nlc3NvcnMKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
