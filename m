From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 4/4] npt/shadow: allow getting foreign page
 table entries
Date: Mon, 18 Feb 2019 18:27:27 +0100
Message-ID: <20190218172727.19644-5-roger.pau@citrix.com>
References: <20190218172727.19644-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VanW=QZ=citrix.com=prvs=945e29c39=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gvmi1-0001hO-1K
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 17:28:01 +0000
In-Reply-To: <20190218172727.19644-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudCBucHQgYW5kIHNoYWRvdyBjb2RlIHRvIGdldCBhbiBlbnRyeSB3aWxsIGFsd2F5cyBy
ZXR1cm4KSU5WQUxJRF9NRk4gZm9yIGZvcmVpZ24gZW50cmllcy4gQWxsb3cgdG8gcmV0dXJuIHRo
ZSBlbnRyeSBtZm4gZm9yCmZvcmVpZ24gZW50cmllcywgbGlrZSBpdCdzIGRvbmUgZm9yIGdyYW50
IHRhYmxlIGVudHJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNp
dHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIFVzZSBwMm1faXNfYW55X3JhbS4K
LS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L21tL3AybS1wdC5jIGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCmluZGV4IDU3YWZhMzdjNzEu
LjE3OTY5NjQzYjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYworKysgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLXB0LmMKQEAgLTg5Myw4ICs4OTMsOCBAQCBwb2RfcmV0cnlfbDE6
CiAgICAgKnQgPSBwMm1fcmVjYWxjX3R5cGUocmVjYWxjIHx8IF9uZWVkc19yZWNhbGMoZmxhZ3Mp
LCBsMXQsIHAybSwgZ2ZuKTsKICAgICB1bm1hcF9kb21haW5fcGFnZShsMWUpOwogCi0gICAgQVNT
RVJUKG1mbl92YWxpZChtZm4pIHx8ICFwMm1faXNfcmFtKCp0KSB8fCBwMm1faXNfcGFnaW5nKCp0
KSk7Ci0gICAgcmV0dXJuIChwMm1faXNfdmFsaWQoKnQpIHx8IHAybV9pc19ncmFudCgqdCkpID8g
bWZuIDogSU5WQUxJRF9NRk47CisgICAgQVNTRVJUKG1mbl92YWxpZChtZm4pIHx8ICFwMm1faXNf
YW55X3JhbSgqdCkgfHwgcDJtX2lzX3BhZ2luZygqdCkpOworICAgIHJldHVybiAocDJtX2lzX3Zh
bGlkKCp0KSB8fCBwMm1faXNfYW55X3JhbSgqdCkpID8gbWZuIDogSU5WQUxJRF9NRk47CiB9CiAK
IHN0YXRpYyB2b2lkIHAybV9wdF9jaGFuZ2VfZW50cnlfdHlwZV9nbG9iYWwoc3RydWN0IHAybV9k
b21haW4gKnAybSwKLS0gCjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
