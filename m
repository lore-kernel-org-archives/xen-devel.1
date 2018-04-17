From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/msr: further correct the emulation
 behaviour of MSR_PRED_CMD
Date: Tue, 17 Apr 2018 13:30:49 +0100
Message-ID: <a775b311-5c53-6854-76ad-4b58906cd079@citrix.com>
References: <5AD5DD8202000078001BC0B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mldi=hg=citrix.com=prvs=6381c0ebe=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f8Pl9-0001B3-8E
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 12:30:55 +0000
In-Reply-To: <5AD5DD8202000078001BC0B7@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMTI6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZvbGxvd2luZyBjb21taXQg
YTZhYTY3OGZhMyAoIng4Ni9tc3I6IENvcnJlY3QgdGhlIGVtdWxhdGlvbiBiZWhhdmlvdXIKPiBv
ZiBNU1JfUFJFRF9DTUQiKSB3ZSBtYXkgZW5kIHVwIHdyaXRpbmcgdGhlIGxvdyBiaXQgd2l0aCB0
aGUgd3JvbmcKPiB2YWx1ZS4gV2hpbGUgaXQncyB1bmxpa2VseSBmb3IgYSBndWVzdCB0byB3YW50
IHRvIHdyaXRlIHplcm8gdGhlcmUsIHdlCj4gc2hvdWxkIHN0aWxsIHBlcm1pdCAodGhpcyB3aXRo
b3V0IGluY3VycmluZyB0aGUgb3ZlcmhlYWQgb2YgYW4gYWN0dWFsCj4gYmFycmllcikuIENvcnJl
Y3RpbmcgdGhpcyByaWdodCBhd2F5IHdpbGwgYWxzbyBoZWxwIHdoZW5ldmVyIGZ1cnRoZXIKPiBi
aXRzIGluIHRoZSBNU1IgbWlnaHQgYmVjb21lIGRlZmluZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vYXJjaC94ODYvbXNy
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKPiBAQCAtMjQ3LDcgKzI0Nyw3IEBAIGludCBn
dWVzdF93cm1zcihzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QKPiAgICAgICAgICAgICAgZ290byBn
cF9mYXVsdDsgLyogUnN2ZCBiaXQgc2V0PyAqLwo+ICAKPiAgICAgICAgICBpZiAoIHYgPT0gY3Vy
ciApCj4gLSAgICAgICAgICAgIHdybXNybChNU1JfUFJFRF9DTUQsIFBSRURfQ01EX0lCUEIpOwo+
ICsgICAgICAgICAgICB3cm1zcmwoTVNSX1BSRURfQ01ELCB2YWwpOwoKSSB3YXMgb24gdGhlIGZl
bmNlIGFib3V0IG1ha2luZyB0aGlzIGNoYW5nZSwgYmVjYXVzZSBpZiB0aGUgcmVzZXJ2ZWQgYml0
CnRlc3RpbmcgaGFwcGVucyB0byBiZSB3cm9uZywgd2UgbWlnaHQgc3VmZmVyIGEgZmF0YWwgI0dQ
IGhlcmUuCgpUaGVuIGFnYWluLCB0aGUgc2FtZSBjb3VsZCBiZSBzYWlkIG9mIHRoZSB0aGUgQ1BV
SUQgY2hlY2sgYW5kIGV4cGxpY2l0CnVzZSBvZiBQUkVEX0NNRF9JQlBCLgoKSSBhbHNvIHdvbmRl
cmVkIGlmIHdlIHdvdWxkIGJlIGJldHRlciB1c2luZyB3cm1zcl9zYWZlKCkgdG8gY29wZSBiZXR0
ZXIKaW4gcmVsZWFzZSBzaXR1YXRpb25zLCB3aGVyZSBhdCBsZWFzdCBiYWQgbG9naWMgaGVyZSB3
b3VsZCByZXN1bHQgaW4KaG9zdCBjcmFzaC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
