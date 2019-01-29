From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v5 1/8] microcode/intel: remove redundent
 check against ucode size
Date: Tue, 29 Jan 2019 03:26:18 -0700
Message-ID: <5C502A4A020000780014B80B@prv1-mh.provo.novell.com>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <1548659210-16870-2-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1goQb1-0007ax-Oe
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 10:26:23 +0000
In-Reply-To: <1548659210-16870-2-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: chao.gao@intel.com
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+IDAxLzI4LzE5IDg6MDYgQU0gPj4+Cj5U
aGlzIGNoZWNrIGhhcyBiZWVuIGRvbmUgaW4gbWljcm9jb2RlX3Nhbml0eV9jaGVjaygpLiBOZWVk
bid0IGRvIGl0Cj5hZ2FpbiBpbiBnZXRfbWF0Y2hpbmdfbWljcm9jb2RlKCkuCgpCdXQgd2hpbGUg
dGhlcmUgYXJlIHR3byBjYWxsIHNpdGVzIG9mIGdldF9tYXRjaGluZ19taWNyb2NvZGUoKSBvbmx5
Cm9uZSBpcyBwcmVjZWRlZCBieSBhIGNhbGwgdG8gbWljcm9jb2RlX3Nhbml0eV9jaGVjaygpLiBU
aGVyZSdzIGFsc28Kbm8gdmlzaWJsZSBjb25uZWN0aW9uIGJldHdlZW4gY3B1X3JlcXVlc3RfbWlj
cm9jb2RlKCkgKHdoaWNoIGZyZWVzCnRoZSBibG9iIGl0IGhhcyB2YWxpZGF0ZWQpIGFuZCBtaWNy
b2NvZGVfcmVzdW1lX21hdGNoKCkgKGFuZCBpbgpwYXJ0aWN1bGFyIHRoZSBibG9iIHBhc3NlZCBp
bnRvIHRoZXJlKS4gV2hhdCBhbSBJIG1pc3Npbmc/CgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
