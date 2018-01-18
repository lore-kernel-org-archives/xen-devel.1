From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] ocaml: fix arm build
Date: Thu, 18 Jan 2018 10:44:58 +0000
Message-ID: <20180118104458.vpyxkrupmy37nayv@citrix.com>
References: <20180117164354.9964-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ec7gq-0003hp-JU
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 10:45:00 +0000
Content-Disposition: inline
In-Reply-To: <20180117164354.9964-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMDQ6NDM6NTRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBBUk0gZG9lc24ndCBoYXZlIGVtdWxhdGlvbl9mbGFncyBpbiB0aGUgYXJjaF9kb21haW5jb25m
aWcuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAt
LS0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybF9zdHVicy5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBi
L3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCj4gaW5kZXggMGI1YTIzNjFjMC4u
ZmQxMjg3NzhiMyAxMDA2NDQKPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1
YnMuYwo+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCj4gQEAgLTE3
NSwxMSArMTc1LDE1IEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNfZG9tYWluX2NyZWF0ZSh2YWx1
ZSB4Y2gsIHZhbHVlIHNzaWRyZWYsCj4gIAkJY2FtbF9mYWlsd2l0aCgiVW5oYW5kbGVkOiBBUk0i
KTsKPiAgCQlicmVhazsKPiAgCj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9f
eDg2XzY0X18pCj4gIAljYXNlIDE6IC8qIFg4NiAtIGVtdWxhdGlvbiBmbGFncyBpbiB0aGUgYmxv
Y2sgKi8KClRoZSBsYWJlbCB3aWxsIGJlIG1vdmVkIG91dHNpZGUgb2YgdGhlICNpZmRlZi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
