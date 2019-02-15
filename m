From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 5/4] backports snapshot: Disable apt
 timestamp checking in right place
Date: Fri, 15 Feb 2019 11:23:02 +0000
Message-ID: <23654.41238.751060.520288@mariner.uk.xensource.com>
References: <20190213183018.5198-4-ian.jackson@eu.citrix.com>
 <20190214114157.12749-1-ian.jackson@eu.citrix.com>
 <d8527694-de40-c988-4ec5-20f9bff36fcc@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flqX=QW=citrix.com=prvs=94288858a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gubaF-0001N4-2R
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 11:23:07 +0000
In-Reply-To: <d8527694-de40-c988-4ec5-20f9bff36fcc@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien.grall@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggNS80
XSBiYWNrcG9ydHMgc25hcHNob3Q6IERpc2FibGUgYXB0IHRpbWVzdGFtcCBjaGVja2luZyBpbiBy
aWdodCBwbGFjZSIpOgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPiAKPiBpbiBjYXNlIG15IGltcGxpY2l0IGFjayBmcm9tIHllc3RlcmRheSBleHBp
cmVkIGFzIHdlbGwgOy0pCgpUaGFua3MgOi0pLiAgSSBwdXNoZWQgaXQgd2l0aG91dCB3YWl0aW5n
LiAgSXQgaXMgbm93IGluIHByb2R1Y3Rpb24gKGFzCm9mIDA3bXVtYmxlIFVUQyB0aGlzIG1vcm5p
bmcpLiAgSSB0aGluayB3ZSB3aWxsIGdldCBhIHB1c2ggb2YKeGVuLXVuc3RhYmxlLXNtb2tlIHNo
b3J0bHkuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
