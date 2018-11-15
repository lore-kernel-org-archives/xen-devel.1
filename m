From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 2/3] x86/HVM: hvm_map_guest_frame_rw() should
 respect p2m_ioreq_server
Date: Thu, 15 Nov 2018 05:50:44 -0700
Message-ID: <5BED6BA402000078001FC622@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
 <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNH6e-0000x2-FA
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:50:48 +0000
In-Reply-To: <5BED6A7E02000078001FC615@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V3JpdGVzIHRvIHN1Y2ggcGFnZXMgd291bGQgbmVlZCB0byBiZSBoYW5kZWQgdG8gdGhlIGVtdWxh
dG9yLCB3aGljaCB3ZSdyZQpub3QgcHJlcGFyZWQgdG8gZG8gYXQgdGhpcyBwb2ludC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgotLS0gYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTI1NTgsNyArMjU1OCw4
IEBAIHN0YXRpYyB2b2lkICpfaHZtX21hcF9ndWVzdF9mcmFtZSh1bnNpZ24KIAogICAgIGlmICgg
d3JpdGFibGUgKQogICAgIHsKLSAgICAgICAgaWYgKCB1bmxpa2VseShwMm1faXNfZGlzY2FyZF93
cml0ZShwMm10KSkgKQorICAgICAgICBpZiAoIHVubGlrZWx5KHAybV9pc19kaXNjYXJkX3dyaXRl
KHAybXQpKSB8fAorICAgICAgICAgICAgIHVubGlrZWx5KHAybXQgPT0gcDJtX2lvcmVxX3NlcnZl
cikgKQogICAgICAgICAgICAgKndyaXRhYmxlID0gMDsKICAgICAgICAgZWxzZSBpZiAoICFwZXJt
YW5lbnQgKQogICAgICAgICAgICAgcGFnaW5nX21hcmtfcGZuX2RpcnR5KGQsIF9wZm4oZ2ZuKSk7
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
