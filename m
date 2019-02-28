From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] x86/dom0: propagate PVH vlapic
 EOIs to hardware
Date: Thu, 28 Feb 2019 12:42:47 +0100
Message-ID: <165b73e0-204b-d6f1-32b4-fa20a1f24c5b@suse.com>
References: <20190227115156.54031-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gzK5W-0001PC-QD
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 11:42:54 +0000
In-Reply-To: <20190227115156.54031-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMjAxOSAxMjo1MSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgY2hl
Y2sgZm9yIE1TSSBFSU8gaXMgbWlzc2luZyBhIHNwZWNpYWwgY2FzZSBmb3IgUFZIIERvbTAsCj4g
d2hpY2ggZG9lc24ndCBoYXZlIGEgaHZtX2lycV9kcGNpIHN0cnVjdCBidXQgcmVxdWlyZXMgRUlP
cyB0byBiZQo+IGZvcndhcmRlZCB0byB0aGUgcGh5c2ljYWwgbGFwaWMgZm9yIHBhc3NlZC10aHJv
dWdoIGRldmljZXMuCj4gCj4gQWRkIGEgc2hvcnQtY2lyY3VpdCB0byBhbGxvdyBFT0lzIGZyb20g
UFZIIERvbTAgdG8gYmUgcHJvcGFnYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
