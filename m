From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/HVM: prefill cache with PDPTEs when
 possible
Date: Tue, 24 Jul 2018 01:04:04 -0600
Message-ID: <5B56CF6402000078001D6F89@prv1-mh.provo.novell.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
 <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
 <5B507A6102000078001D5DDD@prv1-mh.provo.novell.com>
 <65e2cc63-e956-86ca-2c46-55dd0157ae9e@citrix.com>
 <5B50DA850200007800137618@prv1-mh.provo.novell.com>
 <95a0aace-ae9b-6595-978c-05a1de712f6c@citrix.com>
 <5B50DFE70200007800137635@prv1-mh.provo.novell.com>
 <4ba21c83-e1e5-fa2b-01e0-04f2b92b79aa@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhrMh-00062t-6e
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 07:04:11 +0000
In-Reply-To: <4ba21c83-e1e5-fa2b-01e0-04f2b92b79aa@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA3LjE4IGF0IDIxOjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT2ggLSBJJ2Qgbm90IGxvb2tlZCBpbiB0aGF0IG11Y2ggZGV0YWlsIGF0IHlvdXIgYWxn
b3JpdGhtLiAgQXMgYSBmaXJzdAo+IGd1dCBmZWVsLCB0YWdnaW5nIGJ5IGxldmVsIGRvZXNuJ3Qg
c291bmQgYXMgaWYgaXQgd2lsbCBpbnRlcmFjdAo+IGNvcnJlY3RseSB3aXRoIGxpbmVhciBwYWdl
dGFibGVzLgo+IAo+IEJvdGggdGhlIEludGVsIGFuZCBBTUQgT1JNJ3MgbWFpbnRhaW4gcGFnaW5n
IHN0cnVjdHVyZSBjYWNoZXMgc28gSSdkCj4gZXhwZWN0IHRoYXQgYSBsaW5lYXIgcGFnZXRhYmxl
IGVudHJ5IHdvdWxkIGJlIHNlcnZlZCBmcm9tIHRoYXQgY2FjaGUKPiByYXRoZXIgdGhhbiBiZWlu
ZyByZWFkIHR3aWNlIGZyb20gUkFNLgoKSXMgdGhlcmUgYW55d2hlcmUgZW5vdWdoIGRldGFpbCBh
Ym91dCB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uIG9mCnRoZSBwYWdpbmcgc3RydWN0dXJlIGNh
Y2hlcz8gSSBjb3VsZCBpbWFnaW5lIHRoZW0gYmVpbmcgcGVyIGxldmVsLiBJdAp3b3VsZG4ndCBi
ZSB2ZXJ5IGRpZmZpY3VsdCB0byBzd2l0Y2ggdG8gYSB0cmlzdGF0ZSBoZXJlIChub3JtYWwgZGF0
YSwKcGFnZSB0YWJsZSwgYW5kIFBBRSBMMykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
