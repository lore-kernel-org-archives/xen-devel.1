From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v2 5/6] tools/dm_depriv: Add first cut
 RLIMITs
Date: Fri, 5 Oct 2018 16:18:15 +0100
Message-ID: <CAFLBxZZj_nNXM3hUU6U0ANxNM2ckhuhDws63or_qJ90WjqvdkQ@mail.gmail.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-5-george.dunlap@citrix.com>
 <bb3c1df20d5947c98b30b555aaff1f85@AMSPEX02CL03.citrite.net>
 <CAFLBxZanne777R0WfJLuGqTv3dx=A+W0Z5UsW9B0i4MFMWWKXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cdmp=mr=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1g8Rs8-0001gA-5P
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 15:18:32 +0000
Received: by mail-qk1-x743.google.com with SMTP id p6-v6so8171759qkg.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Oct 2018 08:18:31 -0700 (PDT)
In-Reply-To: <CAFLBxZanne777R0WfJLuGqTv3dx=A+W0Z5UsW9B0i4MFMWWKXw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

W3Jlc2VuZGluZ10KT24gRnJpLCBPY3QgNSwgMjAxOCBhdCA0OjE3IFBNIEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAyNCwgMjAx
OCBhdCA5OjM1IEFNIFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ID4gPiArICAgIHsKPiA+ID4gKyAgICAgICAgLnJlc291cmNlID0gLTEKPiA+Cj4gPiBJcyAt
MSBndWFyYW50ZWVkIG5vdCB0byBjbGFzaCB3aXRoIGFueSBkZWZpbmVkIHJlc291cmNlIHR5cGU/
Cj4KPiBIbW0uLi4gd2VsbCBhdCB0aGUgIG1vbWVudCAvdXNyL2luY2x1ZGUvYml0cy9yZXNvdXJj
ZS5oIHNlZW1zIHRvIGhhdmUKPiB0aGVtIGRlZmluZWQgYXMgbm9uLW5lZ2F0aXZlIGludGVnZXJz
IChpLmUuLCBzdGFydGluZyBhdCAwKS4gIEJ1dAo+IHRoZXJlJ3Mgbm90aGluZyBJIGNhbiBzZWUg
d2hpY2ggcHJldmVudHMgYSBuZXcgb25lIGJlaW5nIGRlZmluZWQgYXMgLTEKPiBpZiBzb21lb25l
IGluIHRoZSBMaW51eCBjb21tdW5pdHkgZGVjaWRlcyB0by4gIFRoZSBQT1NJWCBtZXJlbHkKPiBk
ZWZpbmVzIHRoaXMgYXMgYSBpbnQsIGFuZCBJIGNvdWxkbid0IGZpbmQgYW55dGhpbmcgd2hpY2gg
c2F5cyBpdCBoYWQKPiB0byBiZSBub24tbmVnYXRpdmUgaW4gdGhlIHNwZWMuCj4KPiBMaW51eCBz
ZWVtcyB0byBkZWZpbmUgUkxJTUlUX05MSU1JVFMgYXMgdGhlIHRvdGFsIG51bWJlciBvZiBsaW1p
dHMgc28KPiBmYXIgZGVmaW5lZDsgSSdsbCB1c2UgdGhhdCBpbnN0ZWFkLiAgKFRoYXQgYWxzbyBz
b3J0IG9mIGltcGxpZXMgdGhleQo+IGV4cGVjdCB5b3UgdG8gdXNlIHRoYXQgYXMgYW4gYXJyYXkg
c2l6ZXIsIGFuZCB0aGUgdmFyaW91cyBsaW1pdHMgYXMKPiBpbmRleGVzIGludG8gdGhlIGFycmF5
LCBhbmQgdGh1cyBiZSBub24tbmVnYXRpdmU7IGJ1dCB3aGF0ZXZlci4pCj4KPiA+ID4gKwo+ID4g
PiArICAgIC8qIFNldCB2YXJpb3VzICJlYXN5IiBybGltaXRzICovCj4gPiA+ICsgICAgZm9yIChp
PTA7IHJsaW1pdHNbaV0ucmVzb3VyY2UgIT0gLTE7IGkrKykgewo+ID4KPiA+IENvdWxkbid0IGZp
Z3VyZSBvdXQgd2hldGhlciB0aGlzIGlzIGEgY29kaW5nIHN0eWxlIHZpb2xhdGlvbiBvciBub3Qg
YnV0IEkgdGhpbmsgJ2k9MCcgc2hvdWxkIGJlICdpID0gMCcKPgo+IEFjay4KPgo+ICAtR2Vvcmdl
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
