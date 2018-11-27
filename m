From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 09:38:24 -0700
Message-ID: <5BFD7300020000780020077D@prv1-mh.provo.novell.com>
References: <20181127145808.28118-1-paul.durrant@citrix.com>
 <5BFD69780200007800200734@prv1-mh.provo.novell.com>
 <0c1c8dba2ab14ea998cd4fb0c16cb458@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2mkr=og=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRgNZ-0005cI-6D
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 16:38:29 +0000
In-Reply-To: <0c1c8dba2ab14ea998cd4fb0c16cb458@AMSPEX02CL03.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDE3OjA1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFdlbGwsIEkgY291bGQganVzdCBsZWF2ZSBQVi1JT01NVSB1bmltcGxlbWVudGVkIGZvciBB
TUQgaC93IGlmIHlvdSB0aGluayB0aGUgCj4gcGFnZSBtZXJnaW5nIGNvZGUgaXMgbW9yZSBpbXBv
cnRhbnQgc2luY2UsIHdpdGhvdXQgdGhlIHNwYXJlIGlnbm9yZWQgYml0cywgSSAKPiBoYXZlIG5v
IHdheSB0byB0cmFjayBwYWdlcyBhZGRlZCBieSB0aGUgaHlwZXJjYWxsIHZzLiB0aG9zZSBhZGRl
ZCBhdCBzdGFydCBvZiAKPiBkYXkuIEkgcGVyc29uYWxseSB0aGluayB0aGF0IHRoZSBzaW1wbGVy
IGNvZGUgaXMgd29ydGh3aGlsZSBpbiBpdHNlbGYgYnV0IEkgCj4gZ3Vlc3MgeW91IGRpc2FncmVl
LgoKTm90IGV4YWN0bHk6IFdpdGggYSBwcm9wZXIgcmVhc29uIChoZXJlOiB5b3UgbmVlZCB0byBm
cmVlIHVwIGF0IGxlYXN0Cm9uZSBvZiB0aGUgYml0czsgImZvciBvdGhlciBwb3RlbnRpYWwgdXNl
IiBzaW1wbHkgaXMgdG9vIHZhZ3VlIGZvciBteQp0YXN0ZSwgYW5kIHRvIGJlIGhvbmVzdCBJIGhh
ZCBhbHJlYWR5IGZvcmdvdHRlbiBhYm91dCB0aGlzIG5lZWQgb2YKeW91cnMpLCBJIGNhbiBsaXZl
IHdpdGggdGhpcy4gUGx1cyBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9mIHRoaXMgY29kZQphbnl3
YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
