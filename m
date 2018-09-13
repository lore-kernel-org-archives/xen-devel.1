From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 12/16] x86/mm: put
 paging_update_nestedmode under CONFIG_HVM
Date: Thu, 13 Sep 2018 17:39:47 +0100
Message-ID: <6603f57e-1b53-72c4-48ea-702ef6579a75@citrix.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-13-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yl3a=l3=citrix.com=prvs=787e22e97=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g0Uek-0000Pr-Vp
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:39:51 +0000
In-Reply-To: <20180904161533.11575-13-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDQvMjAxOCAwNToxNSBQTSwgV2VpIExpdSB3cm90ZToKPiBOZXN0ZWQgSFZNIGlzIG5v
dCBlbmFibGVkIHdoZW4gIUNPTkZJR19IVk0uCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
