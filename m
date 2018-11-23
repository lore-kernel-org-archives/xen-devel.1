From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4.9 and older] VMX: allow migration of
 guests with SSBD enabled
Date: Fri, 23 Nov 2018 10:47:38 +0000
Message-ID: <37c55923-b370-c57c-f197-a935940154f5@citrix.com>
References: <5BF7BA7302000078001FF399@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zeqx=oc=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQ8zt-0008LW-TZ
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 10:47:41 +0000
In-Reply-To: <5BF7BA7302000078001FF399@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAwODoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGJhY2twb3J0IG9m
IGNkNTMwMjNkZjkgKCJ4ODYvbXNyOiBWaXJ0dWFsaXNlIE1TUl9TUEVDX0NUUkwuU1NCRCBmb3IK
PiBndWVzdHMgdG8gdXNlIikgZGlkIG5vdCBtaXJyb3IgdGhlIFBWIHNpZGUgY2hhbmdlIGludG8g
dGhlIEhWTSAoVk1YLQo+IHNwZWNpZmljKSBjb2RlIHBhdGguCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClNvcnJ5IC0gSSBkZWZpbml0ZWx5IHRlc3Rl
ZCB0aGlzIG9uIFhlbiA0LjcsIGJ1dCBJIGFsc28gZGlkIGJhY2twb3J0IDEwCnZlcnNpb25zIG9m
IHRoaXMgc2VyaWVzIHRocm91Z2ggdGhlIGNvdXJzZSBvZiBkZXZlbG9wbWVudC4KCk5vdGUgdG8g
U2VsZiAtIEkgbmVlZCB0byBzZWUgYWJvdXQgbWFraW5nIFhURiBtaWdyYXRlYWJsZSBzbyB3ZSBo
YXZlIGEKYmV0dGVyIG9wdGlvbiB0aGFuIHVzaW5nIG1zci11dGlscyBpbiBhIExpbnV4IGd1ZXN0
LCB3aGljaCBzdG9wcyB3b3JraW5nCmFzIGEgZGV2IHRlc3Qgd2hlbiBndWVzdCBrZXJuZWxzIGdh
aW4gbWl0aWdhdGlvbnMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
