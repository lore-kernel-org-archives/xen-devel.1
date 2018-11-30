From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 7/9] libxl: Make killing of device model
 asynchronous
Date: Fri, 30 Nov 2018 16:22:29 +0000
Message-ID: <23553.25541.932625.967574@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-7-george.dunlap@citrix.com>
 <23550.50595.50966.218438@mariner.uk.xensource.com>
 <43308BAB-7F2D-408A-A7AB-5874E00BC093@citrix.com>
 <550BD6B4-8278-439E-9C5D-B324EDEDEC7C@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3LvP=OJ=citrix.com=prvs=865853486=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gSlYr-0006LH-FU
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 16:22:37 +0000
In-Reply-To: <550BD6B4-8278-439E-9C5D-B324EDEDEC7C@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIDcvOV0gbGlieGw6IE1ha2Uga2lsbGlu
ZyBvZiBkZXZpY2UgbW9kZWwgYXN5bmNocm9ub3VzIik6Cj4gSXQgbG9va3MgY2xlYW5lciB0byBt
ZSB0byBoYXZlICpzb21ldGhpbmcqIHRoZXJlIHRoYW4gbm90LCBqdXN0IHRvIHZpc3VhbGx5IG1h
a2UgaXQgY2xlYXIgdGhhdCBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIHRoZSBwcmV2aW91cyBm
dW5jdGlvbi4KClRoYXQncyBPSyBieSBtZS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
