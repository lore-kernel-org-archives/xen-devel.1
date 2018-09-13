From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: fix GCC warning and remove duplicate
 EVTCHN_ROW/EVTCHN_COL usage
Date: Thu, 13 Sep 2018 07:13:46 +0200
Message-ID: <37107f15-119b-118e-cbd3-1bb87356e442__6269.34410906887$1536815558$gmane$org@suse.com>
References: <20180913011354.GA19226@josh-ThinkPad-T460s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bifp=l3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g0Jwv-0005yO-4S
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 05:13:53 +0000
In-Reply-To: <20180913011354.GA19226@josh-ThinkPad-T460s>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Josh Abraham <j.abraham1776@gmail.com>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, aams@amazon.com, linux-kernel@vger.kernel.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDkvMTggMDM6MTMsIEpvc2ggQWJyYWhhbSB3cm90ZToKPiBUaGlzIHBhdGNoIHJlbW92
ZXMgZHVwbGljYXRlIG1hY3JvIHVzZWFnZSBpbiBldmVudHNfYmFzZS5jLgo+IAo+IEl0IGFsc28g
Zml4ZXMgZ2NjIHdhcm5pbmc6Cj4gdmFyaWFibGUg4oCYY29s4oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIEFi
cmFoYW0gPGouYWJyYWhhbTE3NzZAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
