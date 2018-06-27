From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 05/31] libxl_qmp: Move the buffer realloc
 to the same scope level as read
Date: Wed, 27 Jun 2018 15:25:05 +0100
Message-ID: <23347.40513.792362.767761@mariner.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-6-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qrb=jn=citrix.com=prvs=709d59aa7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYBNe-0004rh-2L
 for xen-devel@lists.xenproject.org; Wed, 27 Jun 2018 14:25:10 +0000
In-Reply-To: <20180601143720.24637-6-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDA1LzMxXSBsaWJ4bF9xbXA6IE1vdmUg
dGhlIGJ1ZmZlciByZWFsbG9jIHRvIHRoZSBzYW1lIHNjb3BlIGxldmVsIGFzIHJlYWQiKToKPiBJ
biBxbXBfbmV4dCgpLCB0aGUgaW5uZXIgbG9vcCBzaG91bGQgb25seSB0cnkgdG8gcGFyc2UgbWVz
c2FnZXMgZnJvbQo+IFFNUCwgaWYgdGhlcmUgaXMgbW9yZSB0aGFuIG9uZS4KPiAKPiBUaGUgaGFu
ZGxpbmcgb2YgdGhlIHJlY2VpdmUgYnVmZmVyICgnaW5jb21wbGV0ZScpLCBzaG91bGQgYmUgZG9u
ZSBhdCB0aGUKPiBzYW1lIHNjb3BlIGxldmVsIGFzIHJlYWQoKS4gSXQgZG9lc24ndCBuZWVkIHRv
IGJlIGhhbmRsZSBtb3JlIHRoYXQgb25jZQo+IGFmdGVyIGEgcmVhZC4KPiAKPiBCZWZvcmUgdGhp
cyBwYXRjaCwgd2hlbiBvbiBtZXNzYWdlIHdoYXQgaGFuZGxlZCwgdGhlIGlubmVyIGxvb3Agd291
bGQKPiByZXN0YXJ0IGJ5IGFkZGluZyB0aGUgJ2J1ZmZlcicgaW50byAnaW5jb21wbGV0ZScgKGFm
dGVyIHJlYWxsb2NhdGlvbikuCj4gU2luY2UgJ3JkJyB3YXMgbm90IHJlc2V0LCB0aGUgYnVmZmVy
IHdvdWxkIGJlIHN0cmNhdCBhIHNlY29uZCB0aW1lLgo+IEFmdGVyIHRoYXQsIHRoZSBzdHJlYW0g
ZnJvbSB0aGUgUU1QIHNlcnZlciB3b3VsZCBoYXZlIHN5bnRheCBlcnJvciwgYW5kCj4gdGhlIHBh
cnNvciB3b3VsZCB0aHJvdyBlcnJvcnMuCj4gCj4gVGhpcyBpcyB1bmxpa2VseSB0byBoYXBwZW4g
YXMgdGhlIHJlY2VpdmUgYnVmZmVyIGlzIHZlcnkgbGFyZ2UuIEFuZAo+IHJlY2VpdmluZyB0d28g
bWVzc2FnZXMgaW4gYSByb3cgaXMgdW5saWtlbHkuIEluIHRoZSBjdXJyZW50IGNhc2UsIHRoaXMK
PiBjb3VsZCBiZSBhbiBldmVudCBhbmQgYSByZXNwb25zZSB0byBhIGNvbW1hbmQuCgpBY2tlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpIb3dldmVyLCBJIGhh
dmUgbm90IHJldmlld2VkIHRoZSBidWZmZXIgaGFuZGxpbmcgaW4gZGV0YWlsIGZvcgpvZmYtYnkt
b25lIGVycm9ycyBldGMuCgpJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgZm9yIG1lIHRvIGRvIGEg
cHJvcGVyIHNlY3VyaXR5LWZvY3VzZWQgcmV2aWV3Cm9mIHRoZSB3aG9sZSBxbXAgYXJyYW5nZW1l
bnQgYWZ0ZXIgeW91ciBzZXJpZXMuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
