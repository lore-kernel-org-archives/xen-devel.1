From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Wed, 27 Mar 2019 17:18:27 +0100
Message-ID: <aac2efca-8024-485a-4b8f-8565341c305c@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com>
 <e10c14cd-54ac-8d8c-2d5c-db4adbd39d07@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9BG3-0004Xo-5X
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:18:31 +0000
In-Reply-To: <e10c14cd-54ac-8d8c-2d5c-db4adbd39d07@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNjo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOC8wMy8yMDE5
IDEzOjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGZyZWVpbmcgcGVyY3B1
IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0KPj4gYWdhaW4gd2hlbiBy
ZXN1bWluZyBrZWVwIHRoZW0uIE9ubHkgZnJlZSBhbiBhcmVhIGluIGNhc2UgYSBjcHUgZGlkbid0
Cj4+IGNvbWUgdXAgYWdhaW4gd2hlbiByZXN1bWluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IEhtbSAtIHRoaXMgaXMgc2xpZ2h0bHkg
cHJvYmxlbWF0aWMsIGdpdmVuIHRoZSBkdWFsIG5hdHVyZSBvZiB0aGlzIGNvZGUuCj4gCj4gSSBh
Z3JlZSB0aGF0IGl0IHRoaXMgY2hhbmdlIGlzIGJlbmVmaWNpYWwgZm9yIHRoZSBzdXNwZW5kIGNh
c2UsIGJ1dCBpdAo+IGlzIGEgcHJvYmxlbSB3aGVuIHdlIGFyZSBwYXJraW5nIGFuIGluZGl2aWR1
YWwgQ1BVIGZvciBzbXQ9MCBvcgo+IHhlbi1ocHRvb2wgcmVhc29ucy4KPiAKPiBEbyB3ZSBoYXZl
IGFueSBoaW50IHdlIGNhbiB1c2Ugd2hlbiB0YWtpbmcgdGhlIENQVSBkb3duIGFzIHRvIHdoZXRo
ZXIKPiB3ZSdyZSBleHBlY3RpbmcgaXQgdG8gY29tZSBzdHJhaWdodCBiYWNrIHVwIGFnYWluPwoK
RGlkIHlvdSBsb29rIGludG8gdGhlIHBhdGNoPyBJIGRpZCB0aGlzIGJ5IHRlc3Rpbmcgc3lzdGVt
X3N0YXRlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
