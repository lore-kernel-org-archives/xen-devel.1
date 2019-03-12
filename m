From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v6 02/12] microcode/intel: use union to get
 fields without shifting and masking
Date: Tue, 12 Mar 2019 18:23:21 +0000
Message-ID: <20190312182321.5vrqwkcnlqhsprdz@zion.uk.xensource.com>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-3-git-send-email-chao.gao@intel.com>
 <20190312153337.nt4dwkufcjc7zvqc@Air-de-Roger>
 <5C87E1AB020000780021DD55@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7hwM=RP=citrix.com=prvs=967af9503=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h3m3h-0004ST-NJ
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 18:23:25 +0000
Content-Disposition: inline
In-Reply-To: <5C87E1AB020000780021DD55@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMTA6NDM6MjNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEyLjAzLjE5IGF0IDE2OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMDM6NTc6MjZQTSArMDgwMCwgQ2hhbyBH
YW8gd3JvdGU6Cj4gPiAKPiA+IFBsZWFzZSBhZGQgIk5vIGZ1bmN0aW9uYWwgY2hhbmdlIiB0byB0
aGUgY29tbWl0IGRlc2NyaXB0aW9uLgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiAKPiA+IFRoaXMgY2FuIGxpa2VseSBnbyBpbiBhaGVhZCBvZiB0
aGUgcmVzdCBvZiB0aGUgc2VyaWVzLgo+IAo+IEluZGVlZC4KCkkgaGF2ZSBwaWNrZWQgdXAgdGhp
cyBwYXRjaCBpbiBteSBwYXRjaCBzd2VlcGluZy4KCldlaS4KCj4gCj4gSmFuCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
