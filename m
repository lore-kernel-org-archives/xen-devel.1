From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH Makefile v2] asm: handle comments when
 creating header file
Date: Mon, 11 Feb 2019 15:14:55 +0100
Message-ID: <5b6c3457-fddd-8f7f-a7e2-caf952cbcd8c@suse.com>
References: <5A66FF2002000078001A162C@prv-mh.provo.novell.com>
 <1549462173-9343-1-git-send-email-nmanthey@amazon.de>
 <5C5AF8D10200007800214573@prv1-mh.provo.novell.com>
 <638aace5-f3b1-4a7b-d063-04e2d8ce20fa@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3PTQ=QS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gtCMN-0002zm-2x
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 14:14:59 +0000
In-Reply-To: <638aace5-f3b1-4a7b-d063-04e2d8ce20fa@amazon.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Wei Liu <wei.liu2@citrix.com>, Norbert Manthey <nmanthey@amazon.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Michael Tautschnig <tautschn@amazon.co.uk>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDIvMjAxOSAxNDowNywgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDIvNi8xOSAx
NjoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA2LjAyLjE5IGF0IDE1OjA5LCA8bm1h
bnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPj4+IEZyb206IE5vcmJlcnQgTWFudGhleSA8bm1hbnRo
ZXlAYW1hem9uLmNvbT4KPj4+Cj4+PiBJbiB0aGUgZWFybHkgc3RlcHMgb2YgY29tcGlsYXRpb24s
IHRoZSBhc20gaGVhZGVyIGZpbGVzIGFyZSBjcmVhdGVkLCBzdWNoCj4+PiBhcyBpbmNsdWRlL2Fz
bS0kKFRBUkdFVF9BUkNIKS9hc20tb2Zmc2V0cy5oLiBUaGVzZSBmaWxlcyBkZXBlbmQgb24gdGhl
Cj4+PiBhc3NlbWJseSBmaWxlIGFyY2gvJChUQVJHRVRfQVJDSCkvYXNtLW9mZnNldHMucywgd2hp
Y2ggaXMgZ2VuZXJhdGVkCj4+PiBiZWZvcmUuIERlcGVuZGluZyBvbiB0aGUgdXNlZCB0b29sY2hh
aW4sIHRoZXJlIG1pZ2h0IGJlIGNvbW1lbnRzIGluIHRoZQo+Pj4gYXNzZW1ibHkgZmlsZXMuIEVz
cGVjaWFsbHkgdGhlIGdvdG8tZ2NjIGNvbXBpbGVyIG9mIHRoZSBib3VuZGVkIG1vZGVsCj4+PiBj
aGVja2VyIENCTUMgYWRkcyBjb21tZW50cyB0aGF0IHN0YXJ0IHdpdGggYSAnIycgc3ltYm9sIGF0
IHRoZSBiZWdpbm5pbmcKPj4+IG9mIHRoZSBsaW5lLgo+Pj4KPj4+IFRoaXMgY29tbWl0IGFkZHMg
aGFuZGxpbmcgY29tbWVudHMgaW4gYXNzZW1ibGVyIGR1cmluZyB0aGUgY3JlYXRpb24gb2YgdGhl
Cj4+PiBhc20gaGVhZGVyIGZpbGVzLCBlc3BlY2lhbGx5IGlnbm9yaW5nIGxpbmVzIHRoYXQgc3Rh
cnQgd2l0aCAnIycsIHdoaWNoCj4+PiBpbmRpY2F0ZSBjb21tZW50cyBmb3IgYm90aCBBUk0gYW5k
IHg4NiBhc3NlbWJsZXIuIFRoZSB1c2VkIHRvb2wgZ290by1hcwo+Pj4gcHJvZHVjZXMgZXhhY3Rs
eSBjb21tZW50cyBvZiB0aGlzIGtpbmQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBN
YW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRh
dXRzY2huaWcgPHRhdXRzY2huQGFtYXpvbi5jby51az4KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4KPiBKw7xyZ2VuLCBpcyB0aGVyZSBhIGNoYW5jZSB0
byBnZXQgdGhpcyBwYXRjaCBpbnRvIHRoZSA0LjEyIHJlbGVhc2U/IEl0Cj4gd291bGQgYmUgbmlj
ZSB0byBiZSBhYmxlIHRvIGNvbXBpbGUgdXBzdHJlYW0gWGVuIHdpdGggdGhlIHRvb2wgY2hhaW4g
Zm9yCj4gdGhlIENCTUMgbW9kZWwgY2hlY2tlciAoaS5lLiB0aGUgZ290by1nY2MgY29tcGlsZXIp
LCBhcyB0aGF0IHRvb2wgY2hhaW4KPiBhbGxvd3MgdG8gYXBwbHkgZnVydGhlciByZWFzb25pbmcu
IFRoYW5rcyEKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
