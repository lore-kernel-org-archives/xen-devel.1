From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86/hvm: Switch hvm_allow_get_param()
 to use a whitelist
Date: Fri, 07 Sep 2018 00:30:20 -0600
Message-ID: <5B921AFC02000078001E623C@prv1-mh.provo.novell.com>
References: <1536171124-27053-1-git-send-email-andrew.cooper3@citrix.com>
 <1536171124-27053-2-git-send-email-andrew.cooper3@citrix.com>
 <c2554d76f69749078dfe1ca60340042e@AMSPEX02CL03.citrite.net>
 <2145af5a-d61e-9b0c-2d47-b3f4e155306b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <2145af5a-d61e-9b0c-2d47-b3f4e155306b@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE3OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDYvMDkvMTggMDk6NTYsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4g
aW5kZXggYzIyYmYwYi4uOTZhNjMyMyAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4+IEBAIC00MzUwLDcgKzQz
NTAsNyBAQCBzdGF0aWMgaW50IGh2bV9hbGxvd19nZXRfcGFyYW0oc3RydWN0IGRvbWFpbiAqZCwK
Pj4+Cj4+PiAgICAgIHN3aXRjaCAoIGEtPmluZGV4ICkKPj4+ICAgICAgewo+Pj4gLSAgICAvKiBU
aGUgZm9sbG93aW5nIHBhcmFtZXRlcnMgY2FuIGJlIHJlYWQgYnkgdGhlIGd1ZXN0LiAqLwo+Pj4g
KyAgICAgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIGNhbiBiZSByZWFkIGJ5IHRoZSBn
dWVzdCBhbmQgdG9vbHN0YWNrLiAqLwo+PiBJbnRlbnRpb25hbCBpbmRlbnRhdGlvbiBjaGFuZ2U/
IEkgZ3Vlc3Mgc28gc2luY2UgeW91IGRvIGl0IGFnYWluIGJlbG93LCBidXQganVzdCBjaGVja2lu
Zy4KPiAKPiBZZXMgLSB0aGlzIGlzIHdoZXJlIEJTRCBzdHlsZSBwdXRzIGNvbW1lbnRzLCBhcyB5
b3UgYXJlIGluc2lkZSB0aGUKPiBicmFjZWQgc2NvcGUgb2YgdGhlIHN3aXRjaCBzdGF0ZW1lbnQu
CgpXZWxsLCBJJ20gaW5jbGluZWQgdG8gc3VwcG9ydCBQYXVsIGhlcmUsIG5vIG1hdHRlciB3aGF0
IEJTRCBzdHlsZSBtYXkKaGF2ZSB0byBzYXkuIE91ciBvd24gc3R5bGUgZGVzY3JpcHRpb24gZG9l
c24ndCBzcGVsbCBvdXQgYW55dGhpbmcKZWl0aGVyIHdheS4uLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
