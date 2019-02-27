From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v6 5/5] npt/shadow: allow getting foreign page
 table entries
Date: Wed, 27 Feb 2019 12:09:05 +0100
Message-ID: <20190227110905.53512-6-roger.pau@citrix.com>
References: <20190227110905.53512-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0fFX=RC=citrix.com=prvs=954e75155=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gyx5r-000870-99
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 11:09:43 +0000
In-Reply-To: <20190227110905.53512-1-roger.pau@citrix.com>
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
YXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
LS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIFVzZSBwMm1faXNfYW55X3JhbS4KLS0tCiB4ZW4vYXJj
aC94ODYvbW0vcDJtLXB0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5j
IGIveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCmluZGV4IGU2MmJhZmNmYjcuLmNhZmM5ZjI5OWIg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcHQuYworKysgYi94ZW4vYXJjaC94ODYv
bW0vcDJtLXB0LmMKQEAgLTkwMyw4ICs5MDMsOCBAQCBwb2RfcmV0cnlfbDE6CiAgICAgKnQgPSBw
Mm1fcmVjYWxjX3R5cGUocmVjYWxjIHx8IF9uZWVkc19yZWNhbGMoZmxhZ3MpLCBsMXQsIHAybSwg
Z2ZuKTsKICAgICB1bm1hcF9kb21haW5fcGFnZShsMWUpOwogCi0gICAgQVNTRVJUKG1mbl92YWxp
ZChtZm4pIHx8ICFwMm1faXNfcmFtKCp0KSB8fCBwMm1faXNfcGFnaW5nKCp0KSk7Ci0gICAgcmV0
dXJuIChwMm1faXNfdmFsaWQoKnQpIHx8IHAybV9pc19ncmFudCgqdCkpID8gbWZuIDogSU5WQUxJ
RF9NRk47CisgICAgQVNTRVJUKG1mbl92YWxpZChtZm4pIHx8ICFwMm1faXNfYW55X3JhbSgqdCkg
fHwgcDJtX2lzX3BhZ2luZygqdCkpOworICAgIHJldHVybiAocDJtX2lzX3ZhbGlkKCp0KSB8fCBw
Mm1faXNfYW55X3JhbSgqdCkpID8gbWZuIDogSU5WQUxJRF9NRk47CiB9CiAKIHN0YXRpYyB2b2lk
IHAybV9wdF9jaGFuZ2VfZW50cnlfdHlwZV9nbG9iYWwoc3RydWN0IHAybV9kb21haW4gKnAybSwK
LS0gCjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
