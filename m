From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/7] vtd: change lookup_page failure
 semantics
Date: Fri, 21 Sep 2018 04:16:30 -0600
Message-ID: <5BA4C4FE02000078001EA795@prv1-mh.provo.novell.com>
References: <20180920141149.1643-1-paul.durrant@citrix.com>
 <20180920141149.1643-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q3to=md=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g3IUE-0001NU-QX
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:16:34 +0000
In-Reply-To: <20180920141149.1643-7-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA5LjE4IGF0IDE2OjExLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IENvbW1pdCA0M2QxNjIyYiAidnRkOiBhZGQgbG9va3VwX3BhZ2UgbWV0aG9kIHRvIGlvbW11
X29wcyIgYWRkZWQgYQo+IGxvb2t1cCBtZXRob2QgaW4gdG8gdGhlIFZULWQgSU9NTVUgaW1wbGVt
ZW50YXRpb24uCgpXaXRoIHRoaXMgbm90IGhhdmluZyBnb25lIGluIHlldCwgaXMgdGhlcmUgYW55
IHJlYXNvbiBub3QgdG8gbWFrZSB0aGUKYWRqdXN0bWVudCByaWdodCB0aGVyZT8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
