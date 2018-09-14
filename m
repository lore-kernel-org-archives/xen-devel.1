From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xenbus: process otherend_watch event at
 'state' entry in xenwatch multithreading
Date: Fri, 14 Sep 2018 11:04:12 +0200
Message-ID: <1c316a90-0115-3994-8469-b5017f20afc2__20508.8339317173$1536915777$gmane$org@suse.com>
References: <1536910456-13337-1-git-send-email-dongli.zhang@oracle.com>
 <1536910456-13337-5-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rzwb=l4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g0k1P-0001jh-OJ
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 09:04:15 +0000
In-Reply-To: <1536910456-13337-5-git-send-email-dongli.zhang@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: wei.liu2@citrix.com, konrad.wilk@oracle.com, srinivas.eeda@oracle.com, paul.durrant@citrix.com, boris.ostrovsky@oracle.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDkvMTggMDk6MzQsIERvbmdsaSBaaGFuZyB3cm90ZToKPiBUaGlzIGlzIHRoZSA0dGgg
cGF0Y2ggb2YgYSAoNi1wYXRjaCkgcGF0Y2ggc2V0Lgo+IAo+IFdpdGggdGhpcyBwYXRjaCwgd2F0
Y2ggZXZlbnQgaW4gYWJzb2x1dGUgcGF0aCBwYXR0ZXJuCj4gJy9sb2NhbC9kb21haW4vPGRvbWlk
Pi9kZXZpY2UvPHB2ZGV2Pi88aGFuZGxlPi9zdGF0ZScgY2FuIGJlIHByb2Nlc3NlZCBpbgo+IHBl
ci1kb21VIHhlbndhdGNoIHRocmVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcg
PGRvbmdsaS56aGFuZ0BvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
