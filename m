From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v11 6/7] vtd: add missing check for shared
 EPT...
Date: Wed, 19 Sep 2018 17:23:08 +0100
Message-ID: <20180919162308.enowpyffv32nwcn3@zion.uk.xensource.com>
References: <20180919083602.8201-1-paul.durrant@citrix.com>
 <20180919083602.8201-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fFw-0005g6-OR
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:23:12 +0000
Content-Disposition: inline
In-Reply-To: <20180919083602.8201-7-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMDk6MzY6MDFBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmluIGludGVsX2lvbW11X3VubWFwX3BhZ2UoKS4KPiAKPiBUaGlzIHBhdGNoIGFs
c28gaW5jbHVkZXMgc29tZSBub24tZnVuY3Rpb25hbCBtb2RpZmljYXRpb25zIGluCj4gaW50ZWxf
aW9tbXVfbWFwX3BhZ2UoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwu
ZHVycmFudEBjaXRyaXguY29tPgo+IEFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKVGhp
cyBwYXRjaCBjb250YWlucyBtb3JlIGNsZWFudXAgY2hhbmdlcyB0aGVuIGl0cyBtZWF0LCBIZWgu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
