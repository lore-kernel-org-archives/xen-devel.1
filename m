From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/mwait-idle: Graceful probe failure when
 MWAIT is disabled
Date: Thu, 22 Nov 2018 13:52:36 +0000
Message-ID: <3240b993-ca34-0022-8b55-b3ef5443c197@citrix.com>
References: <5BF67DAB02000078001FEC32@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=76bk=ob=citrix.com=prvs=857ae18cf=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gPpPP-0001G7-8C
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 13:52:43 +0000
In-Reply-To: <5BF67DAB02000078001FEC32@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTEvMjAxOCAwOTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hlbiBNV0FJVCBpcyBk
aXNhYmxlZCwgaW50ZWxfaWRsZSByZWZ1c2VzIHRvIHByb2JlLgo+IEJ1dCBpdCBtYXkgbWlzLWxl
YWQgdGhlIHVzZXIgYnkgYmxhbWluZyB0aGlzIG9uIHRoZSBtb2RlbCBudW1iZXI6Cj4KPiBpbnRl
bF9pZGxlOiBkb2VzIG5vdCBydW4gb24gZmFtaWx5IDYgbW9kZXNsIDc5Cj4KPiBTbyBkZWZlciB0
aGUgY2hlY2sgZm9yIE1XQUlUIHVudGlsIGFmdGVyIHRoZSBtb2RlbCMgd2hpdGUtbGlzdCBjaGVj
ayBzdWNjZWVkcywKPiBhbmQgaWYgdGhlIE1XQUlUIGNoZWNrIGZhaWxzLCB0ZWxsIHRoZSB1c2Vy
IGhvdyB0byBmaXggaXQ6Cj4KPiBpbnRlbF9pZGxlOiBQbGVhc2UgZW5hYmxlIE1XQUlUIGluIEJJ
T1MgU0VUVVAKPgo+IFNpZ25lZC1vZmYtYnk6IExlbiBCcm93biA8bGVuLmJyb3duQGludGVsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2NraUBp
bnRlbC5jb20+Cj4gW0xpbnV4IGNvbW1pdDogYTRjNDQ3NTMzYTE4ZWU4NmUwNzIzMmQ2MzQ0YmEx
MmIxZjljNTA3N10KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
