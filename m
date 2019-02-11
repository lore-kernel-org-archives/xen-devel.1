From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH Makefile v2] asm: handle comments when
 creating header file
Date: Mon, 11 Feb 2019 14:07:23 +0100
Message-ID: <638aace5-f3b1-4a7b-d063-04e2d8ce20fa@amazon.de>
References: <5A66FF2002000078001A162C@prv-mh.provo.novell.com>
 <1549462173-9343-1-git-send-email-nmanthey@amazon.de>
 <5C5AF8D10200007800214573@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b7qG=QS=amazon.de=prvs=93823c592=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gtBJD-0004Zq-2c
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 13:07:39 +0000
In-Reply-To: <5C5AF8D10200007800214573@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Michael Tautschnig <tautschn@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

T24gMi82LzE5IDE2OjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNi4wMi4xOSBhdCAx
NTowOSwgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+IEZyb206IE5vcmJlcnQgTWFudGhl
eSA8bm1hbnRoZXlAYW1hem9uLmNvbT4KPj4KPj4gSW4gdGhlIGVhcmx5IHN0ZXBzIG9mIGNvbXBp
bGF0aW9uLCB0aGUgYXNtIGhlYWRlciBmaWxlcyBhcmUgY3JlYXRlZCwgc3VjaAo+PiBhcyBpbmNs
dWRlL2FzbS0kKFRBUkdFVF9BUkNIKS9hc20tb2Zmc2V0cy5oLiBUaGVzZSBmaWxlcyBkZXBlbmQg
b24gdGhlCj4+IGFzc2VtYmx5IGZpbGUgYXJjaC8kKFRBUkdFVF9BUkNIKS9hc20tb2Zmc2V0cy5z
LCB3aGljaCBpcyBnZW5lcmF0ZWQKPj4gYmVmb3JlLiBEZXBlbmRpbmcgb24gdGhlIHVzZWQgdG9v
bGNoYWluLCB0aGVyZSBtaWdodCBiZSBjb21tZW50cyBpbiB0aGUKPj4gYXNzZW1ibHkgZmlsZXMu
IEVzcGVjaWFsbHkgdGhlIGdvdG8tZ2NjIGNvbXBpbGVyIG9mIHRoZSBib3VuZGVkIG1vZGVsCj4+
IGNoZWNrZXIgQ0JNQyBhZGRzIGNvbW1lbnRzIHRoYXQgc3RhcnQgd2l0aCBhICcjJyBzeW1ib2wg
YXQgdGhlIGJlZ2lubmluZwo+PiBvZiB0aGUgbGluZS4KPj4KPj4gVGhpcyBjb21taXQgYWRkcyBo
YW5kbGluZyBjb21tZW50cyBpbiBhc3NlbWJsZXIgZHVyaW5nIHRoZSBjcmVhdGlvbiBvZiB0aGUK
Pj4gYXNtIGhlYWRlciBmaWxlcywgZXNwZWNpYWxseSBpZ25vcmluZyBsaW5lcyB0aGF0IHN0YXJ0
IHdpdGggJyMnLCB3aGljaAo+PiBpbmRpY2F0ZSBjb21tZW50cyBmb3IgYm90aCBBUk0gYW5kIHg4
NiBhc3NlbWJsZXIuIFRoZSB1c2VkIHRvb2wgZ290by1hcwo+PiBwcm9kdWNlcyBleGFjdGx5IGNv
bW1lbnRzIG9mIHRoaXMga2luZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5
IDxubWFudGhleUBhbWF6b24uZGU+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVGF1dHNjaG5p
ZyA8dGF1dHNjaG5AYW1hem9uLmNvLnVrPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4KSsO8cmdlbiwgaXMgdGhlcmUgYSBjaGFuY2UgdG8gZ2V0IHRoaXMg
cGF0Y2ggaW50byB0aGUgNC4xMiByZWxlYXNlPyBJdAp3b3VsZCBiZSBuaWNlIHRvIGJlIGFibGUg
dG8gY29tcGlsZSB1cHN0cmVhbSBYZW4gd2l0aCB0aGUgdG9vbCBjaGFpbiBmb3IKdGhlIENCTUMg
bW9kZWwgY2hlY2tlciAoaS5lLiB0aGUgZ290by1nY2MgY29tcGlsZXIpLCBhcyB0aGF0IHRvb2wg
Y2hhaW4KYWxsb3dzIHRvIGFwcGx5IGZ1cnRoZXIgcmVhc29uaW5nLiBUaGFua3MhCgpCZXN0LApO
b3JiZXJ0CgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNl
bnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFl
Z2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0g
QW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
