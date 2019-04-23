From: "Caccavale, Samuel" <samcacc@amazon.com>
Subject: Re: [PATCH fuzzer v1] Added the --ignore-sigill option
 for AFL fuzzing
Date: Tue, 23 Apr 2019 09:10:33 +0000
Message-ID: <1556010631911.24573@amazon.com>
References: <20190418150238.15352-1-samcacc@amazon.de>,
 <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oNSZ=SZ=amazon.com=prvs=009616fed=samcacc@srs-us1.protection.inumbo.net>)
 id 1hIrV7-0006xU-0d
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:14:05 +0000
In-Reply-To: <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Sam Caccavale <samcacc@amazon.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Woodhouse, David" <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, "Doebel,
 Bjoern" <doebel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

TXkgbWlzdGFrZSwgSSdtIGN1cnJlbnRseSB1bmFibGUgdG8gcmVwcm9kdWNlIHRoZSB+MTAwIGNy
YXNoZXMgCkFGTCBmb3VuZCB3aGlsZSBmdXp6aW5nIHRoZSBtYXN0ZXIgYnJhbmNoLCBvbiB0aGUg
Y3VycmVudCBzdGFnaW5nIApicmFuY2guICBJdCBzZWVtcyBzb21lIHN0YWdlZCBwYXRjaCBoYXMg
c2luY2UgYWRkcmVzc2VkIHRoaXMuCgpJZiBpdCBpcyBvZiBhbnkgaW50ZXJlc3QsIG1vc3Qgb2Yg
dGhlIGNyYXNoZXMgY2FtZSBmcm9tIEFWWDUxMiAKaW5zdHJ1Y3Rpb25zLgoKU29ycnkgYW5kIHRo
YW5rcywKU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJvbTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2VudDogVGh1cnNkYXks
IEFwcmlsIDE4LCAyMDE5IDY6MTggUE0KVG86IFNhbSBDYWNjYXZhbGU7IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpDYzogSmFuIEJldWxpY2g7IERvZWJlbCwgQmpvZXJuOyBXb29kaG91
c2UsIERhdmlkOyBNYXJ0aW4gTWF6ZWluOyBQb2hsYWNrLCBNYXJ0aW47IFdpZWN6b3JraWV3aWN6
LCBQYXdlbDsgTWFudGhleSwgTm9yYmVydApTdWJqZWN0OiBSZTogW1BBVENIIGZ1enplciB2MV0g
QWRkZWQgdGhlIC0taWdub3JlLXNpZ2lsbCBvcHRpb24gZm9yIEFGTCBmdXp6aW5nCgpPbiAxOC8w
NC8yMDE5IDE2OjAyLCBTYW0gQ2FjY2F2YWxlIHdyb3RlOgo+IEFzIG9mIG5vdywgdGhlIHg4Nl9p
bnN0cnVjdGlvbl9lbXVsYXRvciB3aWxsIGV4ZWN1dGUgb3Bjb2Rlcwo+IGJlbG9uZ2luZyB0byBD
UFUgZXh0ZW5zaW9ucyB0aGF0IHRoZSBob3N0IG1heSBub3QgaGF2ZS4KPiBTcGVjaWZ5aW5nIC0t
aWdub3JlLXNpZ2lsbCB3aGVuIHJ1bm5pbmcgYWZsLWhhcm5lc3Mgd2lsbCBpZ25vcmUKPiBhbGwg
U0lHX0lMTCBpbmNsdWRpbmcgdGhvc2UgZ2VuZXJhdGVkIGJ5IHRoZSBhYm92ZSBpc3N1ZS4KCldo
aWNoIGluc3RydWN0aW9ucz8gIFdlIHNwZWNpZmljYWxseSBkaWRuJ3QgYWRkIGEgU0lHX0lMTCBo
YW5kbGVyIGluIHRoZQpmaXJzdCBwbGFjZSB0byBjYXRjaCBtaXN0YWtlcyBsaWtlIHRoaXMgc28g
d2UgY2FuIGZpeCB0aGVtLgoKV2UndmUgZ290IHByb3RlY3Rpb24gaW4gcGxhY2Ugc28gc3VjaCBh
IG1pc3Rha2UgaXNuJ3QgYW4gWFNBIGFueSBtb3JlLApidXQgaXQgaXMgc3RpbGwgYW4gZXJyb3Ig
d2UnZCBsaWtlIHRvIGZpeCBpbiB0aGUgZW11bGF0b3IuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
