From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [xen-unstable test] 131065: regressions - FAIL
Date: Fri, 7 Dec 2018 11:34:42 +0000
Message-ID: <20181207113442.gtdhy4jz6i2bfqrq@zion.uk.xensource.com>
References: <osstest-131065-mainreport@xen.org>
 <b93692b3-70b6-88f5-1fd8-154988dcdcca@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p9mZ=OQ=citrix.com=prvs=872c80055=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gVEP7-0005Yp-Ai
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 11:34:45 +0000
Content-Disposition: inline
In-Reply-To: <b93692b3-70b6-88f5-1fd8-154988dcdcca@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, osstest service owner <osstest-admin@xenproject.org>, "JBeulich@suse.com" <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMDcsIDIwMTggYXQgMDk6NTA6MzBBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNy8xMi8yMDE4IDA5OjIxLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6
Cj4gPiBmbGlnaHQgMTMxMDY1IHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+ID4gaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzMTA2NS8KPiA+Cj4gPiBS
ZWdyZXNzaW9ucyA6LSgKPiA+Cj4gPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+
ID4gIHRlc3QteHRmLWFtZDY0LWFtZDY0LTUgICAgICAgNjkgeHRmL3Rlc3QtaHZtNjQteHNhLTI3
OCAgIGZhaWwgUkVHUi4gdnMuIDEzMDk4NQo+ID4gIHRlc3QteHRmLWFtZDY0LWFtZDY0LTQgICAg
ICAgNjkgeHRmL3Rlc3QtaHZtNjQteHNhLTI3OCAgIGZhaWwgUkVHUi4gdnMuIDEzMDk4NQo+IAo+
IC0tLSBYZW4gVGVzdCBGcmFtZXdvcmsgLS0tCj4gRW52aXJvbm1lbnQ6IEhWTSA2NGJpdCAoTG9u
ZyBtb2RlIDQgbGV2ZWxzKQo+IFhTQS0yNzggUG9DCj4gRmFpbDogdm1yZWFkLCBnb3Qgbm90aGlu
ZywgZXhwZWN0ZWQgI1VECj4gRmFpbDogdm13cml0ZSwgZ290IG5vdGhpbmcsIGV4cGVjdGVkICNV
RAo+IFN1Y2Nlc3M6IFByb2JhYmx5IG5vdCB2dWxuZXJhYmxlIHRvIFhTQS0yNzgKPiBUZXN0IHJl
c3VsdDogRkFJTFVSRQo+IAo+IFRoZXNlIGFyZSBvbiBnb2RlbGxvMCBhbmQgMSB3aGljaCBhcmUg
SGFzd2VsbCBib3hlcywgYnV0IEknbSBhdCBhCj4gY29tcGxldGUgbG9zcyB0byBleHBsYWluIHRo
ZSByZXN1bHRzIChub3QgbGVhc3QgYmVjYXVzZSB0aGlzIGlzIHRoZSBzYW1lCj4gdHlwZSBvZiBz
eXN0ZW0gYXMgbXkgbm9ybWFsIHRlc3QgYm94KS4KPiAKPiBUaGUgbW9zdCBsb2dpY2FsIG9wdGlv
biAoZ2l2ZW4gaG93IEkgZml4ZWQgdGhlICNVRCBjaGVja3MgaW4gWFNBLTI3OCkgaXMKPiB0aGF0
IFZNQ1Mgc2hhZG93aW5nIGlzIHVuZXhwZWN0ZWRseSBhY3RpdmUsIGJ1dCB0aGVyZSBhcmUgbm8g
cGF0Y2hlcyBpbgo+IHN0YWdpbmcgd2hpY2ggbG9vayBsaWtlIHRoZXkgcGxhdXNpYmx5IG1pZ2h0
IGJlIGNhdXNpbmcgdGhpcy4KPiAKCkkgY2FuIHJlc2VydmUgb25lIG9mIHRoZSBib3hlcyBmb3Ig
eW91IHRvIGludmVzdGlnYXRlIGlmIHRoYXQncyBvZgppbnRlcmVzdC4KCldlaS4KCj4gfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
