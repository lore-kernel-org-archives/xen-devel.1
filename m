From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: suppress general register update upon
 AVX gather failures
Date: Fri, 29 Mar 2019 03:39:48 -0600
Message-ID: <5C9DE7E40200007800222BA7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9nzO-0005IG-Ri
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 09:39:54 +0000
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgZGVzdGluYXRpb24gYW5kIG1hc2sgcmVnaXN0ZXJzIG1heSBpbmRlZWQgbmVlZCB1cGRh
dGluZyBpbiB0aGlzCmNhc2UsIHRoZSBySVAgdXBkYXRlIGluIHBhcnRpY3VsYXIgbmVlZHMgdG8g
YmUgYXZvaWRlZCwgYXMgd2VsbCBhcyBlLmcuCnJhaXNpbmcgYSBzaW5nbGUgc3RlcCB0cmFwLgoK
UmVwb3J0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KVGhpcyBpcyBz
dXJlbHkgYSBzdGFibGUgdHJlZSBjYW5kaWRhdGUsIHVubGVzcyBpdCBjb3VsZCBzdGlsbCBtYWtl
IGl0CmludG8gNC4xMiBiZWZvcmUgdGhlIHJlbGVhc2UuCi0tLQpPYnZpb3VzbHkgSSdtIGZvbGRp
bmcgdGhlIHNhbWUgY2hhbmdlIGludG8gdGhlIEFWWDUxMkYgZ2F0aGVyIGFuZApzY2F0dGVyIHBh
dGNoZXMgYXMgd2VsbCBhcyB0aGUgQVZYNTEyUEYgb25lLgoKLS0tIGEveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4
Nl9lbXVsYXRlLmMKQEAgLTg1NDcsNiArODU0Nyw5IEBAIHg4Nl9lbXVsYXRlKAogICAgICAgICBp
bnZva2Vfc3R1YigiIiwgIiIsICIrbSIgKG1hc2spIDogImEiICgmbWFzaykpOwogICAgICAgICBw
dXRfc3R1YihzdHViKTsKIAorICAgICAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tBWSApCisgICAg
ICAgICAgICBnb3RvIGRvbmU7CisKICAgICAgICAgc3RhdGUtPnNpbWRfc2l6ZSA9IHNpbWRfbm9u
ZTsKICAgICAgICAgYnJlYWs7CiAgICAgfQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
