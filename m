From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: correct hvmemul_map_linear_addr()
 for multi-page case
Date: Wed, 12 Sep 2018 06:13:58 -0600
Message-ID: <5B99030602000078001E7D25@prv1-mh.provo.novell.com>
References: <5B98D7CF02000078001E7AEA@prv1-mh.provo.novell.com>
 <6ea95d8032c94db79cee98c62dbe1d56@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0420-0002B7-QA
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 12:14:04 +0000
In-Reply-To: <6ea95d8032c94db79cee98c62dbe1d56@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDEzOjUxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMTIgU2VwdGVtYmVyIDIwMTggMTA6MTAK
Pj4gVG86IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBDYzog
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+
PiA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFtQQVRDSF0geDg2L0hWTTog
Y29ycmVjdCBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpIGZvciBtdWx0aS0KPj4gcGFnZSBjYXNl
Cj4+IAo+PiBUaGUgZnVuY3Rpb24gZG9lcyB0d28gdHJhbnNsYXRpb25zIGluIG9uZSBnbyBmb3Ig
YSBzaW5nbGUgZ3Vlc3QgYWNjZXNzLgo+PiBBbnkgZmFpbHVyZSBvZiB0aGUgZmlyc3QgdHJhbnNs
YXRpb24gc3RlcCAoZ3Vlc3QgbGluZWFyIC0+IGd1ZXN0Cj4+IHBoeXNpY2FsKSwgcmVzdWx0aW5n
IGluICNQRiwgb3VnaHQgdG8gdGFrZSBwcmVjZWRlbmNlIG92ZXIgYW55IGZhaWx1cmUKPj4gb2Yg
dGhlIHNlY29uZCBzdGVwIChndWVzdCBwaHlzaWNhbCAtPiBob3N0IHBoeXNpY2FsKS4gQmFpbCBv
dXQgb2YgdGhlCj4+IGxvb3AgZWFybHkgc29sZWx5IHdoZW4gdHJhbnNsYXRpb24gcHJvZHVjZXMg
SFZNVFJBTlNfYmFkX2xpbmVhcl90b19nZm4sCj4+IGFuZCByZWNvcmQgdGhlIG1vc3QgcmVsZXZh
bnQgb2YgcGVyaGFwcyBtdWx0aXBsZSBkaWZmZXJlbnQgZXJyb3JzCj4+IG90aGVyd2lzZS4gKFRo
ZSBjaG9pY2Ugb2YgWkVST19CTE9DS19QVFIgYXMgc2VudGluZWwgaXMgYXJiaXRyYXJ5LikKPiAK
PiBDb3VsZCB3ZSBoYXZlIGNvbW1lbnQgcGVyaGFwcyBzYXlpbmcgd2hhdCB0aGUgb3JkZXIgb2Yg
cmVsZXZhbmNlIG9mIHRoZSAKPiBlcnJvcnMgYXJlPyBUaGUgbG9naWMgaW4gdXBkYXRlX21hcF9l
cnIoKSBiZWxvdyBpcyBhIGxpdHRsZSBoYXJkIHRvIGZvbGxvdy4KClllYWgsIEkgd2FzIHRoaW5r
aW5nIGFib3V0IHRoaXMgbWVhbndoaWxlLCBhbmQgSSdtIGFsc28gbm8gbG9uZ2VyCmNlcnRhaW4g
SSd2ZSBjaG9zZW4gdGhlIG1vc3Qgc2Vuc2libGUgIm9yZGVyaW5nIi4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
