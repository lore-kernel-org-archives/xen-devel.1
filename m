From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 11/11] vpci/msix: add MSI-X handlers
Date: Tue, 20 Mar 2018 07:10:39 -0600
Message-ID: <5AB1165F02000078001B3F03@prv-mh.provo.novell.com>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-12-roger.pau@citrix.com>
 <5AB0F87D02000078001B3E0B@prv-mh.provo.novell.com>
 <20180320114300.xzadfq244eihcgn3@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyH2K-0007WN-Ca
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:10:44 +0000
In-Reply-To: <20180320114300.xzadfq244eihcgn3@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAzLjE4IGF0IDEyOjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFNpbmNlIHlvdSBvbmx5IGhhZCBjb21tZW50cyBvbiBwYXRjaCA3IGFuZCAxMSBhbmQgdGhlcmUn
cyB0aGUgZXh0cmEKPiBmaXggZm9yIHRoZSB0ZXN0IGhhcm5lc3MsIHNob3VsZCBJIGp1c3Qgc2Vu
ZCB0aG9zZSBhbmQgcHJvdmlkZSB5b3UKPiB3aXRoIGEgZ2l0IGJyYW5jaCB0aGF0IGNvbnRhaW5z
IHRoZSByZXN0PwoKV2VsbCwgaWYgaXQncyBub3QgdG9vIG11Y2ggaGFzc2xlIGZvciB5b3UgSSdk
IHByZWZlciBpZiB5b3UgcmVzZW50IHRoZQpmdWxsIHNlcmllcyAob3IsIHNlZSBiZWxvdywgd2hh
dGV2ZXIgaXMgbGVmdCBhdCB0aGUgdGltZSB5b3UgZ2V0CmFyb3VuZCB0byBzZW5kIGl0KS4KCj4g
SSBjYW4gYWxzbyB3YWl0IGlmIHlvdSB3YW50IHRvIGNvbW1pdCB0aGUgc3RhcnQgb2YgdGhlIHNl
cmllcwo+IChwcm92aWRlZCBJIGdldCBhbGwgdGhlIHJlbGV2YW50IEFja3MpIGFuZCByZWJhc2Ug
b24gdG9wIG9mIHRoYXQuCgpJJ2QgbGVhdmUgdGhhdCB1cCB0byB5b3U7IGl0IGxvb2tzIGxpa2Ug
Ym90aCB0b29sIHN0YWNrIG1haW50YWluZXJzCmFyZSBub3QgYXJvdW5kIHJpZ2h0IG5vdywgc28g
dGhlaXIgYWNrIGZvciBwYXRjaCAxIG1heSB0YWtlIGEgZmV3Cm1vcmUgZGF5cyB0byBhcnJpdmUu
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
