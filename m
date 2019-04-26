From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpu: Use cpu_has_sep for configuring
 the SYSENTER MSRs
Date: Fri, 26 Apr 2019 04:57:42 -0600
Message-ID: <5CC2E4260200007800229686@prv1-mh.provo.novell.com>
References: <1556274165-31022-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJyYB-0003na-CJ
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 10:57:51 +0000
In-Reply-To: <1556274165-31022-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, FionaLi-oc <fionali-oc@zhaoxin.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE5IGF0IDEyOjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ3VycmVudGx5LCBjb25maWd1cmF0aW9uIG9mIHRoZSBTWVNFTlRFUiBNU1JzIGFyZSBi
ZWhpbmQgYSB2ZW5kb3IgY2hlY2sgZm9yCj4gSW50ZWwgYW5kIENlbnRhdXIsIGJ1dCB0aGlzIG1p
c3NlcyBaaGFveGluLgo+IAo+IFVzZSB0aGUgZmVhdHVyZSBiaXQsIHJhdGhlciB0aGFuIGEgdmVu
ZG9yIGNoZWNrLiAgY3B1X2hhc19zZXAgaXMgY2xlYXJlZCBlYXJseQo+IGZvciBBTUQgcHJvY2Vz
c29ycywgd2hpY2ggY2FuJ3QgdXNlIFNZU0VOVEVSL1NZU0VYSVQgd2hlbiBvcGVyYXRpbmcgaW4g
bG9uZwo+IG1vZGUuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
