From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Thu, 19 Apr 2018 17:31:50 -0300
Message-ID: <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=govf=hi=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1f9GDl-00050K-VX
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 20:31:58 +0000
Received: by mail-qt0-x242.google.com with SMTP id s2-v6so7274379qti.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Apr 2018 13:31:56 -0700 (PDT)
In-Reply-To: <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair.francis@xilinx.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTkvMjAxOCAwMTo0NSBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gcGVycm9yKCkgaXMg
ZGVmaW5lZCB0byBmcHJpbnRmKHN0ZGVyciwuLi4pLiAgSEFDS0lORyBzYXlzCj4gZnByaW50Zihz
dGRlcnIsLi4uKSBpcyB3cm9uZy4gIFNvIHBlcnJvcigpIGlzIHRvby4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiBDQzogTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPgo+IENDOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhh
dC5jb20+Cj4gQ0M6IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRscy5tc2sucnU+Cj4gQ0M6IEFsaXN0
YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAeGlsaW54LmNvbT4KPiAtLS0KPiB2NzogTmV3
IHBhdGNoCj4gLS0tCj4gIG9zLXBvc2l4LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL29zLXBv
c2l4LmMgYi9vcy1wb3NpeC5jCj4gaW5kZXggZDRjZjQ2Ni4uMDEwODAyOCAxMDA2NDQKPiAtLS0g
YS9vcy1wb3NpeC5jCj4gKysrIGIvb3MtcG9zaXguYwo+IEBAIC0xMjUsNyArMTI1LDcgQEAgdm9p
ZCBvc19zZXRfcHJvY19uYW1lKGNvbnN0IGNoYXIgKnMpCj4gICAgICAvKiBDb3VsZCByZXdyaXRl
IGFyZ3ZbMF0gdG9vLCBidXQgdGhhdCdzIGEgYml0IG1vcmUgY29tcGxpY2F0ZWQuCj4gICAgICAg
ICBUaGlzIHNpbXBsZSB3YXkgaXMgZW5vdWdoIGZvciBgdG9wJy4gKi8KPiAgICAgIGlmIChwcmN0
bChQUl9TRVRfTkFNRSwgbmFtZSkpIHsKPiAtICAgICAgICBwZXJyb3IoInVuYWJsZSB0byBjaGFu
Z2UgcHJvY2VzcyBuYW1lIik7Cj4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJ1bmFibGUgdG8gY2hh
bmdlIHByb2Nlc3MgbmFtZTogJXMiLCBzdHJlcnJvcihlcnJubykpOwo+ICAgICAgICAgIGV4aXQo
MSk7Cj4gICAgICB9Cj4gICNlbHNlCj4gQEAgLTI0Nyw3ICsyNDcsNyBAQCBzdGF0aWMgdm9pZCBj
aGFuZ2Vfcm9vdCh2b2lkKQo+ICAgICAgICAgICAgICBleGl0KDEpOwo+ICAgICAgICAgIH0KPiAg
ICAgICAgICBpZiAoY2hkaXIoIi8iKSkgewo+IC0gICAgICAgICAgICBwZXJyb3IoIm5vdCBhYmxl
IHRvIGNoZGlyIHRvIC8iKTsKPiArICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJub3QgYWJsZSB0
byBjaGRpciB0byAvOiAlcyIsIHN0cmVycm9yKGVycm5vKSk7Cj4gICAgICAgICAgICAgIGV4aXQo
MSk7Cj4gICAgICAgICAgfQo+ICAgICAgfQo+IEBAIC0zMDksNyArMzA5LDcgQEAgdm9pZCBvc19z
ZXR1cF9wb3N0KHZvaWQpCj4gIAo+ICAgICAgaWYgKGRhZW1vbml6ZSkgewo+ICAgICAgICAgIGlm
IChjaGRpcigiLyIpKSB7Cj4gLSAgICAgICAgICAgIHBlcnJvcigibm90IGFibGUgdG8gY2hkaXIg
dG8gLyIpOwo+ICsgICAgICAgICAgICBlcnJvcl9yZXBvcnQoIm5vdCBhYmxlIHRvIGNoZGlyIHRv
IC86ICVzIiwgc3RyZXJyb3IoZXJybm8pKTsKPiAgICAgICAgICAgICAgZXhpdCgxKTsKPiAgICAg
ICAgICB9Cj4gICAgICAgICAgVEZSKGZkID0gcWVtdV9vcGVuKCIvZGV2L251bGwiLCBPX1JEV1Ip
KTsKPiBAQCAtMzgzLDcgKzM4Myw3IEBAIGludCBvc19tbG9jayh2b2lkKQo+ICAKPiAgICAgIHJl
dCA9IG1sb2NrYWxsKE1DTF9DVVJSRU5UIHwgTUNMX0ZVVFVSRSk7Cj4gICAgICBpZiAocmV0IDwg
MCkgewo+IC0gICAgICAgIHBlcnJvcigibWxvY2thbGwiKTsKPiArICAgICAgICBlcnJvcl9yZXBv
cnQoIm1sb2NrYWxsOiAlcyIsIHN0cmVycm9yKGVycm5vKSk7Cj4gICAgICB9Cj4gIAo+ICAgICAg
cmV0dXJuIHJldDsKClRoaW5raW5nIGxvdWRseSwgbWF5YmUgd2UgY2FuIHJlZmFjdG9yIGFzIGVy
cm9yX3JlcG9ydF9lcnJubyhjb25zdCBjaGFyCipkZXNjKS4uLgoKQW55d2F5OgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
