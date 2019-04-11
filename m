From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
Date: Thu, 11 Apr 2019 04:45:41 -0600
Message-ID: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEXFC-0005RI-VS
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:47:47 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDU5N2ZiYjhiZTYgKCJ4ZW4vdGltZXJzOiBGaXggbWVtb3J5IGxlYWsgd2l0aCBjcHUg
dW5wbHVnL3BsdWciKQp3ZW50IGEgbGl0dGxlIHRvbyBmYXI6IE1pZ3JhdGluZyB0aW1lcnMgYXdh
eSBmcm9tIGEgQ1BVIGJlaW5nIG9mZmxpbmVkCm5lZWRzIHRvIGhlcHBlbiBpbmRlcGVuZGVudCBv
ZiB3aGV0aGVyIGl0IGdldCBwYXJrZWQgb3IgZnVsbHkgb2ZmbGluZWQuCgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL3RpbWVy
LmMKKysrIGIveGVuL2NvbW1vbi90aW1lci5jCkBAIC02MTksOCArNjE5LDYgQEAgc3RhdGljIHZv
aWQgZnJlZV9wZXJjcHVfdGltZXJzKHVuc2lnbmVkCiB7CiAgICAgc3RydWN0IHRpbWVycyAqdHMg
PSAmcGVyX2NwdSh0aW1lcnMsIGNwdSk7CiAKLSAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShj
cHUpOwotCiAgICAgQVNTRVJUKGhlYXBfbWV0YWRhdGEodHMtPmhlYXApLT5zaXplID09IDApOwog
ICAgIGlmICggaGVhcF9tZXRhZGF0YSh0cy0+aGVhcCktPmxpbWl0ICkKICAgICB7CkBAIC02NDgs
NiArNjQ2LDggQEAgc3RhdGljIGludCBjcHVfY2FsbGJhY2soCiAgICAgY2FzZSBDUFVfVVBfQ0FO
Q0VMRUQ6CiAgICAgY2FzZSBDUFVfREVBRDoKICAgICBjYXNlIENQVV9SRVNVTUVfRkFJTEVEOgor
ICAgICAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShjcHUpOworCiAgICAgICAgIGlmICggIXBh
cmtfb2ZmbGluZV9jcHVzICYmIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfc3VzcGVuZCApCiAg
ICAgICAgICAgICBmcmVlX3BlcmNwdV90aW1lcnMoY3B1KTsKICAgICAgICAgYnJlYWs7CgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
