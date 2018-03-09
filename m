From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 03/11] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Fri, 9 Mar 2018 12:09:39 +0000
Message-ID: <23202.31107.416270.677920@mariner.uk.xensource.com>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
 <20180308200345.GD3417@localhost.localdomain>
 <23202.28943.344150.512881@mariner.uk.xensource.com>
 <23202.30969.590920.764930@mariner.uk.xensource.com>
 <23202.31050.607695.817387@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdq1=f7=citrix.com=prvs=5995bc012=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1euGqE-0003mU-Mj
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 12:09:42 +0000
In-Reply-To: <23202.31050.607695.817387@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, "Michael S.
 Tsirkin" <mst@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCAwMy8xMV0geGVuOiBkZWZlciBjYWxsIHRv
IHhlbl9yZXN0cmljdCB1bnRpbCBqdXN0IGJlZm9yZSBvc19zZXR1cF9wb3N0Iik6Cj4gSWFuIEph
Y2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCAwMy8xMV0geGVuOiBkZWZlciBjYWxsIHRvIHhlbl9y
ZXN0cmljdCB1bnRpbCBqdXN0IGJlZm9yZSBvc19zZXR1cF9wb3N0Iik6Cj4gPiBIb3cgYWJvdXQg
dGhpcyA/Cj4gCj4gQW5kIGhlcmUncyB0aGUgY29ycmVzcG9uZGluZyBjaGFuZ2UgdG8gdGhlIFhl
bi1zcGVjaWZpYyBwYXRjaC4KCkkgc2hvdWxkIHNheSB0aGF0IEkgaGF2ZSBidWlsZC10ZXN0ZWQg
dGhpcyBidXQgbm90IGV4ZWN1dGVkIGl0IHlldC4KSWYgaXQgc2VlbXMgbGlrZSB0aGUgcmlnaHQg
ZGlyZWN0aW9uIEknbGwgcnVuIHNvbWUgdGVzdHMgdGhpcwphZnRlcm5vb24gYW5kIHJlc2VuZCB0
aGUgd2hvbGUgc2VyaWVzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
