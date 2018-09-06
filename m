From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 05/16] x86: PIT emulation is common to
 both PV and HVM
Date: Thu, 06 Sep 2018 08:26:33 -0600
Message-ID: <5B91391902000078001E5FD1@prv1-mh.provo.novell.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-6-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pp8w=lu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fxvF1-0005E1-NQ
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 14:26:39 +0000
In-Reply-To: <20180904161533.11575-6-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDE4OjE1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
TW92ZSB0aGUgZmlsZSB0byB4ODYgY29tbW9uIGNvZGUgYW5kIGNoYW5nZSBpdHMgbmFtZSB0byBl
bXVsLWk4MjU0LmMuCj4gCj4gUHV0IEhWTSBvbmx5IGNvZGUgdW5kZXIgQ09ORklHX0hWTSBvciBp
c19odm1fZG9tYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
