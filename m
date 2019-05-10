From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
Date: Fri, 10 May 2019 07:28:15 -0600
Message-ID: <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5ZU-0003Yi-8t
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:28:20 +0000
In-Reply-To: <20190507151458.29350-15-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgK
PiBAQCAtNjU4LDQgKzY1OCwxOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2hhcmVfeGVuX3BhZ2Vf
d2l0aF9wcml2aWxlZ2VkX2d1ZXN0cygKPiAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3Qo
cGFnZSwgZG9tX3hlbiwgZmxhZ3MpOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBEdW1teSBpbXBsZW1l
bnRhdGlvbiBvZiBNMlAtcmVsYXRlZCBoZWxwZXJzIGZvciBjb21tb24gY29kZSB3aGVuCj4gKyAq
IHRoZSBhcmNoaXRlY3R1cmUgZG9lc24ndCBoYXZlIGFuIE0yUC4KPiArICovCj4gKyNpZm5kZWYg
Q09ORklHX0hBU19NMlAKPiArCj4gKyNkZWZpbmUgSU5WQUxJRF9NMlBfRU5UUlkgICAgICAgICh+
MFVMKQo+ICsjZGVmaW5lIFNIQVJFRF9NMlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPiAr
I2RlZmluZSBTSEFSRURfTTJQKF9lKSAgICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRS
WSkKPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcGZuX2Zyb21fbWZuKG1mbl90IG1mbiwg
dW5zaWduZWQgbG9uZyBwZm4pIHt9Cj4gKwo+ICsjZW5kaWYKCkluIG9yZGVyIGZvciB0aGluZ3Mg
dG8gbm90IGJlIHNjYXR0ZXJlZCBhcm91bmQsIGNvdWxkCmRvbWFpbl9zaGFyZWRfaW5mb19nZm4o
KSAoc2VlIHBhdGNoIDkpIG1vdmUgaGVyZT8gSXQgZG9lc24ndApsb29rIGFzIGlmIHRoaXMgd291
bGQgY2F1c2UgYSBidWlsZCBpc3N1ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
