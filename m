From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 12/23] vixen: paravirtualization TSC
 frequency calculation
Date: Mon, 8 Jan 2018 12:04:39 +0000
Message-ID: <20180108120439.7m3g2jtsnppaqutk@citrix.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-13-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9h6o=ed=citrix.com=prvs=53941dece=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eYWAa-00023c-0z
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 12:04:48 +0000
Content-Disposition: inline
In-Reply-To: <1515356919-922-13-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <aliguori@amzn.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMTI6Mjg6MjhQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IEZyb206IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KPiAK
PiBPdGhlcndpc2Ugd2hlbiB0aW1lIHNoYXJpbmcgYSBwaHlzaWNhbCBDUFUsIHRoZSBjYWxjdWxh
dGlvbiBjYW4KPiBiZSBib2d1cyByZXN1bHRpbmcgaW4gdGltZSBkcmlmdCBmb3IgdGhlIGd1ZXN0
IGR1ZSB0byBpbXByb3Blcgo+IGZyZXF1ZW5jeSB3aXRoaW4gcHZjbG9jay4KPiAKCldoYXQgY2xv
Y2sgc291cmNlIGlzIHZpeGVuIHVzaW5nPyBXaGF0IGFib3V0IHVzaW5nIHRoZSB4ZW4gcHZjbG9j
awpzb3VyY2UgcGF0Y2ggaW4gdGhlIHB2LWluLXB2aCBzaGltIHNlcmllcz8KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
