From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pv-shim: Avoid a command line parameter
 warning for CONFIG_PV_SHIM_EXCLUSIVE builds
Date: Wed, 30 Jan 2019 04:22:50 -0700
Message-ID: <5C51890A020000780021243D@prv1-mh.provo.novell.com>
References: <1548788870-1851-1-git-send-email-andrew.cooper3@citrix.com>
 <5C51751B0200007800212354@prv1-mh.provo.novell.com>
 <804418e7-a5c8-b108-dceb-a9ca7c04d312@citrix.com>
 <fd383b41-4103-4148-55e9-be61a79342c1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gonxI-0007EN-7a
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 11:22:56 +0000
In-Reply-To: <fd383b41-4103-4148-55e9-be61a79342c1@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE5IGF0IDExOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMDEvMjAxOSAxMDowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMzAv
MDEvMjAxOSAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyOS4wMS4xOSBhdCAy
MDowNywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9wdi9zaGltLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4+Pj4g
QEAgLTQwLDcgKzQwLDExIEBACj4+Pj4gICN1bmRlZiB2aXJ0X3RvX21mbgo+Pj4+ICAjZGVmaW5l
IHZpcnRfdG9fbWZuKHZhKSBfbWZuKF9fdmlydF90b19tZm4odmEpKQo+Pj4+ICAKPj4+PiAtI2lm
bmRlZiBDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUKPj4+PiArI2lmZGVmIENPTkZJR19QVl9TSElN
X0VYQ0xVU0lWRQo+Pj4+ICsvKiBUb2xlcmF0ZSAicHYtc2hpbSIgYmVpbmcgcGFzc2VkIHRvIGEg
Q09ORklHX1BWX1NISU1fRVhDTFVTSVZFIGh5cGVydmlzb3IuICovCj4+Pj4gK3N0YXRpYyBib29s
IF9kaXNjYXJkOwo+Pj4+ICtib29sZWFuX3BhcmFtKCJwdi1zaGltIiwgX2Rpc2NhcmQpOwo+Pj4+
ICsjZWxzZQo+Pj4+ICBib29sIHB2X3NoaW07Cj4+Pj4gIGJvb2xlYW5fcGFyYW0oInB2LXNoaW0i
LCBwdl9zaGltKTsKPj4+PiAgI2VuZGlmCj4+PiBJdCB3b3VsZCBlbmQgdXAgYmVpbmcgbGVzcyBl
eHRyYSBjb2RlIGlmIHlvdSBkaWQKPj4+Cj4+PiAjaWZkZWYgQ09ORklHX1BWX1NISU1fRVhDTFVT
SVZFCj4+PiAvKiBUb2xlcmF0ZSAicHYtc2hpbSIgYmVpbmcgcGFzc2VkIHRvIGEgQ09ORklHX1BW
X1NISU1fRVhDTFVTSVZFIGh5cGVydmlzb3IuICovCj4+PiBzdGF0aWMgYm9vbCBfX2luaXRkYXRh
IHB2X3NoaW07Cj4+PiAjZWxzZQo+Pj4gYm9vbCBwdl9zaGltOwo+Pj4gI2VuZGlmCj4+PiBib29s
ZWFuX3BhcmFtKCJwdi1zaGltIiwgcHZfc2hpbSk7Cj4+IFNhZGx5IG5vdC4gIEluIHRoZSBFWENM
VVNJVkUgY2FzZSwgcHZfc2hpbSBpcyBkZWZpbmVkIHRvIGJlIDEsIGFuZCB0aGVuCj4+IHlvdSd2
ZSBnb3QgYW4gb2JqZWN0IG5hbWVkIHdpdGgganVzdCBhIG51bWJlci4gIChJIHRyaWVkIHRoaXMg
YXBwcm9hY2gKPj4gZmlyc3QuKQo+Pgo+PiBJIGNhbid0IHRoaW5rIG9mIGFueSBjbGVhbmVyIHNv
bHV0aW9uLgo+IAo+IEFjdHVhbGx5LCBJIGNvdWxkIG1vdmUgdGhpcyB0byB0aGUgYm90dG9tIG9m
IHRoZSBmaWxlLCBhbmQganVzdCB1bmRlZgo+IHB2X3NoaW0uCgpBaCwgeWVzLiBGaW5lIHdpdGgg
bWUgKGkuZS4gZmVlbCBmcmVlIHRvIGtlZXAgbXkgYWNrIHRoZW4pLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
