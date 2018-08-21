From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] x86/xsave: prefer eager clearing of
 state over eager restoring
Date: Tue, 21 Aug 2018 05:21:10 -0600
Message-ID: <5B7BF5A602000078001E06BE@prv1-mh.provo.novell.com>
References: <5B2CD60902000078001CCEF7@prv1-mh.provo.novell.com>
 <5c43bed1-bc50-2cba-8346-8dca2b784056@citrix.com>
 <20180821101028.4o3srromn4jtn6dz@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs4iq-0006UU-OM
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 11:21:16 +0000
In-Reply-To: <20180821101028.4o3srromn4jtn6dz@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDEyOjEwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBdWcgMTYsIDIwMTggYXQgMTA6MDc6MDBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gSXJyZXNwZWN0aXZlIG9mIHdoYXQgd2UgZG8gaGVyZSwgSSdkIHJlYWxseSBsaWtl
IFdlaSB0byByZWJhc2UgaGlzIHdvcmsKPj4gdG8gcmVtb3ZlIHRoZSBsYXp5IGZwdSBsb2dpYyBm
cm9tIHRoZSBuZXN0ZWQgdmlydCBwYXRocywgYmVjYXVzZSBpdHMgYQo+PiBuby1icmFpbmVyIChw
ZXJmIHdpc2UpIGFuZCBjb21lcyB3aXRoIGEgbWFzc2l2ZSBhbW91bnQgb2YgY29kZQo+PiBzaW1w
bGlmaWNhdGlvbiBpbiBYZW4uCj4gCj4gSSBhbSB2ZXJ5IGhhcHB5IHRvIGdldCByaWQgb2YgbW9y
ZSBjb2RlIGlmIHRoYXQncyBhZ3JlZWQuIDotKQoKV2VsbCwgd2UnbGwgaGF2ZSB0byBzZWUuIEkg
ZG9uJ3QgcmVjYWxsIGEgc2VyaWVzIHJlbW92aW5nCiJsYXp5IGZwdSBsb2dpYyBmcm9tIHRoZSBu
ZXN0ZWQgdmlydCBwYXRocyI7IEkgb25seSByZWNhbGwgYSAoZ2lhbnQpCnBhdGNoIHJlbW92aW5n
IGl0IGFsdG9nZXRoZXIgZnJvbSBYZW4gKHdoaWNoIHdvdWxkIG5lZWQgdG8gYmUKYmFja2VkIGJ5
IG51bWJlcnMgaW1vLCBmaXJzdCBhbmQgZm9yZW1vc3QgYmVjYXVzZSBnb2luZwpmb3J3YXJkIHRo
ZSBwcmljZSBvZiBlYWdlciBzdGF0ZSBsb2FkaW5nIGlzIG9ubHkgZ29pbmcgdG8gZ3JvdywKc2lu
Y2UgdGhleSdsbCBvbmx5IGV2ZXIgYWRkIG5ldyBzdGF0ZXMsIHdoaWxlIHRoZSBwZXJmb3JtYW5j
ZQpvZiBsYXp5IHN0YXRlIGxvYWRpbmcgaXMgLSBlc3BlY2lhbGx5IGZvciB0aGUgbG9hZCBhdm9p
ZGVkIGNhc2UgLQpsaWtlbHkgdG8gcmVtYWluIHJlbGF0aXZlbHkgc3RhYmxlKS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
