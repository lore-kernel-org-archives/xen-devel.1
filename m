From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH MM-PART2 RESEND v2 09/19] xen/arm64: head:
 Correctly report the HW CPU ID
Date: Mon, 20 May 2019 15:56:43 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905201553120.16404@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-10-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSrD3-0005QZ-9X
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 22:56:45 +0000
In-Reply-To: <20190514122456.28559-10-julien.grall@arm.com>
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZXJlIGFyZSBubyBy
ZWFzb24gdG8gY29uc2lkZXIgdGhlIEhXIENQVSBJRCB3aWxsIGJlIDAgd2hlbiB0aGUKPiBwcm9j
ZXNzb3IgaXMgcGFydCBvZiBhIHVuaXByb2Nlc3NvciBzeXN0ZW0uIEF0IGJlc3QsIHRoaXMgd2ls
bCByZXN1bHQgdG8KPiBjb25mbGljdGluZyBvdXRwdXQgYXMgdGhlIHJlc3Qgb2YgWGVuIHVzZSB0
aGUgdmFsdWUgZGlyZWN0bHkgcmVhZCBmcm9tCj4gTVBJRFJfRUwxLgo+IAo+IFNvIHJlbW92ZSB0
aGUgemVyb2luZyBhbmQgbG9naWMgdG8gY2hlY2sgaWYgdGhlIENQVSBpcyBwYXJ0IG9mIGEKPiB1
bmlwcm9jZXNzb3Igc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9h
bmlzb3ZAZXBhbS5jb20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAt
IEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVh
ZC5TIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4gaW5kZXggYjk1N2ViOTBmYi4uMDgwOTRhMjczZSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+
IEBAIC0yNzcsMTUgKzI3Nyw5IEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKPiAgICAgICAgICBt
b3YgICB4MjYsICMxICAgICAgICAgICAgICAgIC8qIFgyNiA6PSBza2lwX3plcm9fYnNzICovCj4g
IAo+ICBjb21tb25fc3RhcnQ6Cj4gLSAgICAgICAgbW92ICAgeDI0LCAjMCAgICAgICAgICAgICAg
ICAvKiB4MjQgOj0gQ1BVIElELiBJbml0aWFseSB6ZXJvIHVudGlsIHdlCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmaW5kIHRoYXQgbXVsdGlwcm9jZXNzb3IgZXh0
ZW5zaW9ucyBhcmUKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIHBy
ZXNlbnQgYW5kIHRoZSBzeXN0ZW0gaXMgU01QICAqLwo+ICAgICAgICAgIG1ycyAgIHgwLCBtcGlk
cl9lbDEKPiAtICAgICAgICB0Ym56ICB4MCwgX01QSURSX1VQLCAxZiAgICAgIC8qIFVuaXByb2Nl
c3NvciBzeXN0ZW0/ICovCj4gLQo+ICAgICAgICAgIGxkciAgIHgxMywgPSh+TVBJRFJfSFdJRF9N
QVNLKQo+ICAgICAgICAgIGJpYyAgIHgyNCwgeDAsIHgxMyAgICAgICAgICAgLyogTWFzayBvdXQg
ZmxhZ3MgdG8gZ2V0IENQVSBJRCAqLwo+IC0xOgo+ICAKPiAgICAgICAgICAvKiBOb24tYm9vdCBD
UFVzIHdhaXQgaGVyZSB1bnRpbCBfX2NwdV91cCBpcyByZWFkeSBmb3IgdGhlbSAqLwo+ICAgICAg
ICAgIGNieiAgIHgyMiwgMWYKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
