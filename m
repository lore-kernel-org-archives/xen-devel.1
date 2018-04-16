From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 08/12] os-posix: Provide new
 -runas <uid>:<gid> facility
Date: Mon, 16 Apr 2018 18:00:44 +0100
Message-ID: <23252.54972.659826.276061@mariner.uk.xensource.com>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520535787-6223-9-git-send-email-ian.jackson@eu.citrix.com>
 <874lkfxfxt.fsf@dusky.pond.sub.org>
 <23252.44539.262716.947319@mariner.uk.xensource.com>
 <87tvsbm8gl.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ihor=hf=citrix.com=prvs=6373d119a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f87Un-0004OF-2G
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 17:00:49 +0000
In-Reply-To: <87tvsbm8gl.fsf@dusky.pond.sub.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

TWFya3VzIEFybWJydXN0ZXIgd3JpdGVzICgiUmU6IFtRZW11LWRldmVsXSBbUEFUQ0ggMDgvMTJd
IG9zLXBvc2l4OiBQcm92aWRlIG5ldyAtcnVuYXMgPHVpZD46PGdpZD4gZmFjaWxpdHkiKToKPiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JpdGVzOgo+ID4gVGhhdCB3b3Vs
ZCBkZWZlciB0aGUgZ2V0cHduYW0gZnJvbSBhcmd1bWVudCBwYXJzaW5nIHRvIG9zX3NldHVwX3Bv
c3QuCj4gPiBJIHRoaW5rIHRoYXQncyB1bmRlc3JpYWJsZS4KPiAKPiBObyBhcmd1bWVudC4gIEJ1
dCB3aHkgY2FuJ3Qgb3NfcGFyc2VfY21kX2FyZ3MoKSBjYWxsIGdldHB3bmFtKCkgYXMgaXQKPiBk
b2VzIG5vdywgdGhlbiBzdG9yZSB1c2VyX3B3ZC0+cHdfdWlkLCAtPnB3X2dpZCBhbmQgLT5wd19u
YW1lIGluc3RlYWQgb2YKPiB1c2VyX3B3ZD8gIFN0b3JlIGEgbnVsbCBuYW1lIHdoZW4gaXQgcGFy
c2VzIHRoZSBhcmd1bWVudCBhcyBVSUQ6R0lELgoKT2gsIEkgc2VlLiAgSXQgc2VlbXMgbGVzcyBv
YnZpb3VzIHRvIG1lIHRoYW4gd2hhdCBJIGhhdmUgZG9uZSwgYnV0IEkKY2FuIGRvIGl0IGxpa2Ug
dGhhdCBpZiB5b3UgbGlrZS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
