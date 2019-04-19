From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: BACKPORT Re: [PATCH 3/7] Arm/atomic: correct asm()
 constraints in build_add_sized()
Date: Fri, 19 Apr 2019 14:09:41 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904191409220.1370@sstabellini-ThinkPad-X260>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
 <9314781f-a219-591c-a35e-05163d114057@arm.com>
 <5C88D99F020000780021E06E@prv1-mh.provo.novell.com>
 <04cb358b-5579-d5c6-bddc-5b1468f01bf5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FrJ=SV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHalU-0008JA-2d
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 21:09:44 +0000
In-Reply-To: <04cb358b-5579-d5c6-bddc-5b1468f01bf5@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxMyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEzLzAzLzIwMTkg
MTA6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gT24gMTEuMDMuMTkgYXQgMTk6MDgs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIDExLzAzLzIwMTkgMTY6NDks
IEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IFRoZSBtZW1vcnkgb3BlcmFuZCBpcyBhbiBpbi9v
dXQgb25lLCBhbmQgdGhlIGF1eGlsaWFyeSByZWdpc3RlciBnZXRzCj4gPiA+ID4gd3JpdHRlbiB0
byBlYXJseS4KPiA+ID4gPiAKPiA+ID4gPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBk
cm9wIHRoZSByZWR1bmRhbnQgY2FzdCAodGhlIGlubGluZQo+ID4gPiA+IGZ1bmN0aW9ucycgcGFy
YW1ldGVycyBhcmUgYWxyZWFkeSBvZiB0aGUgY2FzdGVkLXRvIHR5cGUpLgo+ID4gPiA+IAo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4g
Cj4gPiA+IEkgZ3Vlc3MgdGhpcyBpcyBjYW5kaWRhdGUgZm9yIGJhY2twb3J0aW5nLgo+ID4gCj4g
PiBCdHcsIGRvIHlvdSB3YW50IG1lIHRvIHF1ZXVlIHRoaXMsIG9yIHdpbGwgeW91IG9yIFN0ZWZh
bm8gd2FudCB0bwo+ID4gdGFrZSBjYXJlPwo+IAo+IFN0ZWZhbm8gaXMgdGFraW5nIGNhcmUgb2Yg
YmFja3BvcnRpbmcuIFN0ZWZhbm8sIGNhbiB5b3UgcXVldWUgaXQgZm9yIGFsbCB0aGUKPiB0cmVl
IHlvdSBjYW4gYmFja3BvcnQgdG8/CgpEb25lLCBhbmQgc29ycnkgZm9yIHRoZSBkZWxheS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
