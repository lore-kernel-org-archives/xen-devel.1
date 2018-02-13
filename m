From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/srat: fix end calculation in
	nodes_cover_memory()
Date: Tue, 13 Feb 2018 17:59:51 +0000
Message-ID: <5106aae0-5fa0-63b5-4d13-f98a78cd89c4@citrix.com>
References: <5A832A4002000078001A7764@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=l2lz=fh=citrix.com=prvs=5754f3e4f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eles5-0004No-HC
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 18:00:01 +0000
In-Reply-To: <5A832A4002000078001A7764@prv-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDIvMTggMTc6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFsb25nIHRoZSBsaW5lcyBv
ZiBjb21taXQgNzIyNjQ4Njc2NyAoIng4Ni9zcmF0OiBmaXggdGhlIGVuZCBwZm4gY2hlY2sKPiBp
biB2YWxpZF9udW1hX3JhbmdlKCkiKSBub2Rlc19jb3Zlcl9tZW1vcnkoKSBhbHNvIGRvZXNuJ3Qg
Y29uc2lzdGVudGx5Cj4gdXNlICJlbmQiOiBJdCdzIHNldCB0byBhbiBpbmNsdXNpdmUgdmFsdWUg
aW5pdGlhbGx5LCBidXQgdGhlbiBjb21wYXJlZAo+IHRvIHRoZSBleGNsdXNpdmUgImVuZCIgZmll
bGQgb2Ygc3RydWN0IG5vZGUgYW5kIGFsc28gcG9zc2libHkgc2V0IHRvCj4gbm9kZXNbal0uc3Rh
cnQsIG1ha2luZyBpdCBleGNsdXNpdmUgdG9vLiBDaGFuZ2UgdGhlIGluaXRpYWxpemF0aW9uIHRv
Cj4gbWFrZSB0aGUgdmFyaWFibGUgY29uc2lzdGVudGx5IGV4Y2x1c2l2ZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
