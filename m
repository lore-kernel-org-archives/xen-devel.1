From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Tue, 10 Jul 2018 11:31:49 +0100
Message-ID: <20180710103149.t2vgyns2tremj2a6@citrix.com>
References: <20180710093322.10854-1-george.dunlap@citrix.com>
 <20180710095415.niyjxfmotv3jxeqo@citrix.com>
 <23364.35301.770106.69489@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9fb0=j2=citrix.com=prvs=7221156ca=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcpwB-00015y-CY
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 10:32:03 +0000
Content-Disposition: inline
In-Reply-To: <23364.35301.770106.69489@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMTE6MjY6NDVBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSBodm0vYWx0cDJtOiBDbGFyaWZ5IHRo
ZSBwcm9wZXIgd2F5IHRvIGV4dGVuZCB0aGUgYWx0cDJtIGludGVyZmFjZSIpOgo+ID4gT24gVHVl
LCBKdWwgMTAsIDIwMTggYXQgMTA6MzM6MjJBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
PiA+ID4gKyAqIE5vcm1hbGx5IGh5cGVyY2FsbHMgbWFkZSBieSBhIHByb2dyYW0gaW4gZG9tYWlu
IDAgaW4gb3JkZXIgdG8KPiA+ID4gKyAqIGNvbnRyb2wgYSBndWVzdCB3b3VsZCBiZSBET01DVExz
IHJhdGhlciB0aGFuIEhWTU9Qcy4gIEJ1dCBpbiBvcmRlcgo+ID4gPiArICogdG8gcHJvcGVybHkg
ZW5hYmxlIHRoZSAnaW50ZXJuYWwnIHVzZSBjYXNlLCBhcyB3ZWxsIGFzIHRvIGF2b2lkCj4gPiA+
ICsgKiBmcmFnbWVudGF0aW9uLCBhbGwgYWx0cDJtIHN1Ym9wcyBzaG91bGQgY29tZSB1bmRlciB0
aGlzIHNpbmdsZQo+ID4gPiArICogSFZNT1AuCj4gPiAKPiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0
aGlzIGFyZ3VtZW50LiBUaGVyZSBpcyBubyByaXNrIG9mIGNvZGUgZHVwbGljYXRpb24gLwo+ID4g
ZnJhZ21lbnRhdGlvbiBpZiB0aGUgaW1wbGVtZW50YXRpb24gaXMgY29udGFpbmVkIHdpdGhpbiBh
IGZ1bmN0aW9uLgo+ID4gU2hvdWxkIHdlIGNob29zZSB0byBzcGxpdCBvbmUgSFZNT1AgaW50byBh
IERPTUNUTCBhbmQgYSBIVk1PUCwgdGhlcmUgaXMKPiA+IG5vdyB0d28gZW50cmllcyB0byB0aGUg
aW50ZXJuYWwgZnVuY3Rpb24sIGVhY2ggb2Ygd2hpY2ggd2l0aCBwcm9wZXIKPiA+IGNoZWNrcywg
YnV0IHRoZXkgd2lsbCBjYWxsIHRoZSBzYW1lIGludGVybmFsIGZ1bmN0aW9uIGV2ZW50dWFsbHku
Cj4gPiAKPiA+IEkgYWRtaXQgSSBoYXZlbid0IGZvbGxvd2VkIHRoZSBkaXNjdXNzaW9uIGNsb3Nl
bHkuCj4gCj4gImVhY2ggb2Ygd2hpY2ggd2l0aCBwcm9wZXIgY2hlY2tzIi4gIFlvdSBlbmQgdXAg
ZG9pbmcgc29tZSBvZiB0aGUKPiBwYXJhbWV0ZXIgdmFsaWRhdGlvbiB0d2ljZS4gIFRoYXQgaXMg
dmVyeSB1bmRlc2lyYWJsZSBpbmRlZWQuCgpGYWlyIGVub3VnaC4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
