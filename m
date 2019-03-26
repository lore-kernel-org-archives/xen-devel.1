From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] libx86: Recalculate synthesised
 cpuid_policy fields when appropriate
Date: Tue, 26 Mar 2019 12:34:13 +0000
Message-ID: <63d1d530-2e79-438d-2cca-5b7b043a69a5@citrix.com>
References: <1553170866-23812-1-git-send-email-andrew.cooper3@citrix.com>
 <1553170866-23812-5-git-send-email-andrew.cooper3@citrix.com>
 <5C9A19140200007800221E4A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C9A19140200007800221E4A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDMvMjAxOSAxMjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDMuMTkg
YXQgMTM6MjEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gV2hlbiBmaWxs
aW5nIGEgcG9saWN5LCBlaXRoZXIgZnJvbSBDUFVJRCBvciBhbiBpbmNvbW1pbmcgbGVhZiBzdHJl
YW0sCj4+IHJlY2FsY3VsYXRlIHRoZSBzeW50aGVzaXNlZCB2ZW5kb3IgdmFsdWUuICBBbGwgY2Fs
bGVycyBhcmUgZXhwZWN0ZWQgdG8gd2FudAo+PiB0aGlzIGJlaGF2aW91ci4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggb25lIHF1ZXN0
aW9uOgo+Cj4+IEBAIC0xNDEsNiArMTQ4LDggQEAgdm9pZCB4ODZfY3B1aWRfcG9saWN5X2ZpbGxf
bmF0aXZlKHN0cnVjdCBjcHVpZF9wb2xpY3kgKnApCj4+ICAgICAgZm9yICggaSA9IDE7IGkgPCBt
aW5fdCh1bnNpZ25lZCBpbnQsIEFSUkFZX1NJWkUocC0+ZXh0ZC5yYXcpLAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcC0+ZXh0ZC5tYXhfbGVhZiArIDEgLSAweDgwMDAwMDAwKTsgKytp
ICkKPj4gICAgICAgICAgY3B1aWRfbGVhZigweDgwMDAwMDAwICsgaSwgJnAtPmV4dGQucmF3W2ld
KTsKPj4gKwo+PiArICAgIHJlY2FsY3VsYXRlX3N5bnRoKHApOwo+PiAgfQo+PiAgCj4+ICBjb25z
dCB1aW50MzJfdCAqeDg2X2NwdWlkX2xvb2t1cF9kZWVwX2RlcHModWludDMyX3QgZmVhdHVyZSkK
Pj4gQEAgLTM2Myw2ICszNzIsOCBAQCBpbnQgeDg2X2NwdWlkX2NvcHlfZnJvbV9idWZmZXIoc3Ry
dWN0IGNwdWlkX3BvbGljeSAqcCwKPj4gICAgICAgICAgfQo+PiAgICAgIH0KPj4gIAo+PiArICAg
IHJlY2FsY3VsYXRlX3N5bnRoKHApOwo+PiArCj4+ICAgICAgcmV0dXJuIDA7Cj4+ICAKPj4gICBv
dXRfb2ZfcmFuZ2U6Cj4gV2hpbGUgdGhpcyB0YWtlcyBjYXJlIG9mIGxpYng4Niwgd291bGRuJ3Qg
aXQgYmUgZGVzaXJhYmxlIHRvIG1pcnJvciB0aGlzCj4gYmVoYXZpb3IgaW50byB1cGRhdGVfZG9t
YWluX2NwdWlkX2luZm8oKSByaWdodCBhd2F5PwoKVGhhdCBpcyBhbHJlYWR5IGRvbmUgYnkgcGF0
Y2ggMiBieSB2aXJ0dWUgb2YgdGhlIG1vZGlmaWNhdGlvbiB0bwpyZWNhbGN1bGF0ZV9jcHVpZF9w
b2xpY3koKQoKTm9uZSBvZiB0aGlzIGNvZGUgaXMgZ29pbmcgdG8gc3Vydml2ZSB0byB0aGUgZW5k
IG9mIG15IENQVUlEL01TUiB3b3JrLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
