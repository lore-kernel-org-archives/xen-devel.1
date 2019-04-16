From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: kernel: Remove Dom prefix when
 using %pd format
Date: Tue, 16 Apr 2019 14:09:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904161409220.1370@sstabellini-ThinkPad-X260>
References: <20190319232343.24371-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VklA=SS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGVKc-0002vk-7b
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 21:09:30 +0000
In-Reply-To: <20190319232343.24371-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxOSBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmb3JtYXQgJXBk
IHdpbGwgYWxyZWFkeSBwcmVmaXggdGhlIGRvbWFpbiBJRCB3aXRoICdkJy4gU28gYXZvaWQgdG8K
PiBwcmVmaXggd2l0aCAnRG9tJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9rZXJuZWwuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9rZXJuZWwuYyBiL3hlbi9hcmNoL2FybS9rZXJuZWwuYwo+
IGluZGV4IGQwNGE4NjJmOTkuLmUzZmZkYjJmYTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJt
L2tlcm5lbC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2tlcm5lbC5jCj4gQEAgLTQ4NCw3ICs0ODQs
NyBAQCBpbnQgX19pbml0IGtlcm5lbF9wcm9iZShzdHJ1Y3Qga2VybmVsX2luZm8gKmluZm8sCj4g
ICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gICAgICB9Cj4gIAo+IC0gICAgcHJpbnRrKCJMb2Fk
aW5nIERvbSVwZCBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAICUiUFJJcGFkZHIiXG4iLAo+ICsg
ICAgcHJpbnRrKCJMb2FkaW5nICVwZCBrZXJuZWwgZnJvbSBib290IG1vZHVsZSBAICUiUFJJcGFk
ZHIiXG4iLAo+ICAgICAgICAgICAgIGluZm8tPmQsIGluZm8tPmtlcm5lbF9ib290bW9kdWxlLT5z
dGFydCk7Cj4gICAgICBpZiAoIGluZm8tPmluaXRyZF9ib290bW9kdWxlICkKPiAgICAgICAgICBw
cmludGsoIkxvYWRpbmcgcmFtZGlzayBmcm9tIGJvb3QgbW9kdWxlIEAgJSJQUklwYWRkciJcbiIs
Cj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
