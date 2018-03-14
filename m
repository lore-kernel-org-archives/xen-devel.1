From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] SUPPORT.md: Multiple IOREQ servers are
 experimental
Date: Wed, 14 Mar 2018 05:26:47 -0600
Message-ID: <5AA9150702000078001B1766@prv-mh.provo.novell.com>
References: <20180314110547.29285-1-george.dunlap@citrix.com>
 <11869aa8f7f4419cbfc5c65efe096a2c@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0lyu=ge=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ew4Yc-0002Tu-H0
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 11:26:58 +0000
In-Reply-To: <11869aa8f7f4419cbfc5c65efe096a2c@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE4IGF0IDEyOjE2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogR2VvcmdlIER1bmxhcCBb
bWFpbHRvOmdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbV0KPj4gU2VudDogMTQgTWFyY2ggMjAxOCAx
MTowNgo+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIAo+PiBDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24KPj4gPElhbi5K
YWNrc29uQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsgQW5kcmV3
IENvb3Blcgo+PiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT47IFRpbQo+PiAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgS29ucmFkIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vCj4+IFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsg
UGF1bAo+PiBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1BB
VENIXSBTVVBQT1JULm1kOiBNdWx0aXBsZSBJT1JFUSBzZXJ2ZXJzIGFyZSBleHBlcmltZW50YWwK
Pj4gCj4+IFRoZSBjb2RlIGhhcyBiZWVuIHRoZXJlIGluIHRoZSBoeXBlcnZpc29yIGZvciBzZXZl
cmFsIHJlbGVhc2VzLCBidXQKPj4gdGhlcmUgaXMgbm8gdG9vbHN0YWNrIHN1cHBvcnQuCj4+IAo+
PiBXaGlsZSB3ZSdyZSBoZXJlIGRlbGV0ZSBzb21lIHRyYWlsaW5nIHdoaXRlc3BhY2UuCj4+IAo+
PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+
Cj4gCj4gU291bmRzIG9rIHRvIG1lLi4uCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
