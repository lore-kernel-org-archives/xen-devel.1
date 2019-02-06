From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: adjust minimum allocation
 calculations
Date: Wed, 6 Feb 2019 12:00:53 +0000
Message-ID: <158e6fc8-0a01-74a1-3b3a-8fd6d25477bf@citrix.com>
References: <5C5ABD7102000078002143B1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=su2n=QN=citrix.com=prvs=933dc5b42=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1grLsz-00029C-UO
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 12:01:01 +0000
In-Reply-To: <5C5ABD7102000078002143B1@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDIvMjAxOSAxMDo1NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTEzNzMsOSArMTM3
NywxNSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHNoX21pbl9hbGxvY2F0aW9uKGNvCj4gIHsKPiAg
ICAgIC8qCj4gICAgICAgKiBEb24ndCBhbGxvY2F0ZSBsZXNzIHRoYW4gdGhlIG1pbmltdW0gYWNj
ZXB0YWJsZSwgcGx1cyBvbmUgcGFnZSBwZXIKPiAtICAgICAqIG1lZ2FieXRlIG9mIFJBTSAoZm9y
IHRoZSBwMm0gdGFibGUpLgo+ICsgICAgICogbWVnYWJ5dGUgb2YgUkFNIChmb3IgdGhlIHAybSB0
YWJsZSwgbWluaW1hbGx5IGVub3VnaCBmb3IgSFZNJ3Mgc2V0dGluZwo+ICsgICAgICogdXAgb2Yg
c2xvdCB6ZXJvIGFuZCBWTVgncyBzZXR0aW5nIHVwIG9mIHRoZSBMQVBJQyBwYWdlKSwgcGx1cyBv
bmUgZm9yCj4gKyAgICAgKiBIVk0ncyAxLXRvLTEgcGFnZXRhYmxlLgoKV2hhdCBpcyBpbiBzbG90
IDA/wqAgTm90aGluZyBjb21lcyB0byBtaW5kLgoKPiAgICAgICAqLwo+IC0gICAgcmV0dXJuIHNo
YWRvd19taW5fYWNjZXB0YWJsZV9wYWdlcyhkKSArIChkLT50b3RfcGFnZXMgLyAyNTYpOwo+ICsg
ICAgcmV0dXJuIHNoYWRvd19taW5fYWNjZXB0YWJsZV9wYWdlcyhkKSArCj4gKyAgICAgICAgICAg
bWF4KGQtPnRvdF9wYWdlcyAvIDI1NiwKPiArICAgICAgICAgICAgICAgaXNfaHZtX2RvbWFpbihk
KSA/IENPTkZJR19QQUdJTkdfTEVWRUxTICsgISFjcHVfaGFzX3ZteCAqIDIKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA6IDBVKSArCgpJJ20gbm90IHN1cmUgY3B1X2hhc192bXgg
aXMgdGhlIHJpZ2h0IGNoZWNrIGhlcmUuwqAgRm9yIG9uZSwgdGhlcmUgaXMgYQpzZXJpZXMgcG9z
dGVkIGFkZGluZyBzaW1pbGFyIHN1cHBvcnQgZm9yIEFNRCwgc28gdGhpcyBpcyBnb2luZyB0byBi
ZQpzdGFsZSBzaG9ydGx5LgoKSSdkIGVyciBvbiB0aGUgc2lkZSBvZiBtYWtpbmcgaXQgdW5jb25k
aXRpb25hbCwgYnV0IGlmIHlvdSBkbyB3YW50IHRvIGJlCmFzIHRpZ2h0IGFzIHBvc3NpYmxlLCB0
aGVuIGNwdV9oYXNfdm14X2FwaWNfcmVnX3ZpcnQgaXMgdGhlIGNvcnJlY3QKY2hlY2sgZm9yIG5v
dy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
