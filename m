From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 5/8] microcode: split out
 apply_microcode() from cpu_request_microcode()
Date: Fri, 08 Feb 2019 08:58:16 -0700
Message-ID: <5C5DA7180200007800215249@prv1-mh.provo.novell.com>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-6-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7NEh=QP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gs8Xi-00025F-Fm
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 15:58:18 +0000
In-Reply-To: <1548659210-16870-6-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAxLjE5IGF0IDA4OjA2LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2FtZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L21p
Y3JvY29kZV9hbWQuYwo+IEBAIC0yOTcsNiArMjk3LDEwIEBAIHN0YXRpYyBpbnQgYXBwbHlfbWlj
cm9jb2RlKHVuc2lnbmVkIGludCBjcHUpCj4gIAo+ICAgICAgdWNpLT5jcHVfc2lnLnJldiA9IHJl
djsKPiAgCj4gKyNpZiBDT05GSUdfSFZNCj4gKyAgICBzdm1faG9zdF9vc3Z3X2luaXQoKTsKPiAr
I2VuZGlmCgojaWZkZWYgKGl0J3MgYmVlbiB3cm9uZyBhdCB3aGVyZSB5b3UgbW92ZSBpdCBmcm9t
KQoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
