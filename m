From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix build (missing CLONE_NEWIPC)
 on astonishingly old systems
Date: Fri, 11 Jan 2019 19:21:10 +0000
Message-ID: <23608.60582.225422.236530@mariner.uk.xensource.com>
References: <23608.54527.696432.275991@mariner.uk.xensource.com>
 <20190111181211.24073-1-ian.jackson@eu.citrix.com>
 <20190111181211.24073-2-ian.jackson@eu.citrix.com>
 <20190111182706.GA2199@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ayr2=PT=citrix.com=prvs=9077728fb=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gi2Mm-0005V8-6P
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 19:21:16 +0000
In-Reply-To: <20190111182706.GA2199@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzJdIGxpYnhs
OiBmaXggYnVpbGQgKG1pc3NpbmcgQ0xPTkVfTkVXSVBDKSBvbiBhc3RvbmlzaGluZ2x5IG9sZCBz
eXN0ZW1zIik6Cj4gT24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDY6MTI6MTFQTSArMDAwMCwgSWFu
IEphY2tzb24gd3JvdGU6Cj4gPiArI2lmbmRlZiBDTE9ORV9YTkVXSVBDIC8qIEF2YWlsYWJsZSBh
cyBvZiBMaW51eCAyLjYuMTkgLyBnbGliYyAyLjggKi8KPiAKPiBUaGVyZSdzIGEgc3RyYW5nZSBY
IGhlcmUsIGJ1dCBub3QgYmVsb3cuCgpFcmssIHRoYXQncyB3cm9uZy4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
