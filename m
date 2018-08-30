From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] tools/libxl: correct vcpu affinity
 output with sparse physical cpu map
Date: Thu, 30 Aug 2018 10:11:54 +0200
Message-ID: <34fa0d2b-beb9-11df-6e90-e0496680a1d5@suse.com>
References: <20180829182302.9977-1-jgross@suse.com>
 <20180829182302.9977-2-jgross@suse.com> <5B87A5B402000078001E361E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aext=ln=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvI3Z-0007Dy-KH
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:11:57 +0000
In-Reply-To: <5B87A5B402000078001E361E@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMTA6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI5LjA4LjE4IGF0
IDIwOjIzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gV2l0aCBub3QgYWxsIHBoeXNpY2Fs
IGNwdXMgb25saW5lIChpLmUuIHdpdGggc210PTApIHRoZSBvdXRwdXQgb2YgaHRlCj4gCj4gSSB0
aGluayB5b3UgbWVhbiAiZS5nLiIgaW5zdGVhZCBvZiAiaS5lLiIgaGVyZSwgYXMgdGhlcmUgYXJl
IG90aGVyCj4gbWVhbnMgdG8gaGF2ZSBzb21lIENQVXMgb2ZmbGluZS4KCkkgdXNlZCBpdCBpbiB0
aGUgbWVhbmluZyBvZiAibmFtZWx5IiwgaW4gb3JkZXIgdG8gaGlnaGxpZ2h0IHRoZSByZWNlbnQK
Y2hhbmdlIHRvIFhlbiBtYWtpbmcgaXQgbW9yZSBjbGVhciB3aHkgdGhlIGNoYW5nZSBpcyBJTU8g
aW1wb3J0YW50LgoKSW4gdGhlIGVuZCBJIGRvbid0IG1pbmQgdGhpcyBiZWluZyBjaGFuZ2VkIHRv
ICJlLmcuIiB3aGVuIGNvbW1pdHRpbmcuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
