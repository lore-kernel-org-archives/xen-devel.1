From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v5 3/5] x86/mm: put nested p2m code under
 CONFIG_HVM
Date: Mon, 24 Sep 2018 16:42:47 +0100
Message-ID: <33539527-7ea4-339a-581e-a7ca69219e03@citrix.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
 <38e26d667982c03ad3701dd1f1f30c1f77ddf5c4.1537545258.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0lp=mg=citrix.com=prvs=798996f71=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g4T0e-0005mm-7T
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 15:42:52 +0000
In-Reply-To: <38e26d667982c03ad3701dd1f1f30c1f77ddf5c4.1537545258.git-series.wei.liu2@citrix.com>
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

T24gMDkvMjEvMjAxOCAwNDo1NCBQTSwgV2VpIExpdSB3cm90ZToKPiBUaGVzZSBmdW5jdGlvbnMg
YXJlIG9ubHkgdXNlZnVsIGZvciBuZXN0ZWQgaHZtLCB3aGljaCBpc24ndCBlbmFibGVkCj4gd2hl
biBDT05GSUdfSFZNIGlzIGZhbHNlLgo+IAo+IEVuY2xvc2UgcmVsZXZhbnQgY29kZSBhbmQgZmll
bGRzIGluIENPTkZJR19IVk0uCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
UmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
