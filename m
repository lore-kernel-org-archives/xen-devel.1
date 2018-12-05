From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/4] amd-iommu: add flush iommu_ops
Date: Wed, 05 Dec 2018 04:46:18 -0700
Message-ID: <5C07BA8A0200007800203169@prv1-mh.provo.novell.com>
References: <20181205112924.36470-1-paul.durrant@citrix.com>
 <20181205112924.36470-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUVdI-0005HW-8X
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 11:46:24 +0000
In-Reply-To: <20181205112924.36470-2-paul.durrant@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEyLjE4IGF0IDEyOjI5LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwo+IEBAIC02MzQsNiArNjM0
LDU2IEBAIGludCBhbWRfaW9tbXVfdW5tYXBfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBk
Zm4pCj4gICAgICBzcGluX3VubG9jaygmaGQtPmFyY2gubWFwcGluZ19sb2NrKTsKPiAgCj4gICAg
ICBhbWRfaW9tbXVfZmx1c2hfcGFnZXMoZCwgZGZuX3goZGZuKSwgMCk7Cj4gKyAgICByZXR1cm4g
MDsKPiArfQo+ICsKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgZmx1c2hfY291bnQodW5zaWduZWQg
bG9uZyBkZm4sIHVuc2lnbmVkIGludCBwYWdlX2NvdW50LAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gK3sKPiArICAgIHVuc2lnbmVkIGxv
bmcgc3RhcnQgPSBkZm4gPj4gb3JkZXI7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGVuZCA9IChkZm4g
KyBwYWdlX2NvdW50IC0gMSkgPj4gMTsKCkdyYW50ZWQgaW4gbXkgZWFybGllciByZXBseSBJIGhh
ZCBhIG1pc3Npbmcgb3BlbmluZyBwYXJlbnRoZXNpcywKYnV0IHRoZSBhYm92ZSBpcyBwcmV0dHkg
Y2xlYXJseSB0aGUgd3Jvbmcgd2F5IG9mIGFkZHJlc3NpbmcKdGhlIHJlc3VsdGluZyBidWlsZCBl
cnJvci4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
