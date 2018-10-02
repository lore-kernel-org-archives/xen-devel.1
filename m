From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 2/4] tools/xen-hvmctx: drop bogus casts from
 dump_lapic_regs()
Date: Tue, 02 Oct 2018 05:51:14 -0600
Message-ID: <5BB35BB202000078001EDB47@prv1-mh.provo.novell.com>
References: <5BB35A0F02000078001EDB39@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7JCw-0000bq-4T
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 11:51:18 +0000
In-Reply-To: <5BB35A0F02000078001EDB39@prv1-mh.provo.novell.com>
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNhc3RzIHdlcmVuJ3QgZXZlbiB0byB0aGUgcmlnaHQgdHlwZSAtIGFsbCBMQVBJQyByZWdp
c3RlcnMgYXJlCjMyLWJpdCAocGFpcnMvZ3JvdXBzIG9mIHJlZ2lzdGVycyBtYXkgYmUgY29tYmlu
ZWQgdG8gZm9ybSBsYXJnZXIgbG9naWNhbApvbmVzLCBidXQgdGhpcyBpcyBub3QgdmlzaWJsZSBp
biB0aGUgZ2l2ZW4gZGF0YSByZXByZXNlbnRhdGlvbikuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS90b29scy9taXNjL3hlbi1odm1jdHguYwor
KysgYi90b29scy9taXNjL3hlbi1odm1jdHguYwpAQCAtMjUwLDkgKzI1MCw5IEBAIHN0YXRpYyB2
b2lkIGR1bXBfbGFwaWNfcmVncyh2b2lkKQogICAgIHByaW50ZigiICAgIExBUElDIHJlZ2lzdGVy
czpcbiIpOwogICAgIGZvciAoIGkgPSAwIDsgaSA8IDB4NDAwIDsgaSArPSAzMiApCiAgICAgewot
ICAgICAgICBwcmludGYoIiAgICAgICAgICAweCU0LjR4OiAweCUxNi4xNmxseCAgIDB4JTQuNHg6
IDB4JTE2LjE2bGx4XG4iLAotICAgICAgICAgICAgICAgaSwgKih1bnNpZ25lZCBsb25nIGxvbmcg
Kikmci5kYXRhW2ldLCAKLSAgICAgICAgICAgICAgIGkgKyAxNiwgKih1bnNpZ25lZCBsb25nIGxv
bmcgKikmci5kYXRhW2kgKyAxNl0pOyAgICAgICAgCisgICAgICAgIHByaW50ZigiICAgICAgICAg
IDB4JTAzeDogMHglMDgiIFBSSXgzMiAiICAgMHglMDN4OiAweCUwOCIgUFJJeDMyICJcbiIsCisg
ICAgICAgICAgICAgICBpLCAqKHVpbnQzMl90ICopJnIuZGF0YVtpXSwKKyAgICAgICAgICAgICAg
IGkgKyAxNiwgKih1aW50MzJfdCAqKSZyLmRhdGFbaSArIDE2XSk7CiAgICAgfQogfQogCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
