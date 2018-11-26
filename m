From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 03:58:14 -0700
Message-ID: <5BFBD1C602000078001FFE09@prv1-mh.provo.novell.com>
References: <20181123132516.28681-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gREar-0006Gb-4m
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 10:58:21 +0000
In-Reply-To: <20181123132516.28681-1-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjExLjE4IGF0IDE0OjI1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbiBk
ZWJ1ZyBidWlsZHMgdGhlIGh5cGVydmlzb3Igd2lsbCBkZWxpYmVyYXRlbHkgY2xvYmJlciBwcm9j
ZXNzZWQKPiBlbGVtZW50cyBvZiB0aGUgbXVsdGljYWxsIHN0cnVjdHVyZS4gSW4gb3JkZXIgdG8g
ZWFzZSBkaWFnbm9zdGljIGRhdGEKPiBwcmludG91dCBpbiB0aGUgYWZmZWN0ZWQgZ3Vlc3Qgb25s
eSBjbG9iYmVyIGVsZW1lbnRzIHdoaWNoIGRpZG4ndAo+IHJldHVybiBhbiBlcnJvci4KCkJlc2lk
ZXMgd2hhdCBBbmRyZXcgaGFzIHNhaWQgc3VjaCBhIHJlbGF4YXRpb24gcmVkdWNlcwp0aGUgZ3Vh
cmRpbmcgYWdhaW5zdCBiYWQgZ3Vlc3Qgc2lkZSBjb2RlLiBJZiBhIGd1ZXN0IHJlYWxseQp3aXNo
ZXMgdG8gcHJvZHVjZSBkaWFnbm9zdGljcywgSSB0aGluayBpdCBzaG91bGQgZ28gdG8gdGhlCmxl
bmd0aHMgb2YgY29weWluZyBhcmd1bWVudHMgKGlmIHRoZXkgY2FuJ3QgYmUgcmUtY2FsY3VsYXRl
ZAphbnl3YXkpLiBTdXBwcmVzc2luZyB0aGUgY2xvYmJlcmluZyBpbiBtb3JlIGNhc2VzIG1lcmVs
eQppbnZpdGVzIGd1ZXN0cyB0byByZWFkIHRoZSBhcmd1bWVudHMgYWZ0ZXIgdGhlIGNhbGwsIHdo
aWNoCnRoZXkgc2ltcGx5IHNob3VsZCBub3QgZG8uIE5vdCBjbG9iYmVyaW5nIHRoZSB2YWx1ZXMg
aW4KcmVsZWFzZSBidWlsZHMgaXMgYSBwZXJmb3JtYW5jZSBjaG9pY2UsIGFuZCB3ZSBvdWdodCB0
byBiZQphbGxvd2VkIHRvIGNoYW5nZSBvdXIgb3BpbmlvbiByZWdhcmRpbmcgdGhpcyBpbXBsZW1l
bnRhdGlvbgpkZXRhaWwgYXQgYW55IHBvaW50IGluIHRpbWUuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
