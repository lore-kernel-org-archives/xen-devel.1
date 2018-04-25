From: Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 09/16] os-posix: cleanup:
 Replace fprintfs with error_report in change_process_uid
Date: Wed, 25 Apr 2018 06:05:12 +0200
Message-ID: <fd03c116-d700-0466-d4c6-8054105604e1@redhat.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-10-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eao0=ho=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1fBBgC-0003N2-R1
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 04:05:16 +0000
In-Reply-To: <1524592709-6553-10-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQuMDQuMjAxOCAxOTo1OCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSSdtIGdvaW5nIHRvIGJl
IGVkaXRpbmcgdGhpcyBmdW5jdGlvbiBhbmQgaXQgbWFrZXMgc2Vuc2UgdG8gY2xlYW4gdXAKPiB0
aGlzIHN0eWxlIHByb2JsZW0gaW4gYWR2YW5jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogUGFvbG8gQm9uemluaSA8cGJv
bnppbmlAcmVkaGF0LmNvbT4KPiBDQzogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQu
Y29tPgo+IENDOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+Cj4gQ0M6
IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRscy5tc2sucnU+Cj4gLS0tCj4gIG9zLXBvc2l4LmMgfCAx
MCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3NpeC5jCj4gaW5kZXgg
YjljMjM0My4uNTYwZGI5NSAxMDA2NDQKPiAtLS0gYS9vcy1wb3NpeC5jCj4gKysrIGIvb3MtcG9z
aXguYwo+IEBAIC0xNjcsMjAgKzE2NywyMCBAQCBzdGF0aWMgdm9pZCBjaGFuZ2VfcHJvY2Vzc191
aWQodm9pZCkKPiAgewo+ICAgICAgaWYgKHVzZXJfcHdkKSB7Cj4gICAgICAgICAgaWYgKHNldGdp
ZCh1c2VyX3B3ZC0+cHdfZ2lkKSA8IDApIHsKPiAtICAgICAgICAgICAgZnByaW50ZihzdGRlcnIs
ICJGYWlsZWQgdG8gc2V0Z2lkKCVkKVxuIiwgdXNlcl9wd2QtPnB3X2dpZCk7Cj4gKyAgICAgICAg
ICAgIGVycm9yX3JlcG9ydCgiRmFpbGVkIHRvIHNldGdpZCglZCkiLCB1c2VyX3B3ZC0+cHdfZ2lk
KTsKPiAgICAgICAgICAgICAgZXhpdCgxKTsKPiAgICAgICAgICB9Cj4gICAgICAgICAgaWYgKGlu
aXRncm91cHModXNlcl9wd2QtPnB3X25hbWUsIHVzZXJfcHdkLT5wd19naWQpIDwgMCkgewo+IC0g
ICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0byBpbml0Z3JvdXBzKFwiJXNcIiwg
JWQpXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgIHVzZXJfcHdkLT5wd19uYW1lLCB1c2VyX3B3
ZC0+cHdfZ2lkKTsKPiArICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJGYWlsZWQgdG8gaW5pdGdy
b3VwcyhcIiVzXCIsICVkKSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB1c2VyX3B3ZC0+
cHdfbmFtZSwgdXNlcl9wd2QtPnB3X2dpZCk7Cj4gICAgICAgICAgICAgIGV4aXQoMSk7Cj4gICAg
ICAgICAgfQo+ICAgICAgICAgIGlmIChzZXR1aWQodXNlcl9wd2QtPnB3X3VpZCkgPCAwKSB7Cj4g
LSAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIHNldHVpZCglZClcbiIsIHVz
ZXJfcHdkLT5wd191aWQpOwo+ICsgICAgICAgICAgICBlcnJvcl9yZXBvcnQoIkZhaWxlZCB0byBz
ZXR1aWQoJWQpIiwgdXNlcl9wd2QtPnB3X3VpZCk7Cj4gICAgICAgICAgICAgIGV4aXQoMSk7Cj4g
ICAgICAgICAgfQo+ICAgICAgICAgIGlmIChzZXR1aWQoMCkgIT0gLTEpIHsKPiAtICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICJEcm9wcGluZyBwcml2aWxlZ2VzIGZhaWxlZFxuIik7Cj4gKyAg
ICAgICAgICAgIGVycm9yX3JlcG9ydCgiRHJvcHBpbmcgcHJpdmlsZWdlcyBmYWlsZWQiKTsKPiAg
ICAgICAgICAgICAgZXhpdCgxKTsKPiAgICAgICAgICB9Cj4gICAgICB9Cj4gCgpSZXZpZXdlZC1i
eTogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
