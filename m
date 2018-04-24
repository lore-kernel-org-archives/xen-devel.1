From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 05/16] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Tue, 24 Apr 2018 16:08:52 +0100
Message-ID: <23263.18564.94252.535366__19187.8295540393$1524582470$gmane$org@mariner.uk.xensource.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-6-git-send-email-ian.jackson@eu.citrix.com>
 <20180423155816.GF1980@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvks=hn=citrix.com=prvs=6454bde7c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAzYv-00076Y-5v
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 15:08:57 +0000
In-Reply-To: <20180423155816.GF1980@perard>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAwNS8xNl0geGVuOiBkZWZlciBjYWxs
IHRvIHhlbl9yZXN0cmljdCB1bnRpbCBqdXN0IGJlZm9yZSBvc19zZXR1cF9wb3N0Iik6Cj4gSSB0
aGluayB0aGlzIGluY2x1ZGUgaXMgbm90IG5lZWRlZCBhbnltb3JlLCBhbmQgY2FuIGdvIGF3YXkg
ZnJvbSB0aGUKPiBwYXRjaCBzZXJpZXMuCgpZZXMuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
