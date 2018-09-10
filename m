From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] SVM: limit GIF=0 region
Date: Mon, 10 Sep 2018 18:12:21 -0400
Message-ID: <824e3ad6-5d72-ddce-b4ac-bd88fb8b9e26@oracle.com>
References: <5B96879D02000078001E6DDE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c8rd=ly=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fzUOp-0006dL-2g
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 22:11:15 +0000
In-Reply-To: <5B96879D02000078001E6DDE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTAvMjAxOCAxMTowMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVXNlIEVGTEFHUy5J
RiBmb3IgbW9zdCBvcmRpbmFyeSBwdXJwb3NlczsgdGhlcmUncyBpbiBwYXJ0aWN1bGFyIG5vIG5l
ZWQKPiB0byB1bmR1bHkgZGVmZXIgTk1JLyNNQy4gQ2xlYXIgR0lGIG9ubHkgaW1tZWRpYXRlbHkg
YmVmb3JlIFZNUlVOIGl0c2VsZi4KPiBUaGlzIGhhcyB0aGUgYWRkaXRpb25hbCBhZHZhbnRhZ2Ug
dGhhdCBzdm1fc3RnaV9sYWJlbCBub3cgaW5kZWVkIG1hcmtzCj4gdGhlIG9ubHkgcGxhY2Ugd2hl
cmUgR0lGIGdldHMgc2V0Lgo+Cj4gTm90ZSByZWdhcmRpbmcgdGhlIG1haW4gU1RJIHBsYWNlbWVu
dDogUXVpdGUgY291bnRlcmludHVpdGl2ZWx5IHRoZQo+IGhvc3QncyBFRkxBR1MuSUYgY29udGlu
dWVzIHRvIGhhdmUgYSBtZWFuaW5nIHdoaWxlIHRoZSBndWVzdCBydW5zOyBzZWUKPiBQTSBWb2wg
MiBzZWN0aW9uICJQaHlzaWNhbCAoSU5UUikgSW50ZXJydXB0IE1hc2tpbmcgaW4gRUZMQUdTIi4g
SGVuY2Ugd2UKPiBuZWVkIHRvIHNldCB0aGUgZmxhZyBmb3IgdGhlIGR1cmF0aW9uIG9mIHRpbWUg
YmVpbmcgaW4gZ3Vlc3QgY29udGV4dC4KPiBIb3dldmVyLCBTUEVDX0NUUkxfRU5UUllfRlJPTV9I
Vk0gd2FudHMgdG8gYmUgY2FycmllZCBvdXQgd2l0aCBFRkxBR1MuSUYKPiBjbGVhci4KPgo+IE5v
dGUgcmVnYXJkaW5nIHRoZSBtYWluIFNUR0kgcGxhY2VtZW50OiBJdCBjb3VsZCBiZSBtb3ZlZCBm
dXJ0aGVyIHVwLAo+IGJ1dCBhdCBwcmVzZW50IFNQRUNfQ1RSTF9FWElUX1RPX0hWTSBpcyBub3Qg
Tk1JLyNNQy1zYWZlLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
