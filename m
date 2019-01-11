From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix build (missing CLONE_NEWIPC)
 on astonishingly old systems
Date: Fri, 11 Jan 2019 18:27:06 +0000
Message-ID: <20190111182706.GA2199@perard.uk.xensource.com>
References: <23608.54527.696432.275991@mariner.uk.xensource.com>
 <20190111181211.24073-1-ian.jackson@eu.citrix.com>
 <20190111181211.24073-2-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KriI=PT=citrix.com=prvs=907059760=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gi1WS-0000iY-Aa
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 18:27:12 +0000
Content-Disposition: inline
In-Reply-To: <20190111181211.24073-2-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDY6MTI6MTFQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gKyNpZm5kZWYgQ0xPTkVfWE5FV0lQQyAvKiBBdmFpbGFibGUgYXMgb2YgTGludXggMi42
LjE5IC8gZ2xpYmMgMi44ICovCgpUaGVyZSdzIGEgc3RyYW5nZSBYIGhlcmUsIGJ1dCBub3QgYmVs
b3cuCgo+ICsjIGRlZmluZSBDTE9ORV9ORVdJUEMgMHgwODAwMDAwMAoKLS0gCkFudGhvbnkgUEVS
QVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
