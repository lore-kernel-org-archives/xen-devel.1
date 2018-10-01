From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 0/2] ns16550: enable use of PCI MSI
Date: Mon, 01 Oct 2018 10:03:30 -0600
Message-ID: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ngkg=mn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g70fZ-0003oh-Jv
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 16:03:37 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2ggMiBpcyBubyBsb25nZXIgUkZDLCBub3cgdGhhdCBJIGhhdmUgYSBkZXZpY2Ugd2hlcmUg
TVNJIGFjdHVhbGx5CndvcmtzIChzdWdnZXN0aW5nIHRoYXQgaXQgd2FzIHJlYWxseSB0aGUgb3Ro
ZXIgZGV2aWNlJ3MgZmF1bHQgdGhhdCB0aGluZ3MKZGlkbid0IHdvcmspLgoKMTogY29uc29sZTog
YWRqdXN0IElSUSBpbml0aWFsaXphdGlvbgoyOiBuczE2NTUwOiBlbmFibGUgdXNlIG9mIFBDSSBN
U0kKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
