From: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH 1/2] libxl: Add virtio vga interface support
 for qemu
Date: Wed, 17 Apr 2019 13:55:14 -0400
Message-ID: <0524144E-4C73-49F6-A753-2D4797367E28@gmail.com>
References: <1554406611-11262-1-git-send-email-cjp256@gmail.com>
 <CABZSBQebNYDTSGZTMNJv6C2qvcNkW=MDMbbB2_1aUu37840yzQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d9Fk=ST=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hGomD-0003up-6P
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:55:17 +0000
Received: by mail-it1-x141.google.com with SMTP id f22so5832076ita.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 10:55:16 -0700 (PDT)
In-Reply-To: <CABZSBQebNYDTSGZTMNJv6C2qvcNkW=MDMbbB2_1aUu37840yzQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chris Patterson <cjp256@gmail.com>
Cc: xen-devel@lists.xenproject.org, Chris Patterson <pattersonc@ainfosec.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBPbiBBcHIgMTAsIDIwMTksIGF0IDIwOjAyLCBDaHJpcyBQYXR0ZXJzb24gPGNqcDI1NkBnbWFp
bC5jb20+IHdyb3RlOgo+IAo+IEZvciBhbnlvbmUgbG9va2luZyBhdCB0aGlzLi4uIHdoaWxlIEkg
aGF2ZSB0ZXN0ZWQgYW5kIHZlcmlmaWVkIHRoYXQKPiBib3RoIHZpcnRpby1ncHUgYW5kIFZpckdM
IHdvcmssIGl0J3Mgbm90IHdpdGhvdXQgc29tZSBoaWNjdXAuCj4gCj4gSSBoYXZlIGJlZW4gcnVu
bmluZyBVYnVudHUgMTkuMDQgd2l0aCB0aGlzIGNvbmZpZyBmb3IgYSBmZXcgZGF5cyBhbmQgSQo+
IGhhdmUgaGFkIGEgY291cGxlIFZNIGZyZWV6ZXMuICd4bCBkbWVzZycgaXMgc3BhbW1pbmcgdGhl
IGZvbGxvd2luZwo+IHJlcGVhdGVkbHk6Cj4gKFhFTikgaXJxLmM6MjQ3OTogZG9tMzogcGlycSAx
NDMgb3IgZW11aXJxIC0zIGFscmVhZHkgbWFwcGVkCj4gCj4gU2VlbXMgdG8gYmUgcmVsYXRlZCB0
byBNU0ktWCBmb3IgdGhlIGRldmljZSwgYnV0IEkgaGF2ZW4ndCB5ZXQgaGFkIGEKPiBjaGFuY2Ug
dG8gZGlnIGludG8gaXQuICBNYXliZSBzb21lb25lIGtub3dzIGlmIHRoaXMgaXMgdG8gYmUgZXhw
ZWN0ZWQKPiBnaXZlbiB0aGUgc3RhdGUgb2YgdGhpbmdzPyA6KQoKQWRkaW5nIFBhdWwgRHVycmFu
dCAodkdQVS9ncmFwaGljcykgdG8gdGhlIHRocmVhZC4KClJpY2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
