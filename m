From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 5/3] x86/shadow: emulate_gva_to_mfn() should
 respect p2m_ioreq_server
Date: Tue, 13 Nov 2018 03:46:59 -0700
Message-ID: <5BEAABA302000078001FB62E@prv1-mh.provo.novell.com>
References: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k8x1=ny=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMWDo-000562-JO
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 10:47:04 +0000
In-Reply-To: <5BEAA1DB02000078001FB5BD@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

V3JpdGVzIHRvIHN1Y2ggcGFnZXMgd291bGQgbmVlZCB0byBiZSBoYW5kZWQgdG8gdGhlIGVtdWxh
dG9yLCB3aGljaCB3ZSdyZQpub3QgcHJlcGFyZWQgdG8gZG8gYXQgdGhpcyBwb2ludC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9zaGFkb3cvaHZtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9odm0uYwpA
QCAtMzM4LDcgKzMzOCw3IEBAIHN0YXRpYyBtZm5fdCBlbXVsYXRlX2d2YV90b19tZm4oc3RydWN0
IHYKICAgICB7CiAgICAgICAgIHJldHVybiBfbWZuKEJBRF9HRk5fVE9fTUZOKTsKICAgICB9Ci0g
ICAgaWYgKCBwMm1faXNfZGlzY2FyZF93cml0ZShwMm10KSApCisgICAgaWYgKCBwMm1faXNfZGlz
Y2FyZF93cml0ZShwMm10KSB8fCBwMm10ID09IHAybV9pb3JlcV9zZXJ2ZXIgKQogICAgIHsKICAg
ICAgICAgcHV0X3BhZ2UocGFnZSk7CiAgICAgICAgIHJldHVybiBfbWZuKFJFQURPTkxZX0dGTik7
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
