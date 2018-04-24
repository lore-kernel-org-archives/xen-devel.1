From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Tue, 24 Apr 2018 18:20:38 +0200
Message-ID: <87po2obmp5.fsf@dusky.pond.sub.org>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hbuf=hn=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1fB0gN-00059q-LT
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 16:20:43 +0000
In-Reply-To: <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 19 Apr 2018 17:31:50
 -0300")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JpdGVzOgoKPiBPbiAw
NC8xOS8yMDE4IDAxOjQ1IFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPj4gcGVycm9yKCkgaXMgZGVm
aW5lZCB0byBmcHJpbnRmKHN0ZGVyciwuLi4pLiAgSEFDS0lORyBzYXlzCj4+IGZwcmludGYoc3Rk
ZXJyLC4uLikgaXMgd3JvbmcuICBTbyBwZXJyb3IoKSBpcyB0b28uCj4+IAo+PiBTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KPj4gQ0M6IFBhb2xv
IEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4+IENDOiBNYXJrdXMgQXJtYnJ1c3RlciA8
YXJtYnJ1QHJlZGhhdC5jb20+Cj4+IENDOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJl
ZGhhdC5jb20+Cj4+IENDOiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1Pgo+PiBDQzog
QWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B4aWxpbnguY29tPgo+PiAtLS0KPj4g
djc6IE5ldyBwYXRjaAo+PiAtLS0KPj4gIG9zLXBvc2l4LmMgfCA4ICsrKystLS0tCj4+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAt
LWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3NpeC5jCj4+IGluZGV4IGQ0Y2Y0NjYuLjAxMDgwMjgg
MTAwNjQ0Cj4+IC0tLSBhL29zLXBvc2l4LmMKPj4gKysrIGIvb3MtcG9zaXguYwo+PiBAQCAtMTI1
LDcgKzEyNSw3IEBAIHZvaWQgb3Nfc2V0X3Byb2NfbmFtZShjb25zdCBjaGFyICpzKQo+PiAgICAg
IC8qIENvdWxkIHJld3JpdGUgYXJndlswXSB0b28sIGJ1dCB0aGF0J3MgYSBiaXQgbW9yZSBjb21w
bGljYXRlZC4KPj4gICAgICAgICBUaGlzIHNpbXBsZSB3YXkgaXMgZW5vdWdoIGZvciBgdG9wJy4g
Ki8KPj4gICAgICBpZiAocHJjdGwoUFJfU0VUX05BTUUsIG5hbWUpKSB7Cj4+IC0gICAgICAgIHBl
cnJvcigidW5hYmxlIHRvIGNoYW5nZSBwcm9jZXNzIG5hbWUiKTsKPj4gKyAgICAgICAgZXJyb3Jf
cmVwb3J0KCJ1bmFibGUgdG8gY2hhbmdlIHByb2Nlc3MgbmFtZTogJXMiLCBzdHJlcnJvcihlcnJu
bykpOwo+PiAgICAgICAgICBleGl0KDEpOwo+PiAgICAgIH0KPj4gICNlbHNlCj4+IEBAIC0yNDcs
NyArMjQ3LDcgQEAgc3RhdGljIHZvaWQgY2hhbmdlX3Jvb3Qodm9pZCkKPj4gICAgICAgICAgICAg
IGV4aXQoMSk7Cj4+ICAgICAgICAgIH0KPj4gICAgICAgICAgaWYgKGNoZGlyKCIvIikpIHsKPj4g
LSAgICAgICAgICAgIHBlcnJvcigibm90IGFibGUgdG8gY2hkaXIgdG8gLyIpOwo+PiArICAgICAg
ICAgICAgZXJyb3JfcmVwb3J0KCJub3QgYWJsZSB0byBjaGRpciB0byAvOiAlcyIsIHN0cmVycm9y
KGVycm5vKSk7Cj4+ICAgICAgICAgICAgICBleGl0KDEpOwo+PiAgICAgICAgICB9Cj4+ICAgICAg
fQo+PiBAQCAtMzA5LDcgKzMwOSw3IEBAIHZvaWQgb3Nfc2V0dXBfcG9zdCh2b2lkKQo+PiAgCj4+
ICAgICAgaWYgKGRhZW1vbml6ZSkgewo+PiAgICAgICAgICBpZiAoY2hkaXIoIi8iKSkgewo+PiAt
ICAgICAgICAgICAgcGVycm9yKCJub3QgYWJsZSB0byBjaGRpciB0byAvIik7Cj4+ICsgICAgICAg
ICAgICBlcnJvcl9yZXBvcnQoIm5vdCBhYmxlIHRvIGNoZGlyIHRvIC86ICVzIiwgc3RyZXJyb3Io
ZXJybm8pKTsKPj4gICAgICAgICAgICAgIGV4aXQoMSk7Cj4+ICAgICAgICAgIH0KPj4gICAgICAg
ICAgVEZSKGZkID0gcWVtdV9vcGVuKCIvZGV2L251bGwiLCBPX1JEV1IpKTsKPj4gQEAgLTM4Myw3
ICszODMsNyBAQCBpbnQgb3NfbWxvY2sodm9pZCkKPj4gIAo+PiAgICAgIHJldCA9IG1sb2NrYWxs
KE1DTF9DVVJSRU5UIHwgTUNMX0ZVVFVSRSk7Cj4+ICAgICAgaWYgKHJldCA8IDApIHsKPj4gLSAg
ICAgICAgcGVycm9yKCJtbG9ja2FsbCIpOwo+PiArICAgICAgICBlcnJvcl9yZXBvcnQoIm1sb2Nr
YWxsOiAlcyIsIHN0cmVycm9yKGVycm5vKSk7Cj4+ICAgICAgfQo+PiAgCj4+ICAgICAgcmV0dXJu
IHJldDsKPgo+IFRoaW5raW5nIGxvdWRseSwgbWF5YmUgd2UgY2FuIHJlZmFjdG9yIGFzIGVycm9y
X3JlcG9ydF9lcnJubyhjb25zdCBjaGFyCj4gKmRlc2MpLi4uCgpNYXliZS4gIElmIHlvdSB3YW50
IHRvIHRyeSwgbWFrZSBpdCBhIHNlcGFyYXRlIHNlcmllcyBub3QgYmxvY2tpbmcgdGhpcwpvbmUu
Cgo+IEFueXdheToKPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVn
QGFtc2F0Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
