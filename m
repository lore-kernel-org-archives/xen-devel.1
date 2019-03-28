From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 08:53:06 +0100
Message-ID: <78816896-aa22-0031-4d36-bc33bee78c83@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com> <5C9C7BF1020000780022258F@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9Pqc-0001NN-BZ
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 07:53:14 +0000
In-Reply-To: <5C9C7BF1020000780022258F@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAwODo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTguMDMuMTkg
YXQgMTQ6MTEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGZyZWVpbmcg
cGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5nIHRoZW0KPj4gYWdhaW4g
d2hlbiByZXN1bWluZyBrZWVwIHRoZW0uIE9ubHkgZnJlZSBhbiBhcmVhIGluIGNhc2UgYSBjcHUg
ZGlkbid0Cj4+IGNvbWUgdXAgYWdhaW4gd2hlbiByZXN1bWluZy4KPiAKPiBUaGVyZSdzIGFub3Ro
ZXIgYXNwZWN0IGhlcmUgd2hpY2ggbmVlZHMgYXQgbGVhc3QgbWVudGlvbmluZzoKPiBSaWdodCBu
b3csIENQVXMgY29taW5nIGJhY2sgdXAgaGF2ZSB0aGVpciBwZXItQ1BVIGRhdGEKPiBjbGVhcmVk
LiBOb3QgZG9pbmcgc28gbWF5IGluZGVlZCBiZSBhbiBpbXByb3ZlbWVudCBpbgo+IHNvbWUgY2Fz
ZXMgKGxpa2Ugc3RhdGlzdGljcyBjb2xsZWN0ZWQpLCBidXQgbWF5IGFsc28gZ2V0IGluIHRoZQo+
IHdheSBpbiBvdGhlciBjYXNlcy4KCkkgaGF2ZSBjaGVja2VkIHRoZSByZXNwZWN0aXZlIGNwdSBu
b3RpZmllciBob29rcyBhbmQgSSB0aGluayB0aGlzIGlzIG5vCnByb2JsZW0uIEkgaG9wZSBJIGRp
ZG4ndCBvdmVybG9vayBzb21ldGhpbmcuCgpJJ2xsIGFkZCBhIG5vdGUgdG8gdGhlIGNvbW1pdCBt
ZXNzYWdlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
