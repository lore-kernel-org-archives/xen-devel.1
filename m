From: Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 14/16] os-posix: cleanup:
 Replace fprintf with error_report in remaining call sites
Date: Wed, 25 Apr 2018 06:03:41 +0200
Message-ID: <325c0444-c372-5436-a756-0f6ad97bdf7f@redhat.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524592709-6553-15-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eao0=ho=redhat.com=thuth@srs-us1.protection.inumbo.net>)
 id 1fBBep-0003Hg-NV
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 04:03:51 +0000
In-Reply-To: <1524592709-6553-15-git-send-email-ian.jackson@eu.citrix.com>
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

T24gMjQuMDQuMjAxOCAxOTo1OCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gQ0M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVA
cmVkaGF0LmNvbT4KPiBDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5nZUByZWRoYXQuY29t
Pgo+IENDOiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1Pgo+IFJldmlld2VkLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgo+IC0tLQo+IHY4OiBSZW1v
dmUgb25lIHJlbWFpbmluZyBzcHVyaW91cyAiXG4iCj4gdjc6IE5ldyBwYXRjaAo+IC0tLQo+ICBv
cy1wb3NpeC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3NpeC5jCj4g
aW5kZXggMGY1OTU2Ni4uYTJiYTUwZCAxMDA2NDQKPiAtLS0gYS9vcy1wb3NpeC5jCj4gKysrIGIv
b3MtcG9zaXguYwo+IEBAIC0xMjksNyArMTI5LDcgQEAgdm9pZCBvc19zZXRfcHJvY19uYW1lKGNv
bnN0IGNoYXIgKnMpCj4gICAgICAgICAgZXhpdCgxKTsKPiAgICAgIH0KPiAgI2Vsc2UKPiAtICAg
IGZwcmludGYoc3RkZXJyLCAiQ2hhbmdlIG9mIHByb2Nlc3MgbmFtZSBub3Qgc3VwcG9ydGVkIGJ5
IHlvdXIgT1NcbiIpOwo+ICsgICAgZXJyb3JfcmVwb3J0KCJDaGFuZ2Ugb2YgcHJvY2VzcyBuYW1l
IG5vdCBzdXBwb3J0ZWQgYnkgeW91ciBPUyIpOwo+ICAgICAgZXhpdCgxKTsKPiAgI2VuZGlmCj4g
IH0KPiBAQCAtMjQzLDcgKzI0Myw3IEBAIHN0YXRpYyB2b2lkIGNoYW5nZV9yb290KHZvaWQpCj4g
IHsKPiAgICAgIGlmIChjaHJvb3RfZGlyKSB7Cj4gICAgICAgICAgaWYgKGNocm9vdChjaHJvb3Rf
ZGlyKSA8IDApIHsKPiAtICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJjaHJvb3QgZmFpbGVk
XG4iKTsKPiArICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJjaHJvb3QgZmFpbGVkIik7Cj4gICAg
ICAgICAgICAgIGV4aXQoMSk7Cj4gICAgICAgICAgfQo+ICAgICAgICAgIGlmIChjaGRpcigiLyIp
KSB7Cj4gCgpNYXliZSBtZXJnZSB0aGlzIHdpdGggcGF0Y2ggOS8xNj8KCkFueXdheToKClJldmll
d2VkLWJ5OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
