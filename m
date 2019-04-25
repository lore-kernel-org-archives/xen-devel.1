From: Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH 6/6] builds: Run i386 builds on
 amd64 kernels
Date: Thu, 25 Apr 2019 20:44:05 +0200
Message-ID: <70c569e9-22fe-d597-060d-aced07097514@suse.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
 <20190425155056.23145-7-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJjLt-0001Tt-Sj
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:44:09 +0000
In-Reply-To: <20190425155056.23145-7-ian.jackson@eu.citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxNzo1MCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gTW9zdCBoYXJkd2FyZSB0
aGF0IHN1cHBvcnRzIGkzODYgc3VwcG9ydHMgYW1kNjQgdG9vLiAgV2hlbiBkb2luZwo+IGJ1aWxk
cyB3ZSBkbyBuZWVkIHRoZSByaWdodCB1c2VybGFuZCwgYnV0IHdlIGRvbid0IGFjdHVhbGx5IGNh
cmUgd2hhdAo+IHRoZSBrZXJuZWwgaXMgZG9pbmcuICBXaXRoIExpbnV4IDMyLW9uLTY0IGlzIGdv
b2QgZm9yIHRoYXQuCj4gCj4gRXNwZWNpYWxseSwgdGhlcmUgaXMgYSBrZXJuZWwgcmVncmVzc2lv
biAoZXZpZGVudCBpbiB0aGUgRGViaWFuCj4gc3RyZXRjaCBrZXJuZWwsIGJ1dCBub3QgcHJlc2Vu
dCBpbiBqZXNzaWUncykgd2hlcmUgMzItYml0IExpbnV4Cj4gbWlzbWFuYWdlcyB0aGUgbWVtb3J5
IG9uIGhvc3RzIHdpdGggbW9kZXJhdGVseSBsYXJnZSBhbW91bnRzIG9mCj4gUkFNIChpZSwgc2ln
bmlmaWNhbnRseSBtb3JlIFJBTSB0aGFuIGNhbiBiZSBhZGRyZXNzZWQgYXQgb25jZSksCj4gcmVz
dWx0aW5nIGluIHdoYXQgYW1vdW50cyB0byBhIG5lYXItc3RhbGwgb2YgdGhlIHBhZ2luZyBzeXN0
ZW0uICBTaW5jZQo+IHRoZSBwYWdpbmcgc3lzdGVtIGlzIHVzZWQgZm9yIGZpbGVzeXN0ZW0gd3Jp
dGVzIHRvbywgdGhlIGVmZmVjdCBpcwo+IHRoYXQgY29tbWFuZHMgcnVuIGJ5IGJ1aWxkcyBjYW4g
dGFrZSB0b3RhbGx5IHVucmVhc29uYWJsZSBhbW91bnRzIG9mCj4gdGltZS4gIEllLCB0aGlzIHZl
cnNpb24gb2YgTGludXggaXMgYnJva2VuIHdoZW4gaTM4NiBQQUUgaXMgbmVlZGVkLgo+IAo+IElu
IHByYWN0aWNlIHRoaXMgaXMgY2F1c2luZyBzaWduaWZpY2FudCB0cm91YmxlIGluIHRoZSBYZW4g
UHJvamVjdCBDSS4KPiAKPiBUaGlzIGtlcm5lbCBidWcgcHJvYmFibHkgd29uJ3QgYWZmZWN0IG91
ciB0ZXN0IGpvYnMgYmVjYXVzZQo+IChpKSB3ZSB1c2Ugb3VyIG93biBrZXJuZWxzLCBzbyB3ZSB3
b3VsZCBwcm9iYWJseSBkZXRlY3QgdGhpcwo+IHJlZ3Jlc3Npb24gd2hlbiBzd2l0Y2hpbmcga2Vy
bmVsIGJyYW5jaGVzIGV0Yy4gKGlpKSB0ZXN0IGpvYnMKPiBydW4gd2l0aCBhIGRvbTBfbWVtIHNl
dHRpbmcgd2hpY2ggYXZvaWRzIHRoZSBwcmVjb25kaXRpb25zIGZvciB0aGUKPiBwYXJ0aWN1bGFy
IGJ1Zy4KPiAKPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENDOiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IENDOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+
IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoK
QWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
