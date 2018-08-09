From: kbuild test robot <fengguang.wu@intel.com>
Subject: [RFC PATCH] xen/blkback: xen_blkif_pgrant_timeout can
 be static
Date: Fri, 10 Aug 2018 06:33:17 +0800
Message-ID: <20180809223317.GA3009__27667.5574285493$1533853949$gmane$org@lkp-ivb-ep02>
References: <20180808142528.31029-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m23p=ky=intel.com=lkp@srs-us1.protection.inumbo.net>)
 id 1fntUl-0002Fb-8i
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 22:33:27 +0000
Content-Disposition: inline
In-Reply-To: <20180808142528.31029-2-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: axboe@kernel.dk, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, kbuild-all@01.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

CkZpeGVzOiA1YmVkMjUzNzk1NjUgKCJ4ZW4vYmxrYmFjazogZG9uJ3Qga2VlcCBwZXJzaXN0ZW50
IGdyYW50cyB0b28gbG9uZyIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxmZW5n
Z3Vhbmcud3VAaW50ZWwuY29tPgotLS0KIGJsa2JhY2suYyB8ICAgIDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9i
bGtiYWNrLmMKaW5kZXggZjM0MWFjOC4uOWVhZTdiMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2svYmxrYmFjay5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
YmxrYmFjay5jCkBAIC04OCw3ICs4OCw3IEBAIE1PRFVMRV9QQVJNX0RFU0MobWF4X3BlcnNpc3Rl
bnRfZ3JhbnRzLAogICogdXNlLiBUaGUgdGltZSBpcyBpbiBzZWNvbmRzLCAwIG1lYW5zIGluZGVm
aW5pdGVseSBsb25nLgogICovCiAKLXVuc2lnbmVkIGludCB4ZW5fYmxraWZfcGdyYW50X3RpbWVv
dXQgPSA2MDsKK3N0YXRpYyB1bnNpZ25lZCBpbnQgeGVuX2Jsa2lmX3BncmFudF90aW1lb3V0ID0g
NjA7CiBtb2R1bGVfcGFyYW1fbmFtZWQocGVyc2lzdGVudF9ncmFudF91bnVzZWRfc2Vjb25kcywg
eGVuX2Jsa2lmX3BncmFudF90aW1lb3V0LAogCQkgICB1aW50LCAwNjQ0KTsKIE1PRFVMRV9QQVJN
X0RFU0MocGVyc2lzdGVudF9ncmFudF91bnVzZWRfc2Vjb25kcywKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
